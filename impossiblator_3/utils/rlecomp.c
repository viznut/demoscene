#include <stdio.h>
#include <stdlib.h>

#define RLE_ESCAPE 182
#define DEBUG

void rawbyte(int data)
{
   DEBUG(stderr,"- write: %d\n",data);

   putchar(data);
}

void databyte(int data)
{
   if(data==RLE_ESCAPE) rawbyte(data);
   rawbyte(data);
}

int main()
{
   int count=0,data,lastbyte=-1;

   for(;;)
   {

   data=fgetc(stdin);
   if(feof(stdin)) break;

   DEBUG(stderr,"read: %d\n",data);

   if(data==lastbyte)
   {
      count++;

      if(count==256) { rawbyte(RLE_ESCAPE); rawbyte(count&255); count=0; }
   }
    else
   {
      if(count>0)
      {
          if( ((count<3) && (lastbyte!=RLE_ESCAPE)) ||
              ((count<2) && (lastbyte==RLE_ESCAPE)))
          {
             for(;count;count--) databyte(lastbyte);
          }
           else
          {
              rawbyte(RLE_ESCAPE); rawbyte(count&255); count=0;
          }
      }

      databyte(data);
      lastbyte=data;
   }
   }

   if(count>0) { rawbyte(RLE_ESCAPE); rawbyte(count&255); }

   return 0;
}


/*

;	if(data==RLE_ESCAPE)

	format:

	x   = escbyte
	d   = databyte (non-escape)
	0-9 = numbers

	compressed	uncompressed

	d		d
	dx1		dd
	dx2		ddd
	dx3		dddd
	dx0		d*256

	xx		x
	xxxx		xx
	xxx1		xx
	xxxxxx		xxx
	xxx2		xxx

*/