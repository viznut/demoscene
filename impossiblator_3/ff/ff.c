#include <stdio.h>
#include <stdlib.h>
#include <string.h>

unsigned char combs[256][256];
unsigned char mem[65536];

unsigned char pixelData[] = {
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
85,85,85,85,90,170,170,170,170,170,170,170,170,170,85,85,85,85,85,85,85,
85,85,85,86,170,170,170,170,170,170,170,170,170,170,169,85,85,85,85,85,85,
85,85,85,106,170,170,170,170,170,170,170,170,170,170,170,85,85,85,85,85,85,
85,85,86,170,170,170,170,170,170,170,170,170,170,170,170,149,85,85,85,85,85,
85,85,90,170,170,170,170,170,170,168,0,0,2,170,170,165,85,85,85,85,85,
85,85,90,170,170,170,170,170,160,0,0,0,0,10,170,165,85,85,85,85,85,
85,85,90,170,170,170,170,170,160,0,0,0,0,0,170,165,85,85,85,85,85,
85,85,90,170,170,170,170,170,170,168,0,0,0,0,10,165,85,85,85,85,85,
85,85,90,170,170,170,170,170,170,170,168,0,0,0,10,165,85,85,85,85,85,
85,85,90,170,170,170,170,170,170,170,170,160,0,0,10,165,85,85,85,85,85,
85,85,90,170,170,170,170,170,170,170,170,170,0,0,10,165,85,85,85,85,85,
85,85,90,170,170,170,170,170,165,90,170,170,128,0,10,165,85,85,85,85,85,
85,85,90,170,170,170,170,169,85,85,106,170,160,0,10,165,85,85,85,85,85,
85,85,90,170,170,170,170,149,85,85,86,170,160,0,10,165,85,85,85,85,85,
85,85,90,170,170,170,169,85,85,85,85,106,160,0,10,165,85,85,85,85,85,
85,85,90,170,170,170,165,85,85,85,85,90,160,0,10,165,85,85,85,85,85,
85,85,86,170,170,170,149,85,85,85,85,90,160,0,10,165,85,85,85,85,85,
85,85,85,106,170,169,85,85,85,85,85,90,160,0,10,165,85,85,85,85,85,
85,85,85,85,85,85,85,85,85,85,85,106,160,0,10,165,85,85,85,85,85,
85,85,85,85,85,85,85,85,85,85,86,170,160,0,10,165,85,85,85,85,85,
85,85,85,85,85,85,85,85,85,85,106,170,128,0,10,165,85,85,85,85,85,
85,85,85,85,85,85,85,85,85,90,170,170,0,0,10,165,85,85,85,85,85,
85,85,93,85,85,85,85,85,90,170,170,160,0,0,42,165,85,93,93,213,85,
117,117,93,117,85,93,85,85,90,170,168,0,0,0,170,165,85,221,93,213,213,
117,117,93,117,85,221,221,85,90,170,128,0,0,10,170,149,85,221,93,213,213,
0,128,0,0,0,255,255,255,255,255,255,255,255,255,254,128,0,0,128,0,1,
0,128,2,128,0,3,255,255,255,255,255,255,255,255,250,160,0,2,160,0,1,
0,192,10,160,0,2,15,255,255,255,254,255,255,255,255,255,128,0,240,0,1,
85,84,15,252,0,2,0,63,251,255,250,255,255,239,255,254,160,0,0,5,85,
85,85,85,255,0,10,129,3,234,255,255,255,255,171,255,254,160,0,85,85,85,
85,85,85,85,0,3,240,0,15,192,0,0,0,168,0,0,252,21,85,85,85,
85,85,85,85,85,84,60,0,0,0,0,0,0,63,0,1,85,85,85,85,85,
85,85,85,85,85,85,85,84,0,0,0,0,0,0,85,85,85,85,85,85,85,
85,85,85,85,85,85,85,85,85,84,0,0,21,85,85,85,85,85,85,85,85,
84,3,64,3,64,53,3,80,13,0,192,48,13,13,80,52,3,64,208,13,85,
85,15,12,48,195,12,48,195,252,63,208,240,195,13,67,13,15,12,48,195,85,
85,13,12,48,195,12,48,195,84,53,80,208,195,13,67,13,13,12,48,195,85,
85,13,12,48,192,60,48,208,53,3,80,208,15,13,64,13,13,12,48,15,85,
85,13,12,48,195,244,48,213,13,80,208,208,195,13,67,13,13,12,48,195,85,
85,13,12,48,195,84,48,213,13,80,208,208,195,13,67,13,13,12,48,195,85,
84,3,12,48,195,85,3,192,60,3,192,48,15,0,195,13,13,64,240,195,85,
87,255,255,255,255,85,255,127,247,255,127,255,245,255,255,253,253,127,223,255,85
};


