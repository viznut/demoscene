all: demoxfer loaderxfer

demo:
#	cd part0 ; make
#	cd part2 ; make
	cd allparts ; make

loader:
	cd loader ; make

clean:
	rm -f *~ bin/* TEMP.*
	cd loader; make clean

########################################

link:
	c2n -c /dev/ttyS0 utils/vic20-40960.c2n

devxfer: loader demo
	dd if=bin/liber.rle of=bin/liberc.rle
	cbmlink -c c2n232 /dev/ttyS0 -lo,0xa400 bin/liber.rle
	cbmlink -c c2n232 /dev/ttyS0 -l bin/boot_dev.prg
	cbmlink -c c2n232 /dev/ttyS0 -r

kludxfer: loader demo
	cbmlink -c c2n232 /dev/ttyS0 -lo,0x4000 bin/liber.rle
	cbmlink -c c2n232 /dev/ttyS0 -l bin/boot_dev.prg
	cbmlink -c c2n232 /dev/ttyS0 -r

demoxfer: demo
	cbmlink -c c2n232 /dev/ttyS0 -dc 'S0:LIBER0'
	cp bin/liber.rle LIBER0
	cbmlink -c c2n232 /dev/ttyS0 -fw LIBER0

loaderxfer: loader
	cbmlink -c c2n232 /dev/ttyS0 -l bin/boot.prg
	cbmlink -c c2n232 /dev/ttyS0 -r
