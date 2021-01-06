/*

Warning: very quick and dirty! Don't use as an example or base for anything!

Originally made for a single prank video ("Illuminatus gameplay (ATARI ST)")
but refurbished for use as the "cover disk game" of Skrolli 2016.1E.

*/

#include <stdio.h>
#include <stdlib.h>
#include <SDL/SDL.h>
#include <SDL/SDL_image.h>
#include <math.h>
#include <string.h>
#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#endif

int msgtimer=0;
char danger;

void drawmenucursor(int x,int y);

char mode=0;
int menuno=0;

int framectr=0;
int intromode=1; // 0 = intro
int dockingstate=0;
double fuel=100.5;
double energy=100.5;
int selection=0;
double stardate;

SDL_Surface*s;
SDL_Surface*buf3d;
SDL_Surface*sfinal;
SDL_Surface*bg;
SDL_Surface*iconsbg;
SDL_Surface*iconsbg_stat;

#ifndef __EMSCRIPTEN__
#  define RGB(r,g,b) (((r)<<16)|((g)<<8)|(b))
#else
#  define RGB(r,g,b) (((b)<<16)|((g)<<8)|(r))
#endif

int mousex,mousey;

#define putpixel(x,y,c) { ((int*)(s->pixels))[((int)(y))*320+((int)(x))]=(c); }
#define putpixel3d(x,y,c) { ((int*)(buf3d->pixels))[((int)(y))*320+((int)(x))]=(c); }

char keystate[1000];

int textcolor;

int pollevent(SDL_Event*e)
{
  int r;
  e->type=0;
  r=SDL_PollEvent(e);
  if(!r) return r;
  if(e->type==SDL_KEYDOWN) keystate[e->key.keysym.sym]=1;
  if(e->type==SDL_KEYUP) keystate[e->key.keysym.sym]=0;
  if(e->type==SDL_MOUSEMOTION)
  {
    mousex=e->motion.x;
    mousey=e->motion.y;
#ifdef __EMSCRIPTEN__
    mousex>>=1;
    mousey>>=1;
#endif
  }
  return r;
//  fwrite(&framectr,sizeof(int),1,stdout);
//  fwrite(e,sizeof(SDL_Event),1,stdout);
}

/*
int eventwhen=-1;
void pollevent(SDL_Event*e)
{
  if(eventwhen<0)
  {
    fread(&eventwhen,sizeof(int),1,stdin);
    fprintf(stderr,"next event @ %d\n",eventwhen);
  }
  if(framectr>=eventwhen)
  {
    fread(e,sizeof(SDL_Event),1,stdin);
    eventwhen=-1;
    fprintf(stderr,"event type %d\n",e->type);
//    pollevent(e);
  } else e->type=0;

  if(e->type==SDL_KEYDOWN) keystate[e->key.keysym.sym]=1;
  if(e->type==SDL_KEYUP) keystate[e->key.keysym.sym]=0;
  if(e->type==SDL_MOUSEMOTION)
  {
    mousex=e->motion.x;
    mousey=e->motion.y;
  }
}
*/

void drawline(int x0,int y0,int x1,int y1,int c)
{
  putpixel(x0,y0,c);
  putpixel(x1,y1,c);
  if((abs(x0-x1)>1) || (abs(y0-y1)>1))
  {
    drawline(x0,y0,(x0+x1+1)/2,(y0+y1+1)/2,c);
    drawline(x1,y1,(x0+x1+1)/2,(y0+y1+1)/2,c);
  }
}

void drawhline(int x0,int y0,int w,int col)
{
  int i;
  if(y0<0 || y0>=255) return;
  for(i=0;i<w;i++) putpixel(x0+i,y0,col);
}

void drawhline2(int x0,int y0,int w,int col,int col2)
{
  drawhline(x0,y0,w,col);
  putpixel(x0,y0,col2);
  putpixel(x0+w-1,y0,col2);
}

void charline(int x0,int y0,int x1,int y1)
{
  drawline(x0,y0,x1,y1,textcolor);
}

int drawchar(int x,int y, int ch, int h,int w,int mode)
{
  if(x<0 || y<0 || x+w>319 || y+h>255) return w;

  // mode&1=serif, mode&2=condensed
  int mh = h/2; // middle height
  int mw = w/2; // middle width
  int sh = h/7;	// serif height
  int yh = h/3; // y toplines height
  int gh = h-1-yh; // g loop height
  if(y<5) mh++;
  h--;
  w--;

  switch(ch)
  {
    case('{'):
      if(SDL_GetTicks()&128)
      {
        charline(x+w,y, x+w,y+h);
        charline(x+w,y, x-1,y+h/2);
        charline(x+w,y+h,x,y+h/2);
      }return w;
    case('A'):
      charline(x,y, x,y+h);
      charline(x+w,y, x+w,y+h);
      charline(x,y, x+w,y);
      charline(x,y+mh, x+w,y+mh);
      return w;
    case('B'):
      charline(x,y, x,y+h);
      charline(x,y, x+w-1,y);
      charline(x,y+mh, x+w-1,y+mh);
      charline(x,y+h, x+w-1,y+h);
      charline(x+w,y+1, x+w,y+mh-1);
      charline(x+w,y+mh+1, x+w-1,y+h-1);
      return w;
    case('C'):
      charline(x,y, x,y+h);
      charline(x,y, x+w-1,y);
      charline(x,y+h, x+w-1,y+h);
      return w-1;
    case('D'):
      charline(x,y, x,y+h);
      charline(x,y, x+w-1,y);
      charline(x,y+h, x+w-1,y+h);
      charline(x+w,y+1, x+w,y+h-1);
      return w;
    case('E'):
      charline(x,y, x,y+h);
      charline(x,y, x+w-1,y);
      charline(x,y+h, x+w-1,y+h);
      charline(x,y+mh, x+mw,y+mh);
      return w-1;
    case('F'):
      charline(x,y, x,y+h);
      charline(x,y, x+w-1,y);
      charline(x,y+mh, x+mw,y+mh);
      return w-1;
    case('G'):
      charline(x,y, x,y+h);
      charline(x,y, x+w,y);
      charline(x,y+h, x+w,y+h);
      charline(x+w,y,x+w,y+sh);
      if(mw>2) charline(x+mw,y+gh,x+w,y+gh);
      charline(x+w,y+gh,x+w,y+h);
      return w;
    case('H'):
      charline(x,y, x,y+h);
      charline(x+w,y, x+w,y+h);
      charline(x,y+mh, x+w,y+mh);
      return w;
    case('I'):
    case('1'):
      charline(x,y, x,y+h);
      return 0;
    case('J'):
      charline(x+w-1,y, x+w-1,y+h);
      charline(x,y+h,x+w-1,y+h);
      if(w>=3)
      {
        charline(x,y,x+w-1,y);
        charline(x,y+h,x,y+gh);
      }
      return w-1;
    case('K'):
      charline(x,y, x,y+h);
      charline(x,y+mh,x+mw,y+mh);
      charline(x+mw+1,y+mh-1,x+w,y);
      charline(x+mw+1,y+mh+1,x+w,y+h);
      return w;
    case('L'):
      charline(x,y, x,y+h);
      charline(x,y+h, x+w-1,y+h);
      return w-1;
    case('M'):
      if(w<4) { w=4; mw=2; }
      if(w&1)w++;
      charline(x,y, x,y+h);
      charline(x+w,y, x+w,y+h);
      charline(x,y, x+mw-1,y);
      charline(x+w,y, x+mw+1,y);
      charline(x+mw,y+1, x+mw,y+h);
      return w;
    case('N'):
      if(w<3) w=4;
      charline(x,y, x,y+h);
      charline(x+w,y, x+w,y+h);
      if(w==3)
        charline(x+1,y+sh, x+w-1,y+h-sh);
      else
      {
        charline(x,y, x+1,y);
        charline(x+w,y+h, x+w-1,y+h);
        charline(x+1,y+1, x+w-2,y+h-1);
      }
      return w;
    case('O'):
    case('0'):
      charline(x,y, x,y+h);
      charline(x,y, x+w,y);
      charline(x,y+h, x+w,y+h);
      charline(x+w,y, x+w-1,y+h);
      return w;
    case('P'):
      charline(x,y, x,y+h);
      charline(x,y, x+w-1,y);
      charline(x,y+mh, x+w-1,y+mh);
      charline(x+w,y+1, x+w,y+mh-1);
      return w;
    case('Q'):
      charline(x,y, x,y+h);
      charline(x,y, x+w,y);
      charline(x,y+gh, x+w,y+gh);
      charline(x+w,y+1, x+w,y+gh);
      return w;
    case('R'):
      charline(x,y, x,y+h);
      charline(x,y, x+w-1,y);
      charline(x,y+mh, x+w-1,y+mh);
      charline(x+w,y+1, x+w,y+mh-1);
      charline(x+w,y+mh+1, x+w,y+h);
      return w;
    case('S'):
    case('5'):
      charline(x,y, x+w-1,y);
      charline(x,y+h, x+w-1,y+h);
      charline(x,y, x,y+mh);
      charline(x+w-1,y+mh, x+w-1,y+h);
      if(h>=4) charline(x,y+mh,x+w-1,y+mh);
      charline(x+w-1,y,x+w-1,y+sh);
      charline(x,y+h,x,y+h-sh);
      return w-1;
    case('T'):
      if(w&1)w++;
      charline(x,y, x+w,y);
      charline(x+mw,y, x+mw,y+h);
      return w;
    case('U'):
      charline(x,y, x,y+h);
      charline(x,y+h, x+w,y+h);
      charline(x+w,y, x+w,y+h);
      return w;
    case('V'):
//      if(w&1)w++;
      charline(x,y, x,y+mh);
      charline(x+w,y, x+w,y+mh);
      charline(x,y+mh, x+mw,y+h);
      charline(x+w,y+mh, x+mw,y+h);
      return w;
    case('Y'):
//      if(w&1)w++;
      charline(x,y, x,y+yh-1);
      charline(x+w,y, x+w,y+yh-1);
      charline(x+1,y+yh, x+w-1,y+yh);
      charline(x+mw,y+yh, x+mw,y+h);
      return w;
    case('W'):
      if(w<4) w=4;
      if(w&1)w++;
      charline(x,y, x,y+h-1);
      charline(x+w,y, x+w,y+h-1);
      charline(x+mw,y+yh, x+mw,y+h-1);
      charline(x+1,y+h, x+mw-1,y+h);
      charline(x+mw+1,y+h, x+w-1,y+h);
      return w;
    case('X'): // todo l8r
      charline(x,y, x+w,y+h);
      charline(x+w,y, x,y+h);
      return w;
    case('Z'):
    case('2'):
      charline(x+w-1,y, x,y);
      charline(x+w-1,y+h, x,y+h);
      charline(x+w-1,y, x+w-1,y+mh);
      charline(x,y+mh, x,y+h);
      if(h>=4) charline(x+w-1,y+mh,x,y+mh);
      return w-1;
      
    case('['):
      charline(x,y, x,y);
      charline(x+w,y, x+w,y);
      charline(x,y+2, x,y+h);
      charline(x,y+h/2, x+w,y+h/2);
      charline(x,y+2, x+w,y+2);
      charline(x+w,y+2, x+w,y+h);
      return w;
    
    case('^'):
      charline(x,y, x,y);
      charline(x+w,y, x+w,y);
      charline(x,y+2, x,y+h);
      charline(x,y+h, x+w,y+h);
      charline(x+w,y+2, x+w,y+h);
      return w;
    case(']'):
      charline(x,y, x,y+gh);
      charline(x,y, x+w-1,y);
      charline(x,y+gh, x+w-1,y+gh);
      charline(x+w-1,y+gh, x+w-1,y+h);
      return w-1;
    case('3'):
      charline(x,y, x+w-1,y);
      charline(x+1,y+mh, x+w-1,y+mh);
      charline(x,y+h, x+w-1,y+h);
      charline(x+w-1,y, x+w-1,y+h);
      return w-1;
    case('4'):
      charline(x,y, x,y+mh);
      charline(x+w,y, x+w,y+h);
      charline(x,y+mh, x+w,y+mh);
      return w;
    case('6'):
      charline(x,y, x,y+h);
      charline(x,y+mh,x+w,y+mh);
      charline(x,y+h, x+w,y+h);
      charline(x+w,y+h, x+w,y+mh);
      return w;
    case('9'):
      charline(x+w,y, x+w,y+h);
      charline(x,y, x,y+mh);
      charline(x,y, x+w,y);
      charline(x,y+mh, x+w,y+mh);
      return w;
    case('8'):
      charline(x,y, x,y+h);
      charline(x+w,y, x+w,y+h);
      charline(x,y, x+w,y);
      charline(x,y+mh, x+w,y+mh);
      charline(x,y+h, x+w,y+h);
      return w;
    case('7'):
      charline(x,y, x+w-1,y);
      charline(x+w-1,y, x+mw,y+mh);
      charline(x+mw,y+mh, x+mw,y+h);
      return w-1;
    case('-'):
      charline(x,y+mh,x+w/4,y+mh);
      return w/4;
    case('%'):
      charline(x+w,y,x,y+h);
      charline(x,y,x,y+yh);
      charline(x+w,y+h,x+w,y+gh);
      return w;
    case('/'):
      charline(x+w,y,x,y+h);
      return w;
    case('.'):
      charline(x,y+h,x+w/4,y+h);
      return w/4;
    case(':'):
      charline(x,y+yh,x+w/4,y+yh);
      charline(x,y+gh,x+w/4,y+gh);
      return w/4;
    case(','):
      charline(x,y+h,x+w/4,y+gh);
      return w/4;
    case('\''):
      charline(x,y,x+w/4,y);
      return w/4;
    case(' '):
      return w/2-1;
    default:
      return -2;
  }
}