// TODO we need an analyzer which finds repetitive pairs from sourcedata
// and generates tabledata for it
void tabulate(char*fname,int addr)
{
  FILE*f=fopen(fname,"rb");
  for(;;)
  {
    int c = fgetc(f);
    if(c<0) break;
    mem[addr] = c;
    combs[addr&255][c&255] = addr>>8;
    addr++;
  }
}

int generateForcedFetchWithOp(unsigned char*bytes, unsigned char*output,
  int numbytes, int a, int x, int y, int flags, int opLgt)
{
  int i=0;
  while(opLgt>0) {
    switch(output[i]) {
      case 0xEA:
      case 0x18: // CLC
      case 0x38: // SEC  // TODO add SED, CLD, SEI
      case 0xB8: // CLV
      case 0xD8: // CLD  -- opt SED & SEI & CLI
        opLgt--;i++; break;
      case 0xC9: // CMP
      case 0xE0: // CPX
      case 0xC0: // CPY
        opLgt-=2;i+=2; break;
      case 0xA9: // LDA
        a=output[i+1]; opLgt-=2; i+=2; break;
      case 0xA2: // LDX
        x=output[i+1]; opLgt-=2; i+=2; break;
//      case 0xA0: // LDY
//        y=output[i+1]; opLgt-=2; i+=2; break;
      case 0x09: // ORA
        a|=output[i+1]; opLgt-=2; i+=2; break;
      case 0x29: // ADC
      case 0xE9: // SBC
        a=-1; opLgt-=2; i+=2; break;
      case 0x69: // AND
        a&=output[i+1]; opLgt-=2; i+=2; break;
      case 0x49: // EOR
        a^=output[i+1]; opLgt-=2; i+=2; break;
      case 0xAA: // TAX
        x=a; opLgt--; i++; break;
      case 0x8A: // TXA
        a=x; opLgt--; i++; break;
      case 0xCA: // DEX
        x=(x-1)&255; opLgt--; i++; break;
      case 0xE8: // INX
        x=(x+1)&255; opLgt--; i++; break;
//      case 0xA8: // TAY
//        y=a; opLgt--; i++; break;
      case 0x98: // TYA
        a=y; opLgt--; i++; break;
//      case 0x88: // DEY
//        y=(y-1); opLgt--; i++; break;
//      case 0xC8: // INY
//        y=(y+1); opLgt--; i++; break;
      case 0x2A: // ROL
      case 0x6A: // ROR
        a=-1; opLgt--; i++; break;
      case 0x4A: // LSR
        a=(a>>1)&255; opLgt--; i++; break;
      case 0x0A: // ASL
        a=(a<<1)&255; opLgt--; i++; break;
      default:
        fprintf(stderr,"unknown opcode %d!!! at index %d here:\n",output[i],i);
        {int ii;for(ii=0;ii<opLgt;ii++) printf("%d:%02X\n",ii,output[ii]);}
        exit(1);
    }
  }
  if(opLgt!=0) fprintf(stderr,"!!! ERROR in generateForcedFetchWithOp: length mismatch\n");
  generateForcedFetch(bytes,output+i,numbytes,a,x,y,flags);
}

// safe page to hassle with
int getSafePage(int c,int byte)
{
  if((byte&0x0f)==0x0f) return 0x94;
  return 2;
  /*
  if(c<0xA0) return 0;
  if(c<0xE0) return 1;
  return 2;
  */
}

