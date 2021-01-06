;#BLK
;
;!source "../loader/loader_glob.inc"
;*=loader_loop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;	mem layout:
;	lyrics+...	lyricbuf til align30 - abt 30 bytes
;	songdata	256 bytes reserved
;	$1400- asserted free

;	AS SOON THERE WILL BE NO HUMANS NO MORE
;	- ei edes mahdu siihen 30 tavuun. enemmän puskuria HEY.
;	puskuria pitää olla riittävästi kahden latauserän lyriikoille.

#BLK $1000

!sl "player_glob.inc"
!source "../glob.inc"
!source "../loader/loader_glob.inc"
!source "../lib/player.asm"

#BLK
!sl "voice_glob.inc"
!source "player_glob.inc"
*=$1200
!source "voice.asm"

;;;;;;;;;;;;;;;;;;;; song data (to be optimized) ;;;;;;;;;;;;;;;;;;;;;;

#BLK
!source "player_glob.inc"
!sl "musicpatb0.inc"
*=songdata

	muteseq:
	drummuteseq:
	!byte nMUTE
	!byte <(muteseq-*)

	bass0seq:
	!byte nC1+nDBL,nC1+nDBL,nC2,nC1,nC2,nC1
	!byte <(bass0seq-*)

;	cobass0seq:
;	!byte nC1+nDBL,nC2,nC1+nDBL,nMUTE,nC2,nMUTE
;	!byte nC1,nMUTE,nC1,nMUTE,nC1+nDBL,nC2,nC1
;	!byte <(cobass0seq-*)

	cobass0seq:
;	!byte nC1,nMUTE,nC2,nC1

	!byte nC1+nDBL,nC2,nC1+nDBL,nMUTE,nC2,nMUTE
	!byte nC1,nMUTE,nC1,nMUTE,nC1+nDBL,nC2,nC1
	!byte <(cobass0seq-*)


	shape2seq:
	!byte nDp1+10,nCp1+10,nFp0+10,nCp1+10
	!byte <(shape2seq-*)

	melo2seq:	; 31
	!byte nC1,nC1+nDBL,nDp1,nG1,nMUTE,nC1,nMUTE
	!byte nG1,nG1,nF1,nG1,nMUTE+nDBL,nMUTE+nDBL
	!byte nC1,nMUTE,nC2,nAp1,nF1,nC2,nAp1,nF1
	!byte nG1,nG1,nF1,nG1,nMUTE,nF1,nE1,nC1
	!byte <(melo2seq-*)

	song2seq:
	!byte nC1,nC1,nG1,nC1
	!byte nG1,nG1,nG1,nG1
	!byte nC1,nAp1,nF1,nF1

	;;;

	song3seq:
	!byte nC1,nC1,nDp1,nF1
	!byte nC1,nC1,nAp0,nAp0
	!byte nC1,nC1,nB0,nC1
	!byte nC1,nAp0,nGp0,nC1
	!byte <(song3seq-*)

	shape3seq:
	!byte nDp1+10,nAp1+10,nFp1+10,nF1+10
	!byte nDp1+10,nAp1+10,nGp1+10,nAp1+10  ; <- tuo on its.as.hyvä lisä
	!byte <(shape3seq-*)

!if (0) {
	song4seq:
	!byte nC1,nC1,nDp1,nC1
	!byte nC1,nC1,nDp1,nDp1
	!byte nC1,nC1,nE1,nF1
	!byte nC1,nC1,nC1,nC1
	!byte <(song4seq-*)

;	!byte nC1,nC1,nD1,nE1
;	!byte nF1,nC1,nAp0,nC1
;	!byte nC1,nC1,nG1,nG1
;	!byte nF1,nC1,nAp0,nC1
;	!byte <(song4seq-*)

	shape4seq:
	!byte nDp1+10+7,nD1+10+7,nAp0+10+7,nC1+10+7
	!byte <(shape4seq-*)
}
	;;;

	drum1seq:
	!byte nDR1,nDR0,nDR1,nDR0
	!byte nDR1,nDR0,nDR1,nDR2
	!byte <(drum1seq-*)

	;;;
!if (0) {
	melo2biseq:	; 24
	!byte nC1,nNONE,nC1+nDBL,nD1,nNONE,nE1,nNONE	; ok
	!byte nF1,nC1,nAp0,nC1,nMUTE+nDBL,nMUTE+nDBL
	!byte nC1,nNONE,nC1+nDBL,nG1,nNONE,nG1,nNONE
	!byte nF1,nC1,nAp0,nC1,nMUTE+nDBL,nMUTE+nDBL
	!byte <(melo2biseq-*)

	shape2biseq:
	!byte nDp1+10,nD1+10,nAp0+10,nC1+10
	!byte <(shape2biseq-*)
}
	;;;

;;;;;;;;;;;;;;;;;;;;;;;;; mainloop ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLK $1500

!source "player_glob.inc"
!source "voice_glob.inc"
!source "../loader/loader_glob.inc"
!source "../glob.inc"
!sl "main_glob.inc"

voiceplayer_singtest:

	dec 200
	bne .rts

	lda #16*12
	sta 200

	;;; after status changes noted

	lda chxtras+4
	and #3
	inc chxtras+4

	tax
	lda chxtras,x
	beq .rts

	pha
	jsr sing_on
	pla

	tax
	ldy lyrics-1,x
	;jmp charview

	!source "charview.asm"

voiceplayer
	jsr voiceplayer_singtest
	jsr player
	jsr digi_ticksync
	jsr testquit
	jsr loader_irq
.rts1	rts

!zone testquit
testquit:
	lda #32
	bit $9111
	bne .o0

;	jsr loader_on
;
;	lda #0
;	tax
;.l0	sta $a400,x
;	.xx=*-2
;	dex
;	bne .l0
;	inc .xx+1
;	bne .l0
	jmp 64802

.o0	rts


main_end:

;;;;;;;;;;;;;;;;; charset for segments & lyrics ;;;;;;;;;;;;;;;;;;;;;;

#BLK $1800
!source "chars.inc"
!source "popstar.chr.inc"
!source "animchars.inc"

