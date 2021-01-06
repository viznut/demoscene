#include <stdio.h>
#include <stdlib.h>
#include <SDL.h>

SDL_Surface*surf;
int cursorX=36*4,cursorY=30*4,drawColor=1;
int areaX0=18,areaY0=15,areaX1=18,areaY1=15;

// TODO: SUPPORT ANIMATION
// home: first frame
// end: last frame
// pgup: prev frame
// pgdn: next frame
// insert: new frame after this frame, copy it
// del: delete current frame

struct
{
  unsigned char bitmap[8];
  char mode;
} clipboardchars[16];

struct
{
  unsigned char bitmap[36*8*30];
  unsigned char fgcol[36*30];
  int width,height;
} clipboard;

typedef struct
{
  unsigned char bitmap[36*8][30];
  unsigned char fgcol[36][30];
  unsigned char bgcol[36*8];
  unsigned char brdcol[36*8];
  unsigned char auxcol[36*8];
} picture;

picture*frames[256],*currpic;
int currFrameIdx=0;

void initFrames()
{
  int i;
  for(i=0;i<256;i++)frames[i]=NULL;
//  currpic=frames[0]=malloc(sizeof(picture));
//  currFrameIdx=0;
}

void freeFrames()
{
  int i;
  for(i=0;i<256;i++)if(frames[i]){free(frames[i]);frames[i]=NULL;}
  currFrameIdx=0;
}


/*
void viccolors[] = // 16*3*3*2] =
{
  // normal intensity (+0, 16 colors)
  0,0,0,
  0,0,0,
  
  // middle intensity (+16, 16 colors)
  
  // low intensity (+32, 16 colors)
};
*/


int viccolors[17];

unsigned char baseviccolors[9*3] =
{
  0x00,0x00,0x00,
  0xff,0xff,0xff,
  0xb4,0x18,0x18,
  0x4c,0xe6,0xd8,
  0xbc,0x29,0xca,
  0x42,0xe4,0x36,
  0x32,0x2a,0xc8,
  0xd2,0xe1,0x26,
  0xca,0x5a,0x02
};

#define COMBCOL(r,g,b) (((r)<<16)|((g)<<8)|((b)))

void makeviccolors()
{
  int i;
  for(i=0;i<16;i++)
  {
    int bc0,bc1,flutter;
    if(i<=8)
    {
      bc0=i;
      bc1=i;
    } else
    {
      bc1=1;
      if(i==9) bc0=8; else bc0=i-8;
    }
    if(i<2) flutter=0; else flutter=128;
    viccolors[i] = COMBCOL(
       (baseviccolors[bc0*3+0] + baseviccolors[bc1*3+0])/2,
       (baseviccolors[bc0*3+1] + baseviccolors[bc1*3+1])/2,
       (baseviccolors[bc0*3+2] + baseviccolors[bc1*3+2])/2 );
    // flutter: /2, /3, /4
    // 480x288 yuv ok? scale to 720x576
    // YUYV for each 480 -> intact subpixels
  }
  viccolors[16]=COMBCOL(128,128,128);
}

// A  B  A  B
// * * * *

// generate colors

// blk    00 00 00
// wht    ff ff ff

// red    b4 18 18 -- dc 94 94
// cyan   4c e6 d8 -- a5 f4 ec
// purple bc 29 ca -- e0 9a e4
// green  42 e4 36 -- a0 f2 9a
// blue   32 2a c8 -- 9c 92 e4
// yellow d2 e1 26 -- ef f8 9a
// orange ca 5a 02 -- de ac 80


//	02 18 26 29 2a 32 36 42 4c 5a b4 bc ca d8 e4 e6
//	80 94 9a 9a 92 9c 9a a0 a5 ac dc e0 e4 ec f2 f4

//  x   FE 110 10E 10B 10A ... 102
// ok, consider FF

// (a+x)/2=b solve x: a/2+x/2=b a+x=2b x=2b-a

// 3-pixel pattern for normal pixels, 4edge, 8edge; for odd & even lines

void renderPixel(int*o,char color)
{
//  int*s=&viccolors[color*3*2];
  int*s=&viccolors[color];
  o[0]=*s;//++;
  o[1]=*s;//++;
  o[2]=*s;//++;
  o[720]=*s;//++;
  o[721]=*s;//++;
  o[722]=*s;
}

void markRealPixel(int x,int y)
{
  if(x>=0 && x<720 && y>=0 && y<576)
  {
    int*o=(int*)surf->pixels;
    o[720*y+x]^=0xffffff;
  }
}

void renderZPixel(int*o,char*colors,int colno)
{
  int x,y;
  int color=colors[colno];
  int bgcolor;
  for(y=0;y<4;y++)
  for(x=0;x<4;x++)
    renderPixel(o+x*3+y*720*2,color);

  if(colno!=0)
  {
    if(color==colors[0]) bgcolor=16; else bgcolor=colors[0];
  } else {
    bgcolor=colors[2];
  }

  //for(x=0;x<2;x+=2)
  //{
    //renderPixel(o+3*3+x*720*2,bgcolor);
    renderPixel(o+3*3+3*720*2,bgcolor);
//    renderPixel(o+0*3+3*720*2,bgcolor);
////    renderPixel(o+0*3+0*720*2,bgcolor);
//    renderPixel(o+3*3+0*720*2,bgcolor);
  //}
}

void renderZByte(int*o,unsigned char bitmap,char*colors)
{
  if(colors[2]&8)
  {
    colors[2]&=7;
    renderZPixel(o+0*4, colors,(bitmap&0xc0)>>6);
    renderZPixel(o+3*4, colors,(bitmap&0xc0)>>6);
    renderZPixel(o+6*4, colors,(bitmap&0x30)>>4);
    renderZPixel(o+9*4, colors,(bitmap&0x30)>>4);
    renderZPixel(o+12*4,colors,(bitmap&0x0c)>>2);
    renderZPixel(o+15*4,colors,(bitmap&0x0c)>>2);
    renderZPixel(o+18*4,colors,(bitmap&0x03)>>0);
    renderZPixel(o+21*4,colors,(bitmap&0x03)>>0);
    colors[2]|=8;
  }
  else
  {
    renderZPixel(o+0*4, colors,(bitmap&0x80)>>6);
    renderZPixel(o+3*4, colors,(bitmap&0x40)>>5);
    renderZPixel(o+6*4, colors,(bitmap&0x20)>>4);
    renderZPixel(o+9*4, colors,(bitmap&0x10)>>3); // +16
    renderZPixel(o+12*4,colors,(bitmap&0x08)>>2);
    renderZPixel(o+15*4,colors,(bitmap&0x04)>>1);
    renderZPixel(o+18*4,colors,(bitmap&0x02));
    renderZPixel(o+21*4,colors,(bitmap&0x01)<<1); // +24
  }
}

void renderByte(int*o,unsigned char bitmap,char*colors)
{
  if(colors[2]&8)
  {
    colors[2]&=7;
    renderPixel(o+0, colors[(bitmap&0xc0)>>6]);
    renderPixel(o+3, colors[(bitmap&0xc0)>>6]);
    renderPixel(o+6, colors[(bitmap&0x30)>>4]);
    renderPixel(o+9, colors[(bitmap&0x30)>>4]);
    renderPixel(o+12,colors[(bitmap&0x0c)>>2]);
    renderPixel(o+15,colors[(bitmap&0x0c)>>2]);
    renderPixel(o+18,colors[(bitmap&0x03)>>0]);
    renderPixel(o+21,colors[(bitmap&0x03)>>0]);
    colors[2]|=8;
  }
  else
  {
    renderPixel(o+0, colors[(bitmap&0x80)>>6]);
    renderPixel(o+3, colors[(bitmap&0x40)>>5]);
    renderPixel(o+6, colors[(bitmap&0x20)>>4]);
    renderPixel(o+9, colors[(bitmap&0x10)>>3]); // +16
    renderPixel(o+12,colors[(bitmap&0x08)>>2]);
    renderPixel(o+15,colors[(bitmap&0x04)>>1]);
    renderPixel(o+18,colors[(bitmap&0x02)]);
    renderPixel(o+21,colors[(bitmap&0x01)<<1]); // +24
  }
}