int isImmediate(int c)
{
  if(c==0xC9 || c==0xE0 || c==0xC0 || c==0xA9 || c==0xA2 ||
     /*c==0xA0 ||*/ c==0x09 || c==0x29 || c==0xE9 || c==0x69 ||
     c==0x49) return 1; else return 0;
}

int isImplied(int c)
{
  if(c==0x4A || c==0x0A || c==0x2A || c==0x6A || /*c==0xC8 ||*/
     /*c==0x88 ||*/ c==0x98 || /*c==0xA8 ||*/ c==0xE8 || c==0xCA ||
     c==0x8A || c==0xAA || c==0x18 || c==0x38 || c==0xB8 ||
     c==0xEA || c==0xD8) return 1; else return 0;
}

#define MAXCHUNK 12


int generateForcedFetch(unsigned char*bytes, unsigned char*output,
  int numbytes, int a, int x, int y, int flags)
{
  struct {
    unsigned char*bytes;
    int count; // number of total codebytes for the whole thing
  } cands[10];

  int i=0;
  
  if(numbytes<=0) {
//    fprintf(stderr,"FORK FINISHED\n");
    return 0;
  }
  
//  fprintf(stderr,"bytes left %d, first byte %02X, a=%d x=%d y=%d flags=%d\n",
//    numbytes, bytes[0], a, x, y, flags);

  /** fork immediate loads with CMP#/LDA#/LDX#/LDY# **/

  char*o=malloc(numbytes*2+3);
//  fprintf(stderr,"trying CMP# ...\n");
  o[0] = 0xC9; // CMP#
  o[1] = bytes[0];
  cands[i].bytes = o;
  cands[i].count =
     2 + generateForcedFetch(bytes+1, o+2, numbytes-1, a, x, y, flags);
  i++;


  if(!(flags&2)) {
  char*o=malloc(numbytes*2+3);
//  fprintf(stderr,"trying LDX# ...\n");
  o[0] = 0xA2; // LDX#
  o[1] = bytes[0];
  cands[i].bytes = o;
  cands[i].count =
    2 + generateForcedFetch(bytes+1, o+2, numbytes-1, a, *bytes, y, flags|2);
  i++;
  }

  /*
  if(!(flags&4)) {
  char*o=malloc(numbytes*2+3);
//  fprintf(stderr,"trying LDY# ...\n");
  o[0] = 0xA0; // LDY#
  o[1] = bytes[0];
  cands[i].bytes = o;
  cands[i].count =
    2 + generateForcedFetch(bytes+1, o+2, numbytes-1, a, x, *bytes, flags|4);
  i++;
  }
  */

  if(!(flags&1)) {
  char*o=malloc(numbytes*2+3);
//  fprintf(stderr,"trying LDA# ...\n");
  o[0] = 0xA9; // LDA#
  o[1] = bytes[0];
  cands[i].bytes = o;
  cands[i].count =
    2 + generateForcedFetch(bytes+1, o+2, numbytes-1, *bytes, x, y, flags|1);
  i++;
  }
 

  
  /* implied + immediate */

  if(numbytes>=2 && isImplied(bytes[0]))
  {
    int j=0;
    char*o=malloc(numbytes*2+3);
    o[0] = 0xEA;  // always starts with NOP. ok
    while(isImplied(bytes[j]) && j<numbytes-1) { o[j+1]=bytes[j]; j++; }
    // last in line must be immediate
    if(isImmediate(bytes[j]) && (j < numbytes-1))
    {
//      fprintf(stderr,"implied+immediate case found!\n");
//      {int ii=0;for(ii=0;ii<=j+1;ii++) fprintf(stderr,"%d: %02X\n",ii,bytes[ii]);}

      o[j+1] = bytes[j];
      o[j+2] = bytes[j+1];
      cands[i].bytes = o;
      cands[i].count =
        3+j + generateForcedFetchWithOp(
          bytes+j+2, o, numbytes-j-2, a, x, y, flags, j+3);
      i++;
    }
  }

  /** try STA/STX/STY **/

  if(numbytes>=2 && bytes[1]==x && getSafePage(bytes[0],x)>=0)
  {
  char*o=malloc(numbytes*2+3);
//  fprintf(stderr,"trying STX ...\n");
  o[0] = 0x8E; // STX nnnn
  o[1] = bytes[0];
  o[2] = getSafePage(bytes[0],x);
  cands[i].bytes = o;
  cands[i].count =
    3 + generateForcedFetch(bytes+2, o+3, numbytes-2, a, x, y, flags&~2);
  i++;
  }
#if (0)
  if(numbytes>=2 && bytes[1]==y)
  {
  char*o=malloc(numbytes*2+3);
//  fprintf(stderr,"trying STY ...\n");
  o[0] = 0x8C; // STY nnnn
  o[1] = bytes[0];
  o[2] = getSafePage(bytes[0]);
  cands[i].bytes = o;
  cands[i].count =
    3 + generateForcedFetch(bytes+2, o+3, numbytes-2, a, x, y, flags&~4);
  i++;
  }
#endif
  if(numbytes>=2 && bytes[1]==a && getSafePage(bytes[0],a)>=0)
  {
  char*o=malloc(numbytes*2+3);
//  fprintf(stderr,"trying STA ...\n");
  o[0] = 0x8D; // STA nnnn
  o[1] = bytes[0];
  o[2] = getSafePage(bytes[0],a);
  cands[i].bytes = o;
  cands[i].count =
    3 + generateForcedFetch(bytes+2, o+3, numbytes-2, a, x, y, flags&~1);
  i++;
  }
  
  /* immediate opcodes */
  
  if(numbytes>=2 && isImmediate(bytes[0]))
  {
    char*o=malloc(numbytes*2+3);
    o[0] = 0xEA;
    o[1] = bytes[0];
    o[2] = bytes[1];
    cands[i].bytes = o;
    cands[i].count =
      3 + generateForcedFetchWithOp(
        bytes+2, o, numbytes-2, a, x, y, flags, 3);
    i++;
  }

  /** try rom aid **/
  
  if(numbytes>=2 && combs[bytes[0]][bytes[1]])
  {
    int page = combs[bytes[0]][bytes[1]]; // which way around?
    
    char*o;
    
//    fprintf(stderr,"bytes: %02X %02X %02X... (ptr %p)\n",bytes[0],bytes[1],bytes[2],bytes);

    o=malloc(numbytes*2+3);
    o[0] = 0xCD; // CMP 
    o[1] = bytes[0];
    o[2] = page;
    cands[i].bytes = o;
    cands[i].count = 
      3 + generateForcedFetch(bytes+2, o+3, numbytes-2, a, x, y, flags);
    i++;

    if(!(flags&2)) {
    o=malloc(numbytes*2+3);
    o[0] = 0xAE; // LDX
    o[1] = bytes[0];
    o[2] = page;
    cands[i].bytes = o;
    cands[i].count = 
      3 + generateForcedFetch(bytes+2, o+3, numbytes-2, a, bytes[1], y, flags|2);
    i++;
    }
    
    /*
    if(!(flags&4)) {
    o=malloc(numbytes*2+3);
    o[0] = 0xAC; // LDY
    o[1] = bytes[0];
    o[2] = page;
    cands[i].bytes = o;
    cands[i].count = 
      3 + generateForcedFetch(bytes+2, o+3, numbytes-2, a, x, bytes[1], flags|4);
    i++;
    }
    */

    if(!(flags&1)) {
    o=malloc(numbytes*2+3);
    o[0] = 0xAD; // LDA
    o[1] = bytes[0];
    o[2] = page;
    cands[i].bytes = o;
    cands[i].count = 
      3 + generateForcedFetch(bytes+2, o+3, numbytes-2, bytes[1], x, y, flags|1);
    i++;
    }
    
    // TODO also LDA LDX LDY

    if(numbytes>=3)
    {
      if(bytes[2]==bytes[1]>>1)
      {
        o=malloc(numbytes*2+3);
        o[0] = 0x4E; // LSR
        o[1] = bytes[0];
        o[2] = page;
        cands[i].bytes = o;
        cands[i].count =
          3 + generateForcedFetch(bytes+3, o+3, numbytes-3, a, x, y, flags);
        i++;
      }

      if(bytes[2]==(bytes[1]<<1)&255)
      {
        o=malloc(numbytes*2+3);
        o[0] = 0x0E; // ASL
        o[1] = bytes[0];
        o[2] = page;
        cands[i].bytes = o;
        cands[i].count =
          3 + generateForcedFetch(bytes+3, o+3, numbytes-3, a, x, y, flags);
        i++;
      }

      if(bytes[2]==bytes[1]+1)
      {
        o=malloc(numbytes*2+3);
        o[0] = 0xEE; // INC
        o[1] = bytes[0];
        o[2] = page;
        cands[i].bytes = o;
        cands[i].count =
          3 + generateForcedFetch(bytes+3, o+3, numbytes-3, a, x, y, flags);
        i++;
      }

      if(bytes[2]==bytes[1]+1)
      {
        o=malloc(numbytes*2+3);
        o[0] = 0xCE; // DEC
        o[1] = bytes[0];
        o[2] = page;
        cands[i].bytes = o;
        cands[i].count =
          3 + generateForcedFetch(bytes+3, o+3, numbytes-3, a, x, y, flags);
        i++;
      }
      
      // TODO ASL INC DEC
    }
  }

  // numbytes>=2 && immediate:
  //     generate NOP & imm.opcode & following byte, catch 2  [FORK]

  // numbytes>=2 && implied:
  //     first check that all the rest are also implied and final is imm
  //     if such a thing found, generate NOP+rest, catch all [FORK]


  // numbytes>=2 && found in table:
  //     numbytes>=3 && thirdbyte = second>>1: generate LSR, catch 3
  //     numbytes>=3 && thirdbyte = second<<1: generate ASL, catch 3
  //     numbytes>=3 && thirdbyte = second+1:  generate INC, catch 3
  //     numbytes>=3 && thidrbyte = second-1:  generate DEC, catch 3
  //     else: generate CMP, catch 2  (fork for CMP, LDA, LDX & LDY)?

  /* CHOOSE THE BEST */

//   fprintf(stderr,"CHOOSING AMONG %d...\n",i);

  {int j,best=0;
   for(j=1;j<i;j++) if(cands[j].count < cands[best].count) best=j;

//   fprintf(stderr,"best is #%d/%d, count %d\n",best,i,cands[best].count);

   memcpy(output,cands[best].bytes,cands[best].count);
   for(j=1;j<i;j++) free(cands[j].bytes);

   return cands[best].count;
  }
}

