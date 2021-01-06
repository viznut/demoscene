;!zone charview
charview:

	; 4 tekstirivi‰ varattava tekstitykselle
	; tekstitys alas (elite-subtitletys)

	; leveys 25, 22 vai v‰hemm‰n?
	; jos 512 tavun puskuri, niin:
	; 25: 25x20 (16 line‰ "tosi
	; 22: 22x23 (22x19)


	; 00000000	end

	; 1xxxxxxx	merkkiskippaus (negatiivinen arvo)

	; 0llllhhh	h = alempi merkki 0..7
	;		l = ylempi merkki 8..23

	; y = startptr relative to texts
	; required ext symbol: texts

.SCRWIDTH=22
.tmp=255

charview:

	ldx #.SCRWIDTH*4-1
.l9	lda #3
	sta $1e00,x
	dex
	bpl .l9

.l0	lda texts,y
	;beq .o0	; 0 = terminate
	bpl .l1		; minus = skip

	pha
	and #7		; alempi merkki 0..7 -> remap to 16..23
	ora #16
	sta $1e00+.SCRWIDTH,x
	pla
	lsr
	lsr
	lsr
	and #15
	sta $1e00,x	; ylempi merkki 0..15

	lda #7
	sta $9600+.SCRWIDTH,x
	lda #1
	sta $9600,x

.l1	iny

	clc		; x+=a
	stx .tmp
	adc .tmp
	tax
	bpl .l0		; todo: terminoi pelk‰st‰‰n t‰ll‰

.rts
.o0	rts		; done with writing