char*intrologo= // 86x12
".........     ....   ....  ........  .... .... ....  .... ...... .........  .........."
"  ...  ..      ...    ...  ...  ........   ..   ...  ..   ..  .. .........  ..  ......"
"  ...  ..       ..     ..  ..   .. .. ..   ..   .. . ..   ..  .. . ..   ..  ..  ..   ."
"  ...  ..       ..     ..  ..   .. .. ..   ..   .. . ..   ..  ..   ..   ..  ..  ..    "
"  ...  ..       ..     ..  ..   .. .. ..   ..   .. . ..   ..  ..   ..   ..  ..  ..    "
"  ...  ..       ..     ..  ..   .. .. ..   ..   .. . ..   ......   ..   ..  ..  ......"
"  ...  ..       ..     ..  ..   .. .. ..   ..   .. . ..   ..  ..   ..   ..  ..      .."
"  ...  ..  ..   ..  .. ..  ..   .. .. ..   ..   ..  ...   ..  ..   ..   ..  ..  .   .."
"  ...  ......  ....... ..  ..  ... .. ... ....  ..  .... ...  ...  ..   ..  ..  ......"
"............. ........  ....  .... .. ............  ........  .... ..    ....   ......"
"                                                                                      "
"......................................................................................";

int drawintrologo(int x,int y,int col)
{
  int u,v;
  for(v=0;v<12;v++)
  for(u=0;u<86;u++)
    if(intrologo[v*86+u]!=' ')
      putpixel(x+u,y+v,col);
}

int drawtext(int x,int y,char*t, int h,float w,int mode)
{
  int x0=x;
  float lostep=w-trunc(w),leftover=lostep;
  int oldtextcolor=textcolor;
  if(mode&8)
  {
    int mx,my;
    mode&=~8;
    mx=mousex; my=mousey;
//    SDL_GetMouseState(&mx,&my);
    if(my>=y && my<=y+h) textcolor=0x010101*
      ((int)(192+63*sin(framectr/2.0)));
  }
  
  if(mode&4)
  {
    int tmp=textcolor;
    textcolor=0;
    drawtext(x-1,y-1,t,h,w,mode&~4);
    textcolor=tmp;
  }
//  fprintf(stderr,"%f %f %f\n",w,leftover,lostep);
  while(*t)
  {
    leftover+=lostep;
    x+=2+drawchar(x,y,*t,h,((int)w)+(leftover>=1.0?1:0),mode);
    leftover-=trunc(leftover);
    t++;
  }
  textcolor=oldtextcolor;
  
  return x-x0;
}

/****************************************************/

struct { double x,y,z,a,b,c; } camera;
struct { double x,y,z; } velocity;
double avel=0,bvel=0;
int bar0top=2;
int bar1top=136-70;
int bar2top=153-70;
int bar3top=79-70;
double systemload=0;

void rot2d(double*x,double*y,double a)
{
  double x1,y1;

  x1=*x*cos(a) + *y*sin(a);
  y1=*y*cos(a) - *x*sin(a);

  *x=x1;
  *y=y1;
}

void plotstar(double x,double y,double z)
{
  x-=camera.x;
  y-=camera.y;
  z-=camera.z;
  rot2d(&x,&z,camera.a);
  rot2d(&y,&z,camera.b);
  rot2d(&x,&z,camera.c);
  if(z>.001 && z<3.0)
  {
    x/=z;
    y/=z;
    x=80*x+160;
    y=80*y+100;
    if(x>=0 && x<=319 && y>=0 && y<=255)
    {
     // int*d=((int*)(s->pixels))+((int)y)*320+((int)x);
      putpixel3d(x,y,0xffffff);
    }
  }
}

// shotissa tähdet tasakirkkaita ja niitä on ehkä sata näkyvissä.

void drawstarfield()
{
  double x0,y0,z0,x,y,z;
  x0=trunc(camera.x);
  y0=trunc(camera.y);
  z0=trunc(camera.z);

  for(x=x0-4;x<x0+4;x+=1)
  for(y=y0-4;y<y0+4;y+=1)
  for(z=z0-4;z<z0+4;z+=1)
  {
    int i;
    srand((int)(x+y+z));
    for(i=0;i<8;i++)
    {
      plotstar(x+(rand()&255)/256.0,
               y+(rand()&255)/256.0,
               z+(rand()&255)/256.0);
    }
  }
}

#define SWAP(a,b) { int tmp=a; a=b; b=tmp; }

void drawhline3d(int y,int x0,int x1,int col)
{
  int*d;
  if(y<0 || y>255) return;
  if(x1<0 || x0>319) return;
  if(x0<0) x0=0;
  if(x1>319) x1=319;
  if(x1<x0) SWAP(x0,x1);
  x1++;
  
  d=((int*)buf3d->pixels)+320*y+x0;
  for(;x0<x1;x0++)
  {
    *d++=col;
  }
}

void drawplanet(int x0,int y0,int r,int col0,int col1,double ratio)
{
  int y;
  for(y=-r;y<=r;y++)
  {
    double w=sqrt(r*r-y*y);
    int w0=w*2*ratio;
//    int w1=w*2-w0;
    drawhline3d(y0+y,x0-w,x0-w+w0,col0);
    drawhline3d(y0+y,x0-w+w0,x0+w,col1);
  }
}

void drawsun(int x0,int y0,int r,int col)
{
  int y;
//  fprintf(stderr,"sun: r=%d\n",r);
  srand(framectr/4);
  for(y=-r;y<=r;y++)
  {
    double w=sqrt(r*r-y*y);
    w*=((rand()&63)+256-32)/256.0;
    if(w>0) drawhline3d(y0+y,x0-w,x0+w,col);
  }
}

void drawtriangle(int x0,int y0,int x1,int y1,int x2,int y2,int col)
{
  int dxa,dxb,xa,xb;
  
//  fprintf(stderr,"%d %d - %d %d - %d %d\n",
//    x0,y0,x1,y1,x2,y2);

  if(y0>y2) { SWAP(y0,y2); SWAP(x0,x2); }
  if(y0>y1) { SWAP(y0,y1); SWAP(x0,x1); }
  if(y1>y2) { SWAP(y1,y2); SWAP(x1,x2); }

  x0<<=16;
  x1<<=16;
  x2<<=16;

  if(y0>=y2) return;
  dxa=(x2-x0)/(y2-y0);

  if(y0<y1)
  {
    dxb=(x1-x0)/(y1-y0);

    xa=x0+dxa; xb=x0+dxb;
    for(;y0<y1;y0++)
    {
      drawhline3d(y0,xa>>16,xb>>16,col);
      xa+=dxa;
      xb+=dxb;
    }
    xa-=dxa;
    xb-=dxb;
  } else { xa=x0; xb=x1; }
  if(y0<y2)
  {
    dxb=(x2-xb)/(y2-y1);

    for(;y0<y2;y0++)
    {
      drawhline3d(y0,xa>>16,xb>>16,col);
      xa+=dxa;
      xb+=dxb;
    }    
  }
}

typedef struct
{
  int numverts;
  int numpolys;
  int*vertices;
  int*polygons; // 3 vtex indices & color
} polymesh;

int smallship_verts[] =
{
  -8,-2,-8,
   8,-2,-8,
    0,2,-8,
    0,0, 8
};
int smallship_polys[] =
{
  0,1,2,0xff0000,
  0,1,3,0xffffff,
  0,2,3,0xcccccc,
  1,2,3,0x999999
};
polymesh smallship=
{  4,4,smallship_verts,smallship_polys
};

polymesh station;

#include "telaketju.h"

struct
{
  struct { double x,y,z,a,b,c; } pos;
  struct { double x,y,z,a,b,c; } vel;
  int type;
  char*radartext;
} objs[16];
int numobjs=1;

int polycomp(const void*a,const void *b)
{
  return ((int*)a)[0]<((int*)b)[0] ? -1:1;
}

void drawpolymesh(int x0,int y0,double z0,double a,double b,double c,polymesh*pm)
{
  int i;
  int verts[1000][3];
  int polys[1000][2]; // z & index
  for(i=0;i<pm->numverts;i++)
  {
    double x=pm->vertices[i*3+0];
    double y=pm->vertices[i*3+1];
    double z=pm->vertices[i*3+2];
//    fprintf(stderr,"verts: %d\n",i);
    rot2d(&x,&z,a);
    rot2d(&y,&z,b);
    rot2d(&x,&y,c);
    verts[i][0]=(x*4)/z0 + x0;
    verts[i][1]=(y*4)/z0 + y0;
    verts[i][2]=z*256;
  }
  for(i=0;i<pm->numpolys;i++)
  {
    int minz=verts[pm->polygons[i*4+0]][2],maxz=minz;
    if(verts[pm->polygons[i*4+1]][2]<minz) minz=verts[pm->polygons[i*4+1]][2];
    if(verts[pm->polygons[i*4+2]][2]<minz) minz=verts[pm->polygons[i*4+2]][2];

    if(verts[pm->polygons[i*4+1]][2]>maxz) maxz=verts[pm->polygons[i*4+1]][2];
    if(verts[pm->polygons[i*4+2]][2]>maxz) maxz=verts[pm->polygons[i*4+2]][2];
  
//    fprintf(stderr,"polys: %d\n",i);
    polys[i][0]=
      verts[pm->polygons[i*4+0]][2]+
      verts[pm->polygons[i*4+1]][2]+
      verts[pm->polygons[i*4+2]][2];
    polys[i][1]=i;
  }
   qsort(polys,pm->numpolys,sizeof(int)*2,polycomp);
  for(i=0;i<pm->numpolys;i++)
  {
    int j=polys[i][1];
//    fprintf(stderr,"polys: %d (%d, z=%d)\n",i,j,polys[i][0]);
    double normalz;

    { 
    double ux=verts[pm->polygons[j*4+1]][0] - verts[pm->polygons[j*4+0]][0];
    double uy=verts[pm->polygons[j*4+1]][1] - verts[pm->polygons[j*4+0]][1];
    double uz=verts[pm->polygons[j*4+1]][2] - verts[pm->polygons[j*4+0]][2];

    double vx=verts[pm->polygons[j*4+2]][0] - verts[pm->polygons[j*4+0]][0];
    double vy=verts[pm->polygons[j*4+2]][1] - verts[pm->polygons[j*4+0]][1];
    double vz=verts[pm->polygons[j*4+2]][2] - verts[pm->polygons[j*4+0]][2];

    normalz=ux*vy-uy*vx;
    }

    if(normalz>0 || (!intromode))
    {
    drawtriangle(
      verts[pm->polygons[j*4+0]][0],
      verts[pm->polygons[j*4+0]][1],
      verts[pm->polygons[j*4+1]][0],
      verts[pm->polygons[j*4+1]][1],
      verts[pm->polygons[j*4+2]][0],
      verts[pm->polygons[j*4+2]][1],
      pm->polygons[j*4+3] );
    }
  }
//  fprintf(stderr,"there\n");
}

