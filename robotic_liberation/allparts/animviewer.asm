!zone animframe

	lda #12




        lda animtab,x
	ldy #$94
        lsr
	bcs .hup
	ldy #$1c
.hup	tax

	lda #0
	sec
.l00	rol
	dex
	bne .l00

	pha
	lda $9000
	eor #1

	sta $9000
	lsr
	pla

	jsr animdraw
	rts


!zone animdraw
animdraw:

	sta .selectmask0
	ldx #22*4
	lda #$1e
	bcs .z1
	    iny
	    ldx #0
	    lda #$1f
.z1
	sty .srcpage0
	sta .destpage0
	sta .destpage1
	sta .destpage2

.l0	lda #0
	.selectmask0=*-1
	and $1c00,x
	.srcpage0=*-1

	bne .c0
	    dec $1e00,x
	    .destpage0=*-1
	    bne .c1
	.c0
	    lda $1e00,x
	    .destpage1=*-1
	    cmp #5
	    beq .c1
	    inc $1e00,x
	    .destpage2=*-1
	.c1
	inx
	bne .l0

	rts
