!zone segmenter
segmenter:

	segw=$0200 ; 1c40
	segs=$0280 ; 1d40	
	segc=$0100 ; 1e40

;	segclkup=$1b60
;	rasc=$1be0

	segclkup=$1b80
	rasc=$1b60

	FIRSTLINE=41

	NULLCHAR=15
	.tmp=255
	.tmp2=252
	cwidth0=254
	cwidth1=253
	colmem0=$9400
	colmem1=$9600
	scrmem0=$1c00
	scrmem1=$1e00

	; 1bff? 1dff?

	; 1bff ja 1dff sotkeutuvat systeemin rakenteesta johtuen.
	; tämä oli syynä bugitukseen. korjataan niin, ettei näihin
	; tuleva sotku aiheuta artifakteja.

;	sei ;!!

rastablast:
                lda #38-6	  ; $0d = start of screen
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


;	nop
;	nop
;	nop
;	nop
	sty cwidth0
	sty cwidth1
	nop

	ldy #FIRSTLINE

	; nollaus-st$9002 siirrettävä +8

;;;;;;;;;;;;;;;;;;;;; EVEN DOUBLELINE ;;;;;;;;;;;;;;;;;;;;;;;

	;;; init loop



	; VIRHE MUISTISIJOITTELUISSA: SIVUNYLITYKSIÄ
	; 	40..c0

	; wayz to correct: stx $9002:ta ennen inx

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
	;nop	;!!!;!!!;!!!;
	
	;ERROROUS=31

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
	and #31	; 2
	;lda #ERROROUS
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
	ora #24		;2
	sta scrmem0-1,x	;5  O	scrmem[cwidth-1] = (pstart+width)&7)|8

	;;; Set colors for padders: 13 clocks
	;..71
	;  95

	lda .tmp2	;3
	sta colmem0	;4  O
	dex		;+2
	sta colmem0,x	;5  O	colmem[0]=colmem[cwidth-1] = segc[y]&7
	inx 		;+2

	;;; Set register values (color, screenpos, screenwidth): 24 clocks

	;inx		;2

	lda segs,y	;4
	lsr		;2
	lsr		;2
	sta $9000	;4	vic[$0]=segs[y]/4
	stx $9002	;4	vic[$2]=cwidth		SYNCPOINT

	lda .tmp2	;3

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
	and #31	; 2
	;lda #ERROROUS
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
	ora #24		;2
	sta scrmem1-129,x;5  O	scrmem[cwidth-1] = (pstart+width)&7)|8


	;;; STORE 0 TO $9002 if at line #7/7 - total 11		71 - padd ok

	tya		; 2	swap x/y in whole code to be able to use xaa?
	and #1		; 2
	beq .c0		; \
	    nop		;  |

	    ;nop
	    ;nop
	    bne .c1	;  | eq: 3+4
	.c0		;  | ne: 2+2+3
	    sta $9002	;  |			; CHG TO $9002 WHEN IN SYNC
	    ;sta $900f
	.c1		; /

	;;; SCHEDULE

	jsr .wait15

	;;; Set colors for padders: 13 clocks			

	; EI TARTTE ANDATA jos käytetään inversemodea!
	; (voi oikeastaan siirtää tuonne seuraavan lda segc,y:n perään,
	; säästyy 6 kelloa)

	nop  ;!!!;!!!;!!!

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
	; lasku menee jossain kohti pieleen: odd+even viekin 1 kellon enemmän

	; tyhjään rasteritilaan saisi vielä jotain värilookuppia mukaan.
	; 

.done
	; remove padders


	lda #NULLCHAR
	ldx #64         ;paskeet samalla
	ldy #0
	sty $900f
	sty $9002
.rp0	sta scrmem0-1,x
	sta scrmem1-1,x
	dex
	bne .rp0

.wait15	cmp 255
.rts	rts

segmenter_end:

	; vie aika tarkalleen sivun (wait15 on kohdalla $f5)