int targobj=-1;
double targdist;

typedef struct { int n;double x,y,z; } sortob;
int sobcomp(void*a,void*b)
{
  double c = ((sortob*)a)->z - ((sortob*)b)->z;
  if(c<0) return 1; else
  if(c>0) return -1; else return 0;
}

void draw3dscene()
{
  sortob op[32];
//  static int zooz=0;
  int i,j,tobx,toby;
  double shipspeed=sqrt(
    velocity.x*velocity.x +
    velocity.y*velocity.y+
    velocity.z*velocity.z);

//  fprintf(stderr,"ship speed %f\n",shipspeed);

  danger=0;
//  srand(zooz++);  
  targobj=-1;
  targdist=2000;
  for(i=0;i<numobjs;i++)
  {
    double x=objs[i].pos.x-camera.x;
    double y=objs[i].pos.y-camera.y;
    double z=objs[i].pos.z-camera.z;

    rot2d(&x,&z,camera.a);
    rot2d(&y,&z,camera.b);
    rot2d(&x,&z,camera.c);

    op[i].n=i;
    op[i].x=x;
    op[i].y=y;
    op[i].z=z;

//    fprintf(stderr,"obj %d z %f\n",i,z);
  }
  qsort(op,numobjs,sizeof(sortob),sobcomp);

  for(j=0;j<numobjs;j++)
  {
    i=op[j].n;
    double x=op[j].x;
    double y=op[j].y;
    double z=op[j].z;
    double a=objs[i].pos.a-camera.a;
    double b=objs[i].pos.b-camera.b;
    double c=0;//objs[i].pos.c-camera.c;


//    fprintf(stderr,"%f %f %f\n",x,y,z);
    if(z>.01)
    {
      double dist=sqrt(x*x+y*y+z*z);

//    fprintf(stderr,"zorder %d: obj %d z %f dist %f\n",
//      j,i,z,dist);

      x/=z;
      y/=z;
      x=80*x+160;
      y=80*y+100;
            
//      fprintf(stderr,"-> %f %f %f\n",x,y,40/z);
      if(objs[i].type==1)
      {
        static struct { int col0;int col1;double size; } 
        planets[5] =
        {
          RGB(0x00,0xff,0x00),RGB(0x00,0x66,0x00),.3, // 1
          RGB(0xff,0x00,0x00),RGB(0x66,0x00,0x00),.1, // 2
          RGB(0x00,0x00,0xff),RGB(0x00,0xff,0xff),.2, // 3
          RGB(0xff,0xff,0x00),RGB(0xff,0x66,0x00),.4, // 4
          RGB(0xff,0x00,0x00),RGB(0x66,0x00,0x00),.6, // 5
        };
        
        drawplanet(x,y,(1000*planets[i-1].size)/dist,
          planets[i-1].col0,planets[i-1].col1,planets[i-1].size);
      }

      if(x>120 && x<200 && y>80 && y<120 && z<targdist)
      {
        if(z<10 || objs[i].type==1 || objs[i].type==2)
        {
          tobx=x;
          toby=y;
          targobj=i; targdist=dist;
        }
//        targz=z;
      }

      if(objs[i].type==2)
        drawsun(x,y,1000/dist,0xffffff);
      if(objs[i].type==3)
        drawpolymesh(x,y,dist,objs[i].pos.a,objs[i].pos.b,
          objs[i].pos.c,&smallship);
      if(objs[i].type==4)
        drawpolymesh(x,y,dist,objs[i].pos.a,objs[i].pos.b,
          objs[i].pos.c,&station);
      if(objs[i].type==5)
        drawpolymesh(x,y,dist,objs[i].pos.a,objs[i].pos.b,
          objs[i].pos.c,&telaketju);
    
    if(!intromode && (dist>=20 && (objs[i].type==3 || objs[i].type==5)))
    {
      double a=(rand()&255)/64.0;
      double nd=(((rand()&255)+256)*10)/256.0;
      double tx=camera.x;
      double ty=camera.y;
      double tz=camera.z;
      
      if(!(rand()&3)) tx=ty=tz=0;
      
      tx += ((rand()&63)-32)/32.0;
      ty += ((rand()&63)-32)/32.0;
      tz += ((rand()&63)-32)/32.0;

      objs[i].pos.x = camera.x + nd*sin(a);
      objs[i].pos.y = camera.y + nd*cos(a);
      objs[i].pos.z = camera.z;
      objs[i].vel.x = (tx-objs[i].pos.x)/1024.0;
      objs[i].vel.y = (ty-objs[i].pos.y)/1024.0;
      objs[i].vel.z = (tz-objs[i].pos.z)/1024.0;
      
      {double r=sqrt(
        objs[i].vel.x * objs[i].vel.x +
        objs[i].vel.y * objs[i].vel.y +
        objs[i].vel.z * objs[i].vel.z);
        if(r>=1.0)
        {
          objs[i].vel.x /= r;
          objs[i].vel.y /= r;
          objs[i].vel.z /= r;
        }}
      
      objs[i].type=3;
    }
    
    if(dist<(shipspeed+.001)*100)
    {
//      fprintf(stderr,"dangerously nearby object %f, shipspeed %f\n",dist,
//        shipspeed);
        
      if(objs[i].type==1 || objs[i].type==2 || objs[i].type==4)
      {        
        if(dist<(shipspeed+.001)*30 ||
              z<(shipspeed+.001)*30)
        {
          velocity.x=1.0;
          mode=22;
          msgtimer=SDL_GetTicks();
        }
      }

      danger=1;
    }
    
    }

    
//    fprintf(stderr,"object %d z = %f\n",i,z);

    // objektityypit:
    // - planeetta (kaukana, ei tutkassa)
    // - tähti (kaukana, ei tutkassa)
    // - 3d-objekti  }
  }
/*
  if(targobj>=0 && mode==21)
  {
    textcolor=RGB(0,255,0);
    drawtext(tobx+2,toby-2,objs[targobj].radartext,5,3,0);
  }
*/
}


// laitetaan kiihtyvä rotaatio (tosin jokin katto rotaationopeudelle)

void controlship()
{
  double spd=sqrt(velocity.x*velocity.x
      + velocity.y*velocity.y
      + velocity.z*velocity.z);
      
//  fprintf(stderr,"abc %f %f %f\n",camera.a,camera.b,camera.c);

  if(keystate[SDLK_RIGHT]) { avel-=.0005; systemload+=.002; energy-=.02; }
  else
  if(keystate[SDLK_LEFT]) { avel+=.0005; systemload+=.002; energy-=.02; }
  else
  { avel=(avel*7)/8.0;
    if(fabs(avel)<=.002) avel=0;
  }
  
  camera.a += avel;
  
  if(keystate[SDLK_DOWN]) { bvel-=.002; systemload+=.002; energy-=.02; }
  else
  if(keystate[SDLK_UP]) { bvel+=.002; systemload+=.002; energy-=.02; }
  else
  {
    bvel=(bvel*7)/8.0;
    if(fabs(bvel)<=.002) bvel=0;
  }
  
  if(energy<100 && fuel>=.002)
  {
    energy+=.02;
    fuel-=.002;
  }
  
  camera.b += bvel;
  
//  camera.c = (avel+bvel)*6;

  if(keystate[SDLK_PAGEUP] && systemload<30 && fuel>=.001)
  {
    double x=0,y=0,z=0.0001;
    rot2d(&y,&z,-camera.b);
    rot2d(&x,&z,-camera.a);
    velocity.x+=x;
    velocity.y+=y;
    velocity.z+=z;
    systemload+=.1;
    fuel-=.001;
    energy-=.07;
  }
  
//  fprintf(stderr,"%f\n",spd);

  if(keystate['1']) selection=0;
  if(keystate['2']) selection=1;
  if(keystate['3']) selection=2;
  if(keystate['4']) selection=3;
  if(keystate['5']) selection=4;

  if(systemload<25) systemload-=systemload/400.0;
    else systemload-=.01;

  bar0top=102-fuel;

  bar1top=100-systemload*3;
  bar2top=100-spd*1000;
//  if(keystate[SDLK_ESCAPE]) { SDL_Quit(); exit(0); }  
  if(keystate[SDLK_HOME])
  {
    // käänny kulkusuuntaan
  }
  if(keystate[SDLK_END])

  
  camera.a-=.01;

  {
    // käänny kulkusuuntaa vastaan
  }
  if(keystate[SDLK_PAGEDOWN] && systemload<30 && fuel>=.001)
  {
    double x,y,z,r;
    x=velocity.x;
    y=velocity.y;
    z=velocity.z;
    r=sqrt(x*x+y*y+z*z);
    if(r>0.0001)
    {
      x/=r;
      y/=r;
      z/=r;
      x*=0.0001;
      y*=0.0001;
      z*=0.0001;
      velocity.x-=x;
      velocity.y-=y;
      velocity.z-=z;

      systemload+=.1;
      fuel-=.001;
      energy-=.07;
    }
    // jarrua (kaasua vastakkaiseen suuntaan. tai sitten ihan vain velocityn
    // pienentämistä)
  }

  // y=0:aan vajoaminen vähittäistä ja ei velocityn kautta

  camera.x += velocity.x;
  camera.y += velocity.y;
  camera.z += velocity.z;
/*  
  fprintf(stderr,"camera %f,%f,%f heading %f,%f velocity %f,%f,%f\n",
    camera.x,camera.y,camera.z, camera.a,camera.b, velocity.x,velocity.y,velocity.z);
*/
}

/****************************************************/

void stpostproc(int fade)
{
  int i=0,j=0,q;
  if(fade<0) fade=0;
  for(j=0;j<256;j++)
  for(i=0;i<320;i++)
  {
    char*w=(char*)(sfinal->pixels)+4*((j-0)*640*2+i*2);
    
    for(q=0;q<4;q++)
    {
    int n=(j*320+i)*4+q;
    int v=((char*)s->pixels)[n];
    
    v=(v&0xe0)-fade; if(v<0) v=0;
    v&=0xe0;
    w[0+q]=w[640*4+q]=w[1*4+q]=w[641*4+q]=v;
    }
    
//    ((char*)s->pixels)[i]=v;
  }
}

void flutter(int t)
{
  int y;
  for(y=0;y<256-180;y++)
  {
    SDL_Rect src,trg;
    float f=1+(sin((t*.02+y*4)*.3))*.2*sin(t*.0006);
    trg.y=180+y;trg.x=0;
    src.y=180-y*f;src.x=0;
    src.h=trg.h=1;src.w=trg.w=320;
    SDL_BlitSurface(s,&src,s,&trg);
  }
}

