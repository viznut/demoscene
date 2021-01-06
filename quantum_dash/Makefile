# native build.
CC=gcc
EXE=./quantumdash
FLAGS=`sdl-config --libs --cflags`

# Windows build. You probably need to change the paths etc.
WINCC=i586-mingw32msvc-gcc
WINFLAGS=-L../SDL-1.2.14/lib -I../SDL-1.2.14/include -static -lmingw32 ../SDL-1.2.14/lib/libSDL.a ../SDL-1.2.14/lib/libSDLmain.a -mwindows -lwinmm -s

all: envcheck $(EXE)

devrun: $(EXE)
	$(EXE)

package: ../quantumdash/quantumdash.exe ../quantumdash/quantumdash-src.tar.gz
	cd .. && zip quantumdash.zip quantumdash/* 

envcheck:
	@sdl-config --cflags >/dev/null 2>/dev/null || echo 'Cannot run sdl-config! Install SDL dev libs maybe?'

clean:
	rm -f *.o *~ game quantumdash fontdata.i bitmaps.i winbuild/* ../quantumdash/stderr.txt ../quantumdash/stdout.txt

winrun: ../quantumdash/quantumdash.exe
	wine ../quantumdash/quantumdash.exe

$(EXE): game.o gfx.o
	$(CC) -Os  game.o gfx.o -o $(EXE) `sdl-config --libs` -lm

../quantumdash/quantumdash.exe: winbuild/game.o winbuild/gfx.o
	$(WINCC) -Os -s winbuild/game.o winbuild/gfx.o -o ../quantumdash/quantumdash.exe $(WINFLAGS) -lm

winbuild/game.o: game.c
	$(WINCC) -c -Os game.c -o winbuild/game.o $(WINFLAGS)

game.o: game.c game.h
	$(CC) -c -Os game.c -o game.o `sdl-config --cflags`

gfx.o: gfx.c fontdata.i bitmaps.i game.h
	$(CC) -c -Os gfx.c -o gfx.o `sdl-config --cflags`

winbuild/gfx.o: gfx.c fontdata.i game.h
	$(WINCC) -c -Os gfx.c -o winbuild/gfx.o $(WINFLAGS)

../quantumdash/quantumdash-src.tar.gz: clean
	cd .. && tar czf quantumdash/quantumdash-src.tar.gz quantumdash-src/*

fontdata.i: font.pl
	perl font.pl > fontdata.i

bitmaps.i: bitmaps.pl
	perl bitmaps.pl > bitmaps.i
