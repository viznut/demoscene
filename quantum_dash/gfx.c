#include <stdio.h>
#include <math.h>

unsigned char fontdata[]={
#include "fontdata.i"
};

unsigned char bitmaps[]={
#include "bitmaps.i"
};

void drawglyph(int*d,int c,int sz,int col)
{
  int x,y,i,j;
  unsigned char*s=fontdata+(5*(c-'0'));
  for(y=0;y<5;y++)
  for(x=0;x<8;x++)
  {
    if((s[y]>>(7-x))&1)
    {
      for(j=0;j<sz;j++)
      for(i=0;i<sz;i++)
        d[(y*sz+j)*640+x*sz+i]=col;
    }
  }
}

void drawtext(int*d,char*s,int sz,int col)
{
  while(*s)
  {
//    fprintf(stderr,"%c...\n",*s);
    drawglyph(d,*s,sz,col);
    d+=sz*8;
    s++;
  }
}

void drawshadedtext(int*d,char*s,int sz,int col)
{
  int diff;
  if(sz<4) diff=641; else diff=641*2;
  
  drawtext(d,s,sz,0);
  drawtext(d-diff,s,sz,col);
}

extern char bgimg[];

void rot2d(double*x,double*y,double a)
{
  double x1,y1;
  x1 = cos(a)**x - sin(a)**y;
  y1 = cos(a)**y + sin(a)**x;
  *x=x1;
  *y=y1;
}

void makebgimg()
{
  int x,y,i;
  char*d=bgimg;
  
  for(y=0;y<480;y++)
  for(x=0;x<640;x++)
  {
    bgimg[y*640+x]=rand()&31;
  }

  for(i=0;i<4;i++)
  for(y=0;y<480;y++)
  for(x=0;x<640;x++)
  {
    bgimg[y*640+x]= (
      bgimg[(y*640+x+1)%(640*480)]*2+
      bgimg[(y*640+x-1)%(640*480)]*3+
      bgimg[(y*640+x-640)%(640*480)]*1+
      bgimg[(y*640+x+640)%(640*480)]*4 )/10;
  }
  
//  for(i=0;i<2000;i++) bgimg[rand()%(640*480)] = rand()&255;

/*  
    double xx = x-320, yy = y-240;
    double z2 = 180*180 - yy*yy - xx*xx;
    if(z2<0) *d++=0; else
    {
      double zz = sqrt(z2);
      rot2d(&xx,&yy,.4);
      rot2d(&yy,&zz,.7);
      *d++ = ((int)xx)^((int)zz);
    }
  }
*/
}