int generateLongForcedFetch(unsigned char*bytes, unsigned char*output,
  int numbytes, int a, int x, int y, int flags)
{
   unsigned char*output0 = output;

   while(numbytes > MAXCHUNK)
   {
     generateForcedFetch(bytes, output, MAXCHUNK, a, x, y, flags);

     fprintf(stderr,"%d bytes left... opcode %x chosen\n",numbytes,output[0]);


     for(;;) {

     int startsWithImplied = isImplied(output[0]);

     switch(output[0])
     {
      case 0xEA:
      case 0x18: // CLC
      case 0x38: // SEC
      case 0xB8: // CLV
      case 0xD8: // CLD  -- opt SED & SEI & CLI
        output++; bytes++; numbytes--; break;
      case 0xC9: // CMP
      case 0xE0: // CPX
      case 0xC0: // CPY
        output+=2; bytes++; numbytes--; break;
      case 0xA9: // LDA
        a=output[1]; output+=2; bytes++; numbytes--; break;
      case 0xA2: // LDX
        x=output[1]; output+=2; bytes++; numbytes--; break;
//      case 0xA0: // LDY
//        y=output[i+1]; opLgt-=2; i+=2; break;
      case 0x09: // ORA
        a|=output[1]; output+=2; bytes++; numbytes--; break;
      case 0x29: // ADC
      case 0xE9: // SBC
        a=-1; output+=2; numbytes--; bytes++; break;
      case 0x69: // AND
        a&=output[1]; output+=2; bytes++; numbytes--; break;
      case 0x49: // EOR
        a^=output[1]; output+=2; bytes++; numbytes--; break;
      case 0xAA: // TAX
        x=a; output++; bytes++; numbytes--; break;
      case 0x8A: // TXA
        a=x; output++; bytes++; numbytes--; break;
      case 0xCA: // DEX
        x=(x-1)&255; output++; bytes++; numbytes--; break;
      case 0xE8: // INX
        x=(x+1)&255; output++; bytes++; numbytes--; break;
//      case 0xA8: // TAY
//        y=a; opLgt--; i++; break;
      case 0x98: // TYA
        a=y; output++; bytes++; numbytes--; break;
//      case 0x88: // DEY
//        y=(y-1); opLgt--; i++; break;
//      case 0xC8: // INY
//        y=(y+1); opLgt--; i++; break;
      case 0x2A: // ROL
      case 0x6A: // ROR
        a=-1; output++; bytes++; numbytes--; break;
      case 0x4A: // LSR
        a=(a>>1)&255; output++; bytes++; numbytes--; break;
      case 0x0A: // ASL
        a=(a<<1)&255; output++; bytes++; numbytes--; break;
      case(0xCD): // CMP nnnn
      case(0x8E): // STX nnnn
      case(0x8D): // STA nnnn
        output+=3; bytes+=2; numbytes-=2; break;
      case(0xAE): // LDX nnnn
        x=mem[output[1]+output[2]*256]; output+=3; bytes+=2; numbytes-=2; break;
      case(0xAD): // LDA nnnn
        a=mem[output[1]+output[2]*256]; output+=3; bytes+=2; numbytes-=2; break;
      case(0x4E): // LSR nnnn
      case(0x0E): // ASL nnnn
      case(0xEE): // INC nnnn
      case(0xCE): // DEC nnnn
        output+=3; bytes+=3; numbytes-=3; break;
      default:
        fprintf(stderr,"UNKNOWN OPCODE %x!!!\n",output[0]); output++; break;
     }
     
     if(startsWithImplied) { fprintf(stderr,"op was implied, need to get next as well\n"); } else break;
   }
   }

   if (numbytes > 0)
   {
     output += generateForcedFetch(bytes, output, numbytes, a, x, y, flags);
   }
   
   return output - output0;
}