void drawZoomedArea(int x0,int y0)
{
  int y;
  char colors[4];
/*  
  for(y=0;y<10;y++)
  {
    renderZPixel( ((int*)surf->pixels)+y*720*4*2, 0);
    renderZPixel( ((int*)surf->pixels)+y*720*4*2+ 9*3*4, 0);
    renderZPixel( ((int*)surf->pixels)+ y*3*4, 0);
    renderZPixel( ((int*)surf->pixels)+ y*3*4 + 720*4*2*9, 0);
  }
*/
  for(y=-3;y<11;y++)
  { 
    int*o=((int*)surf->pixels)+(y+3)*720*4*2/*+ 1*3*4*/;
    unsigned char bits;

    bits=currpic->bitmap[y+y0][x0-1];
    colors[0]=currpic->bgcol[y+y0];
    colors[2]=currpic->fgcol[(y0+y)/8][x0-1];
    colors[1]=currpic->brdcol[y+y0];
    colors[3]=currpic->auxcol[y+y0];
    renderZByte(o,bits,colors);

    bits=currpic->bitmap[y+y0][x0];
    colors[2]=currpic->fgcol[(y0+y)/8][x0];
    renderZByte(o+3*4*8,bits,colors);

    bits=currpic->bitmap[y+y0][x0+1];
    colors[2]=currpic->fgcol[(y0+y)/8][x0+1];
    renderZByte(o+3*4*16,bits,colors);
  }
  
  for(y=0;y<8;y++)
  {
    markRealPixel(8*3*4-1, (0+y+3)*4*2);
    markRealPixel(16*3*4,  (0+y+3)*4*2);

    markRealPixel((8+y)*3*4-1, (0+3)*4*2-1);
    markRealPixel((8+y)*3*4-1, (8+3)*4*2);
  }
}

void renderAreaWithoutUpdate(int x0,int y0,int x1,int y1) // split renderLine
{
  int x,y;
  for(y=y0;y<y1;y++)
  {
    char colors[4];
    int*o=((int*)surf->pixels)+y*720*2+x0*8*3;
    colors[0]=currpic->bgcol[y];
    colors[1]=currpic->brdcol[y];
    colors[3]=currpic->auxcol[y];
    for(x=x0;x<x1;x++)
    {
      colors[2]=currpic->fgcol[y/8][x];
      unsigned char bits=currpic->bitmap[y][x];
      renderByte(o,bits,colors);
      o+=8*3;
    }
  }
}

// &1 = toolbar needs to be repainted
// &2 = toolbar on

int toolbarFlags=2;


void renderTools()
{
  int x0,y0,x1,y1,i;
  int ismulticol=currpic->fgcol[cursorY/8][cursorX/8]&8;
  
  if(cursorX<9*8 && cursorY<7*8) return;

  if(cursorY/8<35)
  drawZoomedArea(cursorX/8,cursorY&~7);
  
  x0=((ismulticol?(cursorX&6):(cursorX&7))+8)*3*4-1;
  x1=x0+(ismulticol?2:1)*3*4+1;
  y0=((cursorY&7)+3)*2*4-1;
  y1=y0+2*4+1;
  
  for(i=y0;i<=y1;i+=2)
  {
    markRealPixel(x0,i);
    markRealPixel(x1,i);
  }
  for(i=x0;i<=x1;i+=2)
  {
    markRealPixel(i,y0);
    markRealPixel(i,y1);
  }
}

void renderToolsAndUpdate()
{
  renderTools();
  SDL_UpdateRect(surf,0,0,25*3*4,15*2*4);
}

void renderArea(int x0,int y0,int x1,int y1)
{
  renderAreaWithoutUpdate(x0,y0,x1,y1);
  if(y0<34 && toolbarFlags&2) renderTools();
  SDL_UpdateRect(surf,x0*3*8,y0*2,(x1-x0)*3*8,(y1-y0)*2);
}

void renderFrame()
{
  renderArea(0,0,30,36*8);
}


void drawCursor(int whether)
{
  int x,i;
  if(whether)
  {
    int ismulticol=currpic->fgcol[cursorY/8][cursorX/8]&8;
    renderAreaWithoutUpdate(cursorX/8,cursorY&~7,cursorX/8+1,(cursorY+8)&~7);
    int x0,y0,x1,y1;

    x0=(ismulticol?cursorX&~1:cursorX)*3-1;
    y0=cursorY*2-1;
    x1=x0+(ismulticol?7:4);
    y1=y0+3;

    if(!(toolbarFlags&2) && (cursorX>=5*8 || cursorY>=5*8))
    {
      markRealPixel(x0,y0);
      markRealPixel(x1,y0);
      markRealPixel(x0,y1);
      markRealPixel(x1,y1);
    }
    
    x0=(areaX0*8)*3;
    y0=(areaY0*8)*2;
    x1=(areaX1*8+8)*3-1;
    y1=(areaY1*8+8)*2-1;
    for(i=x0;i<=x1;i+=3)
    {
      markRealPixel(i,y0);
      markRealPixel(i,y1);
    }
    for(i=y0;i<=y1;i+=2)
    {
      markRealPixel(x0,i);
      markRealPixel(x1,i);
    }
    SDL_UpdateRect(surf,x0,y0,x1-x0+1,y1-y0+1);
  }
  else
  {
    renderArea(areaX0,areaY0*8,areaX1+1,areaY1*8+8);
  }
}


/*************************************************************************/

// 012345678901234567890123456789012345
//        .......................

// 0123456789012345678901234567890
//      ......................
// ^^^^^                      ^^^^

// $9000 12 (6 columns, use 5), $9001 38 (9.5 rows, use 7)

int getPixel(int x,int y)
{
  if(x<0 || x>=30*8 || y<0 || y>=36*8) return -1;
  if(currpic->fgcol[y/8][x/8]&8)
    return (currpic->bitmap[y][x/8]&(3<<((~x)&6)))>>((~x)&6);
  else
    return (currpic->bitmap[y][x/8]&(1<<((~x)&7)))?2:0;
}

void setPixel(int x,int y,int c)
{
  if(x<0 || x>=30*8 || y<0 || y>=36*8) return;
  if(currpic->fgcol[y/8][x/8]&8)
    currpic->bitmap[y][x/8] = 
    (currpic->bitmap[y][x/8] & (~(3<<((~x)&6))) ) | ((c&3)<<((~x)&6));
  else
    currpic->bitmap[y][x/8] =
    (currpic->bitmap[y][x/8] & (~(1<<((~x)&7))) ) | (((c&2)>>1)<<((~x)&7));
  renderArea(x/8,y&~7,x/8+1,(y+8)&~7);
  toolbarFlags|=1;
}

int getPixelColor(int x,int y)
{
  int c=getPixel(x,y);
  char colors[4];
  if(c<0) return c;
  
  colors[0]=currpic->bgcol[y];
  colors[1]=currpic->brdcol[y];
  colors[2]=currpic->fgcol[y/8][x/8];
  colors[3]=currpic->auxcol[y];
  return colors[c];
}