void hangaraction();
void randomizehangar();

void setupobj(int i,int tp,double x,double y,double z,char*name)
{
  objs[i].type=tp;
  objs[i].pos.x = x;
  objs[i].pos.y = y;
  objs[i].pos.z = z;
  objs[i].pos.a =
  objs[i].pos.b =
  objs[i].pos.c = 0;
  objs[i].vel.x=objs[i].vel.y=objs[i].vel.z=0;
  objs[i].vel.a=objs[i].vel.b=objs[i].vel.c=0;
  if(tp==1 || tp==2)
  {
    objs[i].pos.a=3.1415926;//(rand()&256)/64.0;
//    objs[i].pos.b=0;
//    objs[i].pos.c=-.2;//(rand()&256)/64.0;
//    objs[i].pos.c=(rand()&256)/64.0;
    objs[i].pos.b=-.2;
    objs[i].vel.a=-0.01;
  }
  if(tp==4)
  {
//    objs[i].pos.b=3.1415926/2.0;
    objs[i].vel.c=.003;
  }
  objs[i].radartext=name;
}

void initsolarsystem()
{
  int i;
  numobjs=16;
  
  camera.x=camera.y=camera.z=
  velocity.x=velocity.y=velocity.z=0;
//  camera.a=camera.b=camera.c=0;

  camera.a = -4.761199;
  camera.b = -0.090104;
  camera.c = 0.000000;

  setupobj(0, 4, 1.5,0,0,      "STATION");
  setupobj(1, 1, 75.0,0,75.0,    "EMINIAR 1");
  setupobj(2, 1, 50.0,0,50.0,    "EMINIAR 2");
  setupobj(3, 1, -1.5,0,0,       "EMINIAR 3");
  setupobj(4, 1, -100.0,0,100.0, "EMINIAR 4");
  setupobj(5, 1, 0,0.0,200.0,    "EMINIAR 5");
  setupobj(6, 2, 100.0,0,100.0,  "EMINIAR");

      for(i=7;i<15;i++)
      {
        objs[i].type=3;
        objs[i].pos.x=((rand()&255)-128)/32.0;
        objs[i].pos.y=((rand()&255)-128)/32.0;
        objs[i].pos.z=((rand()&255)-128)/32.0;
        
        objs[i].pos.a=(rand()&255)/64.0;
        objs[i].pos.b=(rand()&31)/64.0;
        objs[i].pos.c=0;
        objs[i].vel.x=objs[i].vel.y=objs[i].vel.z=0; //((rand()&255)-128)/10000.0;
        objs[i].vel.a=objs[i].vel.b=objs[i].vel.c=0;
        objs[i].radartext="COD";

        if(i>=11)
        {
          objs[i].vel.x = ((rand()&255)-128)/128.0;
          objs[i].vel.y = ((rand()&255)-128)/128.0;
          objs[i].vel.z = ((rand()&255)-128)/128.0;
          objs[i].pos.x *= 30;
          objs[i].pos.y *= 30;
          objs[i].pos.z *= 30;
        }
      }
}

void initflymode()
{
  int i;
  menuno=1;
  selection=0;
//  initsolarsystem();
/*  
  objs[1].pos.y=0; objs[0].pos.z=-1.5;
  objs[1].pos.x=1;
  objs[1].pos.a=objs[1].pos.b=objs[1].pos.c=0;
  objs[1].pos.b=0;
  objs[1].type=4;
  objs[1].vel.x=objs[0].vel.y=objs[0].vel.z=0;
  objs[1].vel.z=0; //-0.05;
  objs[1].vel.a=0; //-.01; //-0.01; //.014;
  objs[1].vel.b=0; //-.02;//.01;
  objs[1].vel.c=.003;
  objs[1].radartext="STATION";

  objs[0].pos.y=0; objs[0].pos.z=-5.0;
  objs[0].pos.x=0;
  objs[0].pos.c=3.1415926;
  objs[0].pos.b=-.2;
  objs[0].type=1;
  objs[0].vel.x=objs[0].vel.y=objs[0].vel.z=0;
//  objs[0].vel.z=-0.05;
  objs[0].vel.a=-0.01; //.014;
  objs[0].vel.b=0;//.01;
  objs[0].vel.c=0;//.011;
  objs[0].radartext="EMINIAR 3";
  
  objs[3].pos.y=0; objs[3].pos.z=200.0;
  objs[3].pos.x=-200;
  objs[3].pos.c=3.1415926;
  objs[3].pos.b=-.2;
  objs[3].type=1;
  objs[3].vel.x=objs[3].vel.y=objs[3].vel.z=0;
//  objs[0].vel.z=-0.05;
  objs[3].vel.a=-0.01; //.014;
  objs[3].vel.b=0;//.01;
  objs[3].vel.c=0;//.011;
  objs[3].radartext="EMINIAR 5";
*/
}

void dotick()
{
  int i;
  if(!dockingstate) controlship();
  framectr++;
  if(!(rand()&255)) hangaraction();
  if(!(framectr&16383)) stardate+=0.01;
  if(dockingstate>0 && dockingstate<100)
  {
    dockingstate--;
    if(!dockingstate) initflymode();
  }

  for(i=0;i<numobjs;i++)
  {
    objs[i].pos.x+=objs[i].vel.x;
    objs[i].pos.y+=objs[i].vel.y;
    objs[i].pos.z+=objs[i].vel.z;
    objs[i].pos.a+=objs[i].vel.a;
    objs[i].pos.b+=objs[i].vel.b;
    objs[i].pos.c+=objs[i].vel.c;
  }
  
//  ticksleft=frametimer-SDL_GetTicks();
//  if(ticksleft>0) usleep(ticksleft*1000);
}

void finishdrawing()
{
  static int frametimer=0;

  SDL_Flip(sfinal);

/*
  if(frametimer < SDL_GetTicks()) do
  {
    dotick();
    frametimer+=1000/50;
  } while(frametimer < SDL_GetTicks());
  else {
#ifdef UNIX
    usleep(10000);
#endif
  }
*/
}

void doframe(int fade)
{
  if (SDL_MUSTLOCK(sfinal)) SDL_LockSurface(sfinal);
  stpostproc(fade);
  if (SDL_MUSTLOCK(sfinal)) SDL_UnlockSurface(sfinal);
  finishdrawing();
}

/*
doframe()
{
  static int isfirst=1;
  static int frametimer;
//  int ticksleft;
  static myticks=0;
  int x,y;
  controlship();
  SDL_Flip(sfinal);
  framectr++;
  if(dockingstate>0) dockingstate--;
// ticksleft=frametimer-myticks;
  //if(ticksleft>0) usleep(ticksleft*1000);
  frametimer+=1000/50;
  // wait until next frame  
  myticks+=1000/50;

  if(framectr&1) {

  if(isfirst)
  {
    printf("YUV4MPEG2 W%d H%d F%d:%d Ip A0:0 C420mpeg2 XYSCSS=420MPEG2\n",
    640,
    480,
    25,1);
    isfirst=0;
  }
  printf("FRAME\n");
  for(y=0;y<480;y++)
  for(x=0;x<640;x++)
  {
    int a=((int*)(sfinal->pixels))[(y+16)*640+x];
    int R=(a>>16)&255,G=(a>>8)&255,B=a&255;
    int Y = ( (  66 * R + 129 * G +  25 * B + 128) >> 8) +  16;
    //int U = ( ( -38 * R -  74 * G + 112 * B + 128) >> 8) + 128;
    //int V = ( ( 112 * R -  94 * G -  18 * B + 128) >> 8) + 128;
    putchar(Y);
  }
  for(y=0;y<480;y+=2)
  for(x=0;x<640;x+=2)
  {
    int a=((int*)(sfinal->pixels))[(y+16)*640+x];
    int R=(a>>16)&255,G=(a>>8)&255,B=a&255;
    //int Y = ( (  66 * R + 129 * G +  25 * B + 128) >> 8) +  16;
    int U = ( ( -38 * R -  74 * G + 112 * B + 128) >> 8) + 128;
    //int V = ( ( 112 * R -  94 * G -  18 * B + 128) >> 8) + 128;

    U=((U-128)*3/4.0)+128;

    putchar(U);
  }
  for(y=0;y<480;y+=2)
  for(x=0;x<640;x+=2)
  {
    int a=((int*)(sfinal->pixels))[(y+16)*640+x];
    int R=(a>>16)&255,G=(a>>8)&255,B=a&255;
    //int Y = ( (  66 * R + 129 * G +  25 * B + 128) >> 8) +  16;
    //int U = ( ( -38 * R -  74 * G + 112 * B + 128) >> 8) + 128;
    int V = ( ( 112 * R -  94 * G -  18 * B + 128) >> 8) + 128;
    
    V=((V-128)*3/4.0)+128;
    
    putchar(V);
  }
  }
}
*/



char*menus[] =
{
  "STATION SERVICES",
  "LAUNCH",
  "SHIP SYSTEMS",
  "ARMS AND DRONES",
  "CARGO BAY",

  "NAVIGATION",
  "SCIENCE OPS",
  "SHIP SYSTEMS",
  "ARMS AND DRONES",
  "CARGO BAY"
};


