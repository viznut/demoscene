BLKASM=../utils/blkasm.pl
RLECOMP=../utils/rlecomp

all: ../bin/liber.rle

../bin/liber.bin: part0.asm part2.asm part4.asm segmenter.asm voice.asm
	rm -f ../bin/liber.bin
	$(BLKASM) ../bin/liber.bin part0.asm part2.asm part4.asm
# part4.asm

#../bin/liber.bin: part0.asm part2.asm
#	rm -f ../bin/liber.bin
#	$(BLKASM) ../bin/liber.bin part0.asm part2.asm

../bin/liber.rle: ../bin/liber.bin
	$(RLECOMP) < ../bin/liber.bin > ../bin/liber.rle

clean:
	rm -f *~ TEMP*.prg
