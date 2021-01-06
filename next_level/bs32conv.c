#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//#define DEBUG fprintf
#define DEBUG

typedef struct
{
  unsigned char bitmap[36*8][30];
  unsigned char fgcol[36][30];
  unsigned char bgcol[36*8];
  unsigned char brdcol[36*8];
  unsigned char auxcol[36*8];
} editorPicture;

typedef struct
{
  unsigned char chars[1024][8]; // was 512
  unsigned char fgcol[1024]; // was 512
  unsigned char brdbg;
  unsigned char aux;
} memoryPicture;

editorPicture EP;
memoryPicture baseMP;
memoryPicture MP;
memoryPicture XP;
// compressedPicture

typedef struct
{
  int exploring;
  int compressedSize;
  int targetAddress;
  int dataMode;
} converterState;

converterState state = { 0,0,-666,-666 };

converterState oldState;

/*************************** debugs & outputs ******************************/

int reportCharOccurrences(unsigned char*data,int howmany)
{
  int i;
  if(state.exploring) return;

  printf(";,; <- ch");
  for(i=0;i<8;i++) printf("%02X",data[i]);
  printf(" ; %d\n",howmany);
}

/************************* memoryPicture ops *******************************/

// flags&1 = report
int countUniqueChars(memoryPicture*mp, unsigned char*majorchar, int flags)
{
  int i,j,k;
  unsigned char counted[504];
  int count=0;
  int maxoccurrences=0;
  DEBUG(stderr,"countUniqueChars start, flags=%d\n",flags);
  for(i=0;i<504;i++) counted[i]=0;
  for(i=0;i<504;i++)
  {
    if(!counted[i])
    {
      int occurrences=1;
      counted[i]=2; // "first of the kind"
      for(j=i+1;j<504;j++)
      {
        if(!memcmp(mp->chars[i],mp->chars[j],8))
        {
          occurrences++;
          counted[j]=1;
        }
      }
      if(flags&1) reportCharOccurrences(mp->chars[i],occurrences);
      if(occurrences>maxoccurrences)
      {
        maxoccurrences=occurrences;
        if(majorchar)
        {
          memcpy(majorchar,mp->chars[i],8);
        }
      }
      count++;
    }
  }
  if(flags&1)
  {
    if(!state.exploring)
    printf("; total unique chars in pic: %d (worst case req %d bytes)\n",count,
    count*8);
//    compressedSize+=count*8;
  }
  DEBUG(stderr,"countUniqueChars end, return %d\n",count);
  return count;
}

void getPixelColorUsage(char*bitmap, char*usage)
{
  int i,j;
  usage[0]=usage[1]=usage[2]=usage[3]=0;

  for(i=0;i<8;i++)
  {
    int b=bitmap[i];
      for(j=0;j<8;j+=2)
        usage[(b&(3<<j))>>j]++;
  }
}

/*
void optimizeMemoryPicture(memoryPicture*mp)
{
  int i,j;

  if(!state.exploring) printf("; OPTIMIZING...\n");

  // - eliminate fgvalues where fg color is not used
  {char prevfgcol=mp->fgcol[0];
  for(i=1;i<504;i++)
  {
    if(mp->fgcol[i]!=prevfgcol)
    {
      char usage[4];
      getPixelColorUsage(mp->chars[i],usage);
      if(usage[0]==32) mp->fgcol[i]=prevfgcol;
    }
    prevfgcol=mp->fgcol[i];
  }
  }

  // - eliminate pixel data where all colors are same as fg
  for(i=0;i<504;i++)
  {
    if(!(mp->fgcol[i]&8))
    {
      if(mp->fgcol[i]==mp->brdbg>>4)
      {
        for(j=0;j<8;j++)mp->chars[i][j]=0;
      }
    }
    else
    {
      char usage[4];
      getPixelColorUsage(mp->chars[i],usage);
      if(usage[2]==0)
      {
        for(j=0;j<8;j++)mp->chars[i][j]=0;
      }
    }
  }
}
*/

int makeMemoryPicture(editorPicture*ep,memoryPicture*mp)
{
  int x,y,z;
  int brd,aux,bg;
  for(y=0;y<21;y++)
  for(x=0;x<24;x++)
  {
    mp->fgcol[y*24+x]=ep->fgcol[y+8][x+3];
    for(z=0;z<8;z++)
      mp->chars[y*24+x][z]=ep->bitmap[((y+8)*8+z)][x+3];
  }
  bg=ep->bgcol[8*8];
  brd=ep->brdcol[8*8];
  aux=ep->auxcol[8*8];
  mp->brdbg=(bg<<4)|8|brd;
  mp->aux=aux<<4;
  for(y=1;y<21*8;y++)
  {
    if(ep->bgcol[8*8+y]!=bg) return -1;
    if(ep->brdcol[8*8+y]!=brd) return -2;
    if(ep->auxcol[8*8+y]!=aux) return -3;
  }
  return 0;
}

