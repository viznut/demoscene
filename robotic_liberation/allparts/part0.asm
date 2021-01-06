#BLK

; virginize $1000..$1fff by looping in tapebuffer

!source "../loader/loader_glob.inc"
*=loader_loop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLK $1000

; pituus oli ainakin joskus 017c - eli jee: saadaan playeripaske kahteen
; sivuun

!sl "player_glob.inc"
!source "../glob.inc"
!source "../loader/loader_glob.inc"
!source "../lib/player.asm"

#BLK
!source "player_glob.inc"
!sl "musicpat00.inc"
*=songdata

	muteseq:
	drummuteseq:
	!byte nMUTE
	!byte <(muteseq-*)

	bass0seq:
	!byte nC1+nDBL,nC1+nDBL,nC2,nC1,nC2,nC1
	!byte <(bass0seq-*)

	cobass0seq:
	!byte nC1+nDBL,nC2,nC1+nDBL,nMUTE,nC2,nMUTE
	!byte nC1,nMUTE,nC1,nMUTE,nC1+nDBL,nC2,nC1
	!byte <(cobass0seq-*)

	shape0seq:
	!byte nC1,nC1,   nDp1,   nAp0
	!byte nC1,nC1,   nDp1,   nAp0
	;!byte nC1+6, nC1+6, nDp1+6, nAp0+6
	;!byte nC1+6, nC1+6, nDp1+6, nAp0+6
	!byte <(shape0seq-*)

#BLKV
!source "musicpat00.inc"
*=chctr

chctr	!byte  3,3,3,2,2,2 ; ,1
chtempo	!byte 12,6,6,12,255,6*16 ; ,6*32
chptr	!byte bass0seq-songdata
	!byte cobass0seq-songdata ; cobass0seq-songdata
	!byte muteseq-songdata ; melo0seq-songdata
	!byte drummuteseq-songdata
	!byte muteseq-songdata
	!byte shape0seq-songdata
	;!byte design0seq-songdata
chwave	!byte $81,$94,$82 ; 8e ; $80,$24,$24

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLK $1200

!source "player_glob.inc"
!source "../loader/loader_glob.inc"

	lda #0
	sta trackcmd
	lda #16
	sta loader_bpf
	sei

	; ldx #$ff txs

.l5	lda $9004
	bne .l5

	lda #$07

	sta $900e
	lda #3
	sta $9003
	lda #70
	sta $9001
	lda #$fe
	sta $9005

	ldx #19
.l4	
	  lda #0 ; 0
	  sta $9600-1,x
	dex
	bne .l4


.hoo_inx
	ldx .xtmp
	inx
	cpx #19
	bne .zuuz

	  ldx #19
.l3	  lda introtext-1,x
	  introtxtptr=*-2
	  ora #32
  	  sta $1e00-1,x
	  dex
	  bne .l3

	  lda fadecolptr
	  eor #(<fadecolors) XOR (<fadecolors+5)
	  sta fadecolptr
	  cmp #(<fadecolors)
	  beq .zuuz

	    clc
	    lda introtxtptr
	    adc #19
	    sta introtxtptr

.zuuz	stx .xtmp

	ldy #4
	sty .ytmp

.hoo_iny
	ldx #18
	.xtmp=*-1

	ldy #4
	.ytmp=*-1

	;;;

	lda #69
.waitl	cmp $9004
	bne .waitl

	lda fadecolors+5,y
	fadecolptr=*-2
	sta $9600,x

	  jsr player
	  jsr testquit
	  jsr loader_irq

	dec .ytmp
	bpl .hoo_iny

	bmi .hoo_inx

fadecolors:
	!byte 1,7,5,3,6
	!byte 0,6,3,5,7

;;;;;;;;;;;;;;;;;;;;;;

!zone testquit
testquit:
	lda #32
	bit $9111
	bne .o0

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

introtext:

	!scr "@@@@pwp@presents@@@"
	!scr "@@at@assembly@",27,28,28,29,"@"
	!scr "@@another@demo@for@"
	!scr "@@unexpanded@vic@",27,28
	!scr "@@@"