drawminidisplays()
{
  if(intromode)
  {
    int t=((SDL_GetTicks()-msgtimer)/2048)&7;
    // illuminatus-logo 18,203 - 102,215 ml alleviivaus
    textcolor=RGB(0,255,0);
    drawintrologo(16,204,RGB(0,255,0));
    
    if(t<4)
    {
      drawtext(16,220,"CODE:J^RGEN STERNREISE",7,3.6,0);
      drawtext(25,230,"GRAPHS:ERIK DORF",7,4,0);
    }
    else
    if(t==4)
    {
      drawtext(16,220,"ORIGINAL CONCEPT:",7,4,0);
      drawtext(16,230,"NIKO NIRVI",9,6,0);
    }
    else
    if(t==5)
    {
      drawtext(16,220,"ORIG SCREENSHOTS:",7,4,0);
      drawtext(16,230,"PETRI TEITTINEN",9,6,0);
    }
    else
    if(t==6)
    {
      drawtext(16,220,"NEW CODE AND MOST GFX:",7,3.6,0);
      drawtext(16,230,"VILLE-MATIAS HEIKKIL[",9,4,0);
    }
    else
    if(t==7)
    {
      drawtext(16,220,"3D MODELLING:",7,6,0);
      drawtext(16,230,"NASU VILJANMAA",9,6,0);
    }
    if(framectr&16) {
    drawtext(225,208,"PRESS ANY KEY TO",7,4,0);
    drawtext(248,226,"BEGIN",7,4.5,0); }
  } else
  {
    int i;
    char txtbuf[100];
    textcolor=RGB(0,255,0);
    sprintf(txtbuf,"FUEL LEVEL  %d%%",(int)fuel);
    drawtext(50,185,txtbuf,5,3,0);
    sprintf(txtbuf,"ENERGY LEVEL %d%%",(int)energy);
    drawtext(215,185,txtbuf,5,3,0);
    
    sprintf(txtbuf,"%d%%",(int)energy);
    drawtext(140,98,"17100",5,3,0);
    drawtext(142,106,txtbuf,5,3,0);
    
    drawtext(164,98,"LASER",5,3,0);
    drawtext(164,106,"OFF",5,3,0);
    
    for(i=0;i<5;i++)
    {
      // 17,201 yläreuna
      int w = drawtext(17+19,205+7*i,menus[menuno*5+i],4,3,0);
      if(i==selection)
      {
        textcolor=RGB(255,255,0);
        charline(17+17,203+7*i, 17+17+w+2,203+7*i);
        charline(17+17,210+7*i, 17+17+w+2,210+7*i);
        charline(17+17,203+7*i, 17+17,210+7*i);
        charline(17+17+w+2,203+7*i, 17+17+w+2,210+7*i);
        textcolor=RGB(0,255,0);
        drawmenucursor(17+2,204+7*i);
      }
    }
    
    if(danger)
    {
      textcolor=RGB(255,0,0);
      if(framectr&4)
      drawtext(219,220,"COLLISION ALERT",5,5,0);
    }
    else
    {
    if(menuno==0 && selection==0)
    {
      drawtext(219,208,"ALERT STATUS: GREEN",5,3,0);
      drawtext(219,224,"PRESS ENTER TO",5,3,0);
      drawtext(219,232,"ENTER STATION",5,3,0);
    } else
    if(menuno==0 && selection==1)
    {
      if(dockingstate<100)
        drawtext(229,220,"LAUNCHING...",5,3,0);
      else {
      drawtext(219,208,"ALL SYSTEMS CLEAR",5,3,0);
      drawtext(219,216,"FOR TAKEOFF",5,3,0);
      drawtext(219,232,"PRESS ENTER TO LAUNCH",5,3,0);
      }
    }
      else
    if(targobj>=0)
    {
      int tp=objs[targobj].type;
      char txtbuf[100];
      if(tp==1 || tp==2)
        sprintf(txtbuf,"DISTANCE: %2.2f AU",targdist/100.0);
      else
        sprintf(txtbuf,"DISTANCE: %3.0f KM",targdist*10);
      drawtext(219,224,txtbuf,5,3,0);

      if(tp==3)
        sprintf(txtbuf,"OBJECT: COD %d\n",(31337*targobj)&65535);
      else if(tp==4)
        sprintf(txtbuf,"OBJECT: EMINIAR 3 BASE");
      else
        sprintf(txtbuf,"OBJECT: %s",objs[targobj].radartext);
      drawtext(219,208,txtbuf,5,3,0);

      if(tp==1)
        sprintf(txtbuf,"TYPE: CLASS %c PLANET",
          "CRMKFK"[targobj]);
      else if(tp==2)
        sprintf(txtbuf,"TYPE: CLASS F STAR");
      else if(tp==4)
        sprintf(txtbuf,"TYPE: SPACE STATION");
      else if(tp==3)
        sprintf(txtbuf,"TYPE: COD MK. 1");
      else if(tp==5)
        sprintf(txtbuf,"TYPE: SOYUZ CLASS DESTROYER");
      drawtext(219,216,txtbuf,5,3,0);
    }
    else
      if(menuno==1 && selection==0)
    {
      if(fuel>=0.1)
      {
        double spd = sqrt(
          velocity.x*velocity.x+
          velocity.y*velocity.y+
          velocity.z*velocity.z);

        drawtext(229,208+4,"MAIN ENGINES ON",5,3,0);
        if(spd>.001)
        {
          char txt[20];
          sprintf(txt,"IMPULSE SPEED %4.1f",spd*100);
          drawtext(229,224+4,txt,5,3,0);
        }
      }
      else
      {
        textcolor=RGB(0xff,0x00,0x00);
        if(framectr&16)
        drawtext(229,220,"SHIP OUT OF FUEL",5,3,0);
      }
    }
    else
    {
      if(selection==4 || menuno==1)
      drawtext(249-15,220,"UNAVAILABLE",5,3,0);
        else
      drawtext(249-15,220,"OFF",5,3,0);
    }
    }

//    drawtext(100,100,"MOIMOII",6,4,0);

    // menu vasempaan
    // vaihtelevaa statusdataa oikeaan (riippuu valitusta menukohdasta)
  }
}

#define YC -3
void drawradar()
{
  int barRed=RGB(0xff,0x00,0x00);
  int barYel=RGB(0xff,0xff,0x00);

  int i;
  int zz=0;
  float a;
  for(a=0;a<2*3.1415926;a+=.02)
  {
    int y=sin(a)*44;

    if(y<39 && y>-41)
      drawline(159+cos(a)*44,210-YC+sin(a)*44, 159+cos(a+.01)*44,210-YC+sin(a+.01)*44, barRed);

    if(!(zz%8)) putpixel(159+cos(a)*33,210-YC+sin(a)*33, barRed);
    if(!(zz%12)) putpixel(159+cos(a)*22,210-YC+sin(a)*22, barRed);
    if(!(zz%16)) putpixel(159+cos(a)*11,210-YC+sin(a)*11, barRed);

    if(a>4.2 && a<5.28) // && a<6)
      drawline(159+cos(a)*11,210-YC+sin(a)*11, 159+cos(a+.01)*11,210-YC+sin(a+.01)*11, barRed);

    zz++;
  }

  drawline(114,210-YC,202,210-YC,barRed);
  drawline(159,171,   159,252,   barRed);
  drawline(159,210-YC,135,174-YC,barRed);
  drawline(159,210-YC,182,174-YC,barRed);
  
  if((!intromode) && (!dockingstate))
  for(i=0;i<numobjs;i++)
  {
    if(objs[i].type>=3)
    {
      double x=objs[i].pos.x-camera.x;
      double y=objs[i].pos.y-camera.y;
      double z=objs[i].pos.z-camera.z;
    
      rot2d(&x,&z,camera.a);
      rot2d(&y,&z,camera.b);
      
      {double r0=sqrt(x*x+z*z);
       double r1=sqrt(x*x+z*z+y*y);
       if(r0>0)
       {
         x*=(r1/r0);
         z*=(r1/r0);
       }
      }

   // normalize for y

      x=x*4+159;
      z=-z*4+210;
      
      if(x>=159-44 && x<=159+44 && z>=171 && z<=252)
      {
        putpixel(x,z,barYel);
        putpixel(x+1,z,barYel);
        putpixel(x,z+1,barYel);
        putpixel(x+1,z+1,barYel);

        textcolor=RGB(0,255,0);
        drawtext(x+3,z-1,objs[i].radartext,3,3,0);
      }

      // x & z
    }
  }
}

signed char energybarpos[]={
0,0,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,8,8,8,8,9,9,9,9,9,
10,10,10,10,11,11,11,11,12,12,12,12,12,13,13,13,13,14,14,14,15,15,15,15,15,
16,16,16,16,17,17,17,17,17,18,18,18,18,18,18,19,19,19,19,19,19,19,
20,20,20,20,20,20,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,
23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,-1
};


drawenergybars()
{
  int i=0;
  int barBlue=RGB(0x00,0x00,0xff);
  int barCyan=RGB(0x00,0xff,0xff);
  while(energybarpos[i]>=0)
  {
    if(i>=bar0top) drawhline2(38+3-energybarpos[i], 70+i, 8,barBlue,barCyan);
    if(i>=bar1top) drawhline2(54+3-energybarpos[i], 70+i, 8,barBlue,barCyan);
    if(i>=bar2top) drawhline2(249+3+energybarpos[i], 70+i, 8,barBlue,barCyan);
    if(i>=bar3top) drawhline2(265+3+energybarpos[i], 70+i, 8,barBlue,barCyan);
    // todo syaanit reunat myös
    i++;
  }
  drawhline(38+3-energybarpos[bar0top],70+bar0top,8,barCyan);
  drawhline(54+3-energybarpos[bar1top],70+bar1top,8,barCyan);
  drawhline(249+3+energybarpos[bar2top],70+bar2top,8,barCyan);
  drawhline(265+3+energybarpos[bar3top],70+bar3top,8,barCyan);
  // ehdotus: kun alus on poweroffissa niin r/g/b-värit himmenetään paitsi ei pikkunäytöistä?
}

drawshieldbars()
{
  // todo l8r (introssa selvitään ilman)
}

void draw3d()
{
  int i;
//  SDL_Rect fs={0,0,320,240};
#ifndef __EMSCRIPTEN__
  SDL_FillRect(buf3d,NULL,0);
#else
  {for(i=0;i<320*256;i++) ((int*)buf3d->pixels)[i]=0; }
#endif
//  memset(buf3d->pixels,320*240*sizeof(int),0);

  if(!intromode) drawstarfield();
  draw3dscene();

    if(dockingstate>0)
    {
      int i,ds;
      ds=dockingstate;
      if(ds>100) ds=100;
      
      ds=100-ds;
      ds=(ds*ds)/100;
      ds=100-ds;
      
//      camera.a=camera.b=0;
//      camera.c+=.01;
      for(i=0;i<112;i++)
      {
        int q=i;
        if(q>ds) q=ds;
      
        drawhline3d(i-20,0,q,0x999999);
        if(i<ds) drawhline3d(i-20,i,320-i,0xcccccc);
        drawhline3d(i-20,320-q,320,0x999999);

        drawhline3d(200-i,0,q,0x999999);
        if(i<ds) drawhline3d(200-i,i,320-i,0xcccccc);
        drawhline3d(200-i,320-q,320,0x999999);
      }
//      if(dockingstate>1) { menuno=0; selection=0; }
    } // else camera.c=(camera.c*7)/8.0;

  if(mode==22)
  for(i=0;i<320*256;i++)
    ((int*)s->pixels)[i] = ((int*)buf3d->pixels)[i];
  else
  for(i=0;i<320*200;i++)
  {
    int a=((int*)(s->pixels))[i];
    if(!(a&0xffffff)) ((int*)(s->pixels))[i] = ((int*)(buf3d->pixels))[i];
  }
}

drawcross()
{
  // todo l8r
}

char*cursorshape= // 12x11
" ******     "
"******      "
"*******     "
"********    "
"*********   "
"** *******  "
"*   ******* "
"     *******"
"      ***** "
"       ***  "
"        *   ";

char*menucursorshape= // 14x6
"..........**.."
"..........***."
"**************"
"**************"
"..........***."
"..........**..";

void drawcursor()
{
  int x,y,u,v;
  int col=RGB(0xff,0x00,0x00);
  x=mousex; y=mousey;
//  SDL_GetMouseState(&x,&y);
  if(x<310 && y<245)
  {
    for(v=0;v<11;v++)
    for(u=0;u<12;u++)
      if(cursorshape[v*12+u]!=' ')
        putpixel(x+u,y+v,col);
  }
}

void drawmenucursor(int x,int y)
{
  int col=RGB(0xff,0xff,0x00);
  int u,v;
  {
    for(v=0;v<6;v++)
    for(u=0;u<14;u++)
      if(menucursorshape[v*14+u]!='.')
        putpixel(x+u,y+v,col);
  }
}

void drawcockpit()
{
  SDL_BlitSurface(bg,NULL,s,NULL);
  
  drawminidisplays();
  drawradar();
  drawenergybars();
  drawshieldbars();
  draw3d();
  drawcross();
  if(intromode) drawcursor();
}

void drawrawspace()
{
  int i;
  for(i=0;i<320*256;i++)
    ((int*)s->pixels)[i]=0;
  draw3d();
}

void drawgameovernoise(int t)
{
  int i;
  t&=255;
  for(i=0;i<320*256;i++)
    ((int*)s->pixels)[i]|=(rand()&t)*0x010101;
}

/*

  int fade=256;
  bg=IMG_Load("assets/cockpit.png");
  intromode=1;

  numobjs=1;
  objs[0].pos.y=1; objs[0].pos.z=40.0;
  objs[0].pos.x=1;
  objs[0].pos.c=3.1415926;
  objs[0].pos.b=-.2;
  objs[0].type=5;
  objs[0].vel.x=objs[0].vel.y=objs[0].vel.z=0;
  objs[0].vel.z=-0.05;
  objs[0].vel.a=-0.01; //.014;
  objs[0].vel.b=0;//.01;
  objs[0].vel.c=0;//.011;
  objs[0].radartext="COD";

  for(;;)
  {
    SDL_Event e;
    pollevent(&e);
//    SDL_PollEvent(&e);
    if(e.type==SDL_KEYDOWN) break;
    drawcockpit();
    stpostproc(fade); fade-=4;
    doframe(0);
    if(objs[0].pos.z<8.0)
    {
      objs[0].vel.z=0;
      objs[0].vel.b=-.02;
      objs[0].vel.c=.0012;
    }
  }
*/