void setPixelColor(int x,int y,int c,int aggressive)
{
  int i;
  char usage[4];

  if(currpic->fgcol[y/8][x/8]&7==c) i=2; else
  if(currpic->bgcol[y]==c) i=0; else
  if(currpic->brdcol[y]==c) i=1; else
  if(currpic->auxcol[y]==c) i=3; else i=-1;

    usage[0]=usage[1]=usage[2]=usage[3]=0;
    for(i=y&~7;i<(y+8)&~7;i++)
    {
      int j;
      int b=currpic->bitmap[i][x/8];
      for(j=0;j<8;j+=2)
        usage[(b&(3<<j))>>j]++;
    }

  // if color is already available here, use it
  if(i>=0)
  {
    // if color is usable without mode change, use it
    if((!(i&1)) || (currpic->fgcol[y/8][x/8]&8))
    {
      setPixel(x,y,i);
    }
    else
    // in aggressive mode we can do hires->mc change if cell is not all-zero
    // (in which case it is better to allocate an fg color)
    if(aggressive && usage[0]!=32)
    {
      int j;
      for(j=y&~7;j<(y+8)&~7;j++)
      {
        currpic->bitmap[j][x/8]&=0xaa;
      }
      currpic->fgcol[y/8][x/8]|=8;
      setPixel(x,y,i);
    }
  }

  // if we are aggressive, we can always allocate an fg color
  if(aggressive)
  {
    if(c==8 || c==9) c==2;
    currpic->fgcol[y/8][x/8]=(c&7)|(currpic->fgcol[y/8][x/8]&8);
    setPixel(x,y,2);
    return;
  }

  // if non-aggressive, we need to check first
  {
    if(c<8 && usage[0]==32)
    {
      currpic->fgcol[y/8][x/8]=c;
      setPixel(x,y,2);
      return;
    }else
    if(c<8 && currpic->fgcol[y/8][x/8]&8)
    {
      if(usage[2]==0)
      {
        currpic->fgcol[y/8][x/8]=c|8;
        setPixel(x,y,2);
        return;
      }
    }
  }

  // use color 0 if real color is not available  
  setPixel(x,y,0);
}
// all-zero: if drawcolor<8, allocate it, set mode to hires
// else:
// if 2-color and all-one: use color 0
// if 4-color and all-00/11/01 and drawcolor<8: allocate fgcolor, set mode to lores
// else


// all-01 (border): allocate fg


// setpixel algo:
// - check available colors at this point
//   - if 4-color cell & color found: use it
//   - if 2-color cell & color found
//     - color 0 or 2: use it
//     - else: convert cell to 4-color and use it
// - 

//if cell is all-zero and drawcolor<8:


//   - set cell's fgcol to drawcolor and plot the pixel
// - else: use 


// never allocate rastercolors automatically!!!

// - 2-color cell:
//   - all 0s: 
//   - all 1s: 

// - how many logical colors actually used in this charslot?
//   - 

// - how many logical colors actually used in this

// aggressive pixelplot in given color?

void colorKey(int colnum,int mod)
{
  drawColor=colnum;
  if(!(mod&(KMOD_SHIFT|KMOD_CTRL|KMOD_ALT)))
  {
    // plain: set drawcolor & fgcolor
    setPixelColor(cursorX,cursorY,drawColor,1);
  }
  else
  if((mod&KMOD_SHIFT) & !(mod&(KMOD_CTRL|KMOD_ALT)))
  {
    int x,y;
    for(y=areaY0;y<=areaY1;y++)
    for(x=areaX0;x<=areaX1;x++)
      currpic->fgcol[y][x]=drawColor;
    renderArea(areaX0,areaY0*8,areaX1+1,areaY1*8+8);
  }
  else
  {
    if(mod&KMOD_CTRL)  currpic->bgcol[cursorY]=colnum;
    if(mod&KMOD_ALT)   currpic->brdcol[cursorY]=colnum;
    if(mod&KMOD_SHIFT) currpic->auxcol[cursorY]=colnum;
    renderArea(0,cursorY,30,cursorY+1);
    if(cursorY<36*8-1) cursorY++;
  }
  toolbarFlags|=1;
}

void logColorKey(int colnum,int mod)
{
  if(mod&KMOD_SHIFT)
  { 
    int i,x,y;
    char filler;
    if(colnum&1)
      currpic->fgcol[cursorY/8][cursorX/8]|=8;
    else
    if(colnum==2)
      currpic->fgcol[cursorY/8][cursorX/8]=drawColor;
    if(currpic->fgcol[cursorY/8][cursorX/8]&8)
      filler=0x55*colnum;
    else
      filler=colnum?0xFF:0;
    for(y=areaY0;y<=areaY1;y++)
    for(x=areaX0;x<=areaX1;x++)
    for(i=0;i<8;i++)
      currpic->bitmap[y*8+i][x]=filler;
    renderArea(areaX0,areaY0*8,areaX1+1,areaY1*8+8);
  }
  else
  if(mod&KMOD_ALT)
  {
    unsigned char c[8];
    int i,x,y,others=0;
    for(i=0;i<8;i++)c[i]=currpic->bitmap[(cursorY&~7)+i][cursorX/8];
    setPixel(cursorX,cursorY,colnum);
    for(y=0;y<36;y++)
    for(x=0;x<30;x++)
    {
      for(i=0;i<8;i++)
      {
        if(currpic->bitmap[y*8+i][x]!=c[i])break;
      }
      if(i==8)
      {
         setPixel(x*8+(cursorX&7),y*8+(cursorY&7),colnum);
         others++;
      }
    }
    if(others) renderFrame();
  }
  else
  {
    setPixel(cursorX,cursorY,colnum);
    drawColor=getPixelColor(cursorX,cursorY);
  }
  toolbarFlags|=1;
}

/************************ PIC LOADS & INITS *********************************/

//  00 bg
//  10 fg
//  01 bd
//  11 au

void clrpic()
{
  int i,j,k;
  for(i=0;i<36*8;i++)
  {
    currpic->bgcol[i]=0;
    currpic->brdcol[i]=0;
    currpic->auxcol[i]=1;
  }
  for(i=0;i<36*8;i++)
  for(j=0;j<30;j++)
    currpic->bitmap[i][j]=0x55;
  for(i=0;i<36;i++)
  for(j=0;j<30;j++)
    currpic->fgcol[i][j]=8;
}

void appendFrame()
{
  picture*newFrame;
  int i;
  for(i=0;i<256;i++)
    if(frames[i]==NULL) break;

  currFrameIdx=i;  
  newFrame=malloc(sizeof(picture));
  currpic=frames[currFrameIdx]=newFrame;
  clrpic();
}

void clrpicwithfg()
{
  int i,j,k;
  clrpic();

  /* FG */
  for(i=0;i<21;i++)
  for(j=0;j<24;j++)
  {
    for(k=0;k<8;k++) currpic->bitmap[(i+8)*8+k][j+3]=0xff;
    currpic->fgcol[i+8][j+3]=7;
  }
  renderFrame();
}

void fillpicture()
{
  int i,j,k;

  /* GLOBAL COLORS */
  for(i=0;i<36*8;i++)
  {
    currpic->bgcol[i]=0x1;
    currpic->brdcol[i]=0x3;
    currpic->auxcol[i]=0x0;
  }

  /* BORDER */
  for(i=0;i<36*8;i++)
  for(j=0;j<30;j++)
  {
    currpic->bitmap[i][j]=0x55; // border
  }
  for(i=0;i<36;i++)
  for(j=0;j<30;j++)
  {
    currpic->fgcol[i][j]=8;
  }
  
  /* FG */
  for(i=0;i<23;i++)
  for(j=0;j<22;j++)
  {
    for(k=0;k<8;k++) currpic->bitmap[(i+7)*8+k][j+4]=rand()&255;
    currpic->fgcol[i+7][j+4]=6;
  }
}