;	!scr "@@@@@@@@@@@@@@@@@@@"

#BLK $1a00

	!source "font.inc"

#BLK $1200

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;; SHOW LOGO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#BLK $9400
!source "logo.col.inc"

#BLK $1c00
!source "logo.scr.inc"

#BLK $1600
!source "logo.ras.inc"

#BLK $1800
!source "logo.chr.inc"

#BLK $1700
!source "army.ras.inc"


#BLK $1400

;	while viewing pixx:
;	1600..17ff	rastertabs
;	1800..1bff	charset
;	1c00..1dff	pic #0
;	1e00..1fff	pic #1

;	viewer $1400..$15ff or sumthg

;	player & viewer must fit in 1000..11ff - no way

;;;;;;;;;;;;;;;;;;

;	lda #$0
;	sta mask

;	ldx #160	; # scanlines (rasters at 1..160 upside down)

;;;;;;;;;;;;;;;;;;;

	!source "player_glob.inc"
	!source "../loader/loader_glob.inc"

	fade_ctr=99
	flash_ctr=98
	mask=97
	walk_ctr=96
	genframectr=95

	jmp main

!zone viewer
viewer:
	.tmp=255

	inc genframectr

	lda #7
	bit genframectr
	bne .noanim

	ldx walk_ctr
	bmi .noanim

	inx
	cpx #5
	bne .al0
	ldx #0
.al0	stx walk_ctr

	ldy #7

.al1	lda .animx0,x
	sta $1c00+25*12,y
	lda .animx1,x
	sta $1c00+25*13,y

	dex
	bpl .al2
	ldx #4
.al2
	dey
	bpl .al1

.noanim
	ldx flash_ctr
	beq .noflash

	lda .flash_f-1,x
	sta $900f
	lda .flash_1-1,x
	sta $9001
	dec flash_ctr

.noflash

	lda fade_ctr
	beq .c5

	dec fade_ctr
	lda #7
	bit fade_ctr
	bne .c4

	lda mask
	eor #$01
	jmp .c6
	

.c4	lda mask
	asl
	adc #0
.c6	sta mask
.c5


rastablast:
                lda $9001	 
		clc
		adc #<(-6)
.ll0            cmp $9004       ; wait until at given rasterline
                bne .ll0         ; bail out 3..9 clocks after $9004 change
                                ; first cmp must occurr 71-3-4=64 clks later

                lda $9003       ; -4 (60)
                ldy #11          ; -2 (58)  -1 no matter

.m1              ldx #16         ; wait 57
.m2              dex
                dex
                bne .m2

                cmp $9003       ; +4
                beq *+2         ; +3 if equal, +2 if not equal
                eor #$80        ; +2
                dey             ; +2
                bne .m1          ; +3 -> total 71 if adjusted, 70 if not

	nop

	ldx #0

.l0	lda mask	; 3
	asl		; 2
	adc #0		; 2
	sta mask	; 3
	and #$80	; 2
	ora #25		; 2
	sta .tmp	; 3  2bstored@$9002
			;17 total

	bmi .c1		; 2
	lda $1600,x	; 4
	jmp .c2		; 3
.c1	lda $1700,x	; 3+4
	nop		; 2
.c2			; 9 total

	pha		; 3
	and #$f0	; 2
	ora #$08	; 2
	tay		; 2  2bstored@$900f
	pla		; 4
	asl		; 2
	asl		; 2
	asl		; 2
	asl		; 2
	ora #$7		; 2 
			;25 total

	sta $900e	; 4
	sty $900f	; 4
	lda .tmp	; 3
	sta $9002	; 4
			;16 total (need rastablast?)

	inx		; 2
	cpx #160	; 2
	bne .l0		; 3
			; 5 total

			; 71 TOTAL - exactly what we need
	rts

.B=48
.flash_f
	;      0   1   2   3   4   5   6   7   8   9   a   b   c   d   e
	!byte $08,$6e,$ee,$3b,$3b,$bb,$bb,$19,$bb,$19,$19,$bb,$19,$08,$19
