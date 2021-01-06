!source "../loader/loader_glob.inc"
!cpu 6510

;;;;;;;;;;;;;;;;;;;;; some macros and stuff ;;;;;;;;;;;;;;;;;;;;;;;;;;;

; undocumented opcodes

!zone macros
!macro AXSabs .axst {
   !byte $8f
   !word .axst
}

!macro ASO0 .asot {
   !byte $07,.asot
}

!macro ANCI .imm {
    !byte $0b,.imm
;    and #.imm
}

!macro wait .clocks {	; safe with 14..80
   jsr wait14-(.clocks-14)
}

!macro nocross .length {
  !if ((*&255)>255-.length) {
     !align $ff,0
  }
}

screenyposition=38

mcstart_pimpom
	sei

	lda #$9
	sta $900f
	sta $900e

	lda #$fe
	sta $9005

	lda #screenyposition
	sta $9001

	lda #50
	sta $9003

	ldx #0
.uuzx	lda #0
	sta colmem0,x
	sta colmem1,x
	sta segc,x
	lda #4
	sta segs,x
	lda #4
	sta segw,x
	lda #4
	sta scrmem0,x
	sta scrmem1,x
	dex
	bne .uuzx

	ldx #20
	lda #$80
.l9582	sta 169,x
	dex
	bne .l9582

;	lda #0
;	sta prevcurry

;;;;;;;;;;;;;;;;;;;;;;;; MAINLOOP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!zone mainloop:

mainloop

	ldy #4

.ml0	ldx #4*16
	jsr doframes

	lda #1
	sta roadcurvature

	ldx #5*16
	jsr doframes

	lda #254
	sta roadcurvature

	;ldx #3*16
	;jsr doframes

	dey
	bne .ml0

	lda #0
	sta roadcurvature

	lda #$c8
	sta newhorizonposition

	dec roadbumpiness

	ldx #6*16*2
	jsr doframes

	inc roadbumpiness

	ldy #chData_melody-chData-1
	sty chInitPointers
	iny
	sty chPointers 

	dec roadcurvature

	ldx #3*16
	jsr doframes

	lda #$c0
	sta newhorizonposition

	lda #3
	sta roadcurvature

	ldx #3*8
	jsr doframes

	lda #255
	sta roadcurvature
	inc roadbumpiness

	lda #3*8
	jsr doframes

	lda #0
	sta roadcurvature
	dec roadbumpiness

	ldx #3*16
	jsr doframes

	;; some bumps while going up

	jsr makebumps

	;; then some straight

	jsr dosomeframes
	;ldx #9*16
	;jsr doframes

	;; ... and after this we go down!!!!!

	ldy #2

.ogf	dec roadbumpiness
	ldx #3*4
	jsr doframes
	inc roadbumpiness

	lda #$e0 ; f0
	sta newhorizonposition

	jsr dosomeframes
	jsr dosomeframes

	lda #$c0
	sta newhorizonposition

	;;; .. and up

	inc roadzspeedhi
	inc roadbumpiness
	jsr dosomeframes
	dec roadbumpiness

	cpy #1
	bne .gou
	lda #chData_melody2-chData-1
	sta chInitPointers
	inc roadcurvature
.gou

	jsr dosomeframes

	dey
	bne .ogf

	;;;

	lda #0
	sta roadcurvature

	ldy #0
	ldx #128
	jsr doframes

	jsr makebumps

	ldx #128
	jsr doframes

	lda #$dc
	sta newhorizonposition
.endloop
	jsr psysky
	jsr makebumps
	dec roadbumpiness
	ldx #6*8
	jsr doframes
	jsr psysky
	jsr dosomeframes
	;jsr makebumps
	inc roadbumpiness
	inc roadcurvature
	ldx #6*8
	jsr doframes
	jsr psysky
	dec roadcurvature
	ldx #6*4+8
	jsr doframes
	lda #1
	sta roadcurvature
	ldx #6*4+8
	jsr doframes
	dec roadcurvature
	inc roadzspeedhi
	jmp .endloop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.itsover
	lda #$22
	sta $900f
	lda #0
	sta $9002
	sta $900c
	sta $900d
	lda #$80
	sta $900b
	lda #$BF
	sta $900a

.hu0	lda $9004
	beq .hu0
.hu1	lda $9004
	bne .hu1
	dec $900d
	bmi .hu0
	jmp loader_loop

psysky:
	ldx #4
.kyh
	lda #2
	sta rasc,y
	lda #$20
	sta roadcols,y
	iny
	cpy #32
	beq .itsover
	dex
	bne .kyh
	rts

makebumps
	tya
	pha
	ldy #4

.pif	inc roadbumpiness
	ldx #3*4
	jsr doframes
	dec roadbumpiness
	ldx #3*4
	jsr doframes
	dey
	bne .pif

	pla
	tay

dosomeframes:
	ldx #6*16
doframes:
	jsr doframe
	dex
	bne doframes
	rts

doframe:
	pha
	tya
	pha
	txa
	pha

	;inc $900f
	jsr drawroad
	;dec $900f

	lda $9004
	bmi .noframeskip
	cmp #screenyposition-7
	bcc .noframeskip
	jsr perframestuff
.noframeskip
	jsr segmenter_do
	jsr perframestuff

;	lda #8
;	sta $900f
	pla
	tax
	pla
	tay
	pla
	rts


;;;;;;;;;;;;;;;;;;;;;;;; DRAW ROAD ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ztab:	; todo: persp

	; 60 steps:  255 / (i+c)


; perl -e 'for($i=0;$i<60;$i++){print int((255*8)/($i+8))-30,", ";}' |less

	!byte 225, 196, 174, 155, 140, 126, 115, 106, 97, 90, 83, 77, 72, 67
	!byte 62, 58, 55, 51, 48, 45, 42, 40, 38, 35, 33, 31, 30, 28, 26, 25
	!byte 23, 22, 21, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 10, 9, 8
	!byte 7, 7, 6, 5, 5, 4, 4, 3, 2, 2, 1, 1, 0, 0