void loadbs(char*fn)
{
  unsigned char mem[65536];
  int i,j,k;
  FILE*f=fopen(fn,"rb");
  while(!feof(f))
  {
    int addr=(fgetc(f)+fgetc(f)*256)&65535;
    int endaddr=(fgetc(f)+fgetc(f)*256)&65535;
    for(;addr<endaddr;addr++)
    {
      mem[addr]=fgetc(f);
    }
  }
  fclose(f);
  for(i=0;i<8;i++)
  {
    mem[0x1800+i]=0x00;
    mem[0x1808+i]=0x55;
    mem[0x1810+i]=0xAA;
    mem[0x1818+i]=0xFF;
  }
  appendFrame();
  for(i=0;i<=0x9f;i++)
  {
    currpic->bgcol[i+64]=mem[0x1700+i]>>4;
    currpic->brdcol[i+64]=mem[0x1700+i]&7;
    currpic->auxcol[i+64]=mem[0x1f00+i]>>4;
  }
  for(i=0;i<20;i++)
  for(j=0;j<25;j++)
  {
    int ch=mem[0x1d00+i*25+j];
    currpic->fgcol[i+8][j+3]=mem[0x9500+i*25+j]&15;
    for(k=0;k<8;k++)
    {
      currpic->bitmap[(i+8)*8+k][j+3]=mem[0x1800+8*ch+k];
    }
  }
}

float calculateZoomedSize(int*w,int*h,int trgw,int trgh)
{
  float z;
  if( ((float)*w)/((float)*h) > ((float)trgw)/((float)trgh) )
  {
    z = ((float)trgw) / ((float)*w);
  }
  else
  {
    z = ((float)trgh) / ((float)*h);
  }  
  *w *= z;
  *h *= z;
  return z;
}

void getBitmapPixelWithEntropy(SDL_Surface*s,int x,int y,float z,unsigned char*rgb)
{
  int i;
  int*p=s->pixels;
  float yz=(z*2)/3.0;
  x = (x*z  + ((rand()&65535)/65536.0)*z);
  y = (y*yz + ((rand()&65535)/65536.0)*yz);

  if(x>=0 && y>=0 && x<s->w && y<s->h)
  {
    int*p = s->pixels;
    p+=s->w*y+x;
    rgb[0]=(*p>>16)&255;
    rgb[1]=(*p>>8)&255;
    rgb[2]=*p&255;
  }
  else
  {
    rgb[0]=rgb[1]=rgb[2]=rgb[3]=0;
  }
}

int importBitmapAs1bppMono(char*filename)
{
  SDL_Surface*bmp_raw=SDL_LoadBMP(filename);
  SDL_Surface*bmp=SDL_ConvertSurface(bmp_raw, surf->format, 0);
  int to_w,to_h;
  int x,y;
  int avgr,avgg,avgb,avgi;
  int x0,y0;
  float zm;
  
  printf("bmp_raw=%p bmp=%p\n",bmp_raw,bmp);
  
  if(!bmp) return -1;

  to_w=bmp->w;
  to_h=(bmp->h*3.0)/2.0;
  zm=calculateZoomedSize(&to_w,&to_h,192,168);
  zm=1.0/zm;

  printf("zoomed size: %d x %d, factor %f\n",to_w,to_h,zm);

  // get average pixel values

  avgr=0;avgg=0;avgb=0;
  for(y=0;y<to_h;y++)
  for(x=0;x<to_w;x++)
  {
    unsigned char rgb[3];
    getBitmapPixelWithEntropy(bmp,x,y,zm,rgb);
    avgr+=rgb[0];
    avgg+=rgb[1];
    avgb+=rgb[2];
  }
  avgr/=(to_h*to_w);
  avgg/=(to_h*to_w);
  avgb/=(to_h*to_w);
  avgi=(avgr*3+avgg*6+avgb)/10;
  
  printf("Average color: %d,%d,%d (intensity %d)\n",
    avgr,avgg,avgb,avgi);

  x0=(30*8-to_w)/2;
  y0=(36*8-to_h)/2+4;
  appendFrame();
  clrpicwithfg();
  for(y=0;y<to_h;y++)
  for(x=0;x<to_w;x++)
  {
    unsigned char rgb[3];
    int i,c;
    getBitmapPixelWithEntropy(bmp,x,y,zm,rgb);
    i=(rgb[0]*3+rgb[1]*6+rgb[2])/10;
    c=i>=avgi?2:0;
    currpic->bitmap[y+y0][(x+x0)/8] =
    (currpic->bitmap[y+y0][(x+x0)/8] & (~(1<<((~(x+x0))&7))) ) |
      (((c&2)>>1)<<((~(x+x0))&7));
  }
  
  free(bmp);
  free(bmp_raw);

  return 0;
}
// 0   1   2   3   4   5   6   7
// blk wht red cya pur grn blu yel
char rgb3tovic[]=
{
  0,6,5,3,2,4,7,1
};

int importBitmapAsColorNybbles(char*filename)
{
  SDL_Surface*bmp_raw=SDL_LoadBMP(filename);
  SDL_Surface*bmp=SDL_ConvertSurface(bmp_raw, surf->format, 0);
  int to_w,to_h;
  int x,y;
  int avgr,avgg,avgb,avgi;
  int x0,y0;
  float zm;
  
  printf("bmp_raw=%p bmp=%p\n",bmp_raw,bmp);
  
  if(!bmp) return -1;

  to_w=bmp->w;
  to_h=(bmp->h*3)/2;
  zm=calculateZoomedSize(&to_w,&to_h,24,21);
  zm=1.0/zm;

  printf("zoomed size: %d x %d, factor %f\n",to_w,to_h,zm);

  // get average pixel values

  avgr=0;avgg=0;avgb=0;
  for(y=0;y<to_h;y++)
  for(x=0;x<to_w;x++)
  {
    unsigned char rgb[3];
    getBitmapPixelWithEntropy(bmp,x,y,zm,rgb);
    avgr+=rgb[0];
    avgg+=rgb[1];
    avgb+=rgb[2];
  }
  avgr/=(to_h*to_w);
  avgg/=(to_h*to_w);
  avgb/=(to_h*to_w);
  avgi=(avgr*3+avgg*6+avgb)/10;
  avgr=(avgr+avgi*3)/4;
  avgg=(avgg+avgi*3)/4;
  avgb=(avgb+avgi*3)/4;

  printf("Average color: %d,%d,%d (intensity %d)\n",
    avgr,avgg,avgb,avgi);

  x0=(30-to_w)/2;
  y0=(36-to_h+1)/2;
  appendFrame();
  clrpicwithfg();
  for(y=0;y<to_h;y++)
  for(x=0;x<to_w;x++)
  {
    unsigned char rgb[3];
    int i,c;
    getBitmapPixelWithEntropy(bmp,x,y,zm,rgb);
    c= ((rgb[0]>=avgr)?4:0) |
       ((rgb[1]>=avgg)?2:0) |
       ((rgb[2]>=avgb)?1:0);
    currpic->fgcol[y+y0][x+x0] = rgb3tovic[c];
  }
  
  free(bmp);
  free(bmp_raw);

  return 0;
}

void saveRaw(char*name)
{
  int numpics=0,i;
  FILE*f=fopen(name,"wb");
  while(frames[numpics])numpics++;
  fputc(numpics,f); // number of frames
  for(i=0;i<numpics;i++)
  {
    fwrite(frames[i],sizeof(picture),1,f);
  }
  fclose(f);
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
      appendFrame();
      fread(frames[currFrameIdx],sizeof(picture),1,f);
    }
  fclose(f);
  return 0;
  } else return -1;
}

int endsWith(char*name,char*ext)
{
  int nl=strlen(name)-1;
  int el=strlen(ext)-1;
  int i;
  for(i=0;i<=el;i++)
  {
    if(ext[el-i]!=name[nl-i]) return 0;
  }
  return 1;
}

char*filename="untitled.bs32";