cockpitpart()
{
  numobjs=8;
  int i;

  bg=IMG_Load("assets/cockpit.png");
  intromode=0;  
}

char speedingup=0;

void drawhint(int mm)
{
  int x,y;
  char*txt;
  char stardatebuf[20];
  txt=stardatebuf;
  sprintf(stardatebuf,"STARDATE %2.2f",stardate);
  textcolor=RGB(0,255,0);
  x=mousex; y=mousey;
//  SDL_GetMouseState(&x,&y);
  if(mm==1 && x>=154 && x<=305 && y>=52 && y<=200)
  {
    if(y>=100 && y<=153 && x>=199 && x<=252)
      txt="HANGAR";
    else
      if(x<226 && y<94) txt="PRODUCTION";
    else
      if(x>226 && y<94) txt="SHIP SERVICE";
    else
      if(x<226 && y>156) txt="TRADE DEPOT";
    else
      if(x>226 && y>156) txt="LOUNGE";
  }
  if(y>=222 && y<=242)
  {
    if(x>=199 && x<=225 && speedingup)
    {
      stardate+=0.001; randomizehangar();
    }
    else {
    speedingup=0;
    textcolor=RGB(255,255,255);
    if(x<21) txt="COMMANDER";
    else
    if(x<50) txt="STATION";
    else
    if(x<74) txt="PROPERTY";
    else
    if(x<99) txt="MAP";
    else
    if(x<121) txt="NEWS";
    else
    if(x<149) txt="INFO BANK";
    else
    if(x<174) txt="TASK LIST";
    else
    if(x<199) txt="COMPUTER";
    else
    if(x<225) txt="SPEED UP";
    }
  } else speedingup=0;
  drawtext(233,228,txt,8,4,0);
}

void stationmodeswitch()
{
  int x=mousex;
  int y=mousey;
  if(x>=154 && x<=305 && y>=52 && y<=200)
  {
    if(y>=100 && y<=153 && x>=199 && x<=252) mode=16;
    else
      if(x<226 && y<94) mode=17;
    else
      if(x>226 && y<94) mode=18;
    else
      if(x<226 && y>156) mode=19;
    else
      if(x>226 && y>156) mode=20;
  }
}

void officemodeswitch()
{
  if(mousey>=222 && mousey<=242)
  {
  int x=mousex;
  if(x<21) mode=7;
  else
  if(x<50) mode=8;
  else
  if(x<74) mode=9;
  else
  if(x<99) mode=10;
  else
  if(x<121) mode=11;
  else
  if(x<149) mode=12;
  else
  if(x<174) mode=13;
  else
  if(x<199) mode=14;
  else
  if(x<225) speedingup^=1;
  }
}

char cmdrname[16];
char shipname[16];

#define N 12
void makespacestation()
{
  int i;
  station.numverts=N*7+2;
  station.numpolys=N*64/4;

  station.vertices=malloc(station.numverts*3*sizeof(int));
  station.polygons=malloc(station.numpolys*4*sizeof(int));

  for(i=0;i<N;i++)
  {
    double a=i*(2*3.14915926/N);
    int col=(i&1)?0xffffff:0xcccccc;

    station.vertices[i*21+0]=cos(a)*64;
    station.vertices[i*21+1]=sin(a)*64;
    station.vertices[i*21+2]=-16;

    station.vertices[i*21+3]=cos(a)*64;
    station.vertices[i*21+4]=sin(a)*64;
    station.vertices[i*21+5]=16;

    station.vertices[i*21+6]=cos(a)*48;
    station.vertices[i*21+7]=sin(a)*48;
    station.vertices[i*21+8]=-16;

    station.vertices[i*21+9]=cos(a)*48;
    station.vertices[i*21+10]=sin(a)*48;
    station.vertices[i*21+11]=16;

    station.vertices[i*21+12]=cos(a)*24;
    station.vertices[i*21+13]=sin(a)*24;
    station.vertices[i*21+14]=-40;

    station.vertices[i*21+15]=cos(a)*24;
    station.vertices[i*21+16]=sin(a)*24;
    station.vertices[i*21+17]=40;

    station.vertices[i*21+18]=cos(a)*8;
    station.vertices[i*21+19]=sin(a)*8;
    station.vertices[i*21+20]=-40;

    // ulkokehä: ulko

    station.polygons[i*64+0]=i*7+0;
    station.polygons[i*64+1]=i*7+1;
    station.polygons[i*64+2]=(((i+1)%N)*7);
    station.polygons[i*64+3]=col;

    station.polygons[i*64+4]=i*7+1;
    station.polygons[i*64+5]=(((i+1)%N)*7)+0;
    station.polygons[i*64+6]=(((i+1)%N)*7)+1;
    station.polygons[i*64+7]=col;
    
    // ulkokehä: sisä

    station.polygons[i*64+8]=i*7+2;
    station.polygons[i*64+9]=i*7+3;
    station.polygons[i*64+10]=(((i+1)%N)*7)+2;
    station.polygons[i*64+11]=0x666666;

    station.polygons[i*64+12]=i*7+3;
    station.polygons[i*64+13]=(((i+1)%N)*7)+2;
    station.polygons[i*64+14]=(((i+1)%N)*7)+3;
    station.polygons[i*64+15]=0x666666;
    
    // ulkokehä: väli

    station.polygons[i*64+16]=i*7+0;
    station.polygons[i*64+17]=i*7+2;
    station.polygons[i*64+18]=(((i+1)%N)*7)+0;
    station.polygons[i*64+19]=0x999999;

    station.polygons[i*64+20]=i*7+2;
    station.polygons[i*64+21]=(((i+1)%N)*7)+0;
    station.polygons[i*64+22]=(((i+1)%N)*7)+2;
    station.polygons[i*64+23]=0x999999;

    station.polygons[i*64+56]=i*7+1;
    station.polygons[i*64+57]=i*7+3;
    station.polygons[i*64+58]=(((i+1)%N)*7)+1;
    station.polygons[i*64+59]=0x999999;

    station.polygons[i*64+60]=i*7+1;
    station.polygons[i*64+61]=(((i+1)%N)*7)+3;
    station.polygons[i*64+62]=(((i+1)%N)*7)+1;
    station.polygons[i*64+63]=0x999999;
    
    // ulkokehän ja sylinterin pidike
    
    station.polygons[i*64+24]=i*7+2;
    station.polygons[i*64+25]=i*7+3;
    station.polygons[i*64+26]=i*7+4;
    station.polygons[i*64+27]=0x666666;

    station.polygons[i*64+28]=i*7+3;
    station.polygons[i*64+29]=i*7+4;
    station.polygons[i*64+30]=i*7+5;
    station.polygons[i*64+31]=0x666666;

    // sylinterin reuna
    
    station.polygons[i*64+32]=i*7+4;
    station.polygons[i*64+33]=i*7+5;
    station.polygons[i*64+34]=(((i+1)%N)*7)+4;
    station.polygons[i*64+35]=0xcccccc;

    station.polygons[i*64+36]=i*7+5;
    station.polygons[i*64+37]=(((i+1)%N)*7)+4;
    station.polygons[i*64+38]=(((i+1)%N)*7)+5;
    station.polygons[i*64+39]=0xcccccc;

    // sylinterin reikäpääty
    
    station.polygons[i*64+40]=i*7+4;
    station.polygons[i*64+41]=i*7+6;
    station.polygons[i*64+42]=(((i+1)%N)*7)+4;
    station.polygons[i*64+43]=0xffffff;

    station.polygons[i*64+44]=i*7+6;
    station.polygons[i*64+45]=i*7+4;
    station.polygons[i*64+46]=(((i+1)%N)*7)+6;
    station.polygons[i*64+47]=0xffffff;

    station.polygons[i*64+48]=i*7+6;
    station.polygons[i*64+49]=(((i+1)%N)*7)+6;
    station.polygons[i*64+50]=N*7;
    station.polygons[i*64+51]=0x000000;
    
    // sylinterin umpipääty
    
    station.polygons[i*64+52]=i*7+5;
    station.polygons[i*64+53]=i*7+6;
    station.polygons[i*64+54]=N*7+1;
    station.polygons[i*64+55]=0xcccccc;
        
  }
  station.vertices[N*21+0]=0;
  station.vertices[N*21+1]=0;
  station.vertices[N*21+2]=-40;

  station.vertices[N*21+3]=0;
  station.vertices[N*21+4]=0;
  station.vertices[N*21+5]=40;
}
#undef N

char errorflag=0;
char wordbuf[20];

    // exeter, intrepid, hood, lexington, potemkin
    // muita tos-nimiä: merrimac, republic, endeavour, emden, eagle
    // merchant ships:
    // KHARTAN    -- kauppaan viittaavia nimiä
    // EXCALIBUR  -- piraattinimiä

char*shipnames[]={ // 29
  "MERCHANTMAN","KHARTAN",   "PLUNDERMAN",
  "NORDEA",     "KHARTAN",   "WAHLROOS",
  "BILDERBERG", "KHARTAN",   "STUBB",
  "MORONITY",   "KHARTAN",   "TRUMP",
  "MERRIMAC",  "COD MK. III", "GERTRUDE",
  "SKROLLI",   "COD MK. III", "VIZNUT",
  "TRILOBIT",  "COD MK. III", "VISY",
  "KEWLERS",   "COD MK. III", "CURLYBRACE",
  "FAIRLIGHT",  "EXCALIBUR",  "MUDD",
  "BYTERAPERS", "EXCALIBUR",  "GRENDEL",
  "COD 31196",  "COD MK. I",  "P'NYSS",
  "COD 31006",  "COD MK. I",  "P'STROF",
  "COD 49555",  "COD MK. I",  "P'HREAK",
  "NIL",        "COD MK. I",  "SCHNAPPI",
  "EAGLE ONE",  "COD MK. I",  "HOUSTON",
  "VOODOO CULT","COD MK. I",  "XAZTUR",
  "SURF EXPRESS","GALILEO MK. 7", "LANDCRAB",
  "DRAGON",      "GALILEO MK. 7", "SPACE-X",
  "SS-1",        "GALILEO MK. 7", "RUTAN",
  "POTEMKIN",   "CONSTITUTION", "GORBACHEV",
  "TSIOLKOVSKY","CONSTITUTION", "HRUSCHEV",
  "REPUBLIC",   "CONSTITUTION", "LINCOLN",
  "BATTLEISLAND","COD MK. X", "NNIRVI",
  "AUTO 42291","LIFTER","AUTOMATIC",
  "AUTO 50870","LIFTER","AUTOMATIC",
  "AUTO 17556","LIFTER","AUTOMATIC",
  "AUTO 37224","LIFTER","AUTOMATIC",
  "AUTO 33018","LIFTER","AUTOMATIC",
  "AUTO 27760","LIFTER","AUTOMATIC" };

char hangarbays[17];
// 0 = vacant, 1 = reserved, 2 = launching, 3 = current player, 4+ = others



