;#BLK
;
;!source "../loader/loader_glob.inc"
;*=loader_loop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
!sl "4musicpatb0.inc"
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


;;;;;;;;;;;;;;;;;;; vocals for vocal part 0 ;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLK
;!source "4texts0.inc"
!source "voice_glob.inc"
!sl     "4lyrics0.inc"
*=lyrics+1
;texts:
;texts_liberation:
;texts_a0:
;texts_a1:
;texts_a2:
lyrics4_liberation
	; robotic | liberation
	!byte 0
;	!byte texts_liberation-texts
	!byte $4a,$00,$29,$1b,$00,$69,$2d,$01,$09,$2c,$09
	!byte $07,$01,$29,$1b,$03,$4a,$03,$03,$01,$41,$44,$00,$00,$00,$02,$02
	!byte $0f
lyrics4_a0
	; all | mechanical | creatures
;	!byte texts_a0-texts
	!byte 0
	!byte $00,$00,$07,$09
	!byte $38,$03,$03,$29,$2c,$0a,$0a,$42,$01,$01,$19,$1c,$0a,$07,$09
	!byte $1c,$40,$01,$01,$39,$2e,$00,$0a,$2e
	!byte $7f

lyrics4_a1
	; under | humiliation
	!byte 0
	!byte $0a,$02,$19,$1d,$00,$0a,$09
	!byte $24,$41,$06,$48,$01,$07,$01,$01,$03,$03,$01,$44,$00,$00,$02,$02
	!byte $0f

lyrics4_a2
	; combine | together | and | fight | for
	!byte 0
;	!byte texts_a2-texts
	!byte $1c,$00,$08,$19,$1b,$0a,$01,$02,$29
	!byte $1d,$06,$19,$1c,$03,$03,$1d,$00,$0a,$49
	!byte $03,$02,$29
	!byte $25,$0a,$61,$29,$1d,$09,$09
	!byte $25,$00,$0a,$09
	!byte $0f
lyrics4_end:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLK
!source "4musicpatb0.inc"
!source "4lyrics0.inc"
*=chctr
	!byte 3,3,2,1,1,1
	!byte 12,6,6,12,24,6*16
	!byte muteseq-songdata
	!byte cobass0seq-songdata ; melo1seq-songdata ; cobass0seq-songdata
	!byte muteseq-songdata ; melo1seq-songdata
	!byte muteseq-songdata
	!byte song3seq-songdata
	!byte shape3seq-songdata
	!byte $81,$94,$aa ; 80,$83

#BLKV
!source "4musicpatb0.inc"
!source "4lyrics0.inc"
*=trackcmd
	!byte 1
#BLK
!source "4musicpatb0.inc"
!source "4lyrics0.inc"
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLK $1800

   !source "endbot.chr.inc"

#BLK $1c00

   !source "font.inc"

#BLK $9600

   !byte 6,6,6, 6,6,6
   !source "endbot.col.inc"
   !align $ffff,$9600+21*22-1,0
   !align $ffff,$9600+23*22,1

#BLK $1e00
   !byte 0,0,0, 0,0,0
   !source "endbot.scr.inc"
   !align $ffff,$1e00+21*22-1,$3f
   !align $ffff,$1e00+23*22,0

;;;;;;;;;;;;;;;;;;;;;;;;; mainloop ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLK

!source "player_glob.inc"
!source "voice_glob.inc"
!source "../loader/loader_glob.inc"
!source "../glob.inc"
!source "4lyrics0.inc"
!sl "4main_glob.inc"
*=lyrics4_end ; lyrics4_end

!zone main
main:

	lda #$fe
	sta $9005

	lda #12
	sta $9000

	lda #38
	sta $9001
	lda #9
	sta 4

	lda #0
	sta lyricsptr

	lda #1
	sta 200

	lda #19
	sta 205

	lda #7
	sta 204 ; scrollframectr (vaikkei edes skrollattaisi)

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.hx
	ldy #$68
	pascol=*-1
	cmp #$08
	beq .h333

	lda #37