int loadPic(char*name)
{
  printf("Loadpic: %s\n",name);
  if(endsWith(name,".bs"))
  {
    printf(".bs\n");
    loadbs(name);
  }
  else
  if(endsWith(name,".cn.bmp"))
  {
    printf(".cn.bmp\n");
    return importBitmapAsColorNybbles(name);
  }
  else
  if(endsWith(name,".bmp"))
  {
    printf(".bmp\n");
    return importBitmapAs1bppMono(name);
  }
  else
  if(endsWith(name,".bs32"))
  {
    printf(".bs32\n");
    filename=name;
    return loadRaw(name);
  }
  else
  {
    printf("Unrecognizable extension\n");
    return -1;
  }

  currFrameIdx=0;
  currpic=frames[0];
}


#define NYBBLEBITS(a,b,c,d) ( ((a)<<3)|((b)<<2)|((c)<<1)|(d) )
#define BITS(a,b,c,d,e,f,g,h) (NYBBLEBITS(a,b,c,d)<<4)|NYBBLEBITS(e,f,g,h)
char ibpcaa_chars[16][8] = {
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
  BITS(1,1,1,1,1,1,1,1)
};

int ibpcaa_isBlocked(int x,int y)
{
  int i;
  if(x<0 || x>=30 || y<0 || y>=35) return 0;
  // TODO FIX: all unidentified = blocked
  for(i=0;i<8;i++) if(currpic->bitmap[y*8+i][x]!=0x00) return 0;
  return 1;
}

void ibpcaa_do(int x,int y)
{
  if(!ibpcaa_isBlocked(x,y))
  {
    int n;
    int i;
    n= (ibpcaa_isBlocked(x,y+1)) |
       (ibpcaa_isBlocked(x,y-1)<<1) |
       (ibpcaa_isBlocked(x-1,y)<<2) |
       (ibpcaa_isBlocked(x+1,y)<<3);
    for(i=0;i<8;i++)
      currpic->bitmap[y*8+i][x]=ibpcaa_chars[n][i]^0xff;
  }
  currpic->fgcol[y][x]=drawColor&7;
  renderArea(x,y*8,x+1,y*8+8);
}

void ibpcaa(int x,int y)
{
  ibpcaa_do(x,y-1);
  ibpcaa_do(x-1,y);
  ibpcaa_do(x+1,y);
  ibpcaa_do(x,y+1);
  ibpcaa_do(x,y);
}

void charKey(int charnum,int mod)
{
  // TODO ALTER
  if(mod&KMOD_SHIFT)
  {
    mod&=~KMOD_SHIFT;
    charnum+=8;
  }
  if(mod&KMOD_CTRL)
  {
    int i;
    for(i=0;i<8;i++)
      clipboardchars[charnum].bitmap[i]=
        currpic->bitmap[(cursorY&~7)+i][cursorX/8];
    clipboardchars[charnum].mode=
      currpic->fgcol[cursorY/8][cursorX/8]&8;
  }
  else
  {
    int i;
    for(i=0;i<8;i++)
      currpic->bitmap[(cursorY&~7)+i][cursorX/8]=
        clipboardchars[charnum].bitmap[i];
    currpic->fgcol[cursorY/8][cursorX/8]=
      (drawColor&7)|clipboardchars[charnum].mode;
  }
}

void xorFromClipboard()
{
  unsigned char*bo=clipboard.bitmap;
  int x,y;
  for(y=cursorY/8;y<cursorY/8+clipboard.height;y++)
  for(x=cursorX/8;x<cursorX/8+clipboard.width;x++)
  {
    int i;
    if(x>=0 && y>=0 && x<30 && y<36)
    {
      for(i=0;i<8;i++)
        currpic->bitmap[y*8+i][x]^=bo[i];
      bo+=8;
    }
  }
  renderFrame();
}

void pasteFromClipboard(int flags) // &1=bitmap, &2=colors
{
  unsigned char*bo=clipboard.bitmap;
  unsigned char*fo=clipboard.fgcol;
  int x,y;
  for(y=cursorY/8;y<cursorY/8+clipboard.height;y++)
  for(x=cursorX/8;x<cursorX/8+clipboard.width;x++)
  {
    int i;
    if(x>=0 && y>=0 && x<30 && y<36)
    {
      if(flags&2) currpic->fgcol[y][x]=*fo;
      if(flags&1)
      for(i=0;i<8;i++)
        currpic->bitmap[y*8+i][x]=bo[i];
      fo++;bo+=8;
    }
  }
  renderFrame();
}

void copyToClipboard()
{
  int x,y;
  unsigned char*bo=clipboard.bitmap;
  unsigned char*fo=clipboard.fgcol;
  clipboard.width=areaX1-areaX0+1;
  clipboard.height=areaY1-areaY0+1;
  for(y=areaY0;y<=areaY1;y++)
  for(x=areaX0;x<=areaX1;x++)
  {
    int i;
    for(i=0;i<8;i++)
      *bo++=currpic->bitmap[y*8+i][x];
    *fo++=currpic->fgcol[y][x];
  }
}

void fillFromClipboard()
{
  int x,y;
  if(clipboard.width<=0 || clipboard.height<=0) return;

  for(y=areaY0;y<=areaY1;y++)
  for(x=areaX0;x<=areaX1;x++)
  {
    int sy=(y-areaY0)%clipboard.height;
    int sx=(x-areaX0)%clipboard.width;
    int i;
    currpic->fgcol[y][x]=clipboard.fgcol[sy*clipboard.width+sx];
    for(i=0;i<8;i++)
      currpic->bitmap[y*8+i][x]|=
        clipboard.bitmap[(sy*clipboard.width+sx)*8+i];
  }
  renderFrame();
}

void pasteWithResize()
{
  float xzoom=((float)clipboard.width)  / ((float)(areaX1-areaX0+1));
  float yzoom=((float)clipboard.height) / ((float)(areaY1-areaY0+1));
  int x,y;

  if(clipboard.width<=0 || clipboard.height<=0) return;
  printf("pastewithresize\n");

  for(y=areaY0*8;y<=areaY1*8+7;y++)
  for(x=areaX0*8;x<=areaX1*8+7;x++)
  {
    int sy=((y-areaY0*8)*yzoom);
    int sx=((x-areaX0*8)*xzoom);
    int col=clipboard.bitmap[(sy&~7)*clipboard.width+(sx&~7)+(sy&7)]&(128>>(sx&7));
    if(!col)
      currpic->bitmap[y][x/8]&=~(128>>(x&7));
    else
      currpic->bitmap[y][x/8]|=(128>>(x&7));
  }
  renderFrame();
}

void invertArea()
{
  int x,y,i;
  for(y=areaY0;y<=areaY1;y++)
  for(x=areaX0;x<=areaX1;x++)
  for(i=0;i<8;i++)
    currpic->bitmap[y*8+i][x]^=0xff;
  renderFrame();
}

unsigned char reverseBits(unsigned char s,int mcol)
{
  unsigned char d=0;
  int j;
  if(!mcol)
  {
    for(j=0;j<8;j++)
      d|=((s&(1<<j))>>j)<<(7-j);
  } else
  {
    for(j=0;j<8;j+=2)
      d|=((s&(3<<j))>>j)<<(6-j);
  }
  return d;
}

void pasteXFlippedFromClipboard()
{
  unsigned char*bo=clipboard.bitmap;
  unsigned char*fo=clipboard.fgcol;
  int x,y;
  for(y=cursorY/8;y<cursorY/8+clipboard.height;y++)
  for(x=cursorX/8+clipboard.width-1;x>=cursorX/8;x--)
  {
    int i;
    if(x>=0 && y>=0 && x<30 && y<36)
    {
      currpic->fgcol[y][x]=*fo;
      for(i=0;i<8;i++)
        currpic->bitmap[y*8+i][x]=reverseBits(bo[i],*fo&8);
      fo++;bo+=8;
    }
  }
  renderFrame();
}