int getMainFgValue(memoryPicture*mp,int ord)
{
  int counts[16],i,max,where=0,where2nd=0;
  for(i=0;i<16;i++)counts[i]=0;
  for(i=0;i<504;i++)counts[mp->fgcol[i]&15]++;
  max=counts[0];
  for(i=1;i<16;i++)if(counts[i]>max){where2nd=where;max=counts[i];where=i;}
  return ord?where2nd:where;
}

void getMainChar(memoryPicture*mp,unsigned char*bitmap)
{
  countUniqueChars(mp,bitmap,0);
}

void initMemory(memoryPicture*mp,int fg,unsigned char*ch,int flags)
{
  int i,j;
  for(i=0;i<512;i++)
  {
    mp->fgcol[i]=fg;
    for(j=0;j<8;j++)
      mp->chars[i][j]=ch[j];
  }
  if(flags&1 && !state.exploring)
  {
    printf("!byte $e4,%d,ch",fg);
    for(i=0;i<8;i++) printf("%02X",ch[i]&255);
    printf(" ; clrscr\n");
  }
}

// deprecated
void removeDiffHoles(char*map,int maxfill)
{
  int i;
  
  // to first diff
  while(!map[i] && i<504) i++;  

  while(i<504)
  {
    if(!map[i])
    {
      int holesize=0;
      while(!map[i] && i<504)
      { 
        i++;
        holesize++;
      }
      if(holesize<=maxfill && i<504)
      {
        int j;
        for(j=i-holesize;j<i;j++) map[j]=1;
      }
    }
  }
}

// TODO bytedata may contain rle
// consider
// bytes:
// - SKIP(xx)	1 byte  (xx=1..64)
// - DATA(xx)	1 byte  (xx=1..64) + databytes
// - FILL(xx)	1 byte  (xx=3..66) + databyte
// - ADDR(xx)	2 bytes
// - OPR(xx)	other stuff
// - modes: byte, nybble, 1bpc_00only, 1bpc_both
// - commands: wait, 1bpcaa

// optimal algo:
// - gap
//   - if previous command was fill && the filler spans over the gap &&
//     prevfillstart->overthegap is less than maximum fill size:
//     extend prevfill to span over the gap
//   - if previous command was data && gap is smaller than THRESHOLD &&
//     prevchunkstart->overthegap is less than maximum chunk size:
//     extend prevchunk to span over the gap
//   - else: generate skip over the gap (if over skiprange, set new address)
// - beginning of chunk:
//   - if whole chunk is homogenic, generate fill(s) regardless of runsize
//     (so we get a chance to extend the fill)
//   - if beginning of chunk is homogenic, generate fill if fill is
//     longer than 2 bytes (FILL DATA) i.e. 4 nybbles.
//     else start datachunk.
// - middle of chunk:
//   - if rest of chunk is homogenic, generate fill if fill is
//     longer than 2 bytes (FILL DATA) i.e. 4 nybbles, generate fill.
//   - if middle of chunk is homogenic (still data after it) and the fill
//     is longer than 3 bytes (FILL DATA CHUNK) i.e. 6 nybbles, generate fill.
//   - else: generate datachunk.


#define SC_SKIP(n) (0x80|(n-1))
#define SC_DATA(n) (0x00|(n-1))
#define SC_FILL(n) (0x40|(n-2))
#define SC_OTHR(n) (0xC0|(n))

/*************************************************************************/

void saveState()
{
  memcpy(&oldState,&state,sizeof(converterState));
}

void restoreState()
{
  memcpy(&state,&oldState,sizeof(converterState));
}

void setDataMode(int newDataMode)
{
  if(state.dataMode!=newDataMode)
  {
    state.dataMode=newDataMode;
    if(!state.exploring)
    {
      if(state.dataMode==1) printf("!byte $e2,0;mode8\n");
      if(state.dataMode==2) printf("!byte $e2,1;mode4\n");
      if(state.dataMode==8) printf("!byte $e2,$ff;mode1\n");
    }
    state.compressedSize+=2;
  }  
}

void generateJump(int address)
{
  int skip=address-state.targetAddress;

  if(skip!=0)
  {
    if(skip>0 && skip<=64)
    {
      if(!state.exploring) printf("!byte $%02X ;skip\n",SC_SKIP(skip));
      state.compressedSize++;
    }
    else
    {
      int page=address>>8;
      if(page<=0x03) page=0x10+page; else
      if(page>=0x10 && page<=0x1F) page=page-0x10; else
      if(page>=0x90 && page<=0x9B) page=page-0x90+0x14; else
      {
        if(!state.exploring)
        printf("; ERROR: ILLEGAL TARGET ADDRESS!!! %04X\n",address);
        exit(1);
      }
      if(!state.exploring)
      printf("!byte $%02X,$%02X ;addr\n",SC_OTHR(page),address&255);
      state.compressedSize+=2;
    }
    state.targetAddress=address;
  }
}

