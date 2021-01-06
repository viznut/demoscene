#include <SDL/SDL.h>
#include <string.h>
#include <math.h>
#include <stdint.h>

SDL_Surface*s;

int currentworld=0;
int framectr=0;
int deadhere=0;
int status=5;
int level=0;
int highscore=0;
int usemusic=1;

int lastmovedir;

int viewportx,viewporty,vptox,vptoy;

int16_t deepnoise[65536];
int audiotimer=0;
int fallfx=0,explofx=0,winfx=0;

char bgimg[640*480];

typedef struct
{
  unsigned char cells[64*64];
//  int viewportx,viewporty;
//  int vptox,vptoy;
} worlds_t;

worlds_t worlds[3];

void init()
{
  int i,j,x;
  int plrx=47,plry=47;

  level=0;
  
  viewportx =
  viewporty = 0;
  
  vptox = 320+16-plrx*32;
  vptoy = 240+24-plry*32;
  
  { int zom=0;
  for(x=0;x<65536;x++)
  {
    deepnoise[x]=zom%(x*888+1); //rand()&zom;
    zom+=rand()&4095;
  }
  for(i=0;i<64;i++)
  for(x=0;x<65536;x++)
    deepnoise[x]=(deepnoise[x]+deepnoise[(x+1)&65535]*2+deepnoise[(x+2)&65535])/4;
  }
  
  for(x=0;x<64*64;x++)
  {
    worlds[0].cells[x] = ((rand()&15)<6)?0x10:0;
  }
//  for(x=0;x<256;x++) worlds[0].cells[rand()&4095] |= 1;
  for(x=0;x<512;x++) worlds[0].cells[rand()&4095] |= 4;
//  for(x=0;x<4;x++) worlds[0].cells[rand()&4095] = 7;

  for(x=0;x<64;x++)
    worlds[0].cells[x] =
    worlds[0].cells[x+63*64] =
    worlds[0].cells[x*64] =
    worlds[0].cells[x*64+63] = 0x21;

  memcpy(&worlds[1],&worlds[0],sizeof(worlds_t));
  memcpy(&worlds[2],&worlds[0],sizeof(worlds_t)); 

  for(i=0;i<3;i++)
  {
    for(j=0;j<16;j++)
    {
      int p=(((rand()&63)+1)*64)+(rand()&63)+1;
      if(worlds[i].cells[p]<0x20)
        worlds[i].cells[p] = (worlds[i].cells[p]&0xf0)|3;
    }
    worlds[i].cells[plry*64+plrx] = 0x12;
    if(plry>1)
    worlds[i].cells[(plry-1)*64+plrx] = 0x10;
  }
}

void nextlevel()
{
  int x,i,j;
  
  level++;
  winfx=65536;
  if(level>highscore) highscore=level;
    
  for(i=0;i<256;i++)
  {
    x=rand()&4095;
    int tn=worlds[0].cells[x];
    if(((tn&15)!=2) && (x<0x20) && ((tn&15)!=3))
      worlds[0].cells[x] = 
      worlds[1].cells[x] = 
      worlds[2].cells[x] = 4;
  }
  /*
  if(level>1)
  for(i=0;i<64;i++)
  {
    int tn=worlds[0].cells[x];
    x=rand()&4095;
    if(((tn&15)!=2) && (x<0x20) && ((tn&15)!=3))
      worlds[0].cells[x] = 
      worlds[0].cells[x] = 
      worlds[0].cells[x] = 5;
  }
  */
  if(level>0)
  {
    int howmany=2;
    if(level>2) howmany=4;
    if(level>4) howmany=8;
    if(level>6) howmany=16;
    if(level>8) howmany=32;
    for(i=0;i<howmany;i++)
    {
      int tn;
      x=rand()&4095;
      tn=worlds[0].cells[x];
      if(((tn&15)!=2) && (tn<0x20) && ((tn&15)!=3))
        worlds[0].cells[x] =
        worlds[1].cells[x] =
        worlds[2].cells[x] =
          7+(rand()&3);
    }
  }
  if(level>8)
  {
    for(i=0;i<8;i++)
    {
      int a=rand()&4095;
      int b=rand()&4095;
      
      worlds[rand()%3].cells[a] =
      worlds[rand()%3].cells[b];
    }
  }
  
  for(j=(level<3)?8:0;j;j--)
  for(i=0;i<3;i++)
  {
    x=rand()&4095;
    worlds[i].cells[x] = 3;
  }
}