roadcols:
;	!byte $f0,$f0,$f0,$10,$10,$f0,$f0,$f0
;	!byte $f0,$f0,$90,$90,$80,$80,$20,$20
;	!byte $00,$00,$00,$00,$00,$00,$00,$00
;	!byte $20,$20,$80,$80,$90,$90,$f0,$f0

	!byte $f0,$f0,$f0,$10,$10,$f0,$f0,$f0
	!byte $f0,$f0,$90,$90,$90,$90,$80,$80
	!byte $80,$80,$20,$20,$80,$80,$80,$80
	!byte $90,$90,$90,$f0,$f0,$f0,$f0,$f0

; 1 f d 5

	; TODO CHANGE COLORS

;	!byte 59,58,57,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41
;	!byte 40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22
;	!byte 21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0

roadx:
	!fill 256,0
;	!byte 44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,58,59,60,61,62
;	!byte 63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82
;	!byte 83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100
;	!byte 101,102,103,104,105,106,107,108,109,110,111,112,113,114,115
;	!byte 116,117,118,119,120,121,122,123,124,125,126,127,128
;	!byte 128,127,126,125,124,123,122,121,120,119,118,117,116,115,114
;	!byte 113,112,111,110,109,108,107,106,105,104,103,102,101,100
;	!byte 99,98,97,96,95,94,93,92,91,90,89,88,87,86,85,84,83,82,81,80
;	!byte 79,78,77,76,75,74,73,72,71,70,69,68,67,66,65,64,63,62,61,60
;;	!byte 59,58,57,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41,40
;	!byte 39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20
;	!fill 19,19

; perl -e 'for($i=0;$i<256;$i++){print int(50+sin(2*3.1416*$i/256)*50),", ";}'
;!byte 50, 51, 52, 53, 54, 56, 57, 58, 59, 60, 62, 63, 64, 65, 66, 67, 69, 70, 71
;!byte 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 87, 88, 89, 90
;!byte 90, 91, 92, 92, 93, 94, 94, 95, 95, 96, 96, 97, 97, 97, 98, 98, 98, 99, 99, 99
;!byte 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 98, 98, 98, 97, 97, 97
;!byte 96, 96, 95, 95, 94, 94, 93, 92, 92, 91, 90, 90, 89, 88, 87, 87, 86, 85, 84, 83
;!byte 82, 81, 80, 79, 78, 77, 76, 75, 74, 73, 72, 71, 70, 69, 67, 66, 65, 64, 63, 62
;!byte 60, 59, 58, 57, 56, 54, 53, 52, 51, 49, 48, 47, 46, 45, 43, 42, 41, 40, 39, 37
;!byte 36, 35, 34, 33, 32, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16
;!byte 15, 14, 13, 12, 12, 11, 10, 9, 9, 8, 7, 7, 6, 5, 5, 4, 4, 3, 3, 2, 2, 2, 1, 1
;!byte 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 4
;!byte 4, 5, 5, 6, 7, 7, 8, 9, 9, 10, 11, 12, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21
;!byte 22, 23, 24, 25, 26, 27, 28, 29, 30, 32, 33, 34, 35, 36, 37, 39, 40, 41, 42, 43
;!byte 45, 46, 47, 48

roady:
	!fill 256,0

;	!byte 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
;	!byte 24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43
;	!fill 256-43,43


;	!byte 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
;	!byte 24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43
;	!byte 44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,58,59,60,61,62
;	!byte 63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82
;	!byte 83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100
;	!byte 101,102,103,104,105,106,107,108,109,110,111,112,113,114,115
;	!byte 116,117,118,119,120,121,122,123,124,125,126,127,128
;	!byte 128,127,126,125,124,123,122,121,120,119,118,117,116,115,114
;	!byte 113,112,111,110,109,108,107,106,105,104,103,102,101,100
;	!byte 99,98,97,96,95,94,93,92,91,90,89,88,87,86,85,84,83,82,81,80
;	!byte 79,78,77,76,75,74,73,72,71,70,69,68,67,66,65,64,63,62,61,60
;	!byte 59,58,57,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41,40
;	!byte 39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20
;	!fill 19,19

;	!fill 16,1
;	!fill 16,2
;	!fill 16,3
;	!fill 16,4
;	!fill 16,5
;	!fill 16,6
;	!fill 16,7
;	!fill 16,8
;	!fill 16,9
;	!fill 16,10
;	!fill 16,11
;	!fill 16,12
;	!fill 16,13
;	!fill 16,14
;	!fill 16,15
;	!fill 16,16

;	!fill 64,10
;	!byte 11,11,11,11
;	!byte 12,12,12,12
;	!byte 13,13,13,13
;	!byte 14,14,14,14
;	!byte 15,15,15,15
;	!byte 16,16,16,16
;	!byte 17,17,17,17
;	!byte 18,18,18,18
;	!byte 19,19,19,19
;	!byte 20,20,20,20
;
;	!byte 21,22,23,24,25
;	!byte 26,27,28,29,30
;	!byte 30,30,30,30,30
;	!byte 30,30,30,30,30
;
;	!fill 118,20
;
;	!byte 19,18,17,16,15,14,13,12,11,10

