!source "../loader/start_glob.inc"
!zone mc
*=$11C0

mcstart_mine
	sei

	lda #47
	sta $9001
	lda #40
	sta $9003
	lda #128+21
	sta $9002

	lda #$08
	sta $900f
	lda #$08
	sta $900e

	ldx #7
.hsf	lda shape,x
	;sta $200,x
	;sta $208,x
	;sta $210,x
	sta $298,x ; $218,x
	;sta $220,x
	;sta $228,x
	;sta $230,x
	;sta $238,x
	dex
	bpl .hsf

	lda #1
	ldx #0
.l0	lda #$f
	sta $9400,x
	sta $9500,x
	;lda #1
	sta $9600,x
	sta $9700,x
	lda #$00
	sta $1e00,x
	sta $1f00,x
	sta linelist,x
	dex
	bne .l0

	; for some reason: f9 shows "starry noise", fa & fb ok
	; f5 & f4 also show noise
	lda #$f7 ;	; 0 8000, 8 0000 9 0400 A 0800 B 0C00 C 1000
	sta $9005

	STMP=$fd

mainloop0:

;	lda #0
;.ml00	sta $0200,x

.ml0	jsr mainloop
	lda chStates+4
	cmp #5*4
	beq .ml0

.ml1	jsr mainloop
	lda chStates+4
	cmp #5*4
	bne .ml1

	lda #$ff
	sta $fd
.ml15	jsr mainloop
	dec $fd
	bne .ml15

;	lda #$00
;	sta $900e

.ml2	jsr mainloop_without_music
	inc $900d
	dec $900c
	dec $900c
	dec $900c
	dec $900b
	dec $900a
	inc stretch_dlo
	bne .ml2
	inc stretch_dhi

	ldx #chData_drums_wild-chData-1
	stx chInitPointers+3
	inx
	stx chPointers+3

	ldx #chData_chords-chData-1
	stx chInitPointers+4
	inx
	stx chPointers+4

	ldx #chData_melodyPart0-chData-1
	stx chInitPointers
	inx
	stx chPointers

.ml3	jsr mainloop
	dec rollposition
	bne .ml3

	lda #0
	sta $fa
	sta $f9
.ml4	jsr mainloop_with_rolling
	dec $fd
	bne .ml4

.ml5	jsr mainloop_with_rolling
	inc stretch_dlo
	inc stretch_position
	dec $fd
	bne .ml5

	lda #0
	sta stretch_dhi

	lda #12
	sta $fd

	ldx #chData_melodyPart1-chData-1
	stx chInitPointers

.ml55	lda #$77
	sta stretch_dhi
	jsr mainloop_with_rolling

	lda $fd
	sta stretch_dhi
	jsr mainloop_with_rolling

	dec $fd
	bne .ml55


.ml6	jsr mainloop_with_action
	dec $fd
	bne .ml6

	lda #$ff
	sta $f0

.ml7	jsr mainloop_with_countdown
	dec $fd
	bne .ml7

	lda #0
	sta chInitPointers+1
	sta chInitPointers+3

;.ml77	jsr mainloop_with_countdown
;	dec $fd
;	bne .ml77

.ml78	jsr mainloop_with_countdown
	ldx $fd
	lda #0
	sta linecolrs,x
	dec $fd
	bne .ml78

	jmp restofdesign


;.ml8	lda #4
;	bit $fd
;	bne .ml87
;	lda #8
;	sta $900e
;	jsr mainloop_with_countdown
;	jmp .ml88
;.ml87	lda #0
;	sta $900e
;	jsr mainloop
;.ml88	dec $fd
;	bne .ml8
;
;.ml9	jsr mainloop
;	jmp .ml9

;	lda stretch_dhi
;	and #3
;	sta stretch_dhi

;	lda $fd
;	bpl .hou
;	lda stretch_dlo
;	eor #$ff
;	sta stretch_dlo
;	lda stretch_dhi
;	eor #$ff
;	sta stretch_dhi
;.hou
;
;
;	inc stretch_position
;	clc
;	lda stretch_dlo
;	adc #16
;	sta stretch_dlo
;	bcc .cc6
;	inc stretch_dhi
;.cc6	lda stretch_dhi
;	cmp #$10
;	beq .cc6b
;	lda #$f0
;	sta stretch_dhi

;.ml99	jsr mainloop
;	jmp .ml99

drawchar:

	stx .trg
	asl
	asl	
	asl
	and #63-7
	clc
	adc #8
	sta .src

	ldx #120

.d3	lda $8100,x
	.src=*-2
	sta $ff

	ldy #7
.d2	lsr $ff
	lda #0
	bcc .d1
	lda #195+16
.d1	sta $1e00,y
	.trg=*-2
	dey
	bpl .d2

	clc
	lda .trg
	adc #21
	sta .trg

	inx
	bpl .d3
	rts

;*=$1380
mainloop_with_countdown

	ldx #2+84
	lda $f0
	lsr
	lsr
	lsr
	lsr
	lsr
	jsr drawchar

	ldx #10+84
	lda $f0
	lsr
	lsr
	jsr drawchar

	dec $f0