int pairCount[256][256];
int pairTab[256];

void makeRamPairs()
{
  int i,j;
  for(i=0;i<256;i++)
  for(j=0;j<256;j++) pairCount[i][j] = 0;
  
  for(i=0;i<44;i++)
  {
    for(j=0;j<20;j++)
    {
      int a = pixelData[i*21+j];
      int b = pixelData[i*21+j+1];
      pairCount[a][b] ++;
    }
  }

  printf("pairTab\n");  
  for(i=0;i<256;i++)
  {
    int best=0,where = 0;
    for(j=0;j<256;j++)
    {
      if(pairCount[i][j] > best && (!combs[i][j])) {
        best = pairCount[i][j];
        where = j;
      }
    }
    pairTab[i] = where;
    printf("pairtab: [%02X] = %02X %s\n",i,where,best>0?"":"; UNUSED");
    combs[i][j] = 0x1F;
  }
  printf("\n\n");
}

main()
{
  unsigned char pelle[200];
  int i,j,count,totalsave=0;

  for(i=0;i<256;i++)
  for(j=0;j<256;j++) combs[i][j]=0;

//  tabulate("vic20-basic.bin",0xC000);
//  tabulate("vic20-kernal.bin",0xE000);
// - basic & kernal roms are useless!
  tabulate("vic20-char.bin",0x8000);
  
// no basic: totalsave drops to 337

  // fixed bug, now 354
  // makeRamPairs(); // - only saves tens of extra bytes (388 -> 412)

  for(j=0;j<44;j++) {
  count = generateLongForcedFetch(pixelData+21*j, pelle, 21, -1,-1,-1,0);
  printf("picl%d ; 42 bytes to %d\n; ",j,count);
  {int k=0;for(k=0;k<21;k++) printf("%02X ",pixelData[21*j+k]); printf("\n"); }
  fprintf(stderr,"%d: 42 bytes to %d\n",j,count);
  totalsave += 42-count;
  for(i=0;i<count;i++)
  {
    printf("!byte $%02X\n",pelle[i]);
  }
  printf("jmp linedone\n\n");
  }
  printf("; total save: %d bytes\n",totalsave);
}
