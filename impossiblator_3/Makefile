C1541=/opt/vice/bin/c1541
VICE=/opt/vice/bin/xvic
C2N=/opt/bin/c2n
CBMLINK=/opt/bin/cbmlink
C2NDEV=/dev/cuad0

all: clean emutest

release: clean impo3.zip

clean:
	rm -f *~ bin/* TEMP.* impo3.d64 impo3.zip IMPO3 IMPO3A
	cd loader; make clean
	cd allparts; make clean

########################################

emutest: impo3.d64
	$(VICE) impo3.d64

impo3.zip: impo3.d64
	cp impo3.d64 package
	cp bin/boot.prg package/impo3.prg
	cp bin/impo3.rle package/impo3a
	cd package ; zip ../impo3.zip *

impo3.d64: bin/boot.prg bin/impo3.bin
	dd if=/dev/zero of=impo3.d64 bs=174848 count=1
	$(C1541) impo3.d64 -format impo3,i3
	$(C1541) impo3.d64 -write bin/boot.prg 'impossiblator 3"
	$(C1541) impo3.d64 -write bin/impo3.rle 'impo3a'

bin/boot.prg:
	cd loader; make

bin/impo3.bin:
	cd allparts; make

link:
	$(C2N) -c $(C2NDEV) utils/vic20-40960.c2n

devxfer: demo
	dd if=bin/impo3.rle of=bin/impo3c.rle
	$(CBMLINK) -c c2n232 $(C2NDEV) -lo,0xa400 bin/impo3.rle
	$(CBMLINK) -c c2n232 $(C2NDEV) -l bin/boot_dev.prg
	$(CBMLINK) -c c2n232 $(C2NDEV) -r

kludxfer: demo
	$(CBMLINK) -c c2n232 $(C2NDEV) -lo,0x4000 bin/impo3.rle
	$(CBMLINK) -c c2n232 $(C2NDEV) -l bin/boot_dev.prg
	$(CBMLINK) -c c2n232 $(C2NDEV) -r

fixxfer: demo
	$(CBMLINK) -c c2n232 $(C2NDEV) -l bin/boot.prg
	$(CBMLINK) -c c2n232 $(C2NDEV) -r

demoxfer: bin/impo3.rle bin/boot.prg
	$(CBMLINK) -c c2n232 $(C2NDEV) -dc 'S0:IMPO3A'
	cp bin/impo3.rle IMPO3A
	$(CBMLINK) -c c2n232 $(C2NDEV) -fw IMPO3A
	$(CBMLINK) -c c2n232 $(C2NDEV) -l bin/boot.prg
	$(CBMLINK) -c c2n232 $(C2NDEV) -r