mainloop_with_action

	lda #0
	.paski=*-1
	sta stretch_dhi

	lda $f9
	bpl .cc66
	eor #$ff
.cc66	asl
	ldx #0
	asl
	bcc .cc6
	ldx #$ff
.cc6	stx stretch_dhi
	sta stretch_dlo

	dec stretch_position
	dec stretch_position

	inc $f9

mainloop_with_rolling

	inc $fa
	lda $fa
	bpl .zu
	eor #$ff
.zu	sta rollposition
mainloop:
	jsr musicplayer
mainloop_without_music:
	;;; STRETCH

	LO=$fb
	HI=$fc

	lda #0
	stretch_position=*-1
	sta LO
	sta HI

;	lda #9
;	sta $900f

	ldy #159-31

.sl0	clc
	lda LO
	adc #0
	stretch_dlo=*-1
	sta LO
	lda HI
	adc #0
	stretch_dhi=*-1
	sta HI
	and #126
	sta linelist+31,y
	dey
	bne .sl0

;	inc stretch_dlo
;	bne .blah
;
;	ldx stretch_dhi
;	inx
;	cpx #4
;	bne .blah2
;	ldx #$fd
;.blah2	stx .dhi
;.blah
	;;; ROLL ;;;

	ldy #63
.rl0	lda #0
	rolloffset=*-1
;	lsr
;	lsr
	clc
	adc rolltab,y
	eor #127
	and #62
	ora #128
	sta linelist+160,y
	rollposition=*-2
	dey
	bpl .rl0

	;;; REFLECT ;;;

	ldx #31
	ldy #33

.rfl0	lda linelist,y
	sta linelist,x
	iny
	dex
	bpl .rfl0

	;;; DIZAJN

;	inc $fc
;	lda $fc
;	bpl .zu
;	eor #$ff
;.zu	lsr
;	sta rollposition

	inc rolloffset

	;;;;;;;;;;

.zkip	;dec $900f

	lda #12
	sta $9000

;	lda #40
;	sta $9003
               
rasta
                lda #40         ; = start of screen
ll0             cmp $9004       ; wait until at given rasterline
                bne ll0         ; bail out 3..9 clocks after $9004 change
                                ; first cmp must occur 71-3-4=64 clks later


                lda $9003       ; -4 (60)
                ldy #12         ; -2 (58)  -1 no matter
                nop

m1              ldx #16         ; wait 57
m2              dex
                dex
                bne m2

                cmp $9003       ; +4
                beq *+2         ; +3 if equal, +2 if not equal
                eor #$80        ; +2
                dey             ; +2

                bne m1          ; +3 -> total 71 if adjusted, 70 if not

	pha
	pla
	pha
	pla
	pha
	pla
	pha
	pla
	pha
	pla
	pha
	pla
	pha
	pla
;	pha
;	pla
	nop
	cmp 0

	ldy #159

.l00	ldx linelist,y	; 4	; do anding in real loop
	stx .pt		; 4
;	stx linelist

	lda linecolrs,x	; 4
	sta $900f	; 4

	jmp (lineptrs)	; 5
	.pt=*-2
linedone
	dey		; 2
	bne .l00 	; 3	; total 26 - leaves 45 (22 chars + dumbo)

	ldx #0
	stx $900f
	dex
	stx $9000

	rts

*=$1400
lineptrs
!word picl0,picl0,picl1,picl2,picl3,picl4,picl5,picl6,picl7,picl8,picl9,picl10
!word picl11,picl12,picl13,picl14,picl15,picl16,picl16,picl17,picl18,picl19
!word picl20,picl21,picl22,picl23,picl24,picl25,picl25,picl24,picl23,picl22
!word picl21,picl20,picl19,picl18,picl17,picl16,picl16,picl15,picl14,picl13
!word picl12,picl11,picl10,picl9,picl8,picl7,picl6,picl5,picl4,picl3,picl2
!word picl1,picl26,picl27,picl28,picl29,picl30,picl31,picl32,picl33,picl34
!word picl0
;!word picl0

!word picl35,picl36,picl37,picl38,picl39,picl40,picl40
!word picl41,picl42,picl0,picl0,picl35,picl36,picl37,picl38
!word picl39,picl40,picl40,picl41,picl42,picl0,picl42,picl41
!word picl40,picl40,picl39,picl38,picl37,picl36,picl35,picl0,picl0
; 96x2 = 192

rolltab ; 64, just fit
!byte 0, 3, 4, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 10, 11, 11, 12, 12, 12, 13, 13
!byte 13, 14, 14, 14, 15, 15, 15, 16, 16, 16, 17, 17, 17, 17, 18, 18, 18, 19, 19
!byte 19, 20, 20, 20, 21, 21, 21, 22, 22, 23, 23, 23, 24, 24, 25, 25, 26, 26, 27
!byte 27, 28, 29, 30