;!byte 50, 51, 52, 53, 54, 56, 57, 58, 59, 60, 62, 63, 64, 65, 66, 67, 69, 70, 71
;!byte 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 87, 88, 89, 90
;!byte 90, 91, 92, 92, 93, 94, 94, 95, 95, 96, 96, 97, 97, 97, 98, 98, 98, 99, 99, 99
;!byte 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 98, 98, 98, 97, 97, 97
;!byte 96, 96, 95, 95, 94, 94, 93, 92, 92, 91, 90, 90, 89, 88, 87, 87, 86, 85, 84, 83
;!byte 82, 81, 80, 79, 78, 77, 76, 75, 74, 73, 72, 71, 70, 69, 67, 66, 65, 64, 63, 62
;!byte 60, 59, 58, 57, 56, 54, 53, 52, 51, 49, 48, 47, 46, 45, 43, 42, 41, 40, 39, 37
;!byte 36, 35, 34, 33, 32, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16
;!byte 15, 14, 13, 12, 12, 11, 10, 9, 9, 8, 7, 7, 6, 5, 5, 4, 4, 3, 3, 2, 2, 2, 1, 1
;!byte 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 4
;!byte 4, 5, 5, 6, 7, 7, 8, 9, 9, 10, 11, 12, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21
;!byte 22, 23, 24, 25, 26, 27, 28, 29, 30, 32, 33, 34, 35, 36, 37, 39, 40, 41, 42, 43
;!byte 45, 46, 47, 48

;	!byte 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
;	!byte 15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0
;	!byte 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
;	!byte 15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0
;	!byte 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
;	!byte 15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0
;	!byte 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
;	!byte 15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0
;	!byte 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
;	!byte 15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0
;	!byte 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
;	!byte 15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0
;	!byte 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
;	!byte 15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0
;	!byte 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
;	!byte 15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0

!zone interpol:

interpol:
	; lo hi tlo thi
	; 0  1  2   3

	clc

	lda 0,x
	adc 2,x
	sta 0,x

	lda 1,x
	adc 3,x
	ror
	sta 1,x

	ror 0,x
rts

;;;;;;;;;;;;;;;;;;;;;; SYNC RASTERS ;;;;;;;;;;;;;;;;;;;;;;;;;;;

!zone segmenter

!if (>(*+225) != >*) {
  !align $ff,0,$ea
}

segmenter_do:

;		lda #0
;		sta segc+127
rastablast:
                lda #38-6	  ; $0d = start of screen
.ll0            cmp $9004       ; wait until at given rasterline
                bne .ll0         ; bail out 3..9 clocks after $9004 change
                                ; first cmp must occurr 71-3-4=64 clks later

                lda $9003       ; -4 (60)
                ldy #11         ; -2 (58)  -1 no matter

.m1             ldx #16         ; wait 57
.m2              dex
                dex
                bne .m2

                cmp $9003       ; +4
                beq *+2         ; +3 if equal, +2 if not equal
                eor #$80        ; +2
                dey             ; +2
                bne .m1          ; +3 -> total 71 if adjusted, 70 if not

	nop
	nop
	nop
	nop
	ldy #skip_from_top+1

	; nollaus-st$9002 siirrettävä +8

;;;;;;;;;;;;;;;;;;;;; EVEN DOUBLELINE ;;;;;;;;;;;;;;;;;;;;;;;



	;;; init loop

	NULLCHAR=4
	.tmp=255
	.tmp2=252
	cwidth0=254
	cwidth1=253
	colmem0=$9400
	colmem1=$9600
	scrmem0=$1c00
	scrmem1=$1e00
	segw=$1c40 ; 1c40
	segc=$1d40 ; 1d40	
	segs=$1e40 ; 1e40

.l0	
	;;; Remove previous padder: 10 clocks			18 here

	lda #NULLCHAR	;2
	ldx cwidth0	;3  O
	sta scrmem0-1,x	;5  O	scrmem[cwidth-1]=NULLCHAR

	;;; SCHEDULE: 2*71-84 == 58
	;   CORR:     2*71-95 == 47

	;jsr wait42	; PIMPOM
	;42-31+2=13
	pha
	pla
	nop
	nop
	nop

	;;; Raster color lookup ;;;

	tya		; 2     y+rasydelta
	clc		; 2
	adc #<-30	; 2
	rasydelta0=*-1
	; and #127 ok?? not here (need possibility for bigger thingz)
	tax		; 2

	lda segclkup,x	; 4     segclkup[y+rasydelta]+raszdelta
	clc		; 2
	adc #0		; 2
	raszdelta0=*-1
	and #31		; 2
	tax		; 2

	lda rasc,x	; 4
	;lda segc,y
	ora segc,y	; 4
	sta .tmp2	; 3	31 total

	;;; Set new padders (also calc cwidth for later use): 40(42*) clocks
	;..58

	lda segs,y	;4
	+ANCI 3		;2	pstart=start&3
	sta scrmem0	;4  O
	adc segw,y	;4
	sta .tmp	;3	pstart+width

	lsr		;2
	lsr		;2
	lsr		;2
	tax		;2
	;ora #$80	;   O
	sta cwidth0	;3  O	cwidth=(pstart+width)/8

	lda .tmp	;3
	and #7		;2
	ora #8		;2
	sta scrmem0-1,x	;5  O	scrmem[cwidth-1] = (pstart+width)&7)|8

	;;; Set colors for padders: 13 clocks
	;..71
	;  95

	;nop

	lda .tmp2	;3
	;lda segc,y;.tmp2;segc,y;3;4
	sta colmem0	;4  O
	sta colmem0-1,x	;5  O	colmem[0]=colmem[cwidth-1] = segc[y]&7

	;;; Set register values (color, screenpos, screenwidth): 24 clocks

	lda segs,y	;4
	lsr		;2
	lsr		;2
	sta $9000	;4	vic[$0]=segs[y]/4
	stx $9002	;4	vic[$2]=cwidth		SYNCPOINT

	lda .tmp2	;3
	;lda segc,y	;4

	sta $900f	;4	vic[$f]=segc[y]

