ACME=/opt/bin/acme
PUCRUNCH=/opt/bin/pucrunch

all: ../bin/boot.prg

# ../bin/boot_dev.prg

../bin/boot.prg: boot_real.a65 boot.a65 loader.bin drive.bin
	$(ACME) boot_real.a65
	$(PUCRUNCH) -c20 -x0x1800 boot.prg boot.prg
	mv boot.prg ../bin/

../bin/boot_dev.prg: boot_dev.a65 boot.a65 loader_dev.bin drive.bin
	$(ACME) boot_dev.a65
	mv boot_dev.prg ../bin/

loader.bin: loader_real.a65 loader.a65
	$(ACME) loader_real.a65

loader_dev.bin: loader_dev.a65 loader.a65
	$(ACME) loader_dev.a65

driveside.bin: drive.a65
	$(ACME) drive.a65

clean:
	rm -f *~ boot.prg boot_dev.prg
	rm -f loader.bin loader_dev.bin loader_glob.inc start_glob.inc
	rm -f driveside.bin drive_glob.inc