*=$1500
linecolrs ; 192
!word $66,$66,$86,$86,$86,$83,$f6,$16,$16,$f6,$d6,$f3,$d6,$d6,$c6,$d6,$c3
!word $c6,$16,$c6,$13,$16,$16,$c3,$e6,$e3,$67,$01,$67,$60,$02,$60,$42,$c0
!word $42,$c2,$c0,$e2,$62,$02,$60,$22,$22,$a2,$22,$00,$22,$22,$a2,$f2,$22
!word $00,$72,$72,$22,$22,$26,$26,$26,$26,$26,$26,$66,$66  , $94,$72,$f4,$12
!word $f4,$72,$74,$92,$74,$00,$63,$e6,$e3,$c6,$a3,$a6,$c3,$e6,$e3,$c6,$66
!word $65,$37,$b5,$17,$15,$17,$15,$b7,$35,$67,$64


linelist=$1600;$0200
shape:
!byte %01111101
!byte %01101101
!byte %10101011
!byte %10101011
!byte %10101011
!byte %10101011
!byte %11101101
!byte %01110101
;*=$1600	; !!! USE $200+
;linelist
;!byte 126,126,124,124,122,122,120,120,118,118
;!byte 116,116,114,114,112,112,110,110,108,108
;!byte 106,106,104,104,102,102,100,100, 98, 98
;!byte  96, 96, 94, 94, 92, 92, 90, 90, 88, 88
;!byte  86, 86, 84, 84, 82, 82, 80, 80, 78, 78
;!byte  76, 76, 74, 74, 72, 72, 70, 70, 68, 68
;!byte  66, 66, 64, 64, 62, 62, 60, 60, 58, 58
;!byte  56, 56, 54, 54, 52, 52, 50, 50, 48, 48
;!byte  46, 46, 44, 44, 42, 42, 40, 40, 38, 38
;!byte  36, 36, 34, 34, 32, 32, 30, 30, 28, 28
;!byte  26, 26, 24, 24, 22, 22, 20, 20, 18, 18
;!byte  16, 16, 14, 14, 12, 12, 10, 10,  8,  8
;!byte   6,  6,  4,  4,  2,  2,  0,  0
;; 160 reserved, 96 free

*=$1700
picl0 ; 42 bytes to 21
; 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 
!byte $4E
!byte $00
!byte $8B
!byte $4E
!byte $00
!byte $8B
!byte $4E
!byte $00
!byte $8B
!byte $4E
!byte $00
!byte $8B
!byte $4E
!byte $00
!byte $8B
!byte $4E
!byte $00
!byte $8B
!byte $EE
!byte $00
!byte $8B
jmp linedone

picl1 ; 42 bytes to 36
; 55 55 55 55 5A AA AA AA AA AA AA AA AA AA 55 55 55 55 55 55 55 
!byte $C9
!byte $55
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $C9
!byte $5A
!byte $C9
!byte $AA
!byte $C9
!byte $AA
!byte $C9
!byte $AA
!byte $C9
!byte $AA
!byte $C9
!byte $AA
!byte $A9
!byte $AA
!byte $8D
!byte $AA
!byte $02
!byte $8E
!byte $AA
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl2 ; 42 bytes to 28
; 55 55 55 56 AA AA AA AA AA AA AA AA AA AA A9 55 55 55 55 55 55 
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $C9
!byte $56
!byte $EA
!byte $AA
!byte $AA
!byte $AA
!byte $AA
!byte $AA
!byte $AA
!byte $AA
!byte $AA
!byte $AA
!byte $AA
!byte $A9
!byte $55
!byte $C9
!byte $55
!byte $8D
!byte $55
!byte $02
!byte $8D
!byte $55
!byte $02
jmp linedone