void drawrect(int x0,int y0,int x1,int y1,int col)
{
  int x,y;
  if(x0<0) x0=0;
  if(y0<0) y0=0;
  if(x0>639) x0=639;
  if(y0>479) y0=479;
  if(x1<0) x1=0;
  if(y1<0) y1=0;
  if(x1>639) x1=639;
  if(y1>479) y1=479;
  
  for(y=y0;y<y1;y++)
    for(x=x0;x<x1;x++)
      ((int*)s->pixels)[y*640+x] = col;
}

extern unsigned char bitmaps[];

void drawbitmap(int x0,int y0,int x1,int y1,int col,char*src,int mask,int glitch,int dir)
{
  int x00=x0,y00=y0;
  int x,y;
  if(x0>639 || y0>479) return;
  if(x1<0 || y1<0) return;
  if(x0<0) x0=0;
  if(y0<0) y0=0;
  if(x1>639) x1=639;
  if(y1>479) y1=479;
  
  if(dir==0)
  {
//  fprintf(stderr,"%d %d - %d %d\n",x0,y0,x1,y1);
  for(y=y0;y<y1;y+=1+(rand()&glitch))
  for(x=x0;x<x1;x++)
    if(bitmaps[(y-y00)*32+(x-x00)]&mask)
      ((int*)s->pixels)[y*640+x] = col;
  }
  else if(dir==1)
  {
  for(y=y0;y<y1;y+=1+(rand()&glitch))
  for(x=x0;x<x1;x++)
    if(bitmaps[(31-y+y00)*32+(x-x00)]&mask)
      ((int*)s->pixels)[y*640+x] = col;
  }
  else if(dir==2)
  {
  for(y=y0;y<y1;y+=1+(rand()&glitch))
  for(x=x0;x<x1;x++)
    if(bitmaps[(x-x00)*32+(y-y00)]&mask)
      ((int*)s->pixels)[y*640+x] = col;
  }
  else if(dir==3)
  {
  for(y=y0;y<y1;y+=1+(rand()&glitch))
  for(x=x0;x<x1;x++)
    if(bitmaps[(31-x+x00)*32+(y-y00)]&mask)
      ((int*)s->pixels)[y*640+x] = col;
  }
}

void drawbg(int x0,int y0,int x1,int y1)
{
  int x,y;
  if(x0<0) x0=0;
  if(y0<0) y0=0;
  if(x0>639) x0=639;
  if(y0>479) y0=479;
  if(x1<0) x1=0;
  if(y1<0) y1=0;
  if(x1>639) x1=639;
  if(y1>479) y1=479;
  
  for(y=y0;y<y1;y++)
  for(x=x0;x<x1;x++)
    ((int*)s->pixels)[y*640+x] = bgimg[y*640+x]*0x10101;
}

void fadebounce(int x0,int y0,int x1,int y1)
{
  int bnc=abs(((framectr*2)&63)-32);
  int x,y;
  if(x0<0) x0=0;
  if(y0<0) y0=0;
  if(x0>639) x0=639;
  if(y0>479) y0=479;
  if(x1<0) x1=0;
  if(y1<0) y1=0;
  if(x1>639) x1=639;
  if(y1>479) y1=479;
  
  for(y=y0;y<y1;y++)
  for(x=x0*4;x<x1*4;x++)
  {
    unsigned char*z = &((unsigned char*)s->pixels)[y*640*4+x];
    *z = (*z*bnc)/64;
  }
}

int worldcolors[3*3]
={0xffcccc, 0xcc9966, 0x660000,
  0xccffcc, 0x66cc66, 0x006600,
  0xccccff, 0x6699ff, 0x000099 };