void pasteYFlippedFromClipboard()
{
  unsigned char*bo=clipboard.bitmap;
  unsigned char*fo=clipboard.fgcol;
  int x,y;
  for(y=cursorY/8+clipboard.height-1;y>=cursorY/8;y--)
  for(x=cursorX/8;x<cursorX/8+clipboard.width;x++)
  {
    int i;
    if(x>=0 && y>=0 && x<30 && y<36)
    {
      currpic->fgcol[y][x]=*fo;
      for(i=0;i<8;i++)
        currpic->bitmap[y*8+i][x]=bo[7-i];
      fo++;bo+=8;
    }
  }
  renderFrame();
}

void pasteXYFlippedFromClipboard()
{
  unsigned char*bo=clipboard.bitmap;
  unsigned char*fo=clipboard.fgcol;
  int x,y;
  for(y=cursorY/8+clipboard.height-1;y>=cursorY/8;y--)
  for(x=cursorX/8+clipboard.width-1;x>=cursorX/8;x--)
  {
    int i;
    if(x>=0 && y>=0 && x<30 && y<36)
    {
      currpic->fgcol[y][x]=*fo;
      for(i=0;i<8;i++)
        currpic->bitmap[y*8+i][x]=reverseBits(bo[7-i],*fo&8);
      fo++;bo+=8;
    }
  }
  renderFrame();
}

void shiftAreaLeft()
{
  int x,y;
  for(y=areaY0*8;y<areaY1*8+7;y++)
  {
    int wrap=currpic->bitmap[y][areaX0]&128;
    for(x=areaX0;x<=areaX1;x++)
    {
      int w;
      if(x==areaX1) w=wrap; else w=currpic->bitmap[y][x+1]&128;
      currpic->bitmap[y][x] = (currpic->bitmap[y][x]<<1)|(w?1:0);
    }
  }
}

void shiftAreaRight()
{
  int x,y;
  for(y=areaY0*8;y<areaY1*8+7;y++)
  {
    int wrap=currpic->bitmap[y][areaX1]&1;
    for(x=areaX1;x>=areaX0;x--)
    {
      int w;
      if(x==areaX0) w=wrap; else w=currpic->bitmap[y][x-1]&1;
      currpic->bitmap[y][x] = (currpic->bitmap[y][x]>>1)|(w?128:0);
    }
  }
}

void shiftAreaUp()
{
  int x,y;
  for(x=areaX0;x<=areaX1;x++)
  {
    char wrap=currpic->bitmap[areaY0*8][x];
    for(y=areaY0*8;y<areaY1*8+7;y++)
    {
      currpic->bitmap[y][x]=currpic->bitmap[y+1][x];
    }
    currpic->bitmap[y][x]=wrap;
  }
}

void shiftAreaDown()
{
  int x,y;
  for(x=areaX0;x<=areaX1;x++)
  {
    char wrap=currpic->bitmap[areaY1*8+7][x];
    for(y=areaY1*8+7;y>areaY0*8;y--)
    {
      currpic->bitmap[y][x]=currpic->bitmap[y-1][x];
    }
    currpic->bitmap[y][x]=wrap;
  }
}

int countBits(int b)
{
  int count=0;
  while(b)
  {
    if(b&1)count++;
    b>>=1;
  }
  return count;
}

unsigned char* getCharPtr(int i)
{
  int y=i/30;
  int x=i%30;
  return &(currpic->bitmap[y*8][x]);
}

void getCharData(int i,unsigned char*o)
{
  unsigned char*p=getCharPtr(i);
  int y;
  for(y=0;y<8;y++) o[y]=p[30*y];
}

void optimizeCharsetUsage()
{
  int*occurrences=malloc(36*30*sizeof(int));
  int i,j;
  int leastDamage=32,victim=-1,dominator=-1;
  // -1 = not yet counted
  // -2 = already counted
  
  printf("Optimizing charset usage...\n");
  
  for(i=0;i<36*30;i++) occurrences[i]=-1;

  for(i=0;i<36*30;i++)
  {
    unsigned char ichar[8],jchar[8];
    if(occurrences[i]==-1)
    {
      getCharData(i,ichar);
      occurrences[i]=1;
      for(j=i+1;j<36*30;j++)
      {
        getCharData(j,jchar);
        if(!memcmp(ichar,jchar,8))
        {
          occurrences[i]++;
          occurrences[j]=-2;
        }
      }
     // printf("%d: total %d occurrences\n",i,occurrences[i]);
    }
  }
  for(i=0;i<36*30;i++)
  {
    if(occurrences[i]>0)
    for(j=i+1;j<36*30;j++)
    {
      if(occurrences[j]>0)
      {
        int damage;
        int k;
        int bitcount=0;
        unsigned char ichar[8],jchar[8];
        getCharData(i,ichar);
        getCharData(j,jchar);
        for(k=0;k<8;k++)
          bitcount+=countBits(ichar[k]^jchar[k]);
          
        if(occurrences[i]>occurrences[j])
          damage=occurrences[j]*bitcount;
        else
          damage=occurrences[i]*bitcount;
          
        //printf("Fuse %d (%d) & %d (%d): damage %d (bit difference %d)\n",
        //  i,occurrences[i],j,occurrences[j],damage,bitcount);

        if(damage<leastDamage)
        {
          //printf("BEST SO FAR!\n");

          leastDamage=damage;
          if(occurrences[i]>occurrences[j])
          {
            victim=j;
            dominator=i;
          }
          else
          {
            victim=i;
            dominator=j;
          }
        }
      }
    }
  }
  free(occurrences);

  if(victim>=0)
  {
    char search[8];
    char replace[8];
    getCharData(victim,search);
    getCharData(dominator,replace);
    printf("Victim at %d, dominate with %d, damage %d bits\n",
      victim,dominator,leastDamage);
    for(i=0;i<36*30;i++)
    {
      char ichar[8];
      getCharData(i,ichar);
      if(!memcmp(ichar,search,8))
      {
        int k;
        printf("- Replace at %d...\n",i);
        char*p=getCharPtr(i);
        for(k=0;k<8;k++)
          p[30*k]=replace[k];
      }
    }
  } else
  {
    printf("No victim found!\n");
  }
  renderFrame();

  // foreach cell:
  // - count number of occurrences
  // - calc bitwise difference to every other cell
  // foreach celltypepair A,B:
  // - if(A.amount>B.amount) consider replacing all As with B
  //                    else consider replacing all Bs with A
  // - consider replacing all As and Bs with Cs (linewise average) L8R
  // damage = amount of total changed bits
  // do the least damage, max 32 bits
}

void insertFrame()
{
  picture*newFrame;
  int i;
  
  newFrame=malloc(sizeof(picture));
  memcpy(newFrame,frames[currFrameIdx],sizeof(picture));
  
  currFrameIdx++;
  for(i=255;i>currFrameIdx;i--)
  {
    frames[i]=frames[i-1];
  }
  currpic=frames[currFrameIdx]=newFrame;
  renderFrame();
}

void deleteFrame()
{
  int i;
  if(frames[currFrameIdx+1])
  {
    free(frames[currFrameIdx]);
    for(i=currFrameIdx;i<255;i++)
      frames[i]=frames[i+1];
    frames[255]=NULL;
    currpic=frames[currFrameIdx];
    renderFrame();
  }
}

void nextFrame()
{
  if(currFrameIdx<255 && frames[currFrameIdx+1])
  {
    currFrameIdx++;
    currpic=frames[currFrameIdx];
    renderFrame();
  }
}

void prevFrame()
{
  if(currFrameIdx>0 && frames[currFrameIdx-1])
  {
    currFrameIdx--;
    currpic=frames[currFrameIdx];
    renderFrame();
  }
}