picl3 ; 42 bytes to 36
; 55 55 55 6A AA AA AA AA AA AA AA AA AA AA AA 55 55 55 55 55 55 
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $C9
!byte $6A
!byte $C9
!byte $AA
!byte $C9
!byte $AA
!byte $C9
!byte $AA
!byte $C9
!byte $AA
!byte $C9
!byte $AA
!byte $C9
!byte $AA
!byte $A9
!byte $AA
!byte $8D
!byte $AA
!byte $02
!byte $8D
!byte $AA
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl4 ; 42 bytes to 35
; 55 55 56 AA AA AA AA AA AA AA AA AA AA AA AA 95 55 55 55 55 55 
!byte $C9
!byte $55
!byte $C9
!byte $55
!byte $C9
!byte $56
!byte $C9
!byte $AA
!byte $A2
!byte $AA
!byte $8E
!byte $AA
!byte $02
!byte $8E
!byte $AA
!byte $02
!byte $8E
!byte $AA
!byte $02
!byte $8E
!byte $AA
!byte $02
!byte $8E
!byte $AA
!byte $02
!byte $C9
!byte $95
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl5 ; 42 bytes to 34
; 55 55 5A AA AA AA AA AA AA A8 00 00 02 AA AA A5 55 55 55 55 55 
!byte $C9
!byte $55
!byte $C9
!byte $55
!byte $C9
!byte $5A
!byte $C9
!byte $AA
!byte $A2
!byte $AA
!byte $8E
!byte $AA
!byte $02
!byte $8E
!byte $AA
!byte $02
!byte $4E
!byte $A8
!byte $88
!byte $C9
!byte $02
!byte $8E
!byte $AA
!byte $02
!byte $C9
!byte $A5
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl6 ; 42 bytes to 34
; 55 55 5A AA AA AA AA AA A0 00 00 00 00 0A AA A5 55 55 55 55 55 
!byte $C9
!byte $55
!byte $C9
!byte $55
!byte $C9
!byte $5A
!byte $A2
!byte $AA
!byte $8E
!byte $AA
!byte $02
!byte $8E
!byte $AA
!byte $02
!byte $C9
!byte $A0
!byte $C9
!byte $00
!byte $4E
!byte $00
!byte $8B
!byte $8E
!byte $0A
!byte $02
!byte $C9
!byte $A5
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl7 ; 42 bytes to 34
; 55 55 5A AA AA AA AA AA A0 00 00 00 00 00 AA A5 55 55 55 55 55 
!byte $C9
!byte $55
!byte $C9
!byte $55
!byte $C9
!byte $5A
!byte $A2
!byte $AA
!byte $8E
!byte $AA
!byte $02
!byte $8E
!byte $AA
!byte $02
!byte $C9
!byte $A0
!byte $C9
!byte $00
!byte $4E
!byte $00
!byte $8B
!byte $8E
!byte $00
!byte $02
!byte $C9
!byte $A5
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl8 ; 42 bytes to 34
; 55 55 5A AA AA AA AA AA AA A8 00 00 00 00 0A A5 55 55 55 55 55 
!byte $C9
!byte $55
!byte $C9
!byte $55
!byte $C9
!byte $5A
!byte $C9
!byte $AA
!byte $A2
!byte $AA
!byte $8E
!byte $AA
!byte $02
!byte $8E
!byte $AA
!byte $02
!byte $CD
!byte $A8
!byte $88
!byte $4E
!byte $00
!byte $8B
!byte $C9
!byte $0A
!byte $C9
!byte $A5
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl9 ; 42 bytes to 34
; 55 55 5A AA AA AA AA AA AA AA A8 00 00 00 0A A5 55 55 55 55 55 
!byte $C9
!byte $55
!byte $C9
!byte $55
!byte $C9
!byte $5A
!byte $A2
!byte $AA
!byte $8E
!byte $AA
!byte $02
!byte $8E
!byte $AA
!byte $02
!byte $8E
!byte $AA
!byte $02
!byte $C9
!byte $A8
!byte $4E
!byte $00
!byte $8B
!byte $C9
!byte $0A
!byte $C9
!byte $A5
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl10 ; 42 bytes to 36
; 55 55 5A AA AA AA AA AA AA AA AA A0 00 00 0A A5 55 55 55 55 55 
!byte $C9
!byte $55
!byte $C9
!byte $55
!byte $C9
!byte $5A
!byte $C9
!byte $AA
!byte $A2
!byte $AA
!byte $8E
!byte $AA
!byte $02
!byte $8E
!byte $AA
!byte $02
!byte $8E
!byte $AA
!byte $02
!byte $C9
!byte $A0
!byte $CD
!byte $00
!byte $8B
!byte $C9
!byte $0A
!byte $C9
!byte $A5
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl11 ; 42 bytes to 34
; 55 55 5A AA AA AA AA AA AA AA AA AA 00 00 0A A5 55 55 55 55 55 
!byte $C9
!byte $55
!byte $C9
!byte $55
!byte $C9
!byte $5A
!byte $C9
!byte $AA
!byte $A2
!byte $AA
!byte $8E
!byte $AA
!byte $02
!byte $8E
!byte $AA
!byte $02
!byte $8E
!byte $AA
!byte $02
!byte $4E
!byte $AA
!byte $82
!byte $C9
!byte $0A
!byte $C9
!byte $A5
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl12 ; 42 bytes to 35
; 55 55 5A AA AA AA AA AA A5 5A AA AA 80 00 0A A5 55 55 55 55 55 
!byte $C9
!byte $55
!byte $C9
!byte $55
!byte $A2
!byte $5A
!byte $A9
!byte $AA
!byte $8D
!byte $AA
!byte $02
!byte $8D
!byte $AA
!byte $02
!byte $A2
!byte $A5
!byte $C9
!byte $5A
!byte $8D
!byte $AA
!byte $02
!byte $CD
!byte $80
!byte $8B
!byte $8E
!byte $0A
!byte $02
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl13 ; 42 bytes to 34
; 55 55 5A AA AA AA AA A9 55 55 6A AA A0 00 0A A5 55 55 55 55 55 
!byte $C9
!byte $55
!byte $C9
!byte $55
!byte $C9
!byte $5A
!byte $A9
!byte $AA
!byte $EA
!byte $AA
!byte $AA
!byte $AA
!byte $A9
!byte $55
!byte $C9
!byte $55
!byte $8E
!byte $6A
!byte $02
!byte $C9
!byte $A0
!byte $C9
!byte $00
!byte $C9
!byte $0A
!byte $8D
!byte $A5
!byte $02
!byte $8D
!byte $55
!byte $02
!byte $8D
!byte $55
!byte $02
jmp linedone