void drawtile(int x,int y,int tile,int sameness)
{
  int bg,fg;
  bg=tile>>4;
  fg=tile&15;
  if(!bg)
  {
    drawbg(x,y,x+32,y+32);
  } else
  { drawrect(x,y,x+32,y+32,worldcolors[currentworld*3+1]);
    drawrect(x,y,x+1,y+32,worldcolors[currentworld*3+0]);
    drawrect(x,y,x+32,y+1,worldcolors[currentworld*3+0]);
    
    drawrect(x+31,y,x+32,y+32,worldcolors[currentworld*3+2]);
    drawrect(x,y+31,x+32,y+32,worldcolors[currentworld*3+2]);
  }
  if(fg==5 || tile==0x21)
  {
    drawrect(x,y,x+32,y+32,0xcccccc);
    drawrect(x,y,x+1,y+32,0xffffff);
    drawrect(x,y,x+32,y+1,0xffffff);
    drawrect(x+31,y,x+32,y+32,0x999999);
    drawrect(x,y+31,x+32,y+32,0x999999);
  }
  else
  if(tile>=0xf0)
  {
    int xpd=abs(tile-0xf8);
    drawrect(x-xpd*3,y-xpd*3,x+32+xpd*3,y+32+xpd*3,0x1f1f04*xpd);
  }

  if(sameness!=3)
    fadebounce(x,y,x+32,y+32);

  if((tile<0xf0) && (tile!=0x21) && (fg!=5) && (fg!=0))
  {
  if(fg==2)
  {
    drawbitmap(x,y,x+32,y+32,0xffffff,bitmaps,8,3-sameness,lastmovedir);
    return;
  }
  else
  if((fg==4) || (fg==0xb))
    drawbitmap(x,y,x+32,y+32,worldcolors[currentworld*3],bitmaps,2,3-sameness,0);
  else
  if(fg==3)
    drawbitmap(x,y,x+32,y+32,rand(),bitmaps,1,3-sameness,0);
  else
  if(fg>=7 && fg<=0xa)
    drawbitmap(x,y,x+32,y+32,rand(),bitmaps,4,3-sameness,"\2\1\3\0"[fg-7]);
  }
}

void drawscorebar()
{
  char line[80];
  
  if(status==5) return;
  
  sprintf(line,"%d@CORDS@CONNECTED",level);

  drawrect(0,0,640,32,0);

  drawtext( ((int*)s->pixels)+7*640+6,line,2,0xffffcc);

  drawtext( ((int*)s->pixels)+7*640+445,"QUANTUM@DASH",2,0xffffcc);
}

void explode(int wrld,int where)
{
  int i,j;
  for(i=-1;i<=1;i++)
  for(j=-1;j<=1;j++)
  {
    int x=(where+i*64+j)&4095;
    if((worlds[wrld].cells[x]<0x20) && ((worlds[wrld].cells[x]&15)!=3))
       worlds[wrld].cells[x] = 0xf3;
  }
  if(wrld==currentworld) explofx=65535;
  else
  if(!explofx) explofx=32768;
}

void miniexplode(int wrld,int where)
{
    int x=where;
    if((worlds[wrld].cells[x]<0x20) && ((worlds[wrld].cells[x]&15)!=3))
       worlds[wrld].cells[x] = 0xf3;
}