/*********************** 1bpc(aa) compression ****************************/

#define NYBBLEBITS(a,b,c,d) ( ((a)<<3)|((b)<<2)|((c)<<1)|(d) )
#define BITS(a,b,c,d,e,f,g,h) (((NYBBLEBITS(a,b,c,d)<<4)|NYBBLEBITS(e,f,g,h))^0xff)

unsigned char ibpcaachars[17][8] =
{
  BITS(0,0,0,0,0,0,0,0), // ----
  BITS(0,0,0,0,0,0,0,0), 
  BITS(0,0,0,0,0,0,0,0), 
  BITS(0,0,0,0,0,0,0,0), 
  BITS(0,0,0,0,0,0,0,0), 
  BITS(0,0,0,0,0,0,0,0), 
  BITS(0,0,0,0,0,0,0,0), 
  BITS(0,0,0,0,0,0,0,0), 

  BITS(0,0,0,0,0,0,0,0), // ---d
  BITS(0,0,0,0,0,0,0,0), 
  BITS(0,0,0,0,0,0,0,0), 
  BITS(0,0,0,0,0,0,0,0), 
  BITS(0,0,0,0,0,0,0,0), 
  BITS(0,0,0,0,0,0,0,0), 
  BITS(1,1,1,1,1,1,1,1), 
  BITS(1,1,1,1,1,1,1,1), 

  BITS(1,1,1,1,1,1,1,1), // --u-
  BITS(1,1,1,1,1,1,1,1), 
  BITS(0,0,0,0,0,0,0,0),
  BITS(0,0,0,0,0,0,0,0), 
  BITS(0,0,0,0,0,0,0,0), 
  BITS(0,0,0,0,0,0,0,0), 
  BITS(0,0,0,0,0,0,0,0), 
  BITS(0,0,0,0,0,0,0,0), 

  BITS(1,1,1,1,1,1,1,1), // --ud
  BITS(1,1,1,1,1,1,1,1), 
  BITS(0,0,0,0,0,0,0,0),
  BITS(0,0,0,0,0,0,0,0), 
  BITS(0,0,0,0,0,0,0,0), 
  BITS(0,0,0,0,0,0,0,0), 
  BITS(1,1,1,1,1,1,1,1), 
  BITS(1,1,1,1,1,1,1,1), 

  BITS(1,1,0,0,0,0,0,0), // -l--
  BITS(1,1,0,0,0,0,0,0), 
  BITS(1,1,0,0,0,0,0,0), 
  BITS(1,1,0,0,0,0,0,0), 
  BITS(1,1,0,0,0,0,0,0), 
  BITS(1,1,0,0,0,0,0,0), 
  BITS(1,1,0,0,0,0,0,0), 
  BITS(1,1,0,0,0,0,0,0), 

  BITS(1,0,0,0,0,0,0,0), // -l-d
  BITS(1,1,0,0,0,0,0,0), 
  BITS(1,1,1,0,0,0,0,0), 
  BITS(1,1,1,1,0,0,0,0), 
  BITS(1,1,1,1,1,0,0,0), 
  BITS(1,1,1,1,1,1,0,0), 
  BITS(1,1,1,1,1,1,1,0), 
  BITS(1,1,1,1,1,1,1,1), 

  BITS(1,1,1,1,1,1,1,1), // -lu-
  BITS(1,1,1,1,1,1,1,0), 
  BITS(1,1,1,1,1,1,0,0), 
  BITS(1,1,1,1,1,0,0,0), 
  BITS(1,1,1,1,0,0,0,0), 
  BITS(1,1,1,0,0,0,0,0), 
  BITS(1,1,0,0,0,0,0,0), 
  BITS(1,0,0,0,0,0,0,0), 

  BITS(1,1,1,1,1,1,1,1), // -lud
  BITS(1,1,1,1,1,1,1,1), 
  BITS(1,1,1,1,0,0,0,0), 
  BITS(1,1,0,0,0,0,0,0), 
  BITS(1,1,0,0,0,0,0,0), 
  BITS(1,1,1,1,0,0,0,0), 
  BITS(1,1,1,1,1,1,1,1), 
  BITS(1,1,1,1,1,1,1,1), 

  BITS(0,0,0,0,0,0,1,1), // r---
  BITS(0,0,0,0,0,0,1,1), 
  BITS(0,0,0,0,0,0,1,1), 
  BITS(0,0,0,0,0,0,1,1), 
  BITS(0,0,0,0,0,0,1,1), 
  BITS(0,0,0,0,0,0,1,1), 
  BITS(0,0,0,0,0,0,1,1), 
  BITS(0,0,0,0,0,0,1,1),

  BITS(0,0,0,0,0,0,0,1), // r--d
  BITS(0,0,0,0,0,0,1,1), 
  BITS(0,0,0,0,0,1,1,1), 
  BITS(0,0,0,0,1,1,1,1), 
  BITS(0,0,0,1,1,1,1,1), 
  BITS(0,0,1,1,1,1,1,1), 
  BITS(0,1,1,1,1,1,1,1), 
  BITS(1,1,1,1,1,1,1,1),

  BITS(1,1,1,1,1,1,1,1), // r-u-
  BITS(0,1,1,1,1,1,1,1), 
  BITS(0,0,1,1,1,1,1,1), 
  BITS(0,0,0,1,1,1,1,1), 
  BITS(0,0,0,0,1,1,1,1), 
  BITS(0,0,0,0,0,1,1,1), 
  BITS(0,0,0,0,0,0,1,1), 
  BITS(0,0,0,0,0,0,0,1),

  BITS(1,1,1,1,1,1,1,1), // r-ud
  BITS(1,1,1,1,1,1,1,1), 
  BITS(0,0,0,0,1,1,1,1), 
  BITS(0,0,0,0,0,0,1,1), 
  BITS(0,0,0,0,0,0,1,1), 
  BITS(0,0,0,0,1,1,1,1), 
  BITS(1,1,1,1,1,1,1,1), 
  BITS(1,1,1,1,1,1,1,1), 

  BITS(1,1,0,0,0,0,1,1), // rl--
  BITS(1,1,0,0,0,0,1,1), 
  BITS(1,1,0,0,0,0,1,1), 
  BITS(1,1,0,0,0,0,1,1), 
  BITS(1,1,0,0,0,0,1,1), 
  BITS(1,1,0,0,0,0,1,1), 
  BITS(1,1,0,0,0,0,1,1), 
  BITS(1,1,0,0,0,0,1,1),

  BITS(1,1,0,0,0,0,1,1), // rl-d
  BITS(1,1,0,0,0,0,1,1), 
  BITS(1,1,0,0,0,0,1,1), 
  BITS(1,1,0,0,0,0,1,1), 
  BITS(1,1,1,0,0,1,1,1), 
  BITS(1,1,1,0,0,1,1,1), 
  BITS(1,1,1,1,1,1,1,1), 
  BITS(1,1,1,1,1,1,1,1),

  BITS(1,1,1,1,1,1,1,1), // rlu-
  BITS(1,1,1,1,1,1,1,1), 
  BITS(1,1,1,0,0,1,1,1), 
  BITS(1,1,1,0,0,1,1,1), 
  BITS(1,1,0,0,0,0,1,1), 
  BITS(1,1,0,0,0,0,1,1), 
  BITS(1,1,0,0,0,0,1,1), 
  BITS(1,1,0,0,0,0,1,1),

  BITS(1,1,1,1,1,1,1,1), // rlud
  BITS(1,1,1,1,1,1,1,1), 
  BITS(1,1,1,0,0,1,1,1), 
  BITS(1,1,0,0,0,0,1,1), 
  BITS(1,1,0,0,0,0,1,1), 
  BITS(1,1,1,0,0,1,1,1), 
  BITS(1,1,1,1,1,1,1,1), 
  BITS(1,1,1,1,1,1,1,1),
  
  BITS(1,1,1,1,1,1,1,1),
  BITS(1,1,1,1,1,1,1,1),
  BITS(1,1,1,1,1,1,1,1),
  BITS(1,1,1,1,1,1,1,1),
  BITS(1,1,1,1,1,1,1,1),
  BITS(1,1,1,1,1,1,1,1),
  BITS(1,1,1,1,1,1,1,1),
  BITS(1,1,1,1,1,1,1,1)
};