.flash_1
	!byte .B-0, .B+1, .B-2, .B+3, .B-4, .B+5, .B-6, .B+7
	!byte .B-8, .B+9, .B-10,.B+11,.B-12,.B+13,.B-14,.B+15
.animx0
	!byte 82-53,83-53,84-53,85-53,81-53
.animx1
	!byte 87-53,88-53,89-53,90-53,86-53


!zone main

	main:

	lda #8
	sta loader_on_bpf
	sta loader_bpf

	;lda #40
	;sta $9001
	lda #8
	sta $9000
	;lda #25
	;sta $9002
	lda #40
	sta $9003
	lda #$fe
	sta $9005

	;;;;;;;;;;;;;;;;;;;

	lda #0
	sta fade_ctr
	sta mask
	lda #$ff
	sta walk_ctr

	;;; LOGO: 3 flashes, 1 no-flash ;;;

	jsr flashloop3

	;;; ARMY: start loader after fadein (loads CITY) ;;;

	lda #64
	sta fade_ctr

	;cli

	ldx #6*11
	jsr frames

	jsr loader_on

	ldx #6*5
	jsr frames

	ldy #2
	jsr flashloopn

	;;; CITY: start loader after fadein (loads KING) ;;;

	lda #64
	sta fade_ctr

	lda #0
	sta walk_ctr

	ldx #6*16
	jsr frames

	jsr loader_on

	ldx #12*16
	jsr frames

	ldx #6*16
	jsr frames

;	ldx #12*16
;	jsr frames

	;sei

	;;; and do fadezz

	lda #64
	sta fade_ctr

	ldx #12*16
	jsr frames

	jsr loader_on ; load $1c00..$1dff

	;cli

	lda #0		; ???
	sta chstat+3
	sta chstat+0
	sta chstat+1

	ldx #12*16
	jsr frames

	;sei

	;;; ELITEDOM

	ldx #0
.l0	sta $9400,x
	sta $9500,x
	sta $1600,x
	dex
	bne .l0

	lda #64
	sta fade_ctr

	lda #$fe
	sta walk_ctr
	sta $900a
	sta $900b
	sta $900c
	lda #$7e	
	sta $900d

	ldx #$40
.pippi	jsr frames2

;	ldx #$40
;.puppe	lda $9004
;	cmp $9004
;	bne .puppe
;.pappi	dey
;	bne .pappi
;	dex
;	bne .puppe

	;;;; OR: jmp loader_loop ;;;;

	ldx #0
	stx $9002
	ldx #$ff
	txs
	jmp loader_loop

;.possu	ldx #6*16
;	jsr frames
;	jsr testquit
;;	jmp .possu

flashloop3:
	ldy #3 ; 3	; 3 flashes
flashloopn:
.poo	lda #15
	sta flash_ctr

	ldx #6*16
	jsr frames

	dey
	bne .poo

	ldx #6*16
	jmp frames

	;;;;;;;;;;;;;;;;;;;

!zone frames
frames:
	stx 253
	sty 252
.l0	jsr viewer
	jsr player
	jsr testquit
	jsr loader_irq
	dec 253
	bne .l0
	ldy 252
	rts

!zone frames2
frames2:
	stx 253
.l0	jsr viewer
	ldx $900a
	dex
	dex
	stx $900a
	stx $900b
	stx $900c
	jsr testquit
	jsr loader_irq
	dec 253
	bne .l0
	rts

!zone testquit
testquit:
	lda #32
	bit $9111
	bne .o0

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

;				
;			    27 vai 28? oleta 28, ts. -53
;	82   83   84   85   81
;	87   88   89   90   86
;	***. .*** ..** *..* **..


;	82	***.  p‰‰	87
;	83	.***  p‰‰	88
;	84	..**  p‰‰	89
;	85	*..*  p‰‰	86
;	86	**..  p‰‰	90		
 

;	108

;	81

;	f0	f1	f2	f3
;	82	83	84	85
;	87	88	89	86




#BLK

!source "musicpat00.inc"
!sl "musicpat0.inc"
*=shape0seq