void simulateworlds()
{
  int i,x;
  for(i=0;i<3;i++)
  {
    for(x=64*64-1;x>=0;x--)
    {
      int tn=worlds[i].cells[x];
      if(tn>=0xf0) worlds[i].cells[x]++;
      else
      if((tn&15)==4)
      {
        if(!worlds[i].cells[(x+64)&4095])
        {
          worlds[i].cells[x]=(tn&0xf0)|0xb;
          if(status!=5) fallfx=65536;
        }
      }
      else
      if((tn&15)==0xb)
      {
        int under = worlds[i].cells[(x+64)&4095];
        if(!under)
        {
          worlds[i].cells[(x+64)&4095] = 0xb;
          worlds[i].cells[x] &= 0xf0;
        }else
        if(!(under&15))
        {
          worlds[i].cells[(x+64)&4095] = under|4;
          worlds[i].cells[x] &= 0xf0;
        }else
        {
          if(((under&15)==2) || (((under&15)>=0x7) && ((under&15)<=0xa)))
          {
            explode(i,x);
          } else
          {
            if(!(worlds[i].cells[x+63]))
            {
              worlds[i].cells[(x+63)&4095] = 0xb;
              worlds[i].cells[x] &= 0xf0;
            } else
            if(!(worlds[i].cells[x+65]))
            {
              worlds[i].cells[(x+65)&4095] = 0xb;
              worlds[i].cells[x] &= 0xf0;
            } else
            worlds[i].cells[x] = (tn&0xf0)|4;
          }
        }
      }
      else
      if(((tn&15)>=0x7) && ((tn&15)<=0xa))
      {
        int dir=0;
        if((tn&15)==7) dir=1; else
        //if((tn&15)==8) dir=-64; else
        if((tn&15)==10) dir=64; //else
        //if((tn&15)==9) dir=-1;
        
        if(dir)
        {
        if(!(worlds[i].cells[x+dir]))
        {
          worlds[i].cells[x]&=0xf0;
          worlds[i].cells[x+dir] =
            (worlds[i].cells[x+dir]&0xf0) | (tn&15);
        } else
        {
          if((worlds[i].cells[x+dir]&15)==2) explode(i,x);
        
          worlds[i].cells[x]++;
          if((worlds[i].cells[x]&15)==0xb)
              worlds[i].cells[x]-=4;
        }
        }
      }
    }
    
    for(x=0;x<64*64;x++)
    {
      int tn=worlds[i].cells[x];

      if(tn<0xf0) {

      if(((tn&15)>=0x7) && ((tn&15)<=0xa))
      {
        int dir=0;
        //if((tn&15)==7) dir=1; else
        if((tn&15)==8) dir=-64; else
        //if((tn&15)==10) dir=64; else
        if((tn&15)==9) dir=-1;

        if(dir)
        {
        if(!(worlds[i].cells[x+dir]))
        {
          worlds[i].cells[x]&=0xf0;
          worlds[i].cells[x+dir] =
            (worlds[i].cells[x+dir]&0xf0) | (tn&15);
        } else
        {
          if((worlds[i].cells[x+dir]&15)==2) explode(i,x);

          worlds[i].cells[x]++;
          if((worlds[i].cells[x]&15)==0xb)
              worlds[i].cells[x]-=4;
        }
        }
      }
      }
    }
  }
}

void docontrols();
void simulateworlds();

void perframe()
{
  int i=0;
  viewportx = 
     (viewportx*15 +
      vptox) / 16;

  viewporty = 
     (viewporty*15 +
      vptoy) / 16;

  if(status!=5)
  {
    if(!(framectr&3))
    {
      docontrols();
      simulateworlds();
    }
  }
}

void fillscreen()
{
  int x,y;
//  static int t;
  int x0=viewportx;
  int y0=viewporty;
  
//  t++;

  for(y=0;y<64;y++)
  {
    int yto=((y0+32*y)&2047)-32;
    if(yto<480)
    for(x=0;x<64;x++)
    {
      int xto=((x0+32*x)&2047)-32;
      if(xto<640)
      {
        int tn=worlds[currentworld].cells[y*64+x];
        int sameness=0,i;
        for(i=0;i<3;i++)
          if(worlds[i].cells[y*64+x]==tn) sameness++;
        drawtile(xto,yto,tn,sameness);
      }
    }
  }
  drawscorebar();
}