void hangaraction()
{
  int i;
  int vac=0;
  int res=-1;
  for(i=0;i<17;i++)
  {
    if(hangarbays[i]==2) hangarbays[i]=0;
    if(hangarbays[i]==0) vac++;
    if(hangarbays[i]==1) res=i;
  }
//  fprintf(stderr,"%d vacant, res=%d\n",vac,res);
  if(res>=0)
  {
    int sn=4+(rand()%29);
    for(i=0;i<17;i++) if(hangarbays[i]==sn) break;
    if(i>=17) hangarbays[res]=sn;
  }
  if(vac>9 || (!(rand()&3)))
  {
    int i=rand()%17;
    if(hangarbays[i]==0) hangarbays[i]=1;
  }
  if(vac<4 || (!(rand()&3)))
  {
    int i=rand()%17;
    if(hangarbays[i]>=4) hangarbays[i]=2;
  }
}

void randomizehangar()
{
  int i;
  for(i=16;i;i--) hangaraction();
}

void inithangar()
{
  int i;
  for(i=0;i<17;i++) hangarbays[i]=0;
  hangarbays[6]=3;
  randomizehangar();
}

void callback()
{
  int fc = SDL_GetTicks()/17;
  SDL_Event e;
  int fade;
  
  while(framectr<fc)
    dotick();

  switch(mode)
  {
    case 0: // loader: ask language
      SDL_BlitSurface(bg,NULL,s,NULL);    
      textcolor=RGB(0x66,0xff,0xff);
      if(SDL_GetTicks()>msgtimer)
      {
        drawtext(120,188,"D. DEUTSCH",7,6,0);
        drawtext(120,208,"E. ENGLISH",7,6,0);
        drawtext(120,228,"F. FRAN]AIS",7,6,0);
      } else
      {
        drawtext(80,208,
          errorflag?"FICHIER INTROUVABLE":"DATEI NICHT GEFUNDEN",9,9,0);
        msgtimer--;
      }
      fade=256-(SDL_GetTicks()/4);
      if(fade<0)fade=0;
    
      doframe(fade);
      while(pollevent(&e))
      {
        if(e.type==SDL_KEYDOWN)
        {
          if(e.key.keysym.sym=='e')
          {
            msgtimer=SDL_GetTicks()+3000;
            wordbuf[0]='{';
            wordbuf[1]='\0';
            mode=2; // set to 1 to get the faux copy protection
            errorflag=0;
          }
          if(e.key.keysym.sym=='d' || e.key.keysym.sym=='f')
          {
            errorflag=e.key.keysym.sym-'d';
            msgtimer=SDL_GetTicks()+2000;
          }
        }
      }
      break;
    
    case 1: // loader: copy protection
      SDL_BlitSurface(bg,NULL,s,NULL);
      textcolor=RGB(0x66,0xff,0xff);
    
      if(SDL_GetTicks()<msgtimer)
      {
        if(errorflag==0)
        {
        drawtext(60,188,"THE ULTIMATE SPACE SIMULATION GAME",7,6,4);
        drawtext(64,188+15,"BY J^RGEN STERNREISE AND ERIK DORF",7,6,4);
        drawtext(68,188+30,"COPYRIGHT 1989 ENTERPRISE GAMES",7,6,4);
        drawtext(40,188+45,"REPUBLISHED BY SKROLLI MAGAZINE IN APRIL 2016",7,6,4);
        } else
        {
          drawtext(90,188+20,"CHECK AGAIN",9,9,4);
        }
      } else
      {
        drawtext(60,188,"PLEASE ENTER THE FIRST WORD IN",7,6,4);
        drawtext(60,188+20,"ISSUE 16.1E PAGE 71 COLUMN 1 LINE 4",7,6,4);
        drawtext(60,188+40,wordbuf,7,6,4);
        // 1,4: HAULING
        // 1,2: PLAYER
        // 1,6: AND
        // 2,3: PROMINENCE
        // 3,2: MASSIVE
      }
      doframe(0);
      
      while(pollevent(&e))
      {
        if(e.type==SDL_KEYDOWN)
        {
        int c=e.key.keysym.sym;
        int s=strlen(wordbuf);
      
        msgtimer=SDL_GetTicks();
      
        if(c=='\r')
        {
          if(s>1)
          {
            if(!strcmp(wordbuf,"HAULING{"))
            {
              msgtimer=SDL_GetTicks();
              mode=2;
            }
            else
            {
              wordbuf[0]='{';
              wordbuf[1]=0;
              msgtimer+=2000;
              errorflag=1;
            }
          }
        }
        if(c=='\b')
        {
          if(s>1)
          {
            wordbuf[s-2]='{';
            wordbuf[s-1]=0;
          }
        }
        if(c>='a' && c<='z' && s<18)
        {
          wordbuf[s-1]=c-32;
          wordbuf[s]='{';
          wordbuf[s+1]=0;
        }
        }
      }
      break;
      
    case 2: // loader: fadeout
      fade=(SDL_GetTicks()-msgtimer)/4;
      if(fade>256)
      {
        bg=IMG_Load("assets/cockpit.png");
        mode=3;
      }
      doframe(fade);
      break;
      
    case 3: // transfer to intromode
      intromode=1;
      numobjs=1;
      objs[0].pos.y=1; objs[0].pos.z=40.0;
      objs[0].pos.x=1;
      objs[0].pos.c=3.1415926;
      objs[0].pos.b=-.2;
      objs[0].type=5;
      objs[0].vel.x=objs[0].vel.y=objs[0].vel.z=0;
      objs[0].vel.z=-0.05;
      objs[0].vel.a=-0.01; //.014;
      objs[0].vel.b=0;//.01;
      objs[0].vel.c=0;//.011;
      objs[0].radartext="SOYUZ";
      velocity.x=velocity.y=velocity.z=
      camera.x=camera.y=camera.z=
      camera.a=camera.b=camera.c=0;
      stardate=5100;
      dockingstate=0;
      menuno=selection=0;
      inithangar();
      strcpy(cmdrname,"SKROLLEX");
      sprintf(shipname,"COD %d",rand()&65535);
      msgtimer=SDL_GetTicks();
      SDL_PauseAudio(0);
      mode=4;
      break;

    case 4: // intro part
      pollevent(&e);
      if(e.type==SDL_KEYDOWN) mode=5;
      drawcockpit();
      fade=255-(SDL_GetTicks()-msgtimer);
      doframe(fade);
      if(objs[0].pos.z<8.0)
      {
        objs[0].vel.z=0;
        objs[0].vel.b=-.02;
        objs[0].vel.c=.0012;
      }
      // TODO tähän ehkä esim 30 sek jälkeen jotain ekstrakrediittejä?
      // credits fo
      // - original concept:       niko nirvi
      // - original screenshots:   petri teittinen
      // - code and most graphics: ville-matias heikkilä
      // - 3d object remodelling:  nasu viljanmaa
      // - music: from zx spectrum demo "echologia"
      break;
    
    case 5: // pre-game menu
      while(pollevent(&e))
      {
      if(e.type==SDL_MOUSEBUTTONDOWN)
      {
//        fprintf(stderr,"%d\n",mousey);
        if(mousey>=70 && mousey<=78)
        {
          initsolarsystem();
          mode=6;
        }
        if((mousey>=90 && mousey<=98) ||
           (mousey>=110 && mousey<=118)) msgtimer=SDL_GetTicks()+2000;
        if(mousey>=130 && mousey<=138) mode=4;
        // TODO check y position
        
        // start new game -> pre-game menu
        // resume previous game -> not available!
        // set up modem -> not available!
        // return to intro -> mode=3
      }
      if(e.type==SDL_KEYDOWN)
      {
        int c=e.key.keysym.sym;
        if(c=='\r')
        {
          initsolarsystem();
          mode=6;
        }
        if(c==27) mode=4;
      }
      }

      SDL_BlitSurface(iconsbg,NULL,s,NULL);
      textcolor=RGB(0x00,0xff,0x00);
      drawtext(70,17,"PRE-GAME MENU",10,10,0);
      
      if(SDL_GetTicks()<msgtimer)
      {
        textcolor=RGB(0xff,0x00,0x00);
        if(framectr&8)
        drawtext(30,160,"NOT AVAILABLE IN THIS VERSION",8,8,0);
      }

      textcolor=RGB(0x00,0xff,0x00);
      drawtext(60,70,"START NEW GAME",8,8,8);
      drawtext(60,90,"RESUME PREVIOUS GAME",8,8,8);
      drawtext(60,110,"SET UP MODEM",8,8,8);
      drawtext(60,130,"RETURN TO INTRO",8,8,8);
      drawcursor();
  
      doframe(0);
      break;
    
    case 6: // pre-game 2

      // TODO: komentajan ja aluksen nimi pitää pystyä syöttämään.
      // näillä on helposti oletusarvot.
      // aloituspaikkaa ei voi vaihtaa: NOT AVAILABLE!

  //    SDL_PollEvent(&e);
  /*
      if(e.type==SDL_MOUSEBUTTONDOWN) break;
      if((e.type==SDL_KEYDOWN) && waiting)
      {
        int l=strlen(cmdrname);
        cmdrname[l]="SKROLLEX"[l];
        cmdrname[l+1]=0;
        waiting=0;
      }
      if(e.type==SDL_KEYUP) waiting=1;
  */

      SDL_BlitSurface(iconsbg,NULL,s,NULL);
      textcolor=RGB(0x00,0xff,0x00);
      drawtext(70,17,"START NEW GAME",10,10,0);

      while(pollevent(&e))
      {
        if(e.type==SDL_KEYDOWN)
        {
          char*buf=NULL;
          if(mousey>=70 && mousey<=78) buf=cmdrname;
          if(mousey>=90 && mousey<=98) buf=shipname;
          if(e.key.keysym.sym=='\r') { mode=7; intromode=0; dockingstate=100; numobjs=0; }
          if(buf)
          {
            int s=strlen(buf);
            int c=e.key.keysym.sym;
            if(c=='\b' && s>0) buf[s-1]=0;
            else
            if(c==27) mode=5;
            else
            if(c==' ' || c=='-' || (c>='a' && c<='z') || (c>='0' && c<='9'))
            {
              if(s<11) {
              if(c>='a') c-=32;
              buf[s]=c;
              buf[s+1]=0; }
            }
          }
        }
        if(e.type==SDL_MOUSEBUTTONDOWN)
        {
          if(mousey>=120 && mousey<=158)
             msgtimer=SDL_GetTicks()+2000;
          if(mousey>=180 && mousey<=188) { 
            dockingstate=100; mode=7; intromode=0; numobjs=0; }
        }
      }
      
      if(mousey>=70 && mousey<=78)
      {
        int t=strlen(cmdrname);
        cmdrname[t]='{';
        cmdrname[t+1]=0;
      }
      if(mousey>=90 && mousey<=98)
      {
        int t=strlen(shipname);
        shipname[t]='{';
        shipname[t+1]=0;
      }

      drawtext(30,70,"NAME OF COMMANDER",8,8,8);
      drawtext(30,90,"NAME OF VEHICLE",8,8,8);
      drawtext(30,110,"STARTING POSITION",8,8,8);
    
      textcolor=RGB(0xff,0xff,0xff);
      drawtext(200,70,cmdrname,8,8,0);
      drawtext(200,90,shipname,8,8,0);
    
      textcolor=RGB(0xff,0xff,0xff);
      drawtext(200,110,"EMINIAR 3",6,6,8);
      textcolor=RGB(0x00,0xff,0x00);
      drawtext(200,120,"BETA HYDRI 6",6,6,8);
      drawtext(200,130,"ALPHA CENTAURI A5",6,6,8);
      drawtext(200,140,"ALFLOFOL",6,6,8);
      drawtext(200,150,"CUSTOM",6,6,8);
      drawtext(30,180,"START GAME",8,8,8);

      if(SDL_GetTicks()<msgtimer)
      {
        textcolor=RGB(0xff,0x00,0x00);
        if(framectr&8)
        drawtext(30,200,"NOT AVAILABLE IN THIS VERSION",8,8,0);
      }

      drawcursor();
      
      {int i;
      for(i=0;i<16;i++)if(cmdrname[i]=='{')cmdrname[i]=0;
      for(i=0;i<16;i++)if(shipname[i]=='{')shipname[i]=0;
      }

      doframe(0);

      break;
    
    case 7: // office: commander info
    
      while(pollevent(&e))
      {
        if(e.type==SDL_KEYDOWN && e.key.keysym.sym=='\r') mode=8;
        if(e.type==SDL_MOUSEBUTTONDOWN)
        {
          stationmodeswitch();
          officemodeswitch();
        }
      }
  //    SDL_PollEvent(&e);
  //    if(e.type==SDL_MOUSEBUTTONDOWN) break;

      SDL_BlitSurface(iconsbg,NULL,s,NULL);
  
      textcolor=RGB(0,0xff,0);
      {
      char tmp[30];
      sprintf(tmp,"COMMANDER %s",cmdrname);
      drawtext(160-5*strlen(tmp),17,tmp,10,10,0);
      }
      textcolor=RGB(0,0xff,0);
      drawtext(30,70,"LOCATION",8,8,0);
      drawtext(30,80,"SPECIES",8,8,0);
      drawtext(30,90,"HEALTH",8,8,0);
      textcolor=RGB(0xff,0xff,0xff);
      drawtext(120,70,"EMINIAR 3 CENTRAL STATION",8,5,0);
      drawtext(120,80,"HUMAN",8,5,0);
      drawtext(120,90,"100 %",8,5,0);
    
      textcolor=RGB(0x00,0xff,0xff);
      drawtext(30,120,"PROPERTY",8,8,0);
      textcolor=RGB(0x00,0xff,0x00);
      drawtext(30,140,"CREDITS",8,5,0);
      drawtext(30,150,"SHIPS",8,5,0);
      drawtext(30,160,"STATIONS",8,5,0);
      drawtext(30,170,"FACILITIES",8,5,0);
      textcolor=RGB(0xff,0xff,0xff);
      drawtext(90,140,"100",8,5,0);
      drawtext(90,150,"1",8,5,0);
      textcolor=RGB(0xff,0x00,0x00);
      drawtext(90,160,"0",8,5,0);
      drawtext(90,170,"0",8,5,0);
    
      textcolor=RGB(0x00,0xff,0xff);
      drawtext(160,120,"POLITICAL POSITONS",8,8,0);
      textcolor=RGB(0x00,0xff,0x00);
      drawtext(160,140,"GOVERNOR",8,5,0);
      drawtext(160,150,"SENATOR",8,5,0);
      drawtext(160,160,"MINISTER",8,5,0);
      drawtext(160,170,"PRESIDENT",8,5,0);
      drawtext(160,180,"EMPEROR",8,5,0);
      textcolor=RGB(0xff,0x00,0x00);
      drawtext(220,140,"0",8,5,0);
      drawtext(220,150,"0",8,5,0);
      drawtext(220,160,"0",8,5,0);
      drawtext(220,170,"0",8,5,0);
      drawtext(220,180,"0",8,5,0);

      drawhint(0);
      drawcursor();
      doframe(0);
      break;

    case 8: // office: station info

      while(pollevent(&e))
      {
        if(e.type==SDL_KEYDOWN && e.key.keysym.sym=='\r') mode=16;
        if(e.type==SDL_MOUSEBUTTONDOWN)
        {
          stationmodeswitch();
          officemodeswitch();
        }
      }

      SDL_BlitSurface(iconsbg_stat,NULL,s,NULL);
      textcolor=RGB(0x00,0xff,0x00);
      drawtext(40,17,"EMINIAR 3 CENTRAL STATION",10,10,0);
    
      drawtext(15,60,"PRIMARY",8,5,0);
      drawtext(15,80,"OWNER",8,5,0);
      drawtext(15,100,"STATION TYPE",8,5,0);
      drawtext(15,120,"ALERT STATUS",8,5,0);
      drawtext(15,140,"SHIPS DOCKED",8,5,0);

      textcolor=RGB(0xff,0xff,0xff);
      drawtext(90,60,"EMINIAR 3",8,5,0);
      drawtext(90,80,"TERRAN EMPIRE",8,5,0);
      drawtext(90,100,"CLASS 7",8,5,0);
      drawtext(90,120,"GREEN",8,5,0);
      {int i,count=0;char tmp[12];
       for(i=0;i<17;i++) if(hangarbays[i]>=3) count++;
       sprintf(tmp,"%d / 17",count);
       drawtext(90,140,tmp,8,5,0);}

      drawhint(1);
      drawcursor(0);
      doframe(0);
      // alareuna: kaikki omia ruutujaan paitsi speed up
      // (joka voisi näyttää kellonaikaa esim näytöllä)
      break;

    case 9:
    case 10: // office: map
    case 11:
    case 12:
    case 13:
    case 14:

      SDL_BlitSurface(iconsbg,NULL,s,NULL);

      textcolor=RGB(0xff,0x00,0x00);
      if(framectr&8)
      drawtext(50,120,"NOT AVAILABLE IN THIS VERSION",8,8,0);

      {static char*txts[]={"PROPERTY","MAP","NEWS","INFO BANK","TASK LIST","COMPUTER"};
      textcolor=RGB(0x00,0xff,0x00);
      drawtext(160-strlen(txts[mode-9])*5,17,txts[mode-9],10,10,0);
      }

      while(pollevent(&e))
      {
        if(e.type==SDL_MOUSEBUTTONDOWN)
          officemodeswitch();
      }

      drawhint(0);
      drawcursor(0);
      doframe(0);
      break;

    case 16: // station: hangar
      while(pollevent(&e))
      {
        if(e.type==SDL_MOUSEBUTTONDOWN)
        {
          int ln=(mousey-60)/8;
          if(ln>=0 && ln<=16)
          {
            if(hangarbays[ln]==3)
            {
              initsolarsystem();
              selection=1;
              mode=21;
            }
            else if(hangarbays[ln]>3)
              msgtimer=SDL_GetTicks()+2000;
          }
        }
        if(e.type==SDL_KEYDOWN && e.key.keysym.sym=='\r')
        {
          initsolarsystem();
          selection=1;
          mode=21;
        }
          
        officemodeswitch();
      }

      SDL_BlitSurface(iconsbg,NULL,s,NULL);
      textcolor=RGB(0x00,0xff,0x00);
      drawtext(40,17,"EMINIAR 3 CENTRAL STATION",10,10,0);

      drawtext(30,40,"SHIP NAME",8,8,0);
      drawtext(130,40,"CLASS",8,8,0);
      drawtext(220,40,"COMMANDER",8,8,0);
      charline(30,50,300,50);
      
      if(msgtimer>SDL_GetTicks())
      {
        textcolor=RGB(0xff,0x00,0x00);
        drawtext(30,60+18*8+2,"YOU DON'T OWN THIS SHIP",8,8,0);
      }
      
      {int i;
      for(i=0;i<=17;i++)
      {
        int c=hangarbays[i];
        textcolor=RGB(0x00,0xff,0x00);
        char*name="",*sclass="",*cmdr="";
        if(c==0)
        {
          textcolor=RGB(0xff,0xff,0x00);
          name="VACANT BAY";
        } else
        if(c==1)
        {
          textcolor=RGB(0xff,0x00,0x00);
          name="RESERVED BAY";
        } else
        if(c==2)
        {
          textcolor=RGB(0xff,0xff,0x00);
          name="LAUNCHING";
        } else
        if(c==3)
        {
          textcolor=RGB(0xff,0xff,0xff);
          name=shipname;
          sclass="COD MK. I";
          cmdr=cmdrname;
        } else
        {
          name=shipnames[(c-4)*3+0];
          sclass=shipnames[(c-4)*3+1];
          cmdr=shipnames[(c-4)*3+2];
        }
        drawtext(30,60+i*8,name,7,5,8);
        drawtext(130,60+i*8,sclass,7,5,8);
        drawtext(220,60+i*8,cmdr,7,5,8);
      }}

    drawhint(0);
    drawcursor(0);
    doframe(0);

      break;
      
    case 17: // station: production
    case 18: // station: ship service
    case 19: // station: trade depot
    case 20: // station: lounge

      SDL_BlitSurface(iconsbg,NULL,s,NULL);
      textcolor=RGB(0x00,0xff,0x00);
      drawtext(40,17,"EMINIAR 3 CENTRAL STATION",10,10,0);

      textcolor=RGB(0xff,0x00,0x00);
      if(framectr&8)
      drawtext(50,120,"NOT AVAILABLE IN THIS VERSION",8,8,0);

      while(pollevent(&e))
      {
        if(e.type==SDL_MOUSEBUTTONDOWN)
          officemodeswitch();
      }

      drawhint(0);
      drawcursor(0);
      doframe(0);
      break;

    case 21: // docked ship
      while(pollevent(&e))
      {
        if(e.type==SDL_KEYDOWN)
        {
          if(dockingstate)
          {
            if(e.key.keysym.sym==SDLK_DOWN) selection++;
            if(e.key.keysym.sym==SDLK_UP) selection--;
            if(selection<0) selection=4;
            if(selection>4) selection=0;
            if(e.key.keysym.sym=='\r')
            {
              if(selection==0) mode=8;
              if(selection==1) dockingstate=99;
            }
          }
        }
      }
    
//      SDL_PollEvent(&e);
//    if(e.type==SDL_KEYDOWN) break;
      drawcockpit();
      doframe(0);
      break;

    case 22:
      while(pollevent(&e));
      drawrawspace();
      {int t=(SDL_GetTicks()-msgtimer)/32.0;
      if(t<32)
        drawgameovernoise(255-t*8);

      textcolor=0xffffff;
      if(framectr&16)
      drawtext(160-90,120,"GAME OVER",20,20,0);

      if(t<64) doframe(0); else
      if(t<192) doframe((t-64)*2); else
      {
        mode=3;
        msgtimer+=192;
      }
      }
      break;
  }
}