;	muteseq:
;	drummuteseq:
;	!byte nMUTE
;	!byte <(muteseq-*)
;
;	bass0seq:
;	!byte nC1+nDBL,nC1+NDBL,nC2,nC1,nC2,nC1
;	!byte <(bass0seq-*)
;
;	cobass0seq:
;	!byte nC1,nC1,nC2,nC1+nDBL,nMUTE,nC2,nMUTE
;	!byte nC1,nMUTE,nC1,nMUTE,nC1+nDBL,nC2,nC1
;	!byte <(cobass0seq-*)
;
	shape0seq:	; UNUSED
	!byte nC1,nC1,   nDp1,   nAp0
	!byte nC1,nC1,   nDp1,   nAp0
	;!byte nC1+6, nC1+6, nDp1+6, nAp0+6
	;!byte nC1+6, nC1+6, nDp1+6, nAp0+6
	!byte <(shape0seq-*)

	shape1seq:
	!byte nC1,nC1,   nDp1,   nAp0
	!byte nC1,nC1,   nDp1,   nAp0
	!byte nC1+6,nC1+6, nDp1+6, nAp0+6
	!byte nC1+6,nC1+6, nDp1+6, nAp0+6
	!byte <(shape1seq-*)

	drum0seq:
	!byte nDR2,nDR2,nDRN,nDRN
	!byte nDR1,nDRN,nDR0,nDR1
	!byte <(drum0seq-*)

	melo0seq:
	!byte nC1+nDBL, nC1+nDBL ; +nDBL   ,nC1+nDBL
	!byte nC1,  nNONE,nNONE+nDBL
	!byte nMUTE+nDBL, nG1,  nNONE
	!byte nDp1, nNONE,nD1,  nNONE

	!byte nC1+nDBL, nC1+nDBL ; +nDBL   ,nC1+nDBL
	!byte nC1,  nNONE,nNONE+nDBL
	!byte nMUTE+nDBL, nG1,  nNONE
	!byte nDp1, nNONE,nD1,  nNONE

	!byte nC1+nDBL,   nC1+nDBL
	!byte nC1,  nNONE,nNONE+nDBL
	!byte nMUTE+nDBL, nD1,  nNONE
	!byte nC1,  nD1,  nC1,  nD1

	!byte nC1,  nNONE,nNONE+nDBL
	!byte nF1,  nG1,  nF1,  nG1
	!byte nC1,  nG1,  nF1,  nG1
	!byte nC1,  nG1,  nF1,  nG1
	!byte <(melo0seq-*)

#BLKV
!source "musicpat0.inc"
*=trackcmd
	!byte 1 ; setptrs
#BLK
!source "musicpat0.inc"
*=trackcmd+1
	!byte 3,3,3,2,2,2
	!byte 12,6,6,12,255,6*16

	!byte bass0seq-songdata
	!byte cobass0seq-songdata
	!byte melo0seq-songdata
	!byte drum0seq-songdata
	!byte muteseq-songdata
	!byte shape1seq-songdata

	!byte $81,$94,$82

#BLK
	!source "../loader/loader_glob.inc"
	*=loader_off

#BLK $1400

#BLK $1e00
	!source "army.scr.inc"

#BLK $1800
	!source "army.chr.inc"

#BLK $9600
!source "army.col.inc"

#BLK
	!source "../loader/loader_glob.inc"
	*=loader_off

#BLK $1c00
	!source "city.scr.inc"

#BLK $1800
	!source "city.chr.inc"

#BLK $1600
	!source "city.ras.inc"

#BLK $9400
	!source "city.col.inc"

#BLK
	!source "../loader/loader_glob.inc"
	*=loader_off

#BLKV $1e00
	!source "king.scr.inc"

#BLK $1800
	!source "king.chr.inc"

#BLK $1700
	!source "king.ras.inc"

#BLK $9600
	!source "king.col.inc"

#BLK
	!source "../loader/loader_glob.inc"
	*=loader_off

#BLK
	!source "../loader/loader_glob.inc"
	*=loader_off