;;;;;;;;;;;;;;;;;;; ODD DOUBLELINE ;;;;;;;;;;;;;;;;;;;;;;;;

	;;; TIME PADDING: next sta $9002 at +71

	iny		; 2

	;;; Remove previous padder: 10 clocks		18

	lda #NULLCHAR	;2
	ldx cwidth1	;3  O
	sta scrmem1-129,x;5  O	scrmem[cwidth-1]=NULLCHAR

	;;; Raster color lookup ;;;

	tya		; 2     y+rasydelta
	clc		; 2
	adc #<-30	; 2
	rasydelta1=*-1
	; and #127 ok?? not here (need possibility for bigger thingz)
	tax		; 2
	
	lda segclkup,x	; 4     segclkup[y+rasydelta]+raszdelta
	clc		; 2
	adc #0		; 2
	raszdelta1=*-1
	and #31		; 2
	tax		; 2

	lda rasc,x	; 4
	;lda segc,y
	ora segc,y	; 4
	sta .tmp2	; 3	31 total

	;;;;;;;;;;;;;;

	lda segs,y	;4
	+ANCI 3		;2	pstart=start&3
	sta scrmem1	;4  O
	adc segw,y	;4
	sta .tmp	;3	pstart+width

	lsr		;2
	lsr		;2
	lsr		;2
	ora #$80	;2  O
	tax		;2
	sta cwidth1	;3  O	cwidth=(pstart+width)/8

	;;; POPPO

	lda .tmp	;3
	and #7		;2
	ora #8		;2
	sta scrmem1-129,x;5  O	scrmem[cwidth-1] = (pstart+width)&7)|8


	;;; STORE 0 TO $9002 if at line #7/7 - total 11		71 - padd ok

	tya		; 2	swap x/y in whole code to be able to use xaa?
	and #1		; 2
	beq .c0		; \
	    nop		;  |

	    ;nop
	    ;nop
	    bne .c1	;  | eq: 3+4
.c0			;  | ne: 2+2+3
	    sta $9002	;  |			; CHG TO $9002 WHEN IN SYNC
	    ;sta $900f
.c1			; /

	;;; SCHEDULE

	;jsr wait32	; 71-24-15	; 2*71-108
	;jsr wait12	; 71-37   OK

	jsr wait15

	;wait4 (34-31+1)
;	nop
;	nop
;	jsr wait24

	;;; Set colors for padders: 13 clocks			

	nop

	lda .tmp2	;3
	;lda segc,y	;4
	sta colmem1	;4  O
	sta colmem1-129,x;5  O	colmem[0]=colmem[cwidth-1] = segc[y]&7

	;;; Set register values (color, screenpos, screenwidth): 24 clocks
	;	108

	lda segs,y	;4
	lsr		;2
	lsr		;2

	sta $9000	;4	vic[$0]=segs[y]/4
	stx $9002	;4	vic[$2]=cwidth		SYNCPOINT
	lda .tmp2	;3
	;lda segc,y	;4
	sta $900f	;4	vic[$f]=segc[y]

	;;; Finish loop: 8 clocks

	iny		;2
	bmi .done	;2
	jmp .l0		;3

segmenter_end
!warn "segmenter size = ",segmenter_end-segmenter_do
.done
	; remove padders

	lda #0
	sta $900f
	sta $9002

	lda #NULLCHAR	;2
	ldx cwidth0	;3  O
	sta scrmem0-1,x	;5  O	scrmem[cwidth-1]=NULLCHAR
	ldx cwidth1
	sta scrmem1-129,x

;	lda #NULLCHAR	;2
;	ldx cwidth0	;3  O
;	sta scrmem0-1,x	;5  O	scrmem[cwidth-1]=NULLCHAR

.rts	rts

;	charset $1800-
;	scrmem0 $1c00-  colmem0 $		<32 bytes
;	scrmem1 $1e00-	colmem1 $9600-		<32 bytes

;	max writeranges: $1bff..$1c3e, $1dff..$1e3e

wait55	;;; 23

	nop
	ldx #4
.w0	dex
	bne .w0


wait42		; +13	
	nop
	nop
	nop
	nop	; 13

wait34

	; 22!

	nop
	nop
	nop
	nop
wait26
	pha
	pla
wait19
	pha
	pla
wait12
	rts		; 12
wait15
	cmp 0
	rts
wait24
	jsr wait12
	rts


!if ( >(*+32) != >*) {
   !warn "rasc aligned to different page, leaving a hole of ",256-(<*)," bytes"
   !align $ff,0,$eb
}
rasc:

	!byte $6,	$05
	!byte $6,	$05
	!byte $6,	$05
	!byte $6,	$05
	!byte $6,	$05
	!byte $6,	$05
	!byte $6,	$05
	!byte $6,	$05
	!byte $3,	$05
	!byte $3,	$05
	!byte $3,	$05
	!byte $3,	$05
	!byte $3,	$00
	!byte $3,	$00
	!byte $3,	$00
	!byte $3,	$00

;;;;;;;;;; FREE 189 bytes

perframestuff
	;lda #10
	;sta $900f
	jsr musicplayer
	;lda #8
	;sta $900f

makenewroad

	clc
	lda #0
	.roadzlo=*-1
	adc #0
	roadzspeedlo=*-1
	sta .roadzlo
	adc #2
	roadzspeedhi=*-1
	tay
	beq .noadvance
.mnrloop
	ldx roadz0

	lda #0
	.curroadx=*-1

	clc
	adc #$00
	roadcurvature=*-1
.hob	sta .curroadx
;	bpl .hobb
;	eor #$ff
;.hobb
	sta roadx,x

	lda #0
	.curroady=*-1

	clc
	adc #$00
	roadbumpiness=*-1
hpb	sta .curroady
	bpl .hpbb
	eor #$ff
.hpbb
	sta roady,x

	inc roadz0  ; TODO: speed variance

	dey
	bne .mnrloop
.noadvance
	jmp calcroadparms


!warn "segclkup aligned to different page, leaving a hole of ",256-(<*)," bytes"
!align $ff,0,$ec ; 256 bytes of tab