void realityteleportfx()
{
  char*worldnames[]={"RED@WORLD","GREEN@WORLD","BLUE@WORLD"};
  static int t=0;
  int x;
  for(x=0;x<640*480;x++) ((int*)s->pixels)[x]=(x*13)^t;
  t+=1215747;
  
  drawshadedtext( ((int*)s->pixels)+230*640+70,worldnames[currentworld&3],6,0xffffff);
//  drawtext( ((int*)s->pixels)+230*640+70-641*2,worldnames[currentworld&3],6,0xFFFFFFFF);
}

int playeralive()
{
  int i,x;
  for(i=0;i<3;i++)
  for(x=0;x<64*64;x++) if((worlds[i].cells[x]&15)==2) return 1;
  return 0;
}

void collapseworlds()
{
  int x;
  for(x=0;x<64*64;x++)
  {
    if((worlds[0].cells[x] != worlds[1].cells[x]) ||
       (worlds[1].cells[x] != worlds[2].cells[x]))
    {
      int i;
      if( ((worlds[0].cells[x]&0x15) ==
           (worlds[1].cells[x]&0x15) ) &&
           ((worlds[1].cells[x]&0x15) ==
            (worlds[2].cells[x]&0x15)))
      for(i=0;i<3;i++) miniexplode(i,x);
      else
      for(i=0;i<3;i++) explode(i,x);
    }
  }
}


void updateaudio(void*dum,uint8_t*d0,int lgt)
{
  int16_t*d=(int16_t*)d0;
  int t=audiotimer;
  for(lgt>>=1;lgt;lgt--)
  {
    int fx = 0;
    int music;
    
    if(usemusic)
    {
      music = 
      currentworld>=16?0x1f50&((t>>3|t>>6)*(t)) :
      0x1f50&((t*(16+currentworld*4))&((t>>8)|(t>>12))|(t>>2));
      music=(music-4096)*2;
    } else music=0;

    if(explofx>0)
    {
      fx += ((deepnoise[explofx&65535]*explofx)/50000); //&65535);
      explofx--;
    }
    if(fallfx>0)
    {
      fx += (deepnoise[fallfx&65535]*fallfx)/70000;
      fallfx--;
    }
    if(winfx>0)
    {
      fx += (((0x1f50&((winfx<<2)*((winfx>>15|winfx>>6)&123)))-4096)*winfx)/32768;
      winfx--;
    }

    music += fx;

    if(music<-32768) music=-32768;
    if(music>32767) music=32767;
    *d++ = music;
    t++;
  }
  audiotimer=t;
}

void showdeadstatus()
{
  drawshadedtext( ((int*)s->pixels)+200*640+100,"YOU@ARE@DEAD@IN@THIS@WORLD",2,0xffffff);
//  drawtext( ((int*)s->pixels)+200*640+100-641,"YOU@ARE@DEAD@IN@THIS@WORLD",2,0xffffff);

  drawshadedtext( ((int*)s->pixels)+300*640+120,"PRESS@ESC@TO@END@GAME",2,0xffffff);
//  drawtext( ((int*)s->pixels)+300*640+120-641,"PRESS@ESC@TO@END@GAME",2,0xffffff);
}

