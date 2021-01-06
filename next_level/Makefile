C1541=/cygdrive/C/Program\ Files/WinVICE-1.22/c1541.exe
VICE=/cygdrive/C/Program\ Files/WinVICE-1.22/xvic.exe

run-full: demo.d64
	$(VICE) demo.d64

run-single: singleversion.prg
	$(VICE) singleversion.prg

link:
	c2nload -c com5 -m 20 wrk/cart.prg

single-xfer: singleversion.prg
	c2nload -c com5 -m 20 singleversion.prg

singleversion.prg: demosrc bob20.py
	./bob20.py demosrc/*.asm demosrc/single/*.asm

demo00.trk: demosrc demosrc/full bob20.py
	./bob20.py demosrc/*.asm demosrc/full/*.asm

demo.d64: bin/boot.prg demo00.trk
	dd if=/dev/zero of=demo.d64 bs=174848 count=1
	$(C1541) demo.d64 -format asm08pwp,pw
	$(C1541) demo.d64 -write bin/boot.prg 'the next level'
	$(C1541) demo.d64 -write demo00.trk 'tnl-data'

bin/boot.prg:
	cd loader && make

bs32.exe: bs32.c
	gcc -Os bs32.c -s -o bs32.exe -Dmain=SDL_main -I/usr/include/SDL -L/usr/lib -L/lib/mingw -lmingw32 -lSDLmain -lSDL -mno-cygwin

bs32conv.exe: bs32conv.c
	gcc -Os bs32conv.c -o bs32conv

conv:
	gcc -Os bs32conv.c -o bs32conv

clean:
	rm -f *~ *.exe demosrc/*~ BUILD/* bin/boot.prg demo.d64 demo00.trk

backup: clean
	cd .. && tar czf asm08.tar.gz asm08 && scp asm08.tar.gz viznut@low.fi:public_html/