segclkup
;!fill 4*16,$02
; 2 tai 3 per each alussa, jokin $10:n steppi lopussa

; for i in range(0,64): print hex(int(4096/(abs(i-64)+20))&0x7e),
!byte $60,$62,$62,$64,$66,$66,$68,$6a,$6a,$6c,$6e,$70,$70,$72,$74
!byte $76,$78,$7a,$7c,$7e,$0,$2,$4,$6,$8,$a,$c,$e,$12,$14,$16,$1a
!byte $1c,$20,$22,$26,$2a,$2e,$32,$36,$3a,$3e,$42,$46,$4c,$52,$56
!byte $5c,$62,$6a,$70,$78,$0,$8,$10,$1a,$24,$2e,$3a,$46,$54,$64
!byte $74,$6

; for i in range(64,128): print hex(1|(int(4096/(abs(i-64)+20))&0x7e)),
!byte $4d,$43,$3b,$33,$2b,$23,$1d,$17,$13,$d,$9,$5,$1,$7d,$79,$75
!byte $71,$6f,$6b,$69,$67,$63,$61,$5f,$5d,$5b,$59,$57,$55,$53,$51
!byte $51,$4f,$4d,$4b,$4b,$49,$47,$47,$45,$45,$43,$43,$41,$41,$3f
!byte $3f,$3d,$3d,$3b,$3b,$39,$39,$39,$37,$37,$35,$35,$35,$33,$33
!byte $33,$31,$31

;!byte $02*2,$02*2,$03*2,$03*2,$03*2,$03*2,$04*2,$04*2
;!byte $04*2,$05*2,$05*2,$05*2,$05*2,$06*2,$06*2,$06*2
;!byte $07*2,$07*2,$07*2,$08*2,$08*2,$08*2,$09*2,$09*2
;!byte $0a*2,$0a*2,$0b*2,$0b*2,$0c*2,$0c*2,$0d*2,$0d*2
;!byte $0e*2,$0e*2,$0f*2,$10*2,$10*2,$11*2,$12*2,$12*2
;!byte $13*2,$14*2,$15*2,$16*2,$17*2,$18*2,$19*2,$1a*2
;!byte $1c*2,$1d*2,$1f*2,$20*2,$22*2,$24*2,$26*2,$28*2,$2a,$2d,$30,$33,$36,$39,$3d,$00

;!byte 0x1e 0x1e 0x20 0x20 0x20 0x20 0x22 0x22 0x22 0x24 0x24 0x24 0x26 0x26 0x26
;!byte 0x28 0x28 0x2a 0x2a 0x2c 0x2c 0x2e 0x2e 0x30 0x30 0x32 0x32 0x34 0x36 0x38
;0x38 0x3a 0x3c 0x3e 0x40 0x42 0x44 0x46 0x4a 0x4c 0x50 0x52 0x56 0x5a 0x5e
;0x62 0x68 0x6e 0x74 0x7c 0x84 0x8c 0x96 0xa2 0xb2 0xc2 0xd6 0xf0 0x10 0x3a
;0x74 0xc6 0x48 0x32

;!byte $03,$07,$0a,$0d,$10,$13,$16,$18,$1a,$1c,$1e,$20,$22,$23,$24,$26
;!byte $27,$28,$29,$2a,$2b,$2c,$2d,$2e,$2e,$2f,$30,$31,$31,$32,$32,$33
;!byte $33,$34,$35,$35,$35,$36,$36,$37,$37,$38,$38,$38,$39,$39,$39,$3a
;!byte $3a,$3a,$3b,$3b,$3b,$3c,$3c,$3c,$3c,$3d,$3d,$3d,$3d,$3e,$3e,$3e

; 128 entries total
; abs(i-64)

;!byte $02,$02,$03,$03,$03,$03,$04,$04,$04,$05,$05,$05,$05,$06,$06,$06
;!byte $07,$07,$07,$08,$08,$08,$09,$09,$0a,$0a,$0b,$0b,$0c,$0c,$0d,$0d
;!byte $0e,$0e,$0f,$10,$10,$11,$12,$12,$13,$14,$15,$16,$17,$18,$19,$1a
;!byte $1c,$1d,$1f,$20,$22,$24,$26,$28,$2a,$2d,$30,$33,$36,$39,$3d,$00

;!byte $03,$07,$0a,$0d,$10,$13,$16,$18,$1a,$1c,$1e,$20,$22,$23,$24,$26
;!byte $27,$28,$29,$2a,$2b,$2c,$2d,$2e,$2e,$2f,$30,$31,$31,$32,$32,$33
;!byte $33,$34,$35,$35,$35,$36,$36,$37,$37,$38,$38,$38,$39,$39,$39,$3a
;!byte $3a,$3a,$3b,$3b,$3b,$3c,$3c,$3c,$3c,$3d,$3d,$3d,$3d,$3e,$3e,$3e

*=$1800

!fill 8,%00000111	; 0
!fill 8,%00000011	; 1
!fill 8,%00000001	; 2
!fill 8,%00000000	; 3

!fill 8,%11111111	; 4
!fill 8,%11111111	; 5 UNUSED
!fill 8,%11111111	; 6 UNUSED
!fill 8,%11111111	; 7 UNUSED

!fill 8,%00000000	; f
!fill 8,%10000000	; e
!fill 8,%11000000	; d
!fill 8,%11100000	; c
!fill 8,%11110000	; b
!fill 8,%11111000	; a
!fill 8,%11111100	; 9
!fill 8,%11111110	; 8

!zone drawroad:

	y0hi=250
	y0lo=251
	x0hi=252
	x0lo=253
	curry=254

