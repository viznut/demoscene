#include <stdio.h>
#include <stdlib.h>

unsigned char charset[8192];
unsigned int  scrmem[1024];
unsigned int  colmem[1024];

unsigned char rasters_f[256];
unsigned char rasters_e[256];

unsigned char mem[65536];

int numlines;
int numcolumns;

unsigned char alloctab[256];

int allocshape(unsigned char*shape,int probeonly)
{
   int i=0,j;
   
   for(i=0;i<256;i++)
   if(alloctab[i])
   {
      int diff=0;
      
      for(j=0;j<8;j++) { 
      
         if(charset[i*8+j]!=shape[j]) {diff++; break; } }

      if(!diff) { alloctab[i]|=4; return i; }
   }

   if(probeonly) return;

   /**********************************************************/

   for(i=0;i<256;i++) { if((alloctab[i]&6)==0) break; }
   if(i>255)
   {
      fprintf(stderr,"out of allocspace\n"); exit(1);
   }
   
   fprintf(stderr,"Allocing char %d ...\n",i);

   for(j=0;j<8;j++) charset[i*8+j]=shape[j];
   alloctab[i]|=4;
   
   return i;
}

void inits()
{
   int i;
   
   for(i=0;i<8192;i++) charset[i]=0;
   for(i=0;i<1024;i++) scrmem[i]=0;
   for(i=0;i<256;i++) rasters_f[i]=rasters_e[i]=alloctab[i]=0;

   alloctab[0]=3;
}

void readcharset(char*name)
{
   FILE*f=fopen(name,"rb");
   int i=0;
   
   if(!f) { fprintf(stderr,"file not found: %d\n",name); exit(1); }

   for(;;)
   {
      int ch=fgetc(f);
      if(feof(f)) { fclose(f); return; }
      charset[i]=ch; i++;
      if((i&7)==0) alloctab[(i/8)-1]=7;
   }
}

void readbs(char*name)
{
   FILE*f=fopen(name,"rb");
   int i,lo,hi,start,end;   
   unsigned char basechars[4] = { 0x00,0x55,0xaa,0xff };

   if(!f)
   {
      fprintf(stderr,"file not found: %d\n",name);
      exit(1);
   }

   for(i=0;i<32;i++) mem[0x1800+i]=basechars[i>>3];

   for(;;)
   {

   lo=fgetc(f); if(feof(f)) break;
   hi=fgetc(f); if(feof(f)) break;
   
   start=hi*256+lo;
   
   lo=fgetc(f); if(feof(f)) break;
   hi=fgetc(f); if(feof(f)) break;
   
   end=hi*256+lo;

   fprintf(stderr,"Reading block: %x..%x\n",start,end);
   
   for(;start<end;start++)
   {
      mem[start]=fgetc(f);
   }
   }
   
   close(f);
}

void importbs()
{
   int i;
   
   numlines=20;
   numcolumns=25;
   
   /* fix alloctab */
   for(i=0;i<256;i++) alloctab[i]=(alloctab[i]&1)|(alloctab[i]>>1);

   /* probe */
   for(i=0;i<25*20;i++)
   {
      allocshape(mem+0x1800+8*mem[i+0x1d00],1);
   }
   /* final alloc */
   for(i=0;i<25*20;i++)
   {
      scrmem[i]=allocshape(mem+0x1800+8*mem[i+0x1d00],0);
      colmem[i]=mem[i+0x9500];
   }
   for(i=0;i<160;i++)
   {
      rasters_e[i]=mem[i+0x1f00];
      rasters_f[i]=mem[i+0x1700];
   }

//   fprintf(stderr,"Pic fetched: %d chars\n",numchars);
}

void dumpbyte(int byte)
{
   static int column=0;

   if(byte<0) { printf("\n"); column=0; return; }
   if(column==15) { printf("\n"); column=0; }

   if(column==0) printf("!byte "); else printf(",");
   printf("$%02x",byte);
   column++;
}

int numvisiblecolumns=25;

void dumpsource(char*basename)
{
   int i,j,topchar=0;
   
   printf("\n%s_scrmem:\n",basename);

   for(i=0;i<numlines*numcolumns;i++)
      if((i%numcolumns)<numvisiblecolumns) dumpbyte(scrmem[i]);
   dumpbyte(-1);

   printf("\n%s_colmem:\n",basename);

   for(i=0;i<numlines*numcolumns;i++)
      if((i%numcolumns)<numvisiblecolumns) dumpbyte(colmem[i]&15);
   dumpbyte(-1);

   for(i=0;i<256;i++) if(alloctab[i]) topchar=i;

   printf("\n%s_charset: ; topchar %d\n",basename,topchar);

   for(i=0;i<=topchar;i++)
   {
      for(j=0;j<=7;j++)   
         dumpbyte(charset[i*8+j]);
      printf("\t; char $%2x %s %s %s",i,
         (alloctab[i]&4)?"HERE":"    ",
         (alloctab[i]&2)?"PREV":"    ",
         (alloctab[i]&1)?"OLD":"");
      dumpbyte(-1);
   }

   printf("\n%s_rastbgaux:\n",basename);

   for(i=0;i<numlines*8;i++)
      dumpbyte( ((rasters_e[i]&0xf0)>>4) | (rasters_f[i]&0xf0));
   dumpbyte(-1);
}

int main(int argc,char**argv)
{
   int i;

   if(argc<2) { fprintf(stderr,"usage: %s filename\n",argv[0]); exit(1); }

   inits();
//   readcharset("chars.bin");

   for(i=1;i<argc;i++)
   {
      printf("\n\n\n\n;;; PIC %d : %s ;;;\n\n",i-1,argv[i]);

      readbs(argv[i]);
      importbs();
      dumpsource("logo");
   }
}