int identifyIbpcaaChar(unsigned char*s)
{
  int i,id;
  for(i=0;i<17;i++)
  {
    if(!memcmp(s,ibpcaachars[i],8)) break;
  }
  id=i;
//  for(i=0;i<8;i++)printf("%02X ",s[i]);
//  printf(" id as %d\n",id);
  return id;
}

int ibpcaaHeuristic=0;

int determineIbpcaaBit(unsigned char*chars,int x)
{
  int b=0,n=0,a;

  // TODO modeflag: either this (dummy) or latter (too clever)

  if(!(ibpcaaHeuristic&1))
  {
    a=identifyIbpcaaChar(chars+x*8);
    if(a==16) return 1;
    if(a==0) return 0;
    if(!(ibpcaaHeuristic&2)) return 0;
  }

  if(x>=1)
  {
    a=identifyIbpcaaChar(chars+(x-1)*8);
    if(a<16) { if(a&4) b++; else n++; }
  }
  if(x<=502)
  {
    a=identifyIbpcaaChar(chars+(x+1)*8);
    if(a<16) { if(a&8) b++; else n++; }
  } 
  if(x>=24)
  {
    a=identifyIbpcaaChar(chars+(x-24)*8);
    if(a<16) { if(a&1) b++; else n++; }
  }
  if(x<=503-24)
  {
    a=identifyIbpcaaChar(chars+(x+24)*8);
    if(a<16) { if(a&2) b++; else n++; }
  }
  if(b==n) // RLUD
  {
    a=identifyIbpcaaChar(chars+x*8);
    if(a>=16) b++; else n++;
  }
  if(b>n) return 1; else return 0;
}

// out:
// &1: color
// &2: skip
// &4: unchangeable
void makeIbpcData(char*d0,char*d1,char*out)
{
  int i;
  DEBUG(stderr,"makeIbpcData start\n");
//  if(!state.exploring)
//  printf("; IbpcData ");
  for(i=0;i<504;i++)
  {
    int d0char = identifyIbpcaaChar(d0+i*8);
    int d1char = identifyIbpcaaChar(d1+i*8);

    if(d0char>16) *out=4;
    else if(d0char==16)
    {
      if(d1char<16) *out=0;
               else *out=2+determineIbpcaaBit(d1,i);
    }
    else
    {
      if(d1char==16) *out=1;
                else *out=2+determineIbpcaaBit(d1,i);
    }
//    if(!state.exploring)
//    printf("%d",*out);
//    if((i%24)==23) if(!state.exploring) printf("\n; IbpcData ");

    out++;
  }
//  if(!state.exploring) printf("\n");
  DEBUG(stderr,"makeIbpcData end\n");
}

void flushIbpcChunk(unsigned char*s,int lgt)
{
  DEBUG(stderr,"flushIbpcChunk start, lgt=%d\n",lgt);
  if(lgt<=0) return;

  while(lgt>64) // SHOULD NEVER HAPPEN
  {
    flushIbpcChunk(s,64);
    s+=64;lgt-=64;
  }
  if(!state.exploring) printf("!byte $%02X ;data1\n",SC_DATA(lgt));
  state.compressedSize++;
  while(lgt)
  {
    if(!state.exploring) printf("!byte $%02X\n",*s++);
    lgt--;
    state.compressedSize++;
  }
  DEBUG(stderr,"flushIbpcChunk end\n");
}

void setIbpcBit(char*d0,int bit)
{
  int a=identifyIbpcaaChar(d0);
  int i;
  if(bit) // B can override 0..15
  {
    if(a<=15)
    {
      for(i=0;i<8;i++) d0[i]=0x00;
    }
  } 
  else // N can override 16
  {
    if(a==16)
    {
      for(i=0;i<8;i++) d0[i]=0xFF;
    }
  }
}

void runIbpcaa(char*d0)
{
  int i,a=0;
  DEBUG(stderr,"runIbpcaa start\n");
  if(!state.exploring) printf("!byte $e3 ;run ibpcaa\n");
  state.compressedSize++;
  for(i=24;i<504-24;i++)
  {
    if(identifyIbpcaaChar(d0+i*8)<16)
    {
      int j;
      a = ((identifyIbpcaaChar(d0+(i+24)*8)>=16)?1:0) | 
          ((identifyIbpcaaChar(d0+(i-24)*8)>=16)?2:0) |
          ((identifyIbpcaaChar(d0+(i-1)*8)>=16)?4:0) |
          ((identifyIbpcaaChar(d0+(i+1)*8)>=16)?8:0);
      for(j=0;j<8;j++) d0[i*8+j]=ibpcaachars[a][j];
    }
  }
  DEBUG(stderr,"runIbpcaa end\n");
}

void compressIbpc(char*d0,char*d1)
{
  unsigned char ibd[504],chunk[64];
  int i0=0,i1,i,chunkstart=0,chunklgt=0;
  DEBUG(stderr,"compressIbpc start\n");
  
  makeIbpcData(d0,d1,ibd);

  for(;i0<504;i0++) if(ibd[i0]<2) break;
  if(i0<504)
  {
    generateJump(0x1e00+i0);
    setDataMode(8);
  }
//  chunkstart=i0;
  chunklgt=0;

  while(i0<504)
  {
    int a=0;
    for(i=i0;i<504;i++) if(ibd[i]<2) break;
    if(i==504) break;
    if(i>i0+16)
    {
      flushIbpcChunk(chunk,chunklgt);
      chunklgt=0;
      generateJump(0x1e00+i);
      i0=i;
    }
    for(i=8;i;i--)
    {
      a=(a<<1)|(ibd[i0]&1); // TODO check direction
      setIbpcBit(d0+8*i0,ibd[i0]&1);
      // TODO update char
      i0++;
      state.targetAddress++;
    }
    chunk[chunklgt++]=a;
  }
  flushIbpcChunk(chunk,chunklgt);

  DEBUG(stderr,"compressIbpc end\n");
}

/*********************** byte/nybble compression ****************************/

