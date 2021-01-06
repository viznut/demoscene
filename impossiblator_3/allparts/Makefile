BLKASM=../utils/blkasm.pl
RLECOMP=../utils/rlecomp

all: ../bin/impo3.rle

../bin/impo3.bin: allparts.asm 
	rm -f ../bin/impo3.bin
	$(BLKASM) ../bin/impo3.bin allparts.asm
# part4.asm

../bin/impo3.rle: ../bin/impo3.bin
	$(RLECOMP) < ../bin/impo3.bin > ../bin/impo3.rle

clean:
	rm -f *~ TEMP*
