all: prg2vizldr rlecomp

prg2vizldr: prg2vizldr.c
	gcc -O2 -s prg2vizldr.c -o prg2vizldr

rlecomp: rlecomp.c
	gcc -O2 -s rlecomp.c -o rlecomp

clean:
	rm -f *~ prg2vizldr