int getRepetitionLength(char*data,int lgt,int esize)
{
  int count=1;
  char compareto[esize];
  DEBUG(stderr,"getRepetitionLength start, lgt=%d\n",lgt);
  memcpy(compareto,data,esize);
  while(lgt)
  {
    data+=esize;
    if(memcmp(compareto,data,esize)) break;
    lgt--;
    count++;
  }
  DEBUG(stderr,"getRepetitionLength end\n");
  return count;
}

int isChunkHomogenic(char*data,int lgt,int esize)
{
  if(getRepetitionLength(data,lgt,esize) == lgt) return 1; else return 0;
}

int getGapLength(char*d0,char*d1,int lgt,int esize)
{
  int count=0;
  DEBUG(stderr,"getGapLength start, lgt=%d\n",lgt);
  while(lgt)
  {
    if(!memcmp(d0,d1,esize)) count++; else break;
    lgt--;d0+=esize;d1+=esize;
  }
  DEBUG(stderr,"getGapLength end\n");
  return count;
}

int getDiffLength(char*d0,char*d1,int lgt,int esize)
{
  int count=0;
  DEBUG(stderr,"getDiffLength start, lgt=%d\n",lgt);
  while(lgt)
  {
    if(memcmp(d0,d1,esize)) count++; else break;
    lgt--;d0+=esize;d1+=esize;
  }
  DEBUG(stderr,"getDiffLength end\n");
  return count;
}

int getTailGapLength(char*d0,char*d1,int lgt,int esize)
{
  int count=0;
  DEBUG(stderr,"getTailGapLength start\n");
  d0 += esize*(lgt-1);
  d1 += esize*(lgt-1);
  while(lgt)
  {
    if(!memcmp(d0,d1,esize)) count++; else return count;
    lgt--;d0-=esize;d1-=esize;
  }
  DEBUG(stderr,"getTailGapLength end\n");
}

int roundlength(int lgt,int bytecompratio)
{
  return (lgt+bytecompratio-1)&~(bytecompratio-1);
}

void generateChunk(int address,char*data,int lgt,int esize,int bytecompratio)
{
  int maxlgt=64;
  DEBUG(stderr,"generateChunk start, lgt=%d, bytecompratio=%d, esize=%d\n",lgt,bytecompratio,esize);
  generateJump(address);
  setDataMode(bytecompratio);
  if(bytecompratio==2)maxlgt=128;
  while(lgt>maxlgt)
  {
    generateChunk(address,data,maxlgt,esize,bytecompratio);
    address+=maxlgt;
    data+=maxlgt*esize;
    lgt-=maxlgt;  // was 'esize', switched to '64'
  }
  DEBUG(stderr,"; CHUNK of %d from %04x on (compratio %d)\n",lgt,address,bytecompratio);

  {int sz=8/bytecompratio;
  if(!state.exploring)
    printf("!byte $%02X ;data%d\n",SC_DATA((lgt+bytecompratio-1)/bytecompratio),sz);
  }

  {int i;
   state.compressedSize++;
   for(i=0;i<lgt;i+=bytecompratio)
   {
     DEBUG(stderr,"i=%d\n",i);
     if(esize>=8)
     {
       int j;
       if(!state.exploring)
       {
         printf("!byte ch");
         for(j=0;j<esize;j++) printf("%02X",data[i*esize+j]&255);
         printf("\n");
       }
       state.targetAddress++;
       state.compressedSize++;
     }
     else
     {
       int byte=0;
       if(bytecompratio==1) byte=data[i];
       if(bytecompratio==2) byte=data[i] + (data[i+1]<<4);
       // else 8
       if(!state.exploring) printf("!byte $%02X\n",byte&255);
       state.targetAddress += bytecompratio;
       state.compressedSize++;
     }
   }
  }
  DEBUG(stderr,"generateChunk end\n");
}


void generateFill(int address,char*data,int lgt,int esize)
{
  if(lgt<=0) return;
  DEBUG(stderr,"generateFill start\n");
  
  generateJump(address);

  if(lgt==1)
  {
    setDataMode(1);
    if(!state.exploring) printf("!byte $%02X,",SC_DATA(1));
  } else
  {
    if(!state.exploring) printf("!byte $%02X,",SC_FILL(lgt));
  }
  state.compressedSize+=2;
  if(esize>=8 && !state.exploring)
  {
    int j;
    printf("ch");
    for(j=0;j<esize;j++) printf("%02X",data[j]&255);
  } else
  {
    if(!state.exploring)
    printf("$%02X", data[0]&255);
  }
  if(!state.exploring)
  printf(" ;fill\n");
  state.targetAddress += lgt;

  DEBUG(stderr,"generateFill end\n");
}