void showintrotexts()
{
  drawshadedtext( ((int*)s->pixels)+50*640+30-641*2,"QUANTUM@DASH",6,0xffffff );
//  drawtext( ((int*)s->pixels)+50*640+30,"QUANTUM@DASH",6,0xffffff );

  if((framectr%150)<140)
  {
    int scrno=(framectr/150)%6;

//    drawshadedtext( ((int*)s->pixels)+50*640+30-641*2,"QUANTUM@DASH",2,0xffffff );
//      drawtext( ((int*)s->pixels)+50*640+30,"QUANTUM@DASH",2,0xffffff );
      
    if(scrno==0)
    {
      drawshadedtext( ((int*)s->pixels)+250*640+14*16,"BY@VIZNUT",2,0xffffff);
      drawshadedtext( ((int*)s->pixels)+280*640+7*16,"FOR@LUDUM@DARE@30@IN@2014",2,0xffffff);
    }
    if(scrno==1)
    {
      drawshadedtext( ((int*)s->pixels)+250*640+3*16,"INTERDIMENSIONAL@BRIDGE@IS@BROKEN:",2,0xffffff);
      drawshadedtext( ((int*)s->pixels)+270*640+2*16,"THE@THREE@WORLDS@ARE@DRIFTING@APART",2,0xffffff);
    }
    if(scrno==2)
    {
      drawshadedtext( ((int*)s->pixels)+230*640+7*16,"TO@RECONNECT@THE@WORLDS",2,0xffffff);
      drawshadedtext( ((int*)s->pixels)+250*640+9*16,"BRING@QUANTUM@CORDS",2,0xffffff);
      drawtile(256,265,3,2);
      drawtile(256-48,265,3,2);
      drawtile(256+48,265,3,2);
      drawtile(256+48+48,265,3,2);
      drawshadedtext( ((int*)s->pixels)+310*640+3*16,"TO@THE@SAME@POSITION@IN@EACH@WORLD",2,0xffffff);
    }
    if(scrno==3)
    {
      drawshadedtext( ((int*)s->pixels)+240*640+13*16,"BUT@BEWARE:",2,0xffffff);
      drawshadedtext( ((int*)s->pixels)+260*640+1*16,"DIFFERENCES@BETWEEN@CONNECTING@WORLDS",2,0xffffff);
      drawshadedtext( ((int*)s->pixels)+280*640+6*16,"MAY@CAUSE@FATAL@EXPLOSIONS",2,0xffffff);
    }
    if(scrno==4)
    {
      drawshadedtext( ((int*)s->pixels)+240*640+3*16,">@ARROW@KEYS@TO@MOVE@AROUND",2,0xffffff);
      drawshadedtext( ((int*)s->pixels)+260*640+3*16,">@TAB@KEY@TO@SWITCH@WORLD",2,0xffffff);
      drawshadedtext( ((int*)s->pixels)+280*640+3*16,">@ENTER@TO@TOGGLE@FULLSCREEN",2,0xffffff);
      drawshadedtext( ((int*)s->pixels)+300*640+3*16,">@M@TO@TOGGLE@MUSIC",2,0xffffff);
      drawshadedtext( ((int*)s->pixels)+320*640+3*16,">@ESC@TO@QUIT",2,0xffffff);
    }
    if(scrno==5)
    {
      char hiscstr[8];
      drawshadedtext( ((int*)s->pixels)+220*640+6*16,"HIGH@SCORE@SINCE@STARTUP",2,0xffffff);
      sprintf(hiscstr,"%06d",highscore);
      drawshadedtext( ((int*)s->pixels)+260*640+6*16,hiscstr,8,0xffffff);
    }
  }
}

void togglefullscreen()
{
  static int fullscreen=0;
  fullscreen^=SDL_FULLSCREEN;
  s=SDL_SetVideoMode(640,480,32,fullscreen);
}

