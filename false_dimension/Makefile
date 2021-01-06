all: falsedim.prg

falsedim.prg: falsedim-nc.prg
	pucrunch -c64 -x0x0a80 < falsedim-nc.prg > falsedim.prg

falsedim-nc.prg:
	acme false_dimension.asm

clean:
	rm -f falsedim-nc.prg falsedim.prg *~