void compressChunk(char*d0,char*d1,int lgt,int esize,int address,int bytecompratio)
{
  int chunklgt=0;
  char*chunkstart;
  int chunkaddress;
  
  DEBUG(stderr,"compressChunk start, lgt=%d, bytecompratio=%d\n",lgt,bytecompratio);
  
  // gap in the beginning: always skip
  {int gaplgt=getGapLength(d0,d1,lgt,esize);
   //printf("; INITIAL GAP: %d bytes\n",gaplgt);
   d0+=esize*gaplgt;
   d1+=esize*gaplgt;
   lgt-=gaplgt;
   address+=gaplgt;
  }
  chunkaddress=address;
  chunkstart=d1;

  while(lgt>0)
  {
    int filllgt = getRepetitionLength(d1,lgt,esize);
    int gaplgt = getGapLength(d0,d1,lgt,esize);
//    printf("; at lgt=%d: filllgt=%d gaplgt=%d\n",lgt,filllgt,gaplgt);

    if(filllgt>65 & gaplgt>65) // always skip long fills if they aren't needed
    {
      if(chunklgt>0) // flush chunk
      {
        DEBUG(stderr,"generateChunk: flush chunk at long fill\n");
        //printf("; flushing chunk before skipping long fillgap\n");
        generateChunk(chunkaddress,chunkstart,chunklgt,esize,bytecompratio);
      }
      if(gaplgt >= filllgt)
      {
        d0 += filllgt*esize;
        d1 += filllgt*esize;
        address += filllgt;
        lgt -= filllgt;
      }
      else
      {
        d0 += gaplgt*esize;
        d1 += gaplgt*esize;
        address += gaplgt;
        lgt -= gaplgt;
      }
      chunklgt=0;chunkaddress=address;chunkstart=d1;
    }
    else
    if(filllgt>3*bytecompratio && gaplgt<3*bytecompratio)
    {
      // if superlong fill, generate pagefill command
      if(filllgt>65) filllgt=65;
      filllgt -= getTailGapLength(d0,d1,filllgt,esize);
      if( (filllgt>0 && chunklgt==0) || (filllgt>=3*bytecompratio && chunklgt>0) )
      {
        if(chunklgt>0) // flush chunk
        {
          DEBUG(stderr,"generateChunk: flush chunk before fill\n");
          //printf("; flushing chunk before fill\n");
          generateChunk(chunkaddress,chunkstart,chunklgt,esize,bytecompratio);
        }
        generateFill(address,d1,filllgt,esize);
        d0 += filllgt*esize;
        d1 += filllgt*esize;
        lgt -= filllgt;
        address += filllgt;
        chunkaddress=address;

        chunklgt=0; chunkstart=d1;
      } else
      {
        chunklgt++;
        address++;
        d0 += esize;
        d1 += esize;
        lgt--;
      }
    }
    else // not fillable: jump over gaps or extend current chunk
    {
      if(gaplgt >= lgt)
      {
        lgt=0;
      }
      else
      if(gaplgt>3*bytecompratio)
      {
        if(chunklgt>0)
        {
          DEBUG(stderr,"generateChunk: flush at gap\n");

          generateChunk(chunkaddress,chunkstart,chunklgt,esize,bytecompratio);
        }
        d0 += gaplgt*esize;
        d1 += gaplgt*esize;
        address += gaplgt;
        lgt -= gaplgt;
        chunklgt=0; chunkaddress=address; chunkstart=d1;
      }
      else
      {
        chunklgt++;
//        printf("; at lgt=%d chunklgt is now %d\n",lgt,chunklgt);
        address++;
        d0 += esize;
        d1 += esize;
        lgt--;
      }
    }
  }
  if(chunklgt>0)
  {
    DEBUG(stderr,"generateChunk: flush at end\n");

    generateChunk(chunkaddress,chunkstart,chunklgt,esize,bytecompratio);
  }
  DEBUG(stderr,"compressChunk end\n");
}

/*
char*methods[] =
{
  
}
*/

/*************************** framewise ***********************************/

int doingDeltas=0;