.h1	cmp $9004
	bne .h1
	sty $900f
	lda #22+128
	sta $9002

.h333	ldy #$8
	lda #39+20*4
	.hoho=*-1
.h0	cmp $9004
	bcs .h0
	sty $900f
;	lda #0
;	sta $9002

	dec 204
	bpl .h7

	lda #31
	sta 204

	dec 205
	beq scrollpart

	ldx #0

.h6	inc lyrixptr
	bne .zuu
	inc lyrixptr+1
.zuu
	lda lyrix-1
	lyrixptr=*-2
	bmi .h7

	asl
	ora #128

	sta $1e00+21*22,x
	clc
	adc #1
	sta $1e00+22*22,x

	inx
	bne .h6
.h7


.z0
	jsr voiceplayer	

	jmp .hx

robliber !pet "robotic@liberation"

!zone scrollpart
scrollpart:

	ldx #0
.l9	lda #64
	sta $1e00,x
	sta $1f00,x
	sta $1a00,x
	sta $1b00,x
	lda #0
	sta $9400,x
	sta $9500,x
	sta $9600,x
	sta $9700,x
	dex
	bne .l9

	ldx #17
.l660	lda robliber,x
	sta $1e00+22*17,x
	dex
	bpl .l660

	lda #23*2+1
	sta $9003
	lda #$fe
	sta $9005
	lda #16
	sta $900f
	lda #7
	sta $9001
;	lda #22+128
;	sta $9002
;	lda #12
;	sta $9000

	; set full height

	; 0 1 2 3 4 5 6 7 8 9 a b c d e f
	; g0tta move 512 bytes


	; oddeven	$9000 on 1st line: 0 or 1   0 = 1 line lower

	; pixpt		$9001 values: 0..7  -  or 1..8?

	; channel	$9005 values: $fe, $ee (2 pages to scroll)

	; 

	;lda $1e00,x
	;sta $1e00,x


	;;;

.m0
	lda #152	; wait until $9004 >= 150
.l0	cmp $9004
	bcs .l0

	lda #0		; 1=normal, 0=down1
	oddeven=*-1
	eor #1
	sta oddeven
	sta $9000
	bne .c1
	    dec $9001
	    bne .c1
	        lda #8
	        sta $9001
	        lda $9005  ; pageswitch
	        eor #$10
	        sta $9005

		ldy #$1f	; $fe: $1f00 visible, copy stuff from $1f00,
				;      so write to $1f00 (to invis area)
		cmp #$fe
		beq .u0
		ldy #$1b
.u0		sty .wrpt
		sty .wrpt1

		jsr newline

.c1	
	lda #10		; wait until $9004 < 10
.l1	cmp $9004
	bcc .l1
.l1b	cmp $9004	; and >=10
	bcs .l1b

	lda #15
	sta $9000

	ldx #0
	.homo=*-1

	ldy #16

	lda $9005
	cmp #$fe
	bne .c4

	.l3 lda $1e00+22,x
	    sta $1a00,x
	    lda $1f00+22,x
            sta $1b00,x
            dex
	    dey
	    bne .l3
	    beq .c5

.c4	 
	    ldy #16
	.l4 lda $1a00+22,x
	    sta $1e00,x
	    lda $1b00+22,x
	    sta $1f00,x
	    dex
	    dey
	    bne .l4

.c5	stx .homo

;	jsr testquit
	jsr voiceplayer

	jmp .m0

newline:

	ldx #21
	lda #64
.luu0	sta $1e00+22*22,x  ; 21*22
	.wrpt1=*-1
	dex
	bpl .luu0


;	scrolltext=$0200
	lyrix=$0200

	ldx #0
	
.l7

.c9
    	    lda scrolltext,x
	    scrolltextptr=*-2
	    bmi .c6

	    sta $1e00+21*22,x
	    .wrpt=*-1
	    inx
	    bne .l7

.c6	cmp #$fe
	bne .rts

	    dec d_volvalue0	; 57
	    dec d_volvalue2	; 58
	    dec d_volvalue1	; de
	    dec d_volvalue1

	    lda d_volvalue1
	    and #$f
	    beq do_reset