void makesoundframe(void*userdata,Uint8*d0,int lgt)
{
  int i;
  signed short*d=(signed short*)d0;
  for(i=0;i<lgt/2;i++)
  {
  }
}

int main()
{
  int t=0;
  SDL_Init(SDL_INIT_VIDEO|SDL_INIT_TIMER);//|SDL_INIT_AUDIO);
  makespacestation();
  bg=IMG_Load("assets/loading.png");
  iconsbg=IMG_Load("assets/icons.png");
  iconsbg_stat=IMG_Load("assets/icons-station.png");
  sfinal=SDL_SetVideoMode(640,512,32,0);
  
  s=SDL_CreateRGBSurface(SDL_SWSURFACE,320,256,32,0,0,0,0);
  buf3d=SDL_CreateRGBSurface(SDL_SWSURFACE,320,256,32,0,0,0,0);
/*
  SDL_AudioSpec desiredau;
  desiredau.freq=44100;
  desiredau.format=AUDIO_S16SYS;
  desiredau.channels=1;
  desiredau.samples=512;
  desiredau.callback=&makesoundframe;
  SDL_OpenAudio(desiredau,NULL);
*/
#ifdef TEST_SDL_LOCK_OPTS
  EM_ASM("SDL.defaults.copyOnLock = false; SDL.defaults.discardOnLock = true; SDL.defaults.opaqueFrontBuffer = false;");
#endif

  SDL_ShowCursor(0);

#ifdef __EMSCRIPTEN__
  emscripten_set_main_loop(&callback,60,1);
#else
  for(;;)
  {
    static int nextframeat=0;
    int t;
    nextframeat+=1000/120;
    callback();
    t=nextframeat-SDL_GetTicks();
    if(t>10) SDL_Delay(t);
  }
#endif

//  loadingpart();
//  intropart();
//  officepart();
//  cockpitpart();
//  SDL_Quit();
  return 0;
}
