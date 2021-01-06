all: ../bin/boot.prg

# ../bin/boot_dev.prg

../bin/boot.prg: boot_real.a65 boot.a65 loader.bin drive.bin
	acme boot_real.a65
	mv boot.prg ../bin/

../bin/boot_dev.prg: boot_dev.a65 boot.a65 loader_dev.bin drive.bin
	acme boot_dev.a65
	mv boot_dev.prg ../bin/

loader.bin: loader_real.a65 loader.a65
	acme loader_real.a65

loader_dev.bin: loader_dev.a65 loader.a65
	acme loader_dev.a65

drive.bin: drive.a65
	acme drive.a65

clean:
	rm -f *~ boot.prg boot_dev.prg
	rm -f loader.bin loader_dev.bin loader_glob.inc
	rm -f drive.bin drive_glob.inc