int main(int argc,char**argv)
{
  SDL_Event e;
  SDL_Init(SDL_INIT_VIDEO);
  surf=SDL_SetVideoMode(720,576,32,0);
  SDL_ShowCursor(0);
  SDL_EnableKeyRepeat(200,30);
  makeviccolors();
  initFrames();
  if(argc>=2)
  {
    int i;
    for(i=1;i<argc;i++)
    {
      loadPic(argv[i]);
    }
  }
  if(frames[0]==NULL)
  {
    appendFrame();
    clrpic();
  }
  currFrameIdx=0;
  currpic=frames[0];
  renderFrame();

  do{
    int i;
//    fillpicture();
//    for(i=0;i<720*576;i++)((int*)surf->pixels)[i]=0xFF0000|(rand()&255);
//    SDL_Flip(surf); // todo updaterect

    // wait for event, show cursor
    {int undercursor=getPixelColor(cursorX,cursorY);
//     setPixelColor(cursorX,cursorY,undercursor==1?0:1,0);

     if(toolbarFlags&1)
     {
       renderToolsAndUpdate();
       toolbarFlags&=~1;
     }
     drawCursor(1);
     SDL_WaitEvent(&e);
     drawCursor(0);
     }

    if(e.type==SDL_MOUSEMOTION)
    {
      int prevx=cursorX,prevy=cursorY;
      SDL_MouseMotionEvent*me=(SDL_MouseMotionEvent*)&e;
      cursorX=me->x/3;
      cursorY=me->y/2;
      areaX0=areaX1=cursorX/8;
      areaY0=areaY1=cursorY/8;
      if(me->state!=0)
      {
        // TODO lineto (prevx,prevy)-(cursorX,cursorY)
        setPixelColor(cursorX,cursorY,drawColor,1);
      }
      toolbarFlags|=1;
    }
    else
    if(e.type==SDL_MOUSEBUTTONDOWN)
    {
      setPixelColor(cursorX,cursorY,drawColor,1);
    }
    else
    if(e.type==SDL_KEYDOWN)
    {
      int step=1;
      SDL_KeyboardEvent*ke=(SDL_KeyboardEvent*)&e;
      
      if(ke->keysym.sym==SDLK_ESCAPE)
      {
        if(!(ke->keysym.mod&(KMOD_SHIFT|KMOD_CTRL|KMOD_ALT)))
        {
          saveRaw(filename);
        }
        break;
      }
      
      /*** COLOR LOOKUP ***/
      switch(ke->keysym.sym)
      {
        case SDLK_1:
          colorKey(0,ke->keysym.mod);break;
        case SDLK_2:
          colorKey(1,ke->keysym.mod);break;
        case SDLK_3:
          colorKey(2,ke->keysym.mod);break;
        case SDLK_4:
          colorKey(3,ke->keysym.mod);break;
        case SDLK_5:
          colorKey(4,ke->keysym.mod);break;
        case SDLK_6:
          colorKey(5,ke->keysym.mod);break;
        case SDLK_7:
          colorKey(6,ke->keysym.mod);break;
        case SDLK_8:
          colorKey(7,ke->keysym.mod);break;
        case SDLK_q:
          colorKey(8,ke->keysym.mod);break;
        case SDLK_w:
          colorKey(9,ke->keysym.mod);break;
        case SDLK_e:
          colorKey(10,ke->keysym.mod);break;
        case SDLK_r:
          colorKey(11,ke->keysym.mod);break;
        case SDLK_t:
          colorKey(12,ke->keysym.mod);break;
        case SDLK_y:
          colorKey(13,ke->keysym.mod);break;
        case SDLK_u:
          colorKey(14,ke->keysym.mod);break;
        case SDLK_i:
          colorKey(15,ke->keysym.mod);break;
                
      /*** PIXEL-PLOTTING & CLIPBOARD ***/

        case SDLK_z:
          if(ke->keysym.mod&KMOD_CTRL)
          {
            fillFromClipboard();
            toolbarFlags|=1;
          }
          else
            logColorKey(0,ke->keysym.mod);
            toolbarFlags|=1;
          break;
        case SDLK_x:
          if(ke->keysym.mod&KMOD_CTRL)
          {
            xorFromClipboard();
            toolbarFlags|=1;
          }
          else
            logColorKey(1,ke->keysym.mod);
            toolbarFlags|=1;
          break;
        case SDLK_c:
          if(ke->keysym.mod&KMOD_CTRL)
            copyToClipboard();
          else
            logColorKey(2,ke->keysym.mod);
            toolbarFlags|=1;
          break;
        case SDLK_v:
          if(ke->keysym.mod&KMOD_CTRL)
          {
            pasteFromClipboard(3);
            toolbarFlags|=1;
          }
          else
            logColorKey(3,ke->keysym.mod);
          break;

      /*** CHARACTER-PLOTTING ***/
      // TODO redef
      
        case SDLK_a:
          charKey(0,ke->keysym.mod);break;
        case SDLK_s:
          charKey(1,ke->keysym.mod);break;
        case SDLK_d:
          if(ke->keysym.mod&KMOD_CTRL)
            optimizeCharsetUsage();
          else
          charKey(2,ke->keysym.mod);break;
        case SDLK_f:
          charKey(3,ke->keysym.mod);break;
        case SDLK_g:
          if(!ke->keysym.mod&KMOD_CTRL)
          {
            charKey(4,ke->keysym.mod);
          }
          else
            pasteWithResize();
          break;
        case SDLK_h:
          charKey(5,ke->keysym.mod);break;
        case SDLK_j:
          charKey(6,ke->keysym.mod);break;
        case SDLK_k:
          if(ke->keysym.mod&KMOD_CTRL)
            pasteFromClipboard(2);
          else
          charKey(7,ke->keysym.mod);break;

      /*** 1BPCAA & flipped paste ***/

        case SDLK_b:
          if(ke->keysym.mod&KMOD_CTRL)
          {
            pasteXFlippedFromClipboard();
            toolbarFlags|=1;
          }
          else
          {
            logColorKey(0,KMOD_SHIFT);
            ibpcaa(cursorX/8,cursorY/8);
            toolbarFlags|=1;
          }
          break;
        case SDLK_n:
          if(ke->keysym.mod&KMOD_CTRL)
          {
            pasteYFlippedFromClipboard();
            toolbarFlags|=1;
          }
          else
          {
            currpic->fgcol[cursorY/8][cursorX/8]=drawColor&7;
            logColorKey(2,KMOD_SHIFT);
            ibpcaa(cursorX/8,cursorY/8);
            toolbarFlags|=1;
          }
          break;
        case SDLK_m:
          if(ke->keysym.mod&KMOD_CTRL)
            pasteXYFlippedFromClipboard();
            toolbarFlags|=1;
          break;

      /*** VARIOUS OPERATIONS ***/

        case SDLK_HOME:
          if(ke->keysym.mod&KMOD_SHIFT)
            clrpicwithfg();
          break;
          
        case SDLK_PAGEUP:
          prevFrame();
          break;
        case SDLK_PAGEDOWN:
          nextFrame();
          break;
        case SDLK_INSERT:
          insertFrame();
          break;
        case SDLK_DELETE:
          deleteFrame();
          break;
          
        case SDLK_UP:
        case SDLK_DOWN:
        case SDLK_LEFT:
        case SDLK_RIGHT:

      // arrow+ctrl shifts area pixelwise (but not colors)
      
      if(ke->keysym.mod&KMOD_CTRL /*&& !ke->keysym.mod&(KMOD_SHIFT)*/)
      {
        if(ke->keysym.sym==SDLK_LEFT) shiftAreaLeft();
        if(ke->keysym.sym==SDLK_RIGHT) shiftAreaRight();
        if(ke->keysym.sym==SDLK_UP) shiftAreaUp();
        if(ke->keysym.sym==SDLK_DOWN) shiftAreaDown();
        toolbarFlags|=1;
      }
      else
      {
      if(ke->keysym.mod&KMOD_SHIFT) step=8;
      if(ke->keysym.sym==SDLK_UP && cursorY>=step) cursorY-=step;
      if(ke->keysym.sym==SDLK_DOWN && cursorY<36*8-step) cursorY+=step;
      if(step==1 && currpic->fgcol[cursorY/8][cursorX/8]&8)step=2;
      if(ke->keysym.sym==SDLK_LEFT && cursorX>=step) cursorX-=step;
      if(ke->keysym.sym==SDLK_RIGHT && cursorX<30*8-step) cursorX+=step;
      if(ke->keysym.mod&KMOD_ALT)
      {
        int cx=cursorX/8;
        int cy=cursorY/8;
        if(cx<areaX0) areaX0=cx;
        if(cy<areaY0) areaY0=cy;
        if(areaX1<cx) areaX1=cx;
        if(areaY1<cy) areaY1=cy;
      } else
      {
        areaX0=areaX1=cursorX/8;
        areaY0=areaY1=cursorY/8;
      }
      toolbarFlags|=1;
      }
        break;
      }
      
    }

    
  }while(1); //e.type!=SDL_KEYDOWN);
  return 0;
}