calcroadparms:

	;; x0 autocenter. in game: x+=dx

	ldx roadz0
	lda #70
	sec
	sbc roadx,x
	sta x0hi
	lda #0
	sta x0lo

	;; y0 autocenter. in game

	ldx roadz0
	lda roady,x
	lsr
	eor #127
	sec
	sbc #48
	cameraycorrection=*-1
	;eor roady,x
	sta y0hi
	sta y0lo
	dec y0hi

	.tdx0hi=179
	.tdx0lo=178
	.idx0hi=171
	.idx0lo=170

	.tdy0hi=189
	.tdy0lo=188
	.idy0hi=181
	.idy0lo=180

	framectr=195

	;; dx0

	ldx roadz0 ; dex
	lda roady,x
	sec
	inx
	sbc roady,x
	clc
	adc #$7f
	sta .tdy0hi
	lda #$40
	camerayanglecorrection=*-1
	sta .tdy0lo

	;; dy0

	ldx roadz0 ; dex
	lda roadx,x
	sec
	inx
	sbc roadx,x
	clc
	adc #$81
	sta .tdx0hi
	lda #0
	sta .tdx0lo

	;; interpolations


	;  0   1   2   3   4   5   6   7
	; _lo _hi tlo thi
	;         _lo _hi tlo thi
	;                 _lo _hi tlo thi
	;  

	ldx #170
	jsr interpol
	ldx #172
	jsr interpol
	ldx #174
	jsr interpol
	ldx #176
	jsr interpol

	ldx #180
	jsr interpol
	ldx #182
	jsr interpol
	ldx #184
	jsr interpol
	ldx #186
	jsr interpol

	lda .idx0lo
	sta .dx0lo
	lda .idx0hi
	eor #$80
	sta .dx0hi

	lda .idy0lo
	sta .dy0lo
	lda .idy0hi
	eor #$80
	sta .dy0hi

;	lda .dy0hi
;	eor #$ff
;;	sta rasydelta0

	sec
	lda #0
	.zlo=*-1
	adc #$ff
	bgspeed=*-1
	sta .zlo
	bcc .nobgstep
	ldx raszdelta0
	inx
	inx
	stx raszdelta0
	stx raszdelta1
.nobgstep
	rts

drawroad:

	; kill previous horizon
	lda #0
	ldx #0
	prevhori=*-1
	sta segc,x
	sta segc+1,x
	sta segc+2,x

;	inc $900f

;	ldx #0
;	lda #0

;.uubv	lda #$e0
;	sta segc,x
;	lda #30
;	sta segw,x
;	lda #20
;	.pylly=*-1
;	sta segs,x
;	dex
;	bne .uubv

;	inc .pylly

;	rts

;	lda #$e0
;	ldx #0
;.xu	sta segc,x
;	dex
;	bne .xu

	;;;	

	road_width_additive=12
	skip_from_top = 50
	skip_really = skip_from_top
	lda #127-skip_from_top
	sta curry

	;;;	;;;	;;;	;;;	;;;	;;;

	ldy #52 	; num of steps	was 60

.l1	clc		; X = z0+ztab[y]
	lda ztab+7,y
	adc #00 ; z0
	roadz0=*-1
	tax

	tya
	asl ; clc
;	asl
	adc #road_width_additive
	sta .fillw	; fillwidth	tya asl adc #4  or sumthing

	lda x0lo	; fillx = roadx[X]+((x0+=dx0)>>8)
	adc #$00
	.dx0lo=*-1
	sta x0lo
	lda x0hi
	adc #$01
	.dx0hi=*-1
	sta x0hi
	clc
	adc roadx,x	; näihinkin x0lo:x0hi-systeemi
	sta .fillx

	lda roady,x
	lsr
	sta $ff

	lda y0lo	; Y = roady[X]+((y0+=dy0)>>8)
	adc #$00
	.dy0lo=*-1
	sta y0lo
	lda y0hi
	adc #$ff
	.dy0hi=*-1
	sta y0hi
	clc
	adc $ff

;	adc roady,x

	bpl .c0		; Y must be between 0..127

	adc #64		; 128..192 becomes 128, 192..255 becomes 0
	and #128

	;bcc .z11 ; <--- !!!
	; here: should be either 0 or 128 depending on stuff
	;lda #0
.c0
	pha

	txa		; GOLOUR
	and #31
	tax
	lda roadcols,x
	sta .fillc

	pla
	pha
	tax

.l0	cpx curry	; if(Y>curry) skip
	bcc .l00
	pla
	jmp .z12

.l00	lda #0		; buf[Y].c
	.fillc=*-1
	sta segc+skip_really,x
	lda #0
	.fillw=*-1
	sta segw+skip_really,x
	lda #0
	.fillx=*-1
	sta segs+skip_really,x

	inx
	cpx curry
	bcc .l00

.z1	pla
.z11	sta curry	; curry = saved Y
	beq .screenfull
.z12
	dey
	bne .l1
.screenfull

;	inc $900f

	ldx curry
;	stx rasydelta0
;	stx rasydelta1
	beq .fl0n0
	lda #0

.fl0	sta segw+skip_really,x
	dex
	bne .fl0


.fl0n0
;	ldx curry
;	stx prevcurry

	lda .dy0hi	; horizon = dy*8.0 + 64
;	sta $900f
;	eor #$ff
	sta rasydelta0
	.tmpx=169
	lda .dy0lo
;	eor #$ff
	sta .tmpx

	rol .tmpx
	rol rasydelta0
	rol .tmpx
	rol rasydelta0
	rol .tmpx
	rol rasydelta0
	rol .tmpx
	rol rasydelta0

	lda rasydelta0
	cmp #0
	.prevdelta=*-1
	beq .hops

	sta .prevdelta
	lda horizonposition
	sec
	adc #$dc
	newhorizonposition=*-1
	ror
	sta horizonposition
	lda .prevdelta