picl14 ; 42 bytes to 36
; 55 55 5A AA AA AA AA 95 55 55 56 AA A0 00 0A A5 55 55 55 55 55 
!byte $C9
!byte $55
!byte $A2
!byte $55
!byte $C9
!byte $5A
!byte $C9
!byte $AA
!byte $A9
!byte $AA
!byte $8D
!byte $AA
!byte $02
!byte $C9
!byte $95
!byte $8E
!byte $55
!byte $02
!byte $8D
!byte $56
!byte $02
!byte $C9
!byte $A0
!byte $C9
!byte $00
!byte $C9
!byte $0A
!byte $8E
!byte $A5
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl15 ; 42 bytes to 34
; 55 55 5A AA AA AA A9 55 55 55 55 6A A0 00 0A A5 55 55 55 55 55 
!byte $C9
!byte $55
!byte $C9
!byte $55
!byte $C9
!byte $5A
!byte $EA
!byte $AA
!byte $AA
!byte $AA
!byte $A9
!byte $55
!byte $C9
!byte $55
!byte $8D
!byte $55
!byte $02
!byte $C9
!byte $6A
!byte $C9
!byte $A0
!byte $C9
!byte $00
!byte $C9
!byte $0A
!byte $8D
!byte $A5
!byte $02
!byte $8D
!byte $55
!byte $02
!byte $8D
!byte $55
!byte $02
jmp linedone

picl16 ; 42 bytes to 36
; 55 55 5A AA AA AA A5 55 55 55 55 5A A0 00 0A A5 55 55 55 55 55 
!byte $C9
!byte $55
!byte $C9
!byte $55
!byte $A2
!byte $5A
!byte $A9
!byte $AA
!byte $8D
!byte $AA
!byte $02
!byte $C9
!byte $A5
!byte $A9
!byte $55
!byte $8D
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $C9
!byte $A0
!byte $C9
!byte $00
!byte $C9
!byte $0A
!byte $8D
!byte $A5
!byte $02
!byte $8D
!byte $55
!byte $02
!byte $8D
!byte $55
!byte $02
jmp linedone

picl17 ; 42 bytes to 36
; 55 55 56 AA AA AA 95 55 55 55 55 5A A0 00 0A A5 55 55 55 55 55 
!byte $C9
!byte $55
!byte $A2
!byte $55
!byte $C9
!byte $56
!byte $A9
!byte $AA
!byte $8D
!byte $AA
!byte $02
!byte $C9
!byte $95
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $C9
!byte $5A
!byte $C9
!byte $A0
!byte $C9
!byte $00
!byte $C9
!byte $0A
!byte $8E
!byte $A5
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl18 ; 42 bytes to 33
; 55 55 55 6A AA A9 55 55 55 55 55 5A A0 00 0A A5 55 55 55 55 55 
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $EA
!byte $6A
!byte $AA
!byte $A9
!byte $55
!byte $8D
!byte $55
!byte $02
!byte $8D
!byte $55
!byte $02
!byte $C9
!byte $5A
!byte $C9
!byte $A0
!byte $C9
!byte $00
!byte $C9
!byte $0A
!byte $8D
!byte $A5
!byte $02
!byte $8D
!byte $55
!byte $02
!byte $8D
!byte $55
!byte $02
jmp linedone

picl19 ; 42 bytes to 34
; 55 55 55 55 55 55 55 55 55 55 55 6A A0 00 0A A5 55 55 55 55 55 
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $C9
!byte $6A
!byte $C9
!byte $A0
!byte $C9
!byte $00
!byte $C9
!byte $0A
!byte $8E
!byte $A5
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl20 ; 42 bytes to 35
; 55 55 55 55 55 55 55 55 55 55 56 AA A0 00 0A A5 55 55 55 55 55 
!byte $C9
!byte $55
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $C9
!byte $56
!byte $C9
!byte $AA
!byte $C9
!byte $A0
!byte $C9
!byte $00
!byte $C9
!byte $0A
!byte $8E
!byte $A5
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl21 ; 42 bytes to 34
; 55 55 55 55 55 55 55 55 55 55 6A AA 80 00 0A A5 55 55 55 55 55 
!byte $C9
!byte $55
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $C9
!byte $6A
!byte $C9
!byte $AA
!byte $CD
!byte $80
!byte $8B
!byte $C9
!byte $0A
!byte $8E
!byte $A5
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl22 ; 42 bytes to 32
; 55 55 55 55 55 55 55 55 55 5A AA AA 00 00 0A A5 55 55 55 55 55 
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $C9
!byte $5A
!byte $C9
!byte $AA
!byte $4E
!byte $AA
!byte $82
!byte $C9
!byte $0A
!byte $8E
!byte $A5
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl23 ; 42 bytes to 36
; 55 55 5D 55 55 55 55 55 5A AA AA A0 00 00 2A A5 55 5D 5D D5 55 
!byte $C9
!byte $55
!byte $A2
!byte $55
!byte $8E
!byte $5D
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $C9
!byte $5A
!byte $C9
!byte $AA
!byte $C9
!byte $AA
!byte $C9
!byte $A0
!byte $CD
!byte $00
!byte $8B
!byte $C9
!byte $2A
!byte $8E
!byte $A5
!byte $02
!byte $C9
!byte $5D
!byte $C9
!byte $5D
!byte $8E
!byte $D5
!byte $02
jmp linedone

