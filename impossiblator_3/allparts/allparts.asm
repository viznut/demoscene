#BLK
	!source "../loader/start_glob.inc"
	*=keeploading

#BLKV
	*=$11C0

	;inc $900f
	;jmp $11C0

	!source "stretch.asm"

#BLK
	*=$11C0

#BLKV
	*=$1000
	!source "roadrace.asm"

#BLK
	*=$1000

#BLKV
	*=$1010
	!source "kefrens.asm"

#BLK
	*=$1380