.hops	eor #$ff
	clc
	adc #$dc ; $d0 -- slightly up
	horizonposition=*-1
	sta rasydelta0
	sta rasydelta1
	eor #$ff
	clc
	adc #64
	bmi .nohor
	tax
	stx prevhori
	lda segc,x
	ora #$03
	sta segc,x
	lda segc+1,x
	ora #$07
	sta segc+1,x
	lda segc+2,x
	ora #$02
	sta segc+2,x
.nohor

;	asl
;	clc
;	adc #0 ; 64 ; 96
;	tax

	; ALSO: if horizon<curry then horizon=curry

	;;;;;;;;

;	lda .z0		; horizon = curry - roady[z0+225]
;	clc
;	adc #225
;	tax
;	lda roady,x
;	;eor #$ff
;	adc curry
;	tax

;	lda .dy0hi
;	clc	
;	adc #64
;	tax

;	lda #$10
;	sta segc,x
;	lda #1
;	sta segs,x
;	lda #220
;	sta segw,x

;	lda #8
;	sta $900f

	; fill 0..curry (the sky part)
	; TO -> fill prevcurry..curry

;	dec $900f

	rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

numberOfChannels=5
numberOfMelodyChannels=3
chidxNoise=3
chidxChord=4

voiceTmp=167

!zone musicplayer 
musicplayer:
  	;;; FETCH CHANNEL STATES ;;;

	ldx #numberOfChannels-1

	; tempo subdivide

.l0	dec chTempoCounters,x
	bne .nextCh

	; fetch data & increment pointer.
	; bit7=1 resets pointer instead of incrementing

.incPtr	ldy chPointers,x
	lda chData,y
	bpl .c1
	ldy chInitPointers,x
.c1	iny
	pha	; BLAEAEH
	tya
	sta chPointers,x
	pla

	asl	; channel state between 0..255, step 4
	asl
	sta chStates,x

	; reset tempocounter, bit0=1 doubles waitlength

	lda chTempos,x
	bcc .c2	
	asl
.c2	sta chTempoCounters,x

.nextCh	dex
	bpl .l0

	;;; PROCESS CHANNEL STATES ;;;

	;;; NOISE CHANNEL ;;;

	ldx chStates+chidxNoise
	lda noiseTable,x
	beq .nonoise
	inc chStates+chidxNoise
	sta $900d
.nonoise

	;;; MELODY CHANNELS ;;;

	ldx #numberOfMelodyChannels-1

.l9	lda chStates,x
	lsr
	lsr
	lsr
	php
	lsr
	php
	clc
	beq .silent
	adc chStates+chidxChord
.silent	tay
	lda pitches,y
	plp
	bcc .c0			; hibit = do octaveblip
	ror
.c0	plp
	bcc .c9
	ror
.c9
	; TODO setwave
	pha;sta voiceTmp,x  ; ->pha?

	lda chStates,x
	and #$F8
	sta chStates,x

	dex
	bpl .l9

	ldy #$c
.l3	pla
	tax ; ldx voiceTmp-$a,y ; ->pla?
	lda $9000,y
	bmi .nowave
	lda voiceWaves-$a,y
	bne .setwave
.nowave
	txa
	sta $9000,y
	jmp .nextVc
.setwave
	; x = initfreq
	; y = channel (a/b/c)
	; a = waveform
        TMP=$ff
        TMP2=$fe

        stx .initfreq   ; 4

.waved  sty .ch0        ; 4
        sty .ch1        ; 4
        ldx .ldfqmasks-$a,y ; 4
        sta TMP         ; 3

        ora #$7f        ; 2

        sax $900c       ; 4  [$900c] = a AND x
        .ch0=*-2
        sty TMP2        ; 3
        ldy #7          ; 2

.l6     lda #$7f        ; 2
        slo TMP         ; 5  asl tmp; a = [tmp] OR $7f
        sax $900c       ; 4  [$900c] = a AND x

        .ch1=*-2                 
        dey             ; 2
        bne .l6         ; 3

        lda #128        ; 2
        .initfreq=*-1
        nop             ; 2
        ldy TMP2        ; 3
.noset: sta $9000,y     ; 5

.nextVc	dey
	cpy #$9
	bne .l3
	rts

.ldfqmasks:
     !byte $fe  ; $900a - 1 x 16 clocks/bit
     !byte $fd  ; $900b - 2 x  8 clocks/bit
     !byte $fb  ; $900c - 4 x  4 clocks/bit
     !byte $fe

;;; this is used by fetcher ;;;

chStates	!byte 0,0,0,0, 0


nOct = 2
nBlip = 1
nEnd = 128
nDouble = 64
n0 = 0
n1 = 4 
n2 = 8
n3 = 12
n4 = 16
n5 = 20
n6 = 24
n7 = 28
n8 = 32

fHold = $7E
fC = $87
fCp = $8F
fD = $93
fDp = $9B
fE = $9F
fF = $A5
fFp = $AB
fG = $AF
fGp = $B3
fA = $B7
fAp = $BB
fB = $BF
fC2 = $C3
fD2 = $C9

fCu = $A5
fCpu = $AB
fDu = $AF
fDpu = $B3
fEu = $B7
fFu = $BB
fFpu = $BF
fGu = $C3
fGpu = $C9

chData
	!byte 128
chData_empty16
	!byte n0+nDouble
chData_empty14
	!byte n0+nDouble
chData_empty12
	!byte n0+nDouble
chData_empty10
	!byte n0+nDouble
chData_empty8
	!byte n0+nDouble
chData_empty6
	!byte n0+nDouble
chDate_empty4
	!byte n0+nDouble
chData_empty2
	!byte n0+nDouble+nEnd