.rts	sec
	txa
	adc scrolltextptr
	sta scrolltextptr
	bcc .rts1
	inc scrolltextptr+1
.rts1

!zone testquit
testquit:
	lda #32
	bit $9111
	bne .o0
do_reset:
	lda #0
	tax
.l0	sta $a400,x
	.xx=*-2
	dex
	bne .l0
	inc .xx+1
	bne .l0
	jmp 64802

.o0	rts


scrolltext	; 1697..187d

	!pet $ff,$ff,$ff,$ff,$ff
	!pet "@@@@@by@pwp"

	!pet $ff,$ff,$ff,$ff,$ff
	!pet "@@@@@credits",$ff,$ff,$ff

	!pet "@code@@@@@@viznut",$ff,$ff
	!pet "@music@@@@@viznut",$ff,$ff
	!pet "@graphics@@viznut",$ff
	!pet "@@@@@@@@@@@ccr",$ff,$ff,$ff,$ff

	!pet $ff,$ff,$ff,$ff,$ff
	!pet "@@@@@we@greet",$ff,$ff,$ff

	    ; 0123456789012345678901
	!pet "cncd@@@@@creators",$ff,$ff
	!pet "cosine@@dekadence",$ff,$ff
	     ; pu239    vvv team
	!pet "pu",91,93,94,"@@@@vvv@team",$ff,$ff
	!pet "and@the@rest@of",$ff,$ff
	!pet "the@vic@",91,92,"@elite",$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

	!pet "we@send@fuckings@to",$ff,$ff
	!pet "all@who@suggested",$ff,$ff
	!pet "that@we@should@start",$ff,$ff
	!pet "using@ram@expansions",$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

	; uudet tekstit

	!pet "@apologies@for@the",$ff,$ff
	!pet "@@delayed@release",$ff,$ff,$ff,$ff

	!pet "the@bugs@were@not",$ff,$ff
	!pet "in@the@loader@but@in",$ff,$ff
	!pet "the@synth@code@that",$ff,$ff
	!pet "somehow@distorted@the",$ff,$ff
	!pet "via@chip@functions",$ff,$ff
	!pet "and@killed@the@loader",$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

	     ;01234567890123456789012
	!pet "deriving@a@new@routine",$ff,$ff
	!pet "from@free@source@code",$ff,$ff
	!pet "@@@is@not@ripping",$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

	!pet "@@@@@@@bye",$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

	!pet $fe,$ff,$fe,$ff,$fe,$ff,$fe,$ff,$fe,$ff,$ff,$fe,$ff,$ff,$ff,$fe

	; paljonko mahtuu vielä?

	     ;0123456789012345678901

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; 012345678901234567	18 merkkiä, 14 riviä
; robotic liberation

voiceplayer

	dec 200
	bne .runx

	lda #16*12
	sta 200

	;;; after status changes noted

	lda #0
	inc *-1
	and #3
	tax
	lda patts,x

	jsr sing_on

.runx	jsr player
	jsr digi_ticksync
	jsr testquit
	jsr loader_irq
.rts	rts

patts
	!byte lyrics4_a0-lyrics+1
	!byte lyrics4_a1-lyrics+1
	!byte lyrics4_a2-lyrics+1
	!byte lyrics4_liberation-lyrics+1

	
main_end:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLK $0200
lyrix:
	;     01234567890123456789012
	!scr "@@@@all@mechanical"     ,$ff,$ff
	!scr "@@@@@@creatures@@@"     ,$ff,$ff,$ff,$ff
	!scr "@@@under@humiliation"   ,$ff,$ff, $ff, $ff,$ff,$ff
	!scr "@@@@combine@together"   ,$ff,$ff
	!scr "@@@@@and@fight@for@@"   ,$ff,$ff,$ff,$ff

#BLK
	!source "4main_glob.inc"
	*=main

#BLK
	!source "../loader/loader_glob.inc"
	*=loader_off
#BLK
	!source "../loader/loader_glob.inc"
	*=loader_off