picl24 ; 42 bytes to 35
; 75 75 5D 75 55 5D 55 55 5A AA A8 00 00 00 AA A5 55 DD 5D D5 D5 
!byte $C9
!byte $75
!byte $A2
!byte $75
!byte $8E
!byte $5D
!byte $02
!byte $A2
!byte $55
!byte $C9
!byte $5D
!byte $8E
!byte $55
!byte $02
!byte $C9
!byte $5A
!byte $A9
!byte $AA
!byte $4E
!byte $A8
!byte $88
!byte $8D
!byte $00
!byte $02
!byte $8E
!byte $A5
!byte $02
!byte $C9
!byte $DD
!byte $C9
!byte $5D
!byte $C9
!byte $D5
!byte $C9
!byte $D5
jmp linedone

picl25 ; 42 bytes to 35
; 75 75 5D 75 55 DD DD 55 5A AA 80 00 00 0A AA 95 55 DD 5D D5 D5 
!byte $C9
!byte $75
!byte $A2
!byte $75
!byte $8E
!byte $5D
!byte $02
!byte $A2
!byte $55
!byte $C9
!byte $DD
!byte $8E
!byte $DD
!byte $02
!byte $C9
!byte $5A
!byte $A9
!byte $AA
!byte $4E
!byte $80
!byte $8B
!byte $8D
!byte $0A
!byte $02
!byte $8E
!byte $95
!byte $02
!byte $C9
!byte $DD
!byte $C9
!byte $5D
!byte $C9
!byte $D5
!byte $C9
!byte $D5
jmp linedone

picl26 ; 42 bytes to 28
; 00 80 00 00 00 FF FF FF FF FF FF FF FF FF FE 80 00 00 80 00 01 
!byte $C9
!byte $00
!byte $C9
!byte $80
!byte $4E
!byte $00
!byte $8B
!byte $CD
!byte $FF
!byte $8D
!byte $CD
!byte $FF
!byte $8D
!byte $CD
!byte $FF
!byte $8D
!byte $CD
!byte $FF
!byte $8D
!byte $CD
!byte $FF
!byte $86
!byte $4E
!byte $80
!byte $8B
!byte $EE
!byte $80
!byte $8B
jmp linedone

picl27 ; 42 bytes to 36
; 00 80 02 80 00 03 FF FF FF FF FF FF FF FF FA A0 00 02 A0 00 01 
!byte $C9
!byte $00
!byte $C9
!byte $80
!byte $C9
!byte $02
!byte $CD
!byte $80
!byte $8B
!byte $C9
!byte $03
!byte $CD
!byte $FF
!byte $8D
!byte $CD
!byte $FF
!byte $8D
!byte $CD
!byte $FF
!byte $8D
!byte $CD
!byte $FF
!byte $8D
!byte $C9
!byte $FA
!byte $C9
!byte $A0
!byte $A2
!byte $00
!byte $C9
!byte $02
!byte $8E
!byte $A0
!byte $02
!byte $C9
!byte $01
jmp linedone

picl28 ; 42 bytes to 30
; 00 C0 0A A0 00 02 0F FF FF FF FE FF FF FF FF FF 80 00 F0 00 01 
!byte $A2
!byte $00
!byte $EA
!byte $C0
!byte $0A
!byte $8E
!byte $A0
!byte $02
!byte $C9
!byte $02
!byte $C9
!byte $0F
!byte $CD
!byte $FF
!byte $8D
!byte $EE
!byte $FF
!byte $86
!byte $CD
!byte $FF
!byte $8D
!byte $CD
!byte $FF
!byte $8D
!byte $8E
!byte $80
!byte $02
!byte $EE
!byte $F0
!byte $88
jmp linedone

picl29 ; 42 bytes to 38
; 55 54 0F FC 00 02 00 3F FB FF FA FF FF EF FF FE A0 00 00 05 55 
!byte $C9
!byte $55
!byte $C9
!byte $54
!byte $C9
!byte $0F
!byte $C9
!byte $FC
!byte $C9
!byte $00
!byte $CD
!byte $02
!byte $8B
!byte $C9
!byte $3F
!byte $C9
!byte $FB
!byte $C9
!byte $FF
!byte $C9
!byte $FA
!byte $CD
!byte $FF
!byte $8D
!byte $C9
!byte $EF
!byte $CD
!byte $FF
!byte $86
!byte $C9
!byte $A0
!byte $CD
!byte $00
!byte $8B
!byte $C9
!byte $05
!byte $C9
!byte $55
jmp linedone

