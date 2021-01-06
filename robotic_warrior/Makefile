all: warrior

warrior.bin: warrior.a65
	xa warrior.a65 -o warrior.bin

warrior.239: warrior.bin
	pucrunch -c20 -m5 -fshort -x0x1d00 -i0 < warrior.bin > warrior.239

warrior.239.inc: warrior.239
	./makeintroframe.pl < warrior.239 > warrior.239.inc

warrior: warrior.239.inc intro.a65
	xa intro.a65 -o warrior

clean:
	rm -f *~ warrior.239 warrior.239.inc warrior.bin warrior