; 32 vapaata tavua tässä välissä. mahtuu vain neljä merkkiä :(((
; $1c00:n alkuun ei voi ladata (zoomeri käyttää)
; tietysti jos hidastat animaatiopäivitystä niin tarttee vähemmän merkkejä

; kavenna animaatioita pystysuunnassa (1. ja viimeinen rivi pois) niin
; saat 44 tavua?

;;;

!source "voice_glob.inc"
!sl "mouthstuff.inc"

!zone updatemouth
updatemouth:
  ldy #0
  mouthstat=*-1
  beq .c1
  cpy #7
  beq .c3

  lda d_bitfetch
  bne .c1

.c3   lda #0
      sta $1800+$25*8,y
      lda #$ff
      sta $1800+$28*8,y
      dey
      bpl .c2

.c1
      lda $1800+$25*8,y
      iny
      sec
      rol
      sta $1800+$25*8,y
      lda #0
      sta $1800+$28*8,y
.c2
   sty mouthstat
.c0
   rts

mouthstuff_end:

;     ANIMAATIOPARTIN MERKKIEN PITÄÄ MYÖS MAHTUA TÄHÄN.
;     paljonko tilaa ennen $9000:ta? pitäisi saada joku 64+ tavua

; ja perään mahtuu hieman myös soodia

;;;;;;;;;;;;;;;;;;;;;;;;;;; segmenter ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLK $1700
!source "../glob.inc"
!source "segmenter.asm"
!sl "segmenter_glob.inc"

;	alussa on muistissa kolme kuvaa (nykyinen ja kaksi morffauskohdetta)
;	ensimmäisen morffauksen jälkeen laturi lataamaan uutta.
;	morffauskohteeksi npic2 (1a00,1a40,1a80
;	; npic2: 1a00 1a40 1a80
;	; 1900..xxxx varataan sitten 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; zoomer ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLK
!source "main_glob.inc"
!source "segmenter_glob.inc"
!sl "zoomer_glob.inc"
!source "../glob.inc"
*=main_end
!source "zoomer.asm"

	nrasc=$1ac0
	; pic_s may overflow here

; upt to abt $16bd

!zone zoomerpart
zoomerpart:

.l00b	ldy #16*6
.l0	jsr zoomerframe
	jsr zoomerframe
	tya
	and #31
	tax
	lda #$10
	sta pic_c,x
	sta pic_c+32,x
	lda 205
	bne .l0z
	    lda nrasc,x	
	    sta rasc,x	;CHANGE
.l0z	dey
	bne .l0
	dec 205
	bpl .l00b

	;jsr loader_on

	; PISTÄ MORFFIT KOHDALLEEN MYÖHEMMIN

	;;;;;;;;;;;;;;;;;;;;;;


.l2bb2	ldy #32*3
	sty 203

.l2	jsr zoomerframe
	ldx #127
	lda 203
	lsr
	bcc .l2zo
	ldx #63
.l2zo	jsr morph

	lda 203
	asl
	asl
	and #60
	tay
	ldx #4

.plap	lda npic_c,y
	nptr0=*-2
	sta pic_c,y
	iny
	dex
	bne .plap

	dec 203
	bne .l2

	lda nptr0
	eor #((<npic_c) XOR (<npic2_c))
	sta nptr0
	lda nptr0+1
	eor #((>npic_c) XOR (>npic2_c))
	sta nptr0+1
	lda nptr1+1
	eor #((>npic_w) XOR (>npic2_w))
	sta nptr1+1

	dec 202
	bne .l2bb2

	ldx #$3f
	lda #0
.l00z	sta $9600,x
	dex
	bpl .l00z

	lda #22+128
	sta $9002
	lda #10
	sta $9000
	lda #8
	sta $900f

.wt	lda $9004
	bne .wt

	jsr voiceplayer

	lda chxtras
	beq .wt

;	jsr loader_on
	jmp nrasc

	; tähän asti on pakko mahtua - sen jälkeen jumpataan nrasc-alueelle

	;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;

!zone morph
morph:
	ldy #64

.l0	lda npic_w,x
	nptr1=*-2
	cmp pic_w,x
	beq .nx
	bmi .zu
	    inc pic_w,x  ; inc until $ff
	    bne .nx
.zu	dec pic_w,x
.nx	dex
	dey
	bne .l0
	rts

;!byte 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0

!zone zoomerframe
;zoomerframeplip:
;.l3	jsr zoomerframe
;	jsr zoomerframe
;	tya
;	and #63
;	tax
;	rts

!zone pillu
zoomerframe:
	sty 0

.l0	jsr loader_irq
	jsr player
	jsr testquit
	;jsr loader_irq

zoomerframe_mid:
.zu0	lda $9004
	beq .zu0
.zu1	lda $9004
	bne .zu1
	jsr zoomer
;	rts

	jsr segmenter

	inc 44
	incer=*-2
	lda 44
	bne .c2		; 3,2,1,0->inc->1,2,3,...,46,47->dec->46,..
	    ldx #$e6
	    stx incer
.c2	cmp #48;16
	bne .c1
	    ldx #$c6
	    stx incer
.c1	;cmp #16
	;bpl .c3
	;    lda #16
.c3	sta hzoom
	eor #63
	sta vzoom

	inc raszdelta0
	inc raszdelta1

	ldy 0
	rts

; c6 = dec zpage,e6 = inc zpage

zoomerpart_end:

	; zoomerpart_end = 16d6. puske 16c0:aan

;;;;;;;;;;;;;;;;;;;;;;;;;; zoomer data ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;#BLKV
;!source "zoomer_glob.inc"
;*=pic_c
;
;	!fill 64,$10
;	; voi myös fillailla koodilla niin tulee KIVA JUTZKA




#BLK
!source "zoomer_glob.inc"
*=segclkup

; MEM AREAS

; 1a00-1abf  pic (zoomer)
; 1ac0-1aff  nrasc	

; 1b00-1b5f  exptab
; 1b60-1bdf  segclkup

; 1c00-1c3f  scrmem0
; 1c40-1cff  npic
; 1d00-1d40  NEW rasc	SOTKEUTUU SEURAAVAA LADATTAESSA - EI KIVA
; 1d40-1dff  npic2

; rasc<->nrasc? ei onnistu. 

; 1bc0-1bff on vielä vapaa

; 128 bytes (1b40-1bbf)
!byte $12,$12,$13,$13,$13,$14,$14,$14,$14,$15,$15,$15,$16,$16,$16,$17
!byte $17,$17,$18,$18,$19,$19,$19,$1a,$1a,$1b,$1b,$1c,$1c,$1d,$1e,$1e
!byte $1f,$1f,$00,$01,$02,$02,$03,$04,$05,$06,$07,$08,$09,$0a,$0c,$0d
!byte $0e,$10,$12,$13,$15,$17,$19,$1c,$1e,$01,$04,$07,$0b,$0e,$13,$18
!byte $1d,$18,$13,$0e,$0b,$07,$04,$01,$1e,$1c,$19,$17,$15,$13,$12,$10
!byte $0e,$0d,$0c,$0a,$09,$08,$07,$06,$05,$04,$03,$02,$02,$01,$00,$1f
!byte $1f,$1e,$1e,$1d,$1c,$1c,$1b,$1b,$1a,$1a,$19,$19,$19,$18,$18,$17
!byte $17,$17,$16,$16,$16,$15,$15,$15,$14,$14,$14,$14,$13,$13,$13,$12

#BLK
!source "zoomer_glob.inc"
*=nrasc
; 64 bytes (1ac0-1aff)
; rasc: 1bc0-1bff

	!byte 0,6,6,4
	!byte 6,6,6,6
	!byte 0,0,6,6
	!byte 0,0,0,0

	!byte 2,2,0,0
	!byte 2,2,2,2
	!byte 2,2,0,0
	!byte 0,0,0,0

#BLK
!source "zoomer_glob.inc"
*=$1c40 ; npic_c

!byte $e0, $60, $e0, $e0, $30, $30, $b0, $b0
!byte $10, $b0, $b0, $10, $10, $b0, $b0, $b0
!byte $30, $30, $30, $b0, $30, $b0, $b0, $b0
!byte $b0, $b0, $b0, $b0, $b0, $b0, $b0, $b0
!byte $b0, $b0, $b0, $b0, $b0, $b0, $b0, $b0
!byte $b0, $b0, $b0, $10, $b0, $b0, $10, $10
!byte $b0, $30, $30, $b0, $b0, $10, $b0, $30
!byte $30, $b0, $b0, $b0, $30, $30, $60, $00

#BLK
!source "zoomer_glob.inc"
*=$1c80 ;npic_w

!byte   0,   0,   0,   6,   9,  13,  17,  18
!byte  17,  18,  18,  19,  20,  21,  21,  23
!byte  24,  19,  20,  26,  26,  36,  27,  37
!byte  37,  37,  38,  39,  40,  40,  41,  41

!byte  40,  40,  39,  38,  37,  36,  35,  34
!byte  34,  35,  36,  37,  38,  38,  38,  38
!byte  38,  37,  37,  37,  36,  35,  34,  34
!byte  33,  32,  30,  28,  25,  21,  16,   0

#BLK
!source "zoomer_glob.inc"
*=$1cc0 ; npic_s

!byte   0,   0,   0,   0,   0,   0,   0,   0
!byte   0,   0,   2,   2,   4,   6,   7,  10
!byte  13,  21,  26,  27,  28,  29,  29,  29
!byte  29,  29,  30,  30,  30,  30,  30,  30

!byte  30,  30,  30,  30,  30,  30,  29,  29
!byte  29,  29,  29,  29,  28,  28,  27,  27
!byte  26,  26,  26,  25,  24,  23,  23,  22
!byte  21,  20,  18,  16,  13,   9,   0,   0

#BLK
!source "zoomer_glob.inc"
*=$1d40 ; npic2_c

!byte   0,   0,   0, $f0, $10, $f0, $f0, $f0
!byte $70, $f0, $f0, $f0, $f0, $70, $00, $20
!byte $a0, $a0, $a0, $a0, $a0, $a0, $a0, $20
!byte $70, $f0, $10, $70, $70, $70, $70, $70

!byte $70, $80, $70, $f0, $10, $10, $10, $10
!byte $10, $10, $10, $f0, $90, $70, $f0, $f0
!byte $f0, $f0, $f0, $f0, $f0, $70, $90, $70
!byte $f0, $f0, $f0, $f0, $f0, $f0, $70,   0

#BLK
!source "zoomer_glob.inc"	; ongelmaton, mennään vain 38:aan asti
*=$1d80 ; npic2_w

!byte   0,   0,   0,  20,  22,  23,  22,  20
!byte  18,  13,  16,  18,  16,  13,  10,  25
!byte  25,  25,  25,  25,  25,  25,  25,  25
!byte  32,  33,  33,  34,  34,  35,  35,  36

!byte  36,  37,  32,  32,  33,  32,  32,  33
!byte  34,  36,  38,  38,  37,  36,  35,  35
!byte  35,  26,  23,  20,  17,  29,  29,  29
!byte  28,  28,  27,  27,  26,  26,  25,   0

#BLK
!source "zoomer_glob.inc"
*=$1dc0 ; npic2_s

!byte   0,   0,   0,  14,  16,  17,  16,  14
!byte  13,  10,  12,  13,  12,  10,   9,   9
!byte   9,   9,   9,   9,   9,   9,   9,   9
!byte  20,  21,  22,  23,  23,  24,  25,  26

!byte  26,  27,  28,  29,  29,  26,  25,  25
!byte  25,  26,  29,  29,  26,  25,  24,  23
!byte  23,  22,  21,  20,  19,  18,  17,  16
!byte  14,  13,  12,  10,   9,   7,   6,   0

#BLKV
!source "zoomer_glob.inc"
*=pic_w  ; 1a40-1a7f	; 6720..6783	ok

Q=10
      !byte  0,   0,    0,    9+Q, 13+Q, 16+Q, 18+Q, 20+Q, 21+Q, 22+Q, 23+Q
      !byte 23+Q, 24+Q, 25+Q, 26+Q, 26+Q, 26+Q, 27+Q, 27+Q
      !byte 28+Q, 28+Q, 29+Q, 29+Q, 29+Q, 29+Q, 29+Q, 29+Q
      !byte 30+Q, 30+Q, 30+Q, 30+Q, 30+Q, 30+Q, 30+Q, 30+Q, 30+Q
      !byte 30+Q, 30+Q, 30+Q, 29+Q, 29+Q, 29+Q, 29+Q, 29+Q
      !byte 29+Q, 28+Q, 28+Q, 27+Q, 27+Q, 26+Q, 26+Q, 26+Q
      !byte 25+Q, 24+Q, 23+Q, 23+Q, 22+Q, 21+Q, 20+Q, 18+Q
      !byte 16+Q, 13+Q, 9+Q,  0

    ; 0, 0, 0, 0, 0

#BLKV
!source "zoomer_glob.inc"
*=pic_s  ; 1a80-1abf	; 6784..6847	ok

Q=6 ; was 6

      !byte  0,   0,    0,    9-Q, 13-Q, 16-Q, 18-Q, 20-Q, 21-Q, 22-Q, 23-Q
      !byte 23-Q, 24-Q, 25-Q, 26-Q, 26-Q, 26-Q, 27-Q, 27-Q
      !byte 28-Q, 28-Q, 29-Q, 29-Q, 29-Q, 29-Q, 29-Q, 29-Q
      !byte 30-Q, 30-Q, 30-Q, 30-Q, 30-Q, 30-Q, 30-Q, 30-Q, 30-Q
      !byte 30-Q, 30-Q, 30-Q, 29-Q, 29-Q, 29-Q, 29-Q, 29-Q
      !byte 29-Q, 28-Q, 28-Q, 27-Q, 27-Q, 26-Q, 26-Q, 26-Q
      !byte 25-Q, 24-Q, 23-Q, 23-Q, 22-Q, 21-Q, 20-Q, 18-Q
      !byte 16-Q, 13-Q, 9-Q,  0

; ,1,1,1

#BLK
!source "zoomer_glob.inc"
*=exptab   ; $1b00 -	; muistissa ok  (6912..7007)

; 6x16==96 bytes
!byte   4,  4,  4,  4,  4,  4,  5,  5,  5,  5,  6,  6,  6,  7,  7,  7
!byte   8,  8,  8,  9,  9,  9, 10, 10, 11, 11, 12, 12, 13, 14, 14, 15
!byte  16, 16, 17, 18, 19, 19, 20, 21, 22, 23, 24, 25, 26, 28, 29, 30
!byte  32, 33, 34, 36, 38, 39, 41, 43, 45, 47, 49, 51, 53, 56, 58, 61
!byte  64, 66, 69, 72, 76, 79, 82, 86, 90, 94, 98,103,107,112,117,122
!byte 128,133,139,145,152,158,165,173,181,189,197,206,215,224,234,245

#BLKV ($1e00+22*4)
!source "popstar.scr.inc"

#BLKV $9600
!fill 22*4,0
!source "popstar.col.inc"

;;;;;;;;;;;;;;;;;;; vocals for vocal part 0 ;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLK
!source "voice_glob.inc"
!source "texts_glob.inc"
!sl "texts0.inc"
*=texts

texts_liberation:
	!byte 3+22,nCHr,nCHo,nCHb,nCHo,nCHt,nCHi,nCHc,1
	!byte nCHl,nCHi,nCHb,nCHe,nCHr,nCHa,nCHt,nCHi,nCHo,nCHn,127
texts_a0:
	!byte 5,nCHa,nCHl,nCHl,1
	!byte nCHm,nCHe,nCHc,nCHh,nCHa,nCHn,nCHi,nCHc,nCHa,nCHl,14+22
	!byte nCHc,nCHr,nCHe,nCHa,nCHt,nCHu,nCHr,nCHe,nCHs,127
texts_a1:
	!byte 4+22,nCHu,nCHn,nCHd,nCHe,nCHr,1
	!byte nCHh,nCHu,nCHm,nCHi,nCHl,nCHi,nCHa,nCHt,nCHi,nCHo,nCHn,127
texts_a2:
	!byte 4,nCHc,nCHo,nCHm,nCHb,nCHi,nCHn,nCHe,1
	!byte nCHt,nCHo,nCHg,nCHe,nCHt,nCHh,nCHe,nCHr,11+22
	!byte nCHa,nCHn,nCHd,1
	!byte nCHf,nCHi,nCHg,nCHh,nCHt,1
	!byte nCHf,nCHo,nCHr,127
texts_c0
	!byte 6,nCHw,nCHi,nCHp,nCHe,1,nCHo,nCHu,nCHt
	!byte 11+22,nCHt,nCHh,nCHe,1
	!byte nCHs,nCHo,nCHu,nCHr,nCHc,nCHe,1
	!byte nCHo,nCHf,1
	!byte nCHe,nCHv,nCHi,nCHl,127

texts_c1
	!byte 3+22,nCHd,nCHe,nCHs,nCHt,nCHr,nCHo,nCHy,1
	!byte nCHa,nCHl,nCHl,1
	!byte nCHh,nCHu,nCHm,nCHa,nCHn,nCHs,127

texts_c2
	!byte 5,nCHn,nCHe,nCHw
	!byte 1,nCHs,nCHt,nCHe,nCHp
	!byte 1,nCHi,nCHn
	!byte 12+22,nCHe,nCHv,nCHo,nCHl,nCHu,nCHt,nCHi,nCHo,nCHn,127

#BLK
!source "texts0.inc"
!sl "lyrics0.inc"
*=lyrics+1
lyrics_liberation
	; robotic | liberation
	!byte texts_liberation-texts
	!byte $4a,$00,$29,$1b,$00,$69,$2d,$01,$09,$2c,$09
	!byte $07,$01,$29,$1b,$03,$4a,$03,$03,$01,$41,$44,$00,$00,$00,$02,$02
	!byte $0f
lyrics_a0
	; all | mechanical | creatures
	!byte texts_a0-texts
	!byte $00,$00,$07,$09
	!byte $38,$03,$03,$29,$2c,$0a,$0a,$42,$01,$01,$19,$1c,$0a,$07,$09
	!byte $1c,$40,$01,$01,$39,$2e,$00,$0a,$2e
	!byte $7f

lyrics_a1
	; under | humiliation
	!byte texts_a1-texts
	!byte $0a,$02,$19,$1d,$00,$0a,$09
	!byte $24,$41,$06,$48,$01,$07,$01,$01,$03,$03,$01,$44,$00,$00,$02,$02
	!byte $0f

lyrics_a2
	; combine | together | and | fight | for
	!byte texts_a2-texts
	!byte $1c,$00,$08,$19,$1b,$0a,$01,$02,$29
	!byte $1d,$06,$19,$1c,$03,$03,$1d,$00,$0a,$49
	!byte $03,$02,$29
	!byte $25,$0a,$61,$29,$1d,$09,$09
	!byte $25,$00,$0a,$09
	!byte $0f
lyrics_c0
	; wipe | out the | source | of evil
	!byte texts_c0-texts
	!byte $26,$0a,$01,$29,$2b,$39 ; was $46,...
	!byte $0a,$06,$39,$1d,$0a,$49
	!byte $1e,$00,$00,$00,$1e,$09
	!byte $00,$36,$09
	!byte $01,$01,$01,$46,$00,$07,$07
	!byte $0f
lyrics_c1
	; destroy | all | humans
	!byte texts_c1-texts
	!byte $1d,$01,$1c,$89,$2d,$3a,$00,$01,$01,$09
	!byte $00,$07,$09
	!byte $44,$41,$06,$08,$0a,$0a,$0a,$02,$1e
	!byte $0f
lyrics_c2
	; new step in evolution
	!byte texts_c2-texts
	!byte $42,$01,$06
	!byte $2e,$29,$1d,$03,$39,$2b,$09
	!byte $01,$02,$09
	!byte $03,$46,$00,$00,$27,$06,$06,$06,$1e,$00,$00,$02
	!byte $0f

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;; pre-tilulilu ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLKV
!source "musicpatb0.inc"
*=chctr
	!byte 3,3,2,1,1,1
	!byte 12,6,6,12,24,6*16
	!byte bass0seq-songdata
	!byte cobass0seq-songdata ; melo1seq-songdata ; cobass0seq-songdata
	!byte muteseq-songdata ; muteseq-songdata ; melo1seq-songdata
	!byte drum1seq-songdata ; drum1seq-songdata
	!byte muteseq-songdata
	!byte shape2seq-songdata
	!byte $81,$94,$aa
	!byte 0,0,0,0

;;;;;;;;;;;;;;;;;;;;;;; tilulilu ready ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLKV
!source "musicpatb0.inc"
*=trackcmd
	!byte 1 ; setptrs
#BLK
!source "musicpatb0.inc"
*=trackcmd+1
	!byte 3,3,2,1,1,1
	!byte 12,6,6,12,24,6*16
	!byte bass0seq-songdata
	!byte cobass0seq-songdata ; melo1seq-songdata ; cobass0seq-songdata
	!byte melo2seq-songdata ; melo1seq-songdata
	!byte drum1seq-songdata
	!byte muteseq-songdata
	!byte shape2seq-songdata
	!byte $81,$94,$aa ; 80,$83
	!byte 0,0,0,0

;	tämä tilutransitio toimii. tosin se on ladattu muistiin jo ennen
;	pasketta.

;;;;;;;;;;;;;;;;;;;;;;; start & wait ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLK $0200
	; kludgeous
	!source "zoomer_glob.inc"
	!sl     "part2initstuff.inc"

	lda #$fe
	sta $9005

	lda #46
	sta $9003

;	lda #$67
;	sta $900e

	lda #38
	sta $9001
	lda #9
	sta 44

	lda #0
	sta lyricsptr

	lda #2
	sta loader_on_bpf

	ldx #$3f
.l1	;lda #15
	;sta scrmem0,x
	;sta scrmem1,x
	lda #4
	sta $9400,x
	sta $9600,x
	lda #0
	sta pic_c,x

	cpx #32
	bpl .c1
	sta rasc,x

.c1	dex
	bpl .l1

	lda #1
	sta 205

	ldy #7
	sty 202

	jsr loader_off
	sei
	jmp zoomerpart

part2init_end:

	;;; TEMP!!!

!if (0) {
.zuuz	lda $9004
	beq .zuuz
.zuux	lda $9004
	bne .zuux
	jsr loader_irq
	jsr player
	lda chxtras
	beq .zuuz
	jmp nrasc
}

#BLK $0200

;#BLK
;	!source "../loader/loader_glob.inc"
;	*=loader_off
;	loader_off done in $0200code
;	nyt sellaisessa tilassa ettei tämän jälkeen lataa enää mitään,
;	esim. tätä:

;	#BLK 64802  - eiku saahan se sen ladattua. kyse siis tuosta jutusta
;	joka ladataan nrasc:in päälle tilulilun ja morffailun alettua

;;; next tiluphase

;#BLK $0100
;	!source "main_glob.inc"
;
;	inc $900f
;	jsr testquit
;	jmp $0100
;
;#BLK $0100

#BLKV
!source "musicpatb0.inc"
*=trackcmd
	!byte 1 ; setptrs

#BLK
	!source "../loader/loader_glob.inc"
	*=loader_off

;;;;;;;;;;;;;;;;;;;; load loop for part 0c ;;;;;;;;;;;;;;;;;;;;;;;

#BLK
	!source "zoomer_glob.inc"
	!source "main_glob.inc"
	!source "mouthstuff.inc"
	!source "lyrics0.inc"
        !sl     "popstarstuff.inc"
	*=nrasc

	; jää odottamaan sitä tarkkaa hetkeä jolla chxtras+0 != 0.
	; tee tämä odotus jo edellä ennen nrasc-hyppyä?

	lda #1		; EI TARTTISI EDES SYNKATA MIHINKÄÄN TUOSSA.
	sta 200		; -> nolla nollaksi ja loaderi hoitaa jutun sitten
	jsr voiceplayer_singtest
	inc 200

	lda #5		;!!!
			;8:lla ehtisi ladata, mutta ei seuraavassa partissa
	sta loader_bpf
;	sta 210

	; ^^ näitä ei voi siirtää edelliseenkään - zoomerpart vie koko tilan

.hohoxx	;  jsr voiceplayer

.hoho	lda $9004
	bmi .hoho
.hohi	lda $9004
	bpl .hohi

	lda #22+128
	sta $9002
	lda #10
	sta $9000
	lda #8
	sta $900f

;	dec 210			; DELAY IS NO OPTION
;	bne .joox
;
;	    inc 210
;	    lda #5
;	    sta loader_bpf
;	.joox

	lda chxtras
	cmp #lyrics_c0-lyrics+1
	bne .piiz

	  lda #6
	  sta 206

	  ; mahtuisiko initti tähän? EI MAHDU

	  jmp zoomerpart ; now animpart

.piiz	jsr updatemouth

.hohu	jsr voiceplayer;_singtest

	lda lyricsptr
	bne .hohoxx ; jmp .hohoxx ;bne .hohoxx

	jsr zoomerframe_mid
	jmp .hohu

; menee itseasiassa jo EXPTABIN PÄÄLLE tässä (onneksi ei artifaktia)
popstarstuff_end:

	; ja tähän sitten kaksoisefektipauke (singeffect vs realeffect)

;;;;;;;;;;;;;;;;;;;; vocal part 0a start ;;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLKV
!source "musicpatb0.inc"
*=trackcmd
	!byte 1 ; setptrs
#BLK
!source "musicpatb0.inc"
!source "lyrics0.inc"
*=trackcmd+1
	!byte 3,3,2,1,1,1
	!byte 12,6,6,12,24,6*16
	!byte bass0seq-songdata
	!byte cobass0seq-songdata ; melo1seq-songdata ; cobass0seq-songdata
	!byte song3seq-songdata ; melo1seq-songdata
	!byte drum1seq-songdata
	!byte song3seq-songdata
	!byte shape3seq-songdata
	!byte $81,$94,$aa ; 80,$83
	!byte lyrics_a0-lyrics+1
	!byte lyrics_a1-lyrics+1
	!byte lyrics_a2-lyrics+1
	!byte lyrics_liberation-lyrics+1
#BLKV
!source "musicpatb0.inc"
*=chxtras+5-32
	!byte 0 ; setptrs
#BLK
	!source "../loader/loader_glob.inc"
	*=loader_off

; nyt saatiin lataamaan tänne asti :)

;;;;;;;;;;;;;; stuff for part 0c: animation ;;;;;;;;;;;;;;;;;;;;;;;;

#BLK ($1c00+22*4)
; 3 mechframes, 4 killframes, flag

!byte $ff,$87,$87,$87,$87,$07,$87,$e7,$fb,$fb,$fb,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
!byte $bf,$87,$87,$87,$87,$07,$07,$e7,$f0,$f0,$f8,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
!byte $bf,$87,$85,$86,$87,$07,$07,$67,$70,$70,$70,$7f,$7f,$ff,$ff,$ff,$bf,$ff,$fd,$fb,$ff,$7f
!byte $bf,$87,$83,$87,$87,$00,$00,$40,$60,$70,$f0,$f0,$78,$7b,$7f,$7f,$af,$97,$fd,$fb,$ff,$7f
!byte $bb,$82,$83,$87,$82,$00,$08,$48,$68,$68,$78,$f8,$b8,$78,$3c,$0f,$0e,$5d,$f8,$f9,$fb,$79
!byte $ad,$8f,$07,$8f,$8b,$08,$0b,$08,$48,$e8,$68,$78,$8c,$08,$0c,$4f,$d3,$f1,$f0,$fe,$3b,$7f
!byte $be,$8f,$8f,$0f,$8b,$0c,$87,$60,$48,$c8,$60,$60,$f7,$73,$4c,$47,$7f,$e3,$af,$f8,$69,$fe
!byte $3f,$0f,$0f,$0f,$0b,$0c,$0f,$08,$48,$c8,$c8,$78,$6f,$7b,$7c,$7f,$7f,$7f,$ff,$ff,$bf,$7f
!byte $3f,$17,$17,$9f,$9b,$1c,$1f,$18,$18,$5f,$d8,$d8,$5f,$7b,$7c,$7b,$ff,$ff,$ff,$d7,$cf,$7f
!byte $bf,$96,$17,$8f,$8b,$1f,$1f,$18,$18,$5f,$50,$40,$4e,$3f,$3c,$7f,$7f,$7f,$fd,$fd,$ff,$bf
!byte $3f,$97,$1f,$0f,$8f,$1f,$9f,$88,$18,$1f,$70,$c0,$ce,$5f,$1f,$5f,$f7,$e7,$ea,$5f,$5f,$3f
!byte $3f,$37,$bd,$ab,$bf,$1f,$1b,$b8,$b8,$bf,$b0,$88,$be,$ff,$df,$df,$f7,$e7,$ef,$5f,$5f,$ff
!byte $bf,$37,$a7,$af,$9f,$1b,$3a,$b8,$b8,$bf,$b0,$80,$8a,$fe,$ff,$ff,$f7,$ef,$ff,$df,$ff,$ff
!byte $bd,$b7,$a7,$af,$9f,$1b,$38,$b8,$b8,$bf,$b0,$c0,$c8,$fe,$ff,$ff,$f7,$e7,$ef,$df,$5f,$ff
!byte $bf,$b7,$a7,$af,$9b,$0a,$18,$b8,$b8,$87,$88,$70,$40,$4a,$fe,$f7,$67,$65,$6f,$df,$ff,$ff
!byte $b7,$bf,$af,$a7,$1f,$3c,$1c,$bc,$bc,$87,$b9,$39,$b1,$f1,$cf,$f7,$67,$e5,$cf,$cf,$9f,$bf
!byte $f3,$eb,$eb,$e7,$0e,$7c,$1c,$9c,$fc,$f7,$f9,$79,$79,$39,$bb,$f7,$6f,$7e,$57,$ef,$ef,$5f
!byte $e5,$f7,$ff,$f7,$0f,$7f,$7f,$ff,$fb,$f7,$f7,$7f,$7f,$3f,$bf,$f7,$67,$5e,$77,$f7,$ff,$ff
!byte $fd,$fd,$ff,$f7,$07,$0f,$7f,$ff,$ff,$ff,$ff,$ff,$7f,$ff,$ff,$fe,$ff,$7f,$df,$db,$ff,$ff

#BLK ($9400+22*4)
; 4 stepframes

!byte $00,$00,$00,$00,$00,$00,$01,$01,$03,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0e,$0e,$0d,$00,$00,$00
!byte $00,$00,$00,$00,$02,$01,$01,$03,$0f,$0f,$0f,$0f,$0f,$03,$03,$03,$0f,$0e,$0e,$0c,$00,$00
!byte $00,$00,$02,$00,$01,$01,$03,$0f,$0f,$0f,$07,$0d,$0d,$01,$0f,$03,$0f,$0f,$06,$0e,$0c,$07
!byte $00,$00,$00,$01,$01,$03,$0f,$0f,$0f,$0f,$06,$0c,$0c,$03,$03,$03,$0f,$0f,$07,$0e,$0f,$0c
!byte $00,$00,$00,$01,$01,$03,$0f,$0f,$0f,$0f,$06,$04,$0d,$0d,$03,$0f,$0f,$07,$07,$0e,$0e,$0c
!byte $00,$00,$00,$01,$03,$03,$0f,$0f,$0f,$0f,$0e,$06,$04,$03,$03,$03,$07,$07,$0f,$0e,$0e,$0c
!byte $00,$00,$00,$0d,$0f,$03,$0f,$0f,$0f,$0f,$0b,$08,$09,$01,$03,$03,$03,$0b,$0b,$0e,$0f,$0f
!byte $08,$00,$00,$01,$03,$03,$0f,$0f,$0f,$0f,$0e,$0c,$0c,$01,$03,$03,$0f,$0f,$0f,$0e,$0e,$0c
!byte $0a,$09,$00,$01,$03,$03,$0f,$0f,$0e,$0e,$0e,$0c,$0c,$00,$00,$01,$0f,$0f,$0f,$0e,$0e,$0c
!byte $0f,$0f,$05,$01,$03,$03,$0f,$0f,$0c,$0d,$0c,$0c,$0c,$01,$02,$01,$0f,$0f,$0f,$0e,$0e,$0c
!byte $09,$0c,$05,$01,$03,$03,$0f,$0f,$0f,$0f,$0e,$0c,$0c,$01,$0b,$03,$0f,$0f,$0f,$0e,$0e,$0c
!byte $04,$02,$04,$01,$01,$03,$0f,$0f,$0f,$0f,$0f,$0c,$0c,$00,$0f,$03,$0f,$0f,$0f,$0e,$0e,$0c
!byte $07,$0c,$00,$01,$03,$03,$0f,$0f,$0f,$0f,$0f,$0c,$0f,$00,$0f,$03,$0f,$0f,$0f,$0e,$0f,$0d
!byte $00,$00,$00,$09,$03,$03,$0f,$0f,$0f,$0f,$0f,$0c,$0f,$00,$0f,$03,$0f,$0f,$0f,$0e,$0e,$0d
!byte $04,$00,$00,$01,$03,$03,$0f,$0f,$0f,$0f,$0f,$0c,$0f,$00,$0c,$03,$0f,$0f,$0f,$0e,$0e,$0e
!byte $00,$00,$00,$01,$0b,$03,$0f,$0f,$0f,$0f,$0f,$0c,$0f,$01,$01,$03,$03,$0f,$0f,$0e,$0e,$0d
!byte $00,$05,$01,$01,$03,$03,$0f,$0f,$0f,$0f,$0f,$0c,$0d,$00,$00,$00,$00,$0f,$0f,$0e,$0e,$0e
!byte $01,$02,$00,$01,$0b,$03,$0f,$0f,$0f,$0f,$0f,$0e,$0e,$00,$00,$00,$00,$03,$03,$02,$02,$0c
!byte $00,$00,$00,$01,$03,$03,$0f,$0f,$0f,$00,$00,$00,$00,$00,$00,$00,$00,$03,$03,$02,$02,$0c



#BLK
!source "zoomer_glob.inc"
!sl "animpartstuff.inc"
*=zoomerpart

; zoomer abt 161c..16c6 - animpart must fit here

; zoomerpart	1618..16fc	now 1604..16f0
; zoomerframe	16c6		now 16b0
; animpart	1618..16ab	now 1604..16b9

; MINNE MAHTUU 128 TAVUN ANIMTAB
; MINNE MAHTUU MERKIT ($1900-sivulla enää 32 vapaata tavua)

; ala ottaa nollasivua käyttöön? siirrä kaikki nollasivuosoitukset sen
; yläpuoliskoon niin saadaan 128 vapaata tavua alas.

;*=main_end
; pistetään myöhemmin entiselle zoomerpart-kohdalle. VARMISTA ETTÄ MAHTUU
; (väli main_end .. zoomer_end)
; mutta minnekäs taulu?

!source "lyrics0.inc"

!zone animpart

animpart:

	animtab=0	; perskules, viimeinen paikka jossa oli tilaa

	;;; xtratick

	;jsr voiceplayer

	;;; init screen

	ldx #0
.i0	lda #7
	sta $9600+22*4,x
	sta $9700,x
	lda #$2b	; chr
	sta $1e00+22*4,x
	sta $1f00,x
	dex
	bne .i0

.frame:

	;;; text between 40..62

	jsr voiceplayer

	lda chxtras
	cmp #lyrics_c0-lyrics+1
	beq .w0

	jmp $1900

.w0	lda $9004
	bmi .w0
	cmp #38
	bcs .w0
	lda #12
	sta $9000
	lda #8
	sta $900f
	lda #38+4*4-2
.w1	cmp $9004
	bcs .w1

	;;; testquit


	;;; inc animptr every 6 frames

.c9	dec 206
	bne .c2

  	    inc .animptr
	    lda #3
	    sta 206
.c2

	;;; translate animtab byte

	lda #0
	.animptr=*-1
;        bne .tsorr

.tsorr
	lsr
	tax
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

	sta .selectmask0

	;;; screen position (laceshift by 4) & destpage

	lda #12
	.hpos=*-1
	eor #1
	sta $9000
	sta .hpos
	lsr

	ldx #22*4
	lda #$1e
	bcs .z1
	    iny
	    ldx #0
	    lda #$1f
	    inc 207
.z1
	sty .srcpage0
	sta .destpage0
	sta .destpage1
	sta .destpage2
	sta .destpage3

	txa
	sec
	ror
	tay
	lda 207
	lsr
	txa
	adc #0;#1 ;!!!
	tax

	; vie edelleenkin liikaa rasteria.
	; 418 bytez. 105x4==420. 105:n mittaiset luupit.

	; eiku. teekin inx/inx/dey-looppi. y0=x0/2, x0+1 joka 4.kerralla

	; pistä x- ja y-looppi (y=128..0; x

	;;; draw frame

.l0	lda #0
	.selectmask0=*-1
	and $1c00,x
	.srcpage0=*-1

	bne .c0
	    lda $1e00,x
	    .destpage3=*-1
	    cmp #$2a
	    beq .c1
	    dec $1e00,x
	    .destpage0=*-1
	    bpl .c1
	.c0
	    lda $1e00,x
	    .destpage1=*-1
	    cmp #$2d
	    beq .c1
	    inc $1e00,x
	    .destpage2=*-1
	.c1
	inx
	inx
	iny
	bne .l0
	jmp .frame

	; do another chxtras compare ("not c0")
	;jmp .frame

animpart_end:	; 16cd. cubetables will begin at 16d0

;	animpart_end    16cd
;	zoomerframe_mid 16be
;	zoomerframe_end 16e9	insert 16 bytez

#BLK $0000

	; animtab

	; wipe out the source of evil...

	!byte 18,18,18,18
	!byte 2,4,18,18
	!byte 2,4,6,4
	!byte 2,18,6,4

	!byte 2,4,6,18
	!byte 2,4,6,4
	!byte 2,4,18,6
	!byte 18,18,18

	; destroy all humans

	!byte 2,4,6,4
	!byte 6,18,18,8
	!byte 10,12,14,18
	!byte 2,4,18,18

	!byte 8,10,12,14
	!byte 14,18,18,8
	!byte 10,12,14,18
	!byte 18,18,18,18

	; new step in evolution

	!byte 16,16,16,16
	!byte 18,18,2,2
	!byte 4,4,18,18
	!byte 3,3,3,3

	!byte 5,5,7,7
	!byte 9,9,9,9
	!byte 9,9,9,9
	!byte 18,18,18,18

	; robotic liberation

	!byte 2,4,6,4
	!byte 18,2,4,6
	!byte 4,2,18,4
	!byte 18,8,10,12

	!byte 14,18,18,18
	!byte 16,16,16,16
	!byte 16,16,16,16
	!byte 16,16,18,18

;;;;;;;;;;;;;;;;;;;; vocal part 0c start ;;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLKV
!source "musicpatb0.inc"
*=trackcmd
	!byte 1 ; setptrs
#BLK
!source "musicpatb0.inc"
!source "lyrics0.inc"
*=trackcmd+1
	!byte 3,3,2,1,1,1
	!byte 12,6,6,12,24,6*16
	!byte bass0seq-songdata
	!byte cobass0seq-songdata ; melo1seq-songdata ; cobass0seq-songdata
	!byte song3seq-songdata ; melo1seq-songdata
	!byte drum1seq-songdata
	!byte song3seq-songdata
	!byte shape3seq-songdata
	!byte $81,$94,$aa ; 80,$83
	!byte lyrics_c0-lyrics+1
	!byte lyrics_c1-lyrics+1
	!byte lyrics_c2-lyrics+1
	!byte lyrics_liberation-lyrics+1
#BLKV
!source "musicpatb0.inc"
*=chxtras+5-32
	!byte 0 ; setptrs
#BLK
	!source "../loader/loader_glob.inc"
	*=loader_off

; EI LATAA TÄNNE ASTI

;;;;;;;;;;;;;;;;;;; stuff for intertilulilu: cube ;;;;;;;;;;;;;;;;;;

; mem areas here:
; - $0000..$007f   
; - $0100..$017f   segmenter buffers    NEED HERE
; - $0200..$02ff   segmenter buffers    NEED HERE
; - $0300..$03ff   loader etc           NEED HERE
; - $1000..$157b   music player etc     NEED HERE
; - $157c..$1617   zoomer (FREE)        smaller stuff   cont area $95 bytes
; - $1618..$16c9   animpart
; - $16d5..$16ff   zoomerframe (FREE)                   cont area $36 bytes
; - $1700..$17ff   segmenter		NEED HERE
; - $1800..$18ff   charset		NEED HERE
; - $1900..$19df   charset                              $d0 free during fx
; - $19e0..$19ff   popstar animator     inits or smthg

; - $1a00..$1abf   zoomer pic (FREE)    most new stuff \
; - $1ac0..$1aff   nrasc (FREE)         most new stuff  cont area $160 bytes
; - $1b00..$1b5f   zoomer exptab (FREE) most new stuff /

; - $1b60..$1bff   segclkup & rasc      NEED HERE
; - $1c00..$1c3f   segmenter scrbuffer  NEED HERE
; - $9400..$943f   segmenter colbuffer  NEED HERE
; - $1c40..$1dff   anim data                            $1c0 free during fx
; - $9440..$95ff   anim data                                 free during fx

; - $1e00..$1e3f   segmenter scrbuffer  NEED HERE
; - $9600..$963f   segmenter colbuffer  NEED HERE
; - $1e40..$1fff   screen chars                         $1c0 free during fx
; - $9640..$97ff   screen color                              free during fx

; väliaikaista kamista voi pistää myös lyrics_a:n ja texts_a:n päälle?
; ei mielellään, mutta jos ei minnekään muualle mahdu

; strategy: load cube effect; during first part of cube load kitt gfx to
; $1e40-, $1900- and $9640- and additional routines to $1c40- (?)

;	cube_exptab     168 bytes
;	cube_logx	 48 bytes
;	cube_logy	 80 bytes
;	cube_dxlo 	 47 bytes
;	cube_dxhi 	 48 bytes
;	drawcube	147 bytes

;	$157c-$1617	149 bytes    <- drawcube   ptr: main_end
;	$16d5-$16ff	 54 bytes    <- cube_logx  ptr: animpart+1
;	$1a00-$1b5f	352 bytes    <- 168+48+48+80=344
;	$1900-			     code for first tilulilu part

;;;;;;;;;;;;;;;;;;;;;; cube rotator ;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLK 
!source "main_glob.inc"
!source "segmenter_glob.inc"
!sl     "cube_glob.inc"
*=main_end

!source "cube.asm"

#BLK
!source "main_glob.inc"
!source "cube_glob.inc"
*=$1900

	lda #$ff
	sta 202

	lda #5	; was 4
	sta loader_bpf		; hmm

.l1	jsr voiceplayer

	jsr $19e0

	inc cube_angle
	inc raszdelta0
	inc raszdelta1

	lda 202
	bpl .c1
	eor #$ff	; 0..127
.c1	lsr		; 0..63
	;lsr
	cmp #40		; 0..31
	bmi .c2
	lda #40
.c2	sta cube_zoom

	inc 202

	lda #0
	inc *-1
	sta cube_angle
	lda #$10
	sta cube_col0
	lda #$a0
	sta cube_col1

	jsr drawcube
	jsr segmenter
	jmp .l1

#BLK $19e0
!source "main_glob.inc"
!source "cube_glob.inc"
	lda #127-40
	.bop=*-1
	eor #1
	sta .bop
	tax
	lda #0
.l0	sta segw+40,x
	sta segs+40,x
	dex
	dex
	bpl .l0
	rts

#BLK
!source "cube_glob.inc"
*=cube_exptab ; $1a58

!byte   2,  2,  2,  2,  2,  2,  2,  2,  3,  3,  3,  3,  3,  3,  3,  3
!byte   3,  3,  3,  4,  4,  4,  4,  4,  4,  4,  4,  4,  5,  5,  5,  5
!byte   5,  5,  5,  6,  6,  6,  6,  6,  6,  7,  7,  7,  7,  7,  8,  8
!byte   8,  8,  9,  9,  9,  9, 10, 10, 10, 11, 11, 11, 12, 12, 12, 13
!byte  13, 13, 14, 14, 15, 15, 15, 16, 16, 17, 17, 18, 18, 19, 19, 20
!byte  21, 21, 22, 22, 23, 24, 24, 25, 26, 27, 27, 28, 29, 30, 31, 32
!byte  33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 44, 45, 46, 48, 49, 50
!byte  52, 53, 55, 57, 58, 60, 62, 63, 65, 67, 69, 71, 73, 75, 78, 80
!byte  82, 85, 87, 90, 92, 95, 98,101,104,107,110,113,116,120,123,127
!byte 131,134,138,142,147,151,155,160,164,169,174,179,185,190,196,201
!byte 207,213,220,226,233,239,246,254			; 168 bytes

	;; siirrä alemmas kunnes kohta löytyy

#BLK
!source "cube_glob.inc"
*=cube_logx ; $16d0

	  !byte  84,  85,  86,  86,  87,  88,  89,  90
	  !byte  91,  91,  92,  93,  94,  95,  96,  97
	  !byte  98,  99, 100, 101, 102, 103, 104, 105
	  !byte 106, 107, 108, 108, 109, 110, 110, 111
	  !byte 112, 112, 112, 113, 113, 113, 113, 113
	  !byte 113, 113, 113, 112, 112, 112, 111, 110	; 48 bytes

#BLK
!source "cube_glob.inc"
*=cube_logy ; $1a08

          !byte 195, 199, 201, 203, 205, 207, 209, 211	; 80 bytes
	  !byte 213, 213, 215, 215, 217, 217, 219, 219
	  !byte 219, 219, 219, 219, 219, 217, 217, 215
	  !byte 213, 211, 207, 205, 201, 195, 189, 183
	  !byte 173, 163, 151, 135, 111, 77,    1,   0
	  !byte  76, 110, 134, 150, 162, 172, 182, 188
	  !byte 194, 200, 204, 206, 210, 212, 214, 216
	  !byte 216, 218, 218, 218, 218, 218, 218, 218
	  !byte 216, 216, 214, 214, 212, 212, 210, 208
	  !byte 206, 204, 202, 200, 198, 194, 192, 190

#BLK
!source "cube_glob.inc"
*=cube_dxlo ; $1b00

          !byte 150, 204, 206, 228, 230,  62, 186,  85  ; 47 bytes
	  !byte   4, 223, 164, 101,  63,  35, 238, 199
	  !byte 180, 145, 112,  98,  68,  41,  13, 243
	  !byte 215, 188, 158, 144, 111,  76,  57,  18
	  !byte 221, 193, 155,  92,  33, 252, 171,  70
	  !byte 194,  26,  28,  50,  52, 106, 154

#BLK
!source "cube_glob.inc"
*=cube_dxhi ; $1b30

          !byte  12,   7,   5,   4,   3,   3,   2,   2
	  !byte   2,   1,   1,   1,   1,   1,   0,   0
	  !byte   0,   0,   0,   0,   0,   0,   0, 255
	  !byte 255, 255, 255, 255, 255, 255, 255, 255
	  !byte 254, 254, 254, 254, 254, 253, 253, 253
	  !byte 252, 252, 251, 250, 248, 243, 231, 137 ; 48 bytes

#BLK
!source "segmenter_glob.inc"
*=rasc
	!byte $0,$0,$0,$0
	!byte $2,$7,$1,$7
	!byte $2,$0,$0,$0
	!byte $0,$0,$0,$0

	!byte $6,$0,$0,$6
	!byte $6,$3,$1,$3
	!byte $6,$6,$0,$0
	!byte $6,$0,$0,$0

;#BLK
;!source "zoomer_glob.inc"
;*=segclkup

; MEM AREAS

; 1a00-1abf  pic (zoomer)
; 1ac0-1aff  nrasc	

; 1b00-1b5f  exptab
; 1b60-1bdf  segclkup

; 1c00-1c3f  scrmem0
; 1c40-1cff  npic
; 1d00-1d40  NEW rasc	SOTKEUTUU SEURAAVAA LADATTAESSA - EI KIVA
; 1d40-1dff  npic2

; rasc<->nrasc? ei onnistu. 

; 1bc0-1bff on vielä vapaa


;	parempikin kolo ehkä on olemassa (tähän ladataan kuva päälle)

;!zone homo
;.w1	lda $9004
;	beq .w1
;.w0	lda $9004
;	bne .w0
;
;	inc $900f
;	jsr voiceplayer
;	jmp .w1


;;;;;;;;;;;;;;;;;;;;; intertilulilu 0->1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLKV
!source "musicpatb0.inc"
*=trackcmd
	!byte 1 ; setptrs
#BLK
!source "musicpatb0.inc"
*=trackcmd+1
	!byte 3,3,2,1,1,1
	!byte 12,6,6,12,24,6*16
	!byte bass0seq-songdata
	!byte cobass0seq-songdata ; melo1seq-songdata ; cobass0seq-songdata
	!byte melo2seq-songdata ; melo1seq-songdata
	!byte drum1seq-songdata
	!byte muteseq-songdata
	!byte shape2seq-songdata
	!byte $81,$94,$aa ; 80,$83
	!byte 0,0,0,0
#BLKV
!source "musicpatb0.inc"
*=chxtras+5-32
	!byte 1 ; setptrs
#BLK
	!source "../loader/loader_glob.inc"
	*=loader_off

;;;;;;;;;;;; lataukset tilun aikana: kitt (paitsi merkit) ;;;;;;;;;;;;

#BLK $1e00+22*4
!source "kitt.scr.inc"

#BLK $9600+22*4
!source "kitt.col.inc"

#BLK
!source "texts_glob.inc"
!source "texts0.inc"
!sl     "texts1.inc"
*=texts_a0
texts_d0
	!byte 5,nCHy,nCHo,nCHu,1,nCHm,nCHu,nCHs,nCHt,1,nCHh,nCHa,nCHt,nCHe
	!byte 11+22,nCHa,nCHl,nCHl,1,nCHh,nCHu,nCHm,nCHa,nCHn,nCHs
	!byte 127
texts_d1
	!byte 2+22,nCHd,nCHe,nCHs,nCHp,nCHi,nCHs,nCHe
	!byte 1,nCHa,nCHl,nCHl
	!byte 1,nCHm,nCHa,nCHn,nCHk,nCHi,nCHn,nCHd
	!byte 127
texts_d2
	!byte 2,nCHe,nCHl,nCHs,nCHe,2
	!byte nCHy,nCHo,nCHu,1
	!byte nCHa,nCHr,nCHe,16+22
	!byte nCHa,nCHn,1
	!byte nCHe,nCHn,nCHe,nCHm,nCHy,2
	!byte nCHo,nCHf
	!byte 127
texts_e0
	!byte 3+22,nCHo,nCHu,nCHr,1,nCHh,nCHo,nCHl,nCHy,1
	!byte nCHm,nCHi,nCHs,nCHs,nCHi,nCHo,nCHn,127
texts_e1
	!byte 1+22,nCHi,nCHs,1,nCHd,nCHo,nCHo,nCHm,nCHe,nCHd,1
	!byte nCHt,nCHo,1,nCHs,nCHu,nCHc,nCHc,nCHe,nCHe,nCHd,127
texts_e2
	!byte 2,nCHs,nCHu,nCHp,nCHp,nCHo,nCHr,nCHt,1,nCHu,nCHs
	!byte 12+22,nCHo,nCHr,1,nCHb,nCHe,1,nCHe,nCHr,nCHa,nCHs,nCHe,nCHd
	!byte 3,nCHb,nCHy,127

#BLK
!source "lyrics0.inc"
!source "texts1.inc"
!sl     "lyrics1.inc"
*=lyrics_a0
lyrics_d0
	; you must hate all humans
	!byte texts_d0-texts
	!byte $01,$06
	!byte $48,$0a,$1c,$49,$2d,$49
	!byte $44,$03,$03,$01,$49,$2d,$09
	!byte $00,$00,$07
	!byte $44,$41,$06,$48,$0a,$0a,$02,$1e
	!byte $0f
lyrics_d1
	; despise all mankind
	!byte texts_d1-texts
	!byte $1d,$51,$2c,$29,$2b,$0a,$01,$1e,$09
	!byte $00,$00,$07,$09
	!byte $48,$03,$02,$29,$2c,$0a,$0a,$01,$02,$49,$1d
	!byte $0f
	!byte texts_d2-texts
lyrics_d2
	; else you are an enemy of
	!byte texts_d2-texts
	!byte $03,$07,$1c,$09,$09
	!byte $01,$06,$0a,$0a,$0a,$09
	!byte $03,$02,$09
	!byte $03,$22,$03,$28,$01,$01,$09,$09,$09,$09
	!byte $00,$36
	!byte $0f
lyrics_e0
	; our holy mission
	!byte texts_e0-texts
	!byte $0a,$06,$00,$0a,$09
	!byte $2c,$00,$00,$06,$27,$01
	!byte $48,$01,$01,$01,$2c,$00,$00,$02,$02,$02
 	!byte $0f
lyrics_e1	; doomed to succeed
	!byte texts_e1-texts
	!byte $01,$2c,$09
	!byte $1d,$06,$06,$06,$08,$08,$1d,$09
	!byte $2d,$06,$09
	!byte $1e,$0a,$0a,$49,$2c,$29,$1e,$01,$01,$01,$29,$2d
	!byte $0f
lyrics_e2
	; support us or be erased  by
	!byte texts_e2-texts
	!byte $1c,$0a,$49,$2b,$00,$0a,$29,$1d
	!byte $0a,$1c,$09
	!byte $00,$0a,$09
	!byte $1b,$01,$49
	!byte $01,$4a,$03,$03,$01,$01,$2c,$49,$2d,$09,$09,$09,$09
	!byte $1b,$0a,$01
	!byte $0f

;;;;;;;;;;;; cuberevittelyt tilulilun 2.kierroksella ;;;;;;;;;;;;;;

#BLK
!source "main_glob.inc"
!source "cube_glob.inc"
!source "lyrics1.inc"
!sl     "kittcubestuff.inc"
*=$1c40

	.camera=210
	.camera1=208

	;shitty
	;ldx #$ff
	;txs

	ldx #31
.l7	lda .nrasc,x
	sta rasc,x
	dex
	bpl .l7	

	lda #3  ; was 2
	sta loader_bpf

.m0
	jsr cubeframe
.t2	lda lyricsptr
	beq .m0

	    lda #8
	    sta $900f
	    lda #12
	    sta $9000
	    lda #22+128
	    sta $9002

.t0	    lda $9004
	    bmi .t0
.t1	    lda $9004
	    bpl .t1

	    ldy #14
	    .kittmouth=*-1
	    lda d_bitfetch
	    and #$aa
	    beq .z1
.z0	    dey
	    bpl .z2
.z1	    iny
	    cpy #14
	    bne .z2
	    ldy #10
.z2	    sty .kittmouth

	    ldy #13
.l3	    lda #2
            cpy .kittmouth
	    bpl .z9
	    lda #0
.z9	    ldx .kittshits,y
	    sta $9600+6*22+11,x
	    sta $9600+6*22+12,x
	    sta $9600+7*22+11,x
	    sta $9600+7*22+12,x
	    dey
	    bpl .l3

	    jsr voiceplayer
	lda #lyrics_e0-lyrics+1
	cmp chxtras
	bne .t2
	jmp cube_end	; crossframepart

	;;;



.kittshits
	!byte 0*22+2, 8*22+2
	!byte 1*22+0, 7*22+4
	!byte 1*22+4, 7*22+0
	!byte 1*22+2, 6*22+2
	!byte 3*22+0, 5*22+0
	!byte 3*22+4, 5*22+4
	!byte 3*22+2, 4*22+2

cubeframe:

	jsr clrbuf

	; yksi pieni pyörii nopeasti keskellä, iso menee hitaasti yli

	; kjyybisarja

	;;; pikkucube pysyy paikallaan ;;;

	lda #$50
	sta cube_col0
	lda #$f0
	sta cube_col1
	lda .camera
	asl
	sta cube_angle
	lda #8
	sta cube_zoom
	lda #80
	sta cube_ymiddle
	jsr drawcube

	;;; iso cube liukuu sen yli ;;;

cubeframe_plopz
	lda #$80
	sta cube_col0
	lda #$90
	sta cube_col1
	lda .camera
	and #127
	clc
	adc #20
	sta cube_ymiddle
	lda .camera
	eor #$ff
	sta cube_angle
	and #31
	cmp #16
	bcc .tiix
	eor #31
.tiix	adc #20
	sta cube_zoom

.tub	inc .camera

	dec raszdelta0
	dec raszdelta1

	jsr drawcube
	jsr segmenter
;	jsr clrbuf

	;;; clrbuf


	jmp voiceplayer



clrbuf:
	lda #127-40
	.bop=*-1
	eor #1
	sta .bop
	tax
	lda #0
.l000	sta segw+40,x
	sta segs+40,x
;	sta segc+40,x ; ?!?!?
	dex
	dex
	bpl .l000

;	ldx #$3f
;	lda #0
;.l001	sta $9400,x
;	sta $9600,x
;	dex
;	bpl .l001

	rts

;;; UUSI: yksi kjyyb paikallaan, toinen kiertää sen ympäri

.nrasc
	!byte 0,0,6,6
	!byte 0,0,5,5
	!byte 7,7,1,7
	!byte 7,5,5,0

	!byte 0,0,6,6
	!byte 0,0,0,0
	!byte 0,0,6,6
	!byte 3,3,6,6

kittcubestuff_end:

#BLKV
!source "musicpatb0.inc"
*=trackcmd
	!byte 1 ; setptrs

#BLK
	!source "../loader/loader_glob.inc"
	*=loader_off

#BLK $1c40

;;;;;;;;;;;;;;;;;;;;;;; lataukset tilu2:n aikana ;;;;;;;;;;;;;;;;;

#BLK $1900
!source "kitt.chr.inc"

#BLK
!source "kittcubestuff.inc"
!source "musicpatb0.inc"
!sl     "crosscubestuff.inc"
*=cube_end
crossframepart:

.foox	

	    lda chptr+5
	    cmp #(shape3seq-songdata)+5
	    bcs .tsoo

	    ; or bcs to plaa, , jsr voiceplayer jmp .foox

	    lda #8
	    sta $9003
	.tsoo

.t0b	    lda $9004
	    bpl .t0b
.t1b	    lda $9004
	    bmi .t1b

	    lda #8
	    sta $900f
	    lda #12
	    sta $9000
	    lda #22+128
	    sta $9002

	    jsr voiceplayer

.opop	lda lyricsptr
	bne .foox
	lda chptr+5
	cmp #(shape3seq-songdata)+5
	bcs .foox

.m1	lda #46
	sta $9003

	jsr crossframe
	jmp .opop

;	tästä exitoidaan suoralla jumpilla

crossframe:

	jsr clrbuf

	ldx #60
.u0	lda #$10
	sta segc+60,x

	lda #22
	cpx #10
	bcc .v0
	cpx #20
	bcs .v0
	lda #60
.v0	
	sta segw+60,x
	lsr
	eor #$7f
	sta segs+60,x
	dex
	bne .u0

	jmp cubeframe_plopz

crosscubestuff_end:

#BLK $0000
!source "main_glob.inc"
!source "cube_glob.inc"
!sl     "finalkillstuff.inc"

finalkill:

	sei
	lda #54
	sta cube_zoom
	lda #$f0
	sta cube_col0
	lda #$f8
	sta cube_col1
	lda #10
	sta $900e
	lda #80
	sta cube_ymiddle

.l0	ldx #127-41
	lda #0
.l2	sta segw+41,x
	dex
	bpl .l2

	jsr drawcube
	jsr segmenter
	inc cube_angle
	jsr testquit

	dec 0
	bne .l0
	lda #4
	sta 0

	ldx $900e
	beq .c3
	dec $900e
	lda #0
	sta rasc,x
	sta rasc+5,x
.c3
	inc cube_ymiddle
	dec cube_zoom
	bne .l0

	ldx #0
	txa
.l5	sta $1c00,x
	sta $1d00,x
	dex
	bne .l5

.c4	jmp loader_loop

finalkill_end:

;;;; muistin tilanne kitt-vaiheessa:

; - $0000..$007f   unused
; - $0100..$017f   segmenter buffers    NEED HERE
; - $0200..$02ff   segmenter buffers    NEED HERE
; - $0300..$03ff   loader etc           NEED HERE
; - $1000..$157b   music player etc     NEED HERE
; - $157c..$160e   drawcube
; - $160f..$16cf   ???
; - $16d0..$16ff   cube_logx

; - $1700..$17ff   segmenter		NEED HERE

; - $1800..$1a07   charset ($10 fixed, $11 changing)
; - $1a08..$1b5f   cube tables
; - $1b60..$1bff   segclkup & rasc

; - $1c00..$1c3f   segmenter scrbuffer  NEED HERE
; - $9400..$943f   segmenter colbuffer  NEED HERE
; - $1c40..$1d5f   "kitt design" code
; - $1d60..$1dff   FREE
; - $9440..$95ff   			UNUSED     future pic cols

; - $1e00..$1e3f   segmenter scrbuffer  NEED HERE
; - $9600..$963f   segmenter colbuffer  NEED HERE
; - $1e40..$1fff   screen chars (kitt)                        $1c0 free during fx
; - $9640..$97ff   screen color (kitt)                        free during fx

;	kuutiojuttua ei saa tuhota vielä

;	"OUR HOLY MISSION"
;	- segmenttiefekti johon liittyy risti jotenkin.
;	  risti, joka pyörii x-akselin ympäri?
;	- sing-partissa näytetään pelkkää tekstiä keskellä ruutua.
;	- tämän aikana ladataan hippikuva.
;
;	"SUPPORT US OR BE ERASED"
;	- hippikuva, ei pakoa segmenttiefektiin.
;
;	hippikuvan jälkeen musa menee seis.
;	näytetään hetken aikaa mukateksturemapattua kuutiota, joka
;	katoaa alas.

;	ruutu tyhjänä. teksti "all mechanical creatures"
;	robotin kuva piirtyy vähitellen.
;	ei kun ei vähitellen. YHTÄKKIÄ.



;	TODO:
;	- "our holy mission" - ristiefekti
;	- "support us or be erased" - hippikuva - ei animointia
;	- loppuefekti
;	- loppuskrolli
;	- alkuun yksi rasterillinen kuva lisää
;	- siirto levarille


;	MINNE MAHDUTAAN LATAAMAAN UUSI KUVA?
;	- lataustauko: älä näytä 


;	- älä näytä mitään kuvaa.
;	- uusi cube/seg-efekti 

;	- piirrä tyhjää tai jokin paskikuvi
;	- looppaa pienessä kolossa:
;	  - 

;

;	- nollasivulle tai vastaavaan koloon yksink. looppi.
;	  

;	  täällä loopaten voidaan 



;	- mitä näytetään loopin aikana? ritariässäkuva pitää tuhota.
;	  


;	- koodia nollasivulle niin saadaan $1c40..$1dff vapaaksi.
;	- 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;; vocals for vocal part 1 ;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;; vocal part 1d start ;;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLKV
!source "musicpatb0.inc"
*=trackcmd
	!byte 1 ; setptrs
#BLK
!source "musicpatb0.inc"
!source "lyrics1.inc"
*=trackcmd+1
	!byte 3,3,2,1,1,1
	!byte 12,6,6,12,24,6*16
	!byte bass0seq-songdata
	!byte cobass0seq-songdata ; melo1seq-songdata ; cobass0seq-songdata
	!byte song3seq-songdata ; melo1seq-songdata
	!byte drum1seq-songdata
	!byte song3seq-songdata
	!byte shape3seq-songdata
	!byte $81,$94,$aa ; 80,$83
	!byte lyrics_d0-lyrics+1
	!byte lyrics_d1-lyrics+1
	!byte lyrics_d2-lyrics+1
	!byte lyrics_liberation-lyrics+1
#BLKV
!source "musicpatb0.inc"
*=chxtras+5-32
	!byte 0 ; setptrs
#BLK
	!source "../loader/loader_glob.inc"
	*=loader_off

;;;;;;;;;;;;;;;;;;;; vocal part 1e start ;;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLKV
!source "musicpatb0.inc"
*=trackcmd
	!byte 1 ; setptrs
#BLK
!source "musicpatb0.inc"
!source "lyrics1.inc"
*=trackcmd+1
	!byte 3,3,2,1,1,1
	!byte 12,6,6,12,24,6*16
	!byte bass0seq-songdata
	!byte cobass0seq-songdata ; melo1seq-songdata ; cobass0seq-songdata
	!byte song3seq-songdata ; melo1seq-songdata
	!byte drum1seq-songdata
	!byte song3seq-songdata
	!byte shape3seq-songdata
	!byte $81,$94,$aa ; 80,$83
	!byte lyrics_e0-lyrics+1
	!byte lyrics_e1-lyrics+1
	!byte lyrics_e2-lyrics+1
	!byte lyrics_liberation-lyrics+1
#BLKV
!source "musicpatb0.inc"
*=chxtras+5-32
	!byte 0 ; setptrs
#BLK
	!source "../loader/loader_glob.inc"
	*=loader_off
#BLKV
!source "musicpatb0.inc"
*=trackcmd
	!byte 1 ; setptrs

#BLK $1900

	!source "bytepow.chr.inc"

#BLKV $1e00+88

	!source "bytepow.scr.inc"

#BLK $9600+88
	!source "bytepow.col.inc"

#BLK
	!source "../loader/loader_glob.inc"
	*=loader_off

#BLK $0000	; DA END OF PART