picl30 ; 42 bytes to 37
; 55 55 55 FF 00 0A 81 03 EA FF FF FF FF AB FF FE A0 00 55 55 55 
!byte $C9
!byte $55
!byte $C9
!byte $55
!byte $C9
!byte $55
!byte $CD
!byte $FF
!byte $89
!byte $C9
!byte $0A
!byte $C9
!byte $81
!byte $C9
!byte $03
!byte $C9
!byte $EA
!byte $CD
!byte $FF
!byte $8D
!byte $CD
!byte $FF
!byte $8D
!byte $C9
!byte $AB
!byte $CD
!byte $FF
!byte $86
!byte $C9
!byte $A0
!byte $C9
!byte $00
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
jmp linedone

picl31 ; 42 bytes to 31
; 55 55 55 55 00 03 F0 00 0F C0 00 00 00 A8 00 00 FC 15 55 55 55 
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $CD
!byte $55
!byte $82
!byte $C9
!byte $03
!byte $CD
!byte $F0
!byte $88
!byte $C9
!byte $0F
!byte $C9
!byte $C0
!byte $4E
!byte $00
!byte $8B
!byte $4E
!byte $A8
!byte $88
!byte $C9
!byte $FC
!byte $8E
!byte $15
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl32 ; 42 bytes to 29
; 55 55 55 55 55 54 3C 00 00 00 00 00 00 3F 00 01 55 55 55 55 55 
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $C9
!byte $54
!byte $C9
!byte $3C
!byte $4E
!byte $00
!byte $8B
!byte $4E
!byte $00
!byte $8B
!byte $EE
!byte $3F
!byte $8A
!byte $C9
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl33 ; 42 bytes to 30
; 55 55 55 55 55 55 55 54 00 00 00 00 00 00 55 55 55 55 55 55 55 
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $C9
!byte $54
!byte $4E
!byte $00
!byte $8B
!byte $4E
!byte $00
!byte $8B
!byte $C9
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl34 ; 42 bytes to 33
; 55 55 55 55 55 55 55 55 55 54 00 00 15 55 55 55 55 55 55 55 55 
!byte $A2
!byte $55
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $C9
!byte $54
!byte $CD
!byte $00
!byte $8B
!byte $C9
!byte $15
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
!byte $8E
!byte $55
!byte $02
jmp linedone

picl35 ; 42 bytes to 35
; 54 03 40 03 40 35 03 50 0D 00 C0 30 0D 0D 50 34 03 40 D0 0D 55 
!byte $AE
!byte $54
!byte $8B
!byte $A9
!byte $40
!byte $8D
!byte $03
!byte $02
!byte $8E
!byte $35
!byte $02
!byte $A2
!byte $50
!byte $A2
!byte $0D
!byte $C9
!byte $00
!byte $EA
!byte $C0
!byte $30
!byte $8E
!byte $0D
!byte $02
!byte $C9
!byte $50
!byte $C9
!byte $34
!byte $8D
!byte $03
!byte $02
!byte $8E
!byte $D0
!byte $02
!byte $C9
!byte $55
jmp linedone

picl36 ; 42 bytes to 38
; 55 0F 0C 30 C3 0C 30 C3 FC 3F D0 F0 C3 0D 43 0D 0F 0C 30 C3 55 
!byte $C9
!byte $55
!byte $C9
!byte $0F
!byte $C9
!byte $0C
!byte $C9
!byte $30
!byte $A2
!byte $C3
!byte $C9
!byte $0C
!byte $8E
!byte $30
!byte $02
!byte $C9
!byte $FC
!byte $C9
!byte $3F
!byte $C9
!byte $D0
!byte $8E
!byte $F0
!byte $02
!byte $C9
!byte $0D
!byte $C9
!byte $43
!byte $CD
!byte $0D
!byte $8F
!byte $C9
!byte $0C
!byte $8E
!byte $30
!byte $02
!byte $C9
!byte $55
jmp linedone

picl37 ; 42 bytes to 38
; 55 0D 0C 30 C3 0C 30 C3 54 35 50 D0 C3 0D 43 0D 0D 0C 30 C3 55 
!byte $C9
!byte $55
!byte $C9
!byte $0D
!byte $C9
!byte $0C
!byte $C9
!byte $30
!byte $A2
!byte $C3
!byte $C9
!byte $0C
!byte $8E
!byte $30
!byte $02
!byte $C9
!byte $54
!byte $C9
!byte $35
!byte $C9
!byte $50
!byte $8E
!byte $D0
!byte $02
!byte $A9
!byte $0D
!byte $C9
!byte $43
!byte $8D
!byte $0D
!byte $02
!byte $C9
!byte $0C
!byte $8E
!byte $30
!byte $02
!byte $C9
!byte $55
jmp linedone