/*

new get/setpixel: uses real colors

  getPixelColor
  - returns actua
  
  setPixelColor


editing

arrows move by pixel
shift+arrows move by char
zxcv set pixel

some keys copy chars in/out

mouse can also be used for drawing (last selected color used)

12345678QWERTYUI set cell fg or line bg/brd/aux
after setting linecolor, cursor goes one step down

charry fun:
- "edit all similar chars" mode
- blocky areacopy
- count char usage
- find optimizable chars (pixelwise nearest)
- brush?

possibility to load normal bitmap pics (black&white)

DEMOJUONTA: MEZZÄ

ISOPUNK

---

TODOOO:
- valmismerkkejä shiftin kanssa:
  - shift-zxcv. korvaavat koko merkin.
  - diagonaaleja. orrautuvat päällekkäin
  - palloja
- 1bpp-aa
  shift-b plottaa 1-merkin
  shift-n plottaa 0-merkin
  shift-m tekee nätimmän kontekstipyöristyksen tai jotain?
- maalausoperaatiot
  - alt+nuolet: maalaa aluetta
  - merkkioperaatiot pätevätkin nyt koko alueelle
- pari toimintoa:
  - flippaukset x- ja y-suunnissa
  - copypaste on ainoa tarvittava clipboard-toiminto?
  - floodfill 
  - tekstinpiirtomoodi! jokin valmisfontti ladattu editoriin

perusperiaatteet käskyissä:
- x on pikselitason operaatio
  - väri plottaa pikselin
  - zxcv plottaa pikselin
  - nuoli hyppää pikselin verran
  - asdghjklbnm on vielä vapaana
- shift+x tekee jotain koko merkille:
  - shift+väri asettaa värin koko solulle
  - shift+zxcv asettaa värin koko solulle
  - shift+bnmasdfghjkl ovat myös koko solulle toimivia (valmismerkkejä yms)
  - shift+nuoli hyppää merkin verran
- ctrl/alt: erikoisempia toimintoja koko merkille/alueelle
  - ctrl/alt+väri asettavat globaaleja värejä
  - ctrl+c copy area
  - ctrl+v paste area
  - ?? paste with or/xor (ctrl+b/n?)
  - ctrl+x flip horizontal
  - ctrl+z flip vertical
  - ?? invert colors (ctrl+m?)
  - TODO scroll by pixel?
- extra
  - shift-home = clear screen
  - ?? = load
  - ?? = save
  - ?? = render text

LEPPOISA GRAFFAEDITORI, kiva piirrellä nopeasti mäiskettä jossa paljon
copypastettuja alueita yms. jotta uniikkien merkkien määrä pysyy
siedettävänä.

TODO
- LOAD&SAVE!!!!!!!!!!!!!!!!!!!
  - kuvan nimi argseihin
- tämän jälkeen kuville ja animaatioille erillinen optimoija.
  tuottaa datan (assemplysourke) ja rutiinikutsut per frame

bytekuvissa:

pic00xx:
  !byte ch000000FFFF000000
  !byte ch000000FFFF000000
  ...
; mahd. pic00xx_fg:
pic00xx_show:
  lda #<pic00xx
  ldx #>pic00xx
  jsr copyToScreen

aluksi stillkuvat (fg ilman rastereita.
seuraavaksi raster

POOOO:
- kursorin aiheuttama sotkeutuminen pois
- 
- floodfill

PIX TO THINK ABOUT
- väritaustoja ja efektejä
  - still-väritaustoja, mielellään tyylikkään näköisiä vaikka olisivatkin
    abstrakteja :)
  - skrollaavia väritaustoja (skrollaus pysty- ja vaakasuunnassa).
    voivat olla viitteelliisiä, koska bytekuvat muodostavat 
  - ulos- ja sisäänfeidauksia
  - jotain plasmantapaista
- 1bpcaa-silhuetteja:
  - animoituja ihmishahmoja
- bytekuvia
  - still-taustoja joissa ehkä pientä animointia
  - vähittäisanimaatiota (kasvavia köynnöksiä ym.)
  - animoidut silmät

voidaan harrastaa myös "viitteellisiä kuvia" ja pientä psykohuijausta joka saa
ihmiset 

psykohuijatut yksityiskohdat:
- silhuetit ja "äärikontrasti", etenkin animaatiojaksoissa
- nopeasti vaihtuvat otokset

kuvasarjaideoita:
- kaikki ihmishahmot silhueteiksi.
- vähitellen piirtyviä taustoja
- shottivaihtelua:
  - ukko hyppää kuiluun
  - silhuettitason kuva ukosta, skrolli
  - lähestyvä kuilun pohja (tunneliefekti tai pelkkä kasvava juttu)
  - vaihdetaan taas silhuettitasoon
  - lopputömähdys

lähiTsilhuetit navasta ylöspäin?

- establishing shot:

    WE ARE THE ONES

    PWP

juoni päätetään kunhan on kokeeksi piirretty pari pikaista inspiraatiokuvaa.

juonimahdollisuuksia
- hahmovetoisuus: päähahmo ja joitakin muita hahmoja.
- huumori, mahdollisesti genrekliseillevittuilua ja camppia.
- jotain koskettavaa ja kantaaottavaa joka liittyy jotenkin käytettyyn
  teknologiaan.
  - retrofuturismi?
  - videopeliviittauksia?
  - pönkitetään kasibittisiä?
  - haukutaan nykyteknologiaa?
- mahdollisesti myös jotain kantaaottavaa
- boonusta jos saadaan pioneerattua seuraavanlaisilla jutuilla:
  - jännitys päähahmon puolesta
  - loppuylläri
- voidaanko mennä musiikkivideoreittiä?
  raivokasta tunteilua?
- vältetään "teennäistä hölmöyttä" jota on ollut joissakin produissa
- MIELIKUVATYKITYS (a la cyriak) VOISI OLLA AIKA RULES

24x21 = 504
- 63 bytes per full 1bpcaa frame
- 252 bytes for full fgcol frame
- 504 bytes + charset for full bytepic

*/

/*

TODO:
- multiload (state multiple files in argv, load them all as different frames)
- load support for other picture types
  - .bmp -- using SDL_LoadBMP(filename), returns surface
  - .bs -- old bs type

bitmap import modes
- SDL_Surface*s = SDL_LoadBMP(filename);
  convert to 32bpp for ease
- 1bpp without dithering
  - get zooming coefficients for 192x168 (notice aspectratio corr).
    zoomer must do some kind of interpolation
  - check intensity: <treshold becomes 1, >=treshold becomes 
- colornybbles 
  - get zooming coefficients for 24x21
  - check intensity for each component separately, -> color# 0..7

// int*p=bmp->pixels;
// p[



*/