chData_melodyPart0
chData_melody

	!byte n1+nBlip+nOct
	!byte n2+nBlip
	!byte n2
	!byte n1+nBlip+nOct
	!byte n2+nBlip
	!byte n2
	!byte n1+nBlip+nOct
	!byte n2+nBlip+nDouble

	;!byte n2
	!byte n1+nBlip
	!byte n2+nBlip+nDouble
	;!byte n2
	!byte n3+nOct+nDouble+nBlip
	!byte n4+nOct+nDouble
	!byte n5+nOct+nDouble+nBlip
	!byte n5+nOct
	!byte n6+nDouble,n6+nDouble,n6+nDouble,n6,n6+nDouble,n6+nBlip,n6+nBlip,n6+nBlip,n6+nBlip+nEnd

chData_melody2

	!byte n1+nOct+nBlip
	!byte n1+nBlip
	!byte n2+nBlip
	!byte n1+nOct+nBlip
	!byte n1+nBlip
	!byte n2+nBlip
	!byte n1+nOct+nBlip
	!byte n1+nBlip+nEnd

;	3 1 2 3 1 2 3 1

;chData_melodyPart1
;
;	!byte	n1+nBlip+nDouble
;	!byte	n3+nBlip+nDouble
;	!byte	n1+nBlip
;	!byte	n3+nBlip
;	!byte	n1+nBlip+nDouble
;
;	!byte	n0
;	!byte	n3+nBlip
;	!byte	n1+nBlip
;	!byte	n3+nBlip
;	!byte	n4+nBlip+nDouble
;	!byte	n4+nDouble
;	!byte	n1+nBlip+nDouble
;	!byte	n3+nBlip+nDouble
;	!byte	n1+nBlip
;	!byte	n3+nBlip
;	!byte	n1+nBlip+nDouble
;
;	!byte	n1+nBlip+nDouble
;	!byte	n1+nDouble
;	!byte	n1+nDouble
;	!byte	n0+nDouble+nEnd

chData_bass
	!byte n1+nOct,n1+nEnd ; ,n0+nEnd
chData_cobass
	!byte n1+nOct
	!byte n1
	!byte n1
	!byte n1+nOct
	!byte n1
	!byte n1
	!byte n1+nOct
	!byte n1+nEnd

chData_drums
chData_drums_wild
	!byte 5,1,5,1,5,1,5,1
	!byte 5,1,5,1,5,1,7,7+128

;	!byte 7,7,0,1,0,5,1,5
;	!byte 7,7,1,5,1,5,1,5+128

;	!byte 7+64,0+64,1+64,0+64,7+64,1+64,1+64,7,7+128

chData_chords
	!byte 4,0,0,4
	!byte 6,2,2,6
chData_chords_loopstart
	!byte 4,0,0,4
	!byte 6,2,2,6
	!byte 12,8,8,12
	!byte 14,10,10,14+128

;	!byte 1,0,0,1+128
;	!byte 1,0,3,2
;	!byte 1+128
;	!byte 1,0,3,2
;	!byte 1,0,3,2
chData_chords_loopstart_hionly
;	!byte 1+128
;	!byte 5,4,7,6
;	!byte 5,4,7,6+128
chData_chords_end

!warn "chData length = ", *-chData

; reset = 128
; double = 64

; melodychans:
; - 1  blip
; - 2  +octave
; - 0=pitchindex 0, 4=pitchindex 1 etc.

;	0 = silence
;	1 = basenote
;	2 = basenote+1
pitches
;	!byte $7E,fE,fE+1,$9B;,$AF
;	!byte $7E,fG,fG+1,$AF;,$BB
;	!byte $7E,fD,fD+1,$7e;,$7e
;	!byte $7E,fA,fA+1,$7e
;	!byte $7E,fG,fG+1,$7e
;	!byte $7e,fAp,fAp+1,$7e
;	!byte $7e,fF,fF+1,$7e
;	!byte $7e,fC2,fC2+1,$7e

	!byte $7e,fF,fC,fC,fC
	!byte     fD,fF,$7E,$7E

	!byte     fF,fC,fF,fF
	!byte     fF,fF,$7E,$7E

	!byte     fG,fD,fD,fDp
	!byte     fD,fG,$7E,$7E

	!byte     fG,fD,fD,fG
	!byte     fG,$7E,$7E,$7E

	!byte     fFu,fCu,fCu,fCu
	!byte     fDu,fFu,$7E,$7E

	!byte     fFu,fCu,fFu,fFu
	!byte     fFu,fFu,$7E,$7E

	!byte     fGu,fDu,fDu,fDpu
	!byte     fDu,fGu,$7E,$7E

	!byte     fGu,fDu,fDu,fGu
	!byte     fGu,$7E,$7E,$7E


noiseTable
;0
        !byte 126,126,0
	!byte 0
;4
        !byte 250,200,240,160,230,130
        !byte 180,128,220,126,130,126
        !byte 126,130,126,0
;20
        !byte 210,180,160,140,126,130,126,0
;28
        !byte 250,200,240,250,220,240 ; 160,230,130
        !byte 250,200,240,160,230,130
        !byte 250,200,240,160,230,130
        !byte 250,200,240,160,230,130
        !byte 180,128,220,126,130,126
        !byte 160,130,126,0

; FIRST set bassline so we can get the rhythm

chInitPointers	
		!byte 0;chData_melody-chData-1
		!byte chData_bass-chData-1
		!byte chData_cobass-chData-1
		!byte chData_drums-chData-1
		!byte chData_chords_loopstart-chData-1
		;!byte chData_melodyList_loopstart-chData-1

chPointers	!byte 1;chData_melody-chData;1
		!byte chData_bass-chData
		!byte chData_cobass-chData
		!byte chData_drums-chData
		!byte chData_chords-chData
		;byte 1;!byte chData_melodyList-chData
chTempos	!byte 6,6,6,6*2,6*16;,4*16
chTempoCounters	!byte 9,9,9,9,9;,1
voiceWaves
	!byte $00,$00,$50

!warn "player starts at ", musicplayer
!warn "player length = ", *-musicplayer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