void addFrame(editorPicture*ep)
{
  static int framenum=0;
  static int lastSize=0;
  int err;
  int best,where;
  int curr;

  err = makeMemoryPicture(ep,&MP);
  if(err<0)
  {
    printf("; ERROR %d from makeMemoryPicture! rastercolors not yet supported\n",err);
  }
//  optimizeMemoryPicture(&MP);

  printf("\n\n;,; *_%03d\n;,; <- ibpcaablocks\n",framenum);

  framenum++;

/*
  if(!doingDeltas)
  {
    unsigned char mainchar[8];
    int fg;
    getMainChar(&MP,mainchar);
    fg=getMainFgValue(&MP);
    initMemory(&baseMP,fg,mainchar,1);
    baseMP.brdbg=MP.brdbg;
    baseMP.aux=MP.aux;
    doingDeltas=1;
    // TODO generate appropriate fills
  }
  countUniqueChars(&MP,NULL,1);
  compressChunk(baseMP.fgcol,MP.fgcol,504,1,0x9600,2);
*/
  // EXPLORE
  
  best=666666;where=-1;
  for(curr=doingDeltas?0:4;curr<=19;curr++)
  {
    state.exploring = 1;

    saveState();
    printf("; method %d ( ",curr);
    memcpy(&XP,&baseMP,sizeof(memoryPicture));
    
    if(curr>>2)
    {
      unsigned char mainchar[8];
      int fg;
      int ord=(curr>>2)-1;

      printf("clrscr%d ",ord);

      getMainChar(&MP,mainchar);
      if(ord&2){
        int i;
        for(i=0;i<8;i++)mainchar[i]^=0xff;
      }
      fg=getMainFgValue(&MP,ord&1);
      initMemory(&XP,fg,mainchar,1);
      XP.brdbg=MP.brdbg;
      XP.aux=MP.aux;
      // TODO generate appropriate fills
    }

    countUniqueChars(&MP,NULL,1);
    compressChunk(XP.fgcol,MP.fgcol,504,1,0x9600,2);

    if(curr&1)
    {
      ibpcaaHeuristic=0; // (curr-1)&3;
      printf("ibpc%d ",ibpcaaHeuristic);
      compressIbpc(XP.chars[0],MP.chars[0]);
      if(curr&2) // (curr-1)&4)
      {
        printf("ibpcaa ");
        runIbpcaa(XP.chars[0]);
      }
    }
    printf("bytes ) ");
    compressChunk(XP.chars[0],MP.chars[0],504,8,0x1E00,1);
    if(state.compressedSize < best)
    {
      best=state.compressedSize;
      where=curr;
    }
    printf("-- %d bytes (%d cumu)\n",state.compressedSize-lastSize,state.compressedSize);
    restoreState();
  }

  
  state.exploring = 0;

  // CHOOSE

  printf("; METHOD %d CHOSEN\n",where);
  curr=where;

  {
    state.exploring =0;

//    saveState();
//    printf("; method %d ( ",curr);
    memcpy(&XP,&baseMP,sizeof(memoryPicture));

    if(curr>>2)
    {
      unsigned char mainchar[8];
      int fg;
      int ord=(curr>>2)-1;

//      printf("clrscr%d ",ord);

      getMainChar(&MP,mainchar);
      if(ord&2){
        int i;
        for(i=0;i<8;i++)mainchar[i]^=0xff;
      }
      fg=getMainFgValue(&MP,ord&1);
      initMemory(&XP,fg,mainchar,1);
      XP.brdbg=MP.brdbg;
      XP.aux=MP.aux;
      // TODO generate appropriate fills
    }

    countUniqueChars(&MP,NULL,1);
    compressChunk(XP.fgcol,MP.fgcol,504,1,0x9600,2);

    if(curr&1)
    {
      ibpcaaHeuristic=0; // (curr-1)&3;
//      printf("ibpc%d ",ibpcaaHeuristic);
      compressIbpc(XP.chars[0],MP.chars[0]);
      if(curr&2) // (curr-1)&4)
      {
//        printf("ibpcaa ");
        runIbpcaa(XP.chars[0]);
      }
    }
//    printf("bytes ) ");
    compressChunk(XP.chars[0],MP.chars[0],504,8,0x1E00,1);
    if(state.compressedSize < best)
    {
      best=state.compressedSize;
      where=curr;
    }
//    printf("-- %d bytes (%d cumu)\n",state.compressedSize-lastSize,state.compressedSize);
 //   restoreState();
  }

/*
  {
    state.exploring = 0;
    memcpy(&XP,&baseMP,sizeof(memoryPicture));
    if(curr>0)
    {
      ibpcaaHeuristic=(curr-1)&3;
      compressIbpc(XP.chars[0],MP.chars[0]);
      if((curr-1)&4)
      {
        runIbpcaa(XP.chars[0]);
      }
    }
    compressChunk(XP.chars[0],MP.chars[0],504,8,0x1E00,1);
  }
*/

  lastSize=state.compressedSize;  
  memcpy(&baseMP,&MP,sizeof(memoryPicture));

  printf("!byte $e1,12\n\n");

  if(!doingDeltas)
    doingDeltas=1;
}

int loadRaw(char*name)
{
  FILE*f=fopen(name,"rb");
  if(f)
  {
    int i;
    int numpics=fgetc(f);
    for(i=0;i<numpics;i++)
    {
      fread(&EP,sizeof(editorPicture),1,f);
      addFrame(&EP);
    }
  fclose(f);
  return 0;
  } else return -1;
}

int main(int argc,char**argv)
{
  if(argc<=1)
  {
    DEBUG(stderr,"Usage: %s filename\n",argv[0]);
    return 1;
  }
  loadRaw(argv[1]);
  printf("; total compressed size %d bytes\n",state.compressedSize);
  return 0;
}