picl38 ; 42 bytes to 38
; 55 0D 0C 30 C0 3C 30 D0 35 03 50 D0 0F 0D 40 0D 0D 0C 30 0F 55 
!byte $C9
!byte $55
!byte $C9
!byte $0D
!byte $C9
!byte $0C
!byte $C9
!byte $30
!byte $EA
!byte $C0
!byte $3C
!byte $C9
!byte $30
!byte $A2
!byte $D0
!byte $C9
!byte $35
!byte $C9
!byte $03
!byte $8E
!byte $50
!byte $02
!byte $A2
!byte $0F
!byte $A9
!byte $0D
!byte $C9
!byte $40
!byte $8D
!byte $0D
!byte $02
!byte $C9
!byte $0C
!byte $8E
!byte $30
!byte $94
!byte $C9
!byte $55
jmp linedone

picl39 ; 42 bytes to 38
; 55 0D 0C 30 C3 F4 30 D5 0D 50 D0 D0 C3 0D 43 0D 0D 0C 30 C3 55 
!byte $C9
!byte $55
!byte $C9
!byte $0D
!byte $C9
!byte $0C
!byte $A2
!byte $30
!byte $C9
!byte $C3
!byte $8E
!byte $F4
!byte $02
!byte $C9
!byte $D5
!byte $A9
!byte $0D
!byte $C9
!byte $50
!byte $C9
!byte $D0
!byte $C9
!byte $D0
!byte $8D
!byte $C3
!byte $02
!byte $C9
!byte $43
!byte $8D
!byte $0D
!byte $02
!byte $8E
!byte $0C
!byte $02
!byte $C9
!byte $C3
!byte $C9
!byte $55
jmp linedone

picl40 ; 42 bytes to 38
; 55 0D 0C 30 C3 54 30 D5 0D 50 D0 D0 C3 0D 43 0D 0D 0C 30 C3 55 
!byte $C9
!byte $55
!byte $C9
!byte $0D
!byte $C9
!byte $0C
!byte $A2
!byte $30
!byte $C9
!byte $C3
!byte $8E
!byte $54
!byte $02
!byte $C9
!byte $D5
!byte $A9
!byte $0D
!byte $C9
!byte $50
!byte $C9
!byte $D0
!byte $C9
!byte $D0
!byte $8D
!byte $C3
!byte $02
!byte $C9
!byte $43
!byte $8D
!byte $0D
!byte $02
!byte $8E
!byte $0C
!byte $02
!byte $C9
!byte $C3
!byte $C9
!byte $55
jmp linedone

picl41 ; 42 bytes to 36
; 54 03 0C 30 C3 55 03 C0 3C 03 C0 30 0F 00 C3 0D 0D 40 F0 C3 55 
!byte $CD
!byte $54
!byte $8B
!byte $C9
!byte $0C
!byte $C9
!byte $30
!byte $C9
!byte $C3
!byte $CD
!byte $55
!byte $8B
!byte $EA
!byte $C0
!byte $3C
!byte $C9
!byte $03
!byte $EA
!byte $C0
!byte $30
!byte $CD
!byte $0F
!byte $8A
!byte $A2
!byte $C3
!byte $C9
!byte $0D
!byte $C9
!byte $0D
!byte $C9
!byte $40
!byte $8E
!byte $F0
!byte $02
!byte $C9
!byte $55
jmp linedone

picl42 ; 42 bytes to 32
; 57 FF FF FF FF 55 FF 7F F7 FF 7F FF F5 FF FF FD FD 7F DF FF 55 
!byte $C9
!byte $57
!byte $CD
!byte $FF
!byte $8D
!byte $CD
!byte $FF
!byte $8D
!byte $4E
!byte $55
!byte $86
!byte $4E
!byte $F7
!byte $8F
!byte $C9
!byte $FF
!byte $C9
!byte $F5
!byte $CD
!byte $FF
!byte $8D
!byte $C9
!byte $FD
!byte $C9
!byte $FD
!byte $C9
!byte $7F
!byte $CD
!byte $DF
!byte $8C
!byte $C9
!byte $55
jmp linedone

picl43 ; 42 bytes to 27
; 00 00 00 00 00 01 00 00 00 01 00 00 00 0C 00 00 00 58 84 04 08 
!byte $4E
!byte $00
!byte $8B
!byte $EE
!byte $00
!byte $8B
!byte $C9
!byte $00
!byte $EE
!byte $00
!byte $8B
!byte $4E
!byte $00
!byte $8B
!byte $C9
!byte $0C
!byte $4E
!byte $00
!byte $8B
!byte $C9
!byte $58
!byte $C9
!byte $84
!byte $C9
!byte $04
!byte $C9
!byte $08
jmp linedone

; total save: 355 bytes

restofdesign:

	lda #7*4+128
	sta $f0

	lda #0
	sta $fd
.ml79	jsr mainloop_with_countdown
	ldx $fd
	lda #<picl0
	sta lineptrs,x
	lda #>picl0
	sta lineptrs+1,x
	inc $fd
	inc $fd
	bne .ml79

.poh	jsr mainloop ;_with_countdown
	lda $fd
	lsr
	lsr
	lsr
	lsr
	lsr
;	bpl .pihh
	sta $900e
;.pihh	ldx $f0
;	cpx #7*4
;	bne .poh
	dec $fd
	bne .poh

	lda #12
	sta $9000
	jmp loader_loop