void docontrols()
{
  SDL_Event e;
  int numkeys;
  char*keys;

    SDL_PollEvent(&e);
  
  keys = SDL_GetKeyState(&numkeys);
  
  if(e.type==SDL_KEYDOWN)
  {
    if(e.key.keysym.sym==13 || e.key.keysym.sym==10)
      togglefullscreen();
    else if(e.key.keysym.sym=='m')
      usemusic^=1;
    else
    if(e.key.keysym.sym==27)
    {
      if(status==5) status=6;
      else { status=5; framectr=0; }
    } else
    if(status==5)
    {
      init();
      status=0;
      framectr=0;
    }
  }
  
  if(status>=5) return;
  
  if(keys[9] || keys[32])
  {
    if(currentworld<3)
      currentworld=((currentworld+1)%3)|16;
  } else currentworld&=3;

  if(currentworld<3)
  {
    int x;
    for(x=0;x<64*64;x++)
      if((worlds[currentworld].cells[x]&15)==2) break;

    if(x==64*64) deadhere=1;
    else
    {
      int oldpos=x,dir=0;
      deadhere=0;
      if(keys[SDLK_UP]) { dir=-64; lastmovedir=0; }
      if(keys[SDLK_DOWN]) { dir=64; lastmovedir=1; }
      if(keys[SDLK_LEFT]) { dir=-1; lastmovedir=2; }
      if(keys[SDLK_RIGHT]) { dir=1; lastmovedir=3; }

      vptox = 320+16 - (x&63)*32; 
      vptoy = 240+24 - (x>>6)*32;

      if(dir)
      {
        int fst=worlds[currentworld].cells[(oldpos+dir)&4095],
            nxt=worlds[currentworld].cells[(oldpos+dir*2)&4095];
        
        if( (fst<0x20) && ((!(fst&15)) || (!(nxt&15)) ))
        {
          int i=0;
          for(i=0;i<3;i++)
          {
            fst=worlds[i].cells[(oldpos+dir)&4095];
            nxt=worlds[i].cells[(oldpos+dir*2)&4095];

            if((worlds[i].cells[oldpos]&15)==2)
            {
            if(!(fst&15))
            {
              worlds[i].cells[oldpos]&=0xf0;
              worlds[i].cells[(oldpos+dir)&4095]|=2;
            } else
            if( (!(nxt&15)) && ((fst&15)!=5))
            {
              worlds[i].cells[(oldpos+dir*2)&4095] =
                (worlds[i].cells[(oldpos+dir*2)&4095]&0xf0) |
                (worlds[i].cells[(oldpos+dir*1)&4095]&0x0f);
              worlds[i].cells[oldpos]&=0xf0;
              worlds[i].cells[(oldpos+dir)&4095]=
                (worlds[i].cells[(oldpos+dir)&4095]&0xf0) | 2;
                
              if((fst&15)==3)
              {
                int i,cnt=0;
                for(i=0;i<3;i++)
                  if((worlds[i].cells[oldpos+dir*2]&15)==3) cnt++;
                if(cnt==3)
                {
                  for(i=0;i<3;i++)
                    worlds[i].cells[oldpos+dir*2] = 0x21;
                  status=1;
                }
              }
            }

          }
        }
      }
    }

  }
  
  if(status==1)
  {
    collapseworlds();
    status=0;
    if(playeralive())
    {
      nextlevel();
    }
  }
  }
}

int main(int argc,char**argv)
{
  int lasttick=0;
  SDL_Init(SDL_INIT_VIDEO|SDL_INIT_AUDIO);
  SDL_EnableKeyRepeat(0,0);
  SDL_ShowCursor(0);
  SDL_WM_SetCaption("Quantum Dash","Quantum Dash");
  srand(time(NULL));
  
  s=SDL_SetVideoMode(640,480,32,0);
  
  {
  SDL_AudioSpec as;
  as.freq=44100;
  as.format=AUDIO_S16;
  as.channels=1;
  as.samples=512;
  as.callback=updateaudio;
  SDL_OpenAudio(&as,NULL);
  }
  
  makebgimg();
  init();
  lasttick=SDL_GetTicks();
  SDL_PauseAudio(0);
  
  while(status!=6)
  {
    SDL_Event e;

    if(SDL_MUSTLOCK(s)) SDL_LockSurface(s);    
    
    if(status==5)
    {
      fillscreen();
      docontrols();
      if(!(framectr&3)) simulateworlds();
      showintrotexts();
      vptox=sin(framectr*.01)*1024;
      vptoy=cos(framectr*.011)*1024;
    } else
    {
        
    if(currentworld<3)
    {
      fillscreen();
      if(deadhere) showdeadstatus();
    }
      else
      realityteleportfx();
    }

    if(SDL_MUSTLOCK(s)) SDL_UnlockSurface(s);
    
    SDL_Flip(s);
    while(lasttick < SDL_GetTicks())
    {
//      SDL_Delay((lasttick+1000/30) - SDL_GetTicks());
      framectr++;
      lasttick+=1000/30;
      perframe();
    }
    if(SDL_GetTicks() < lasttick+1000/30)
    {
      SDL_Delay(lasttick+1000/60 - SDL_GetTicks());
    }
  }
  
  SDL_Quit();
}
