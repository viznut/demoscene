#include <stdio.h>
#include <stdlib.h>

signed short int*mem;
signed short int*nmem;

int volatile_area=0,force_change=0;

void do_diff()
{
  int a0=0,lgt,hole,i;

  while(a0<0xb000)
  {
    while((mem[a0]==(force_change?-1:nmem[a0])) || (nmem[a0]<0))
    { a0++; if(a0>0xb100) return; }

    lgt=hole=0;
 
    for(lgt=1;lgt<255;lgt++)
    {
       if((mem[a0+lgt-1]==(force_change?-1:nmem[a0+lgt-1])) ||
          (nmem[a0+lgt-1]<0)) hole++; else hole=0;
 
       if(hole==4) { lgt-=hole; break; }
    }
  
    fprintf(stderr,"Length %x since %x\n",lgt,a0);
    
    putchar(lgt);
    putchar((a0-1)&255);
    putchar(((a0-1)>>8)&255);

    for(i=lgt;i;i--)
    {
       putchar(nmem[a0+i-1]);
       mem[a0+i-1]=volatile_area?-1:nmem[a0+i-1];
       nmem[a0+i-1]=-1;
    }
    a0+=lgt;
  }
}

void readfile(char*name)
{
   FILE*f=fopen(name,"rb");
   int buf[255];
   int lgt=0;
   int addr=0;
   int a;
   
   if(f==NULL)
   {
      fprintf(stderr,"File not found: %s\n",name);
      exit(1);
   }

   fprintf(stderr,"reading file %s (%s)\n",
     name,volatile_area?"var":"const");

   addr =fgetc(f);
   addr+=(fgetc(f)<<8);

   a=fgetc(f);

   if(feof(f))
   {
      /* length 2 = empty block = RUN command. no correction */

      putchar(0);
      putchar(addr&255);
      putchar((addr>>8)&255);
      fclose(f);
      return;
   }
   else
   {
      while(!feof(f))
      {
         nmem[addr] = a; a = fgetc(f);
      
         addr++;
      }
      do_diff();
      fclose(f);
   }
}


/*
   tehd‰‰n joka blokista oma prg-file ja ajetaan ne sitten kerralla l‰pi.



   prg2vizldr hoho.prg haha.prg +hihi.prg
   
   + alussa merkkaa volatilet "
   
   TEMP00.prg
   TEMP01.prg
   +TEMP02.prg

*/

int main(int argc,char**argv)
{
   int i;

   if(argc<=1)
   {
      fprintf(stderr,"usage: %s <file0.prg> [<file1.prg> ...] > bitstream.vizldr\n",
         argv[0]);
      return 0;
   }

   mem=malloc(65536*sizeof(short int));
   if(!mem) fprintf(stderr,"alloc error\n");
   nmem=malloc(65536*sizeof(short int));
   if(!nmem) fprintf(stderr,"alloc error\n");

   for(i=0;i<65536;i++) mem[i]=nmem[i]=-1; /* undefined */

   fprintf(stderr,"allocs ok\n");

   for(i=1;i<argc;i++)
   {
      char*name=argv[i];
      volatile_area=force_change=0;
      if(*name=='+') { volatile_area++; name++; }
      if(*name==':') { force_change++; name++; }
      readfile(name);
   }

   return 0;
}
