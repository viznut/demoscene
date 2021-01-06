!cpu 6510

; start at 1010
; init at $1380
!source "font.inc"

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

!macro wait .clocks {	; safe with 14..80
   jsr wait14-(.clocks-14)
}

!macro nocross .length {
  !if ((*&255)>255-.length) {
     !align $ff,0
  }
}


; taustakuvio ei juuri riipu luettavista osoitteista vaan ohjelmakoodin
; sijainnista muistissa!

	ddlo_ulo=$9a
	ddlo_u=$9b	
	dhi=$9d
	dlo=$9c
	foox=$90

;	ddlo=$fc
;	ddhi=$fb

texts

;01234567890123456789
;   that will be all
;   fitts for fight
;    george w bush
;    tanja saarela
;    tea hiilloste
;      timbaland

;    greetings to
;       aspekt
;       ate bit
;       cosine
;        cpu
;      creators
;      dekadence
;      fairlight
;       goto80
;       pu 239
;      vvv team

; aspekt, ate bit, dekadence,

texts
greetings_to
	!byte 4
	!scrxor $40, "greetings"
	!byte 1
	!scrxor $40, "to"
	!byte 0
fuckings_to
	!byte 5
	!scrxor $40, "fuckings"
	!byte 1
	!scrxor $40, "to"
	!byte 0
greetings0
	!byte 7
	!scrxor $40, "aspekt"
	!byte 0

	!byte 7
	!scrxor $40, "ate"
	!byte 1
	!scrxor $40, "bit"
	!byte 0

	!byte 7
	!scrxor $40, "cosine"
	!byte 0

	!byte 6
	!scrxor $40, "carillon"
	!byte 0

	!byte 8
	!scrxor $40, "cpu"
	!byte 0

	!byte 6
	!scrxor $40, "creators"
	!byte 0

	!byte 6
	!scrxor $40, "dekadence"
	!byte 0

	!byte 6
	!scrxor $40, "fairlight"
	!byte 0

	!byte 7
	!scrxor $40, "goto"
	!byte $40+31,$40+28,0

	!byte 8
	!scrxor $40, "k"
	!byte $40+27,0

	!byte 7
	!scrxor $40, "pu"
	!byte 1,$40+27,$40+29,$40+30,0

	!byte 8
	!scrxor $40, "rno"
	!byte 0

	!byte 6
	!scrxor $40, "trilobit"
	!byte 0

	!byte 6
	!scrxor $40, "vvv"
	!byte 1
	!scrxor $40, "team"
	!byte 0
fuckings0
	!byte 0 ; filler

	!byte 3
	!scrxor $40, "fitts"
	!byte 1
	!scrxor $40, "for"
	!byte 1
	!scrxor $40, "fight"
	!byte 0

	!byte 4
	!scrxor $40, "george"
	!byte 1
	!scrxor $40, "w"
	!byte 1
	!scrxor $40, "bush"
	!byte 0

	!byte 4
	!scrxor $40, "tanja"
	!byte 1
	!scrxor $40, "saarela"
	!byte 0

	!byte 4
	!scrxor $40, "tea"
	!byte 1
	!scrxor $40, "hiilloste"
	!byte 0

	!byte 6
	!scrxor $40, "timbaland"
	!byte 0
endofmessages
thatsall
	!byte 1
	!scrxor $40, "end"
	!byte 1
	!scrxor $40, "of"
	!byte 1
	!scrxor $40, "transmission"
	!byte 0

clrscr
	txa
	pha
	ldx #59
	lda #0
.clr0	sta $1e00,x
	dex
	bpl .clr0
	tax
	pla
	rts

writetext
	txa
	clc
	adc texts,y
	tax
	iny
.gl1	lda texts,y
	beq .rtso
	sta $1e00,x
	iny
	inx
	bne .gl1
.rtso	iny
	rts

greet
	tya
	pha
	jsr clrscr
	ldx #20

	pla
	pha
	ldy #greetings_to-texts
	cmp #fuckings0-texts
	bne .zzzz
	pla
	tay
	iny
	rts
.zzzz
	bcc .hiphop
	ldy #fuckings_to-texts
.hiphop
	jsr writetext
	ldx #40
	pla
	tay
	jsr writetext
	rts

greet000:
	jsr clrscr
	ldy #greetings0-texts
	.phokki=*-1
	cpy #endofmessages-texts
	beq greet001
	jsr greet
	sty .phokki
	rts

greet001:
	ldy #thatsall-texts
	ldx #20
	jsr writetext
	rts

	; in memoriam

	; xaztur of pwp

	; 1979 - 2007

*=$1380
mcstart sei

	; let 

	lda #0
	sta ddlo_u
	sta ddlo_ulo
	sta dlo0
	sta foox

	lda #$19
	sta $900f
	lda #$c8
	sta $900e
	lda #20+128
	sta $9002

	lda #$ff
	sta $9003

;	lda #56
;	sta $9001
	lda #14
	sta $9000

	ldx #0
.l0	lda #$f
	sta $9400,x
	sta $9500,x
	lda #$0
	sta $9600,x
	sta $9700,x
	lda #$00
	sta $1e00,x
	sta $1f00,x
	dex
	bne .l0

	
;	lda #$41
;	sta $1e00+20*6+5
;	lda #$42
;	sta $1e00+20*6+6
;	lda #$43
;	sta $1e00+20*6+7

	lda #$fb
	sta $9005

	STMP=$fd

mainloop:

	jsr musicplayer

	lda foox
	bne .tsip
	jsr greet000
.tsip	lda foox
	bpl .zi0
	eor #$ff	
.zi0	cmp #64
	bcs .zih
	sta $9001
.zih	inc foox
	inc foox

rasta
                lda #56         ; = start of screen
ll0             cmp $9004       ; wait until at given rasterline
                bne ll0         ; bail out 3..9 clocks after $9004 change
                                ; first cmp must occur 71-3-4=64 clks later

                lda $9003       ; -4 (60)
                ldy #11         ; -2 (58)  -1 no matter
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

;	cmp 0

	pha
	pla
	pha
	pla
	pha
	pla
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	;nop
	;nop
	;nop

	tsx
	stx STMP

	ldx #128 ; 96

	lda #$19
	sta $900f
lineloop:
        txs                     ; 2
        ldy pointlist,x         ; 4
        ldx xtolineloopptr,y    ; 4
        lda linebuf,x           ; 4
        ora xxorrer,y           ; 4     ; or maybe and+or
        sta linebuf,x           ; 5                      
        tsx                     ; 2 tot 25
linebuf:
        cmp #0                  ; may spend 71-25-5 = 41 clox here
                                ; if two dots per line: 71-50-5 = 16 clox :(
        cmp #0                                                              
        cmp #0
        cmp #0
	cmp #0
	cmp #0
	cmp #0
	cmp #0
	cmp #0
	cmp #0
	cmp #0
	cmp #0
	cmp #0
	cmp #0
	cmp #0
	cmp #0
	cmp #0
	cmp #0
	cmp #0
	cmp  0

        dex                     ; 2              
        bne lineloop            ; 3 tot 5

        ldx STMP
        txs

	ldx #8
	stx $900f

	;inc $900f

; framebuffer init:
        lda #$00
        sta linebuf+1
        sta linebuf+3
        sta linebuf+5
        sta linebuf+7
        sta linebuf+9
        sta linebuf+11
        sta linebuf+13
        sta linebuf+15
        sta linebuf+17
        sta linebuf+19
        sta linebuf+21
        sta linebuf+23
        sta linebuf+25
        sta linebuf+27
        sta linebuf+29
        sta linebuf+31
        sta linebuf+33
        sta linebuf+35
        sta linebuf+37
        sta linebuf+39

	clc
	lda ddlo_ulo
	adc #<2730
	sta ddlo_ulo
	lda ddlo_u
	adc #>2730
	sta ddlo_u
	;asl
	;asl
	bpl .tooto
	eor #$ff
.tooto	lsr
	lsr
	eor #$ff
	sta ddlo
	lda #$ff
	sta ddhi

	ldy #0
	lda #0
	dlo0=*-1
	bpl .zizi
	eor #$7f
.zizi	bpl .zixx
	ldy #$ff
.zixx	sta dlo
	sty dhi


;	inc ddlo ;.dlo
;	bne .zog
;	lda ddhi ;.dhi
;	clc
;	adc #1
;	and #7
;	sta dhi;.dhi

	; PAH
	lda #0
	;sta ddlo
	;sta ddhi

	;;; ;;;

	ldx #128
	ldy #0
	.pff=*-1
	sty $fe
	inc .pff

.zoo	clc
	lda dlo
	adc #0
	ddlo=*-1
	sta dlo
	lda dhi
	adc #0
	ddhi=*-1
	sta dhi

	tya		; y.$fe
	clc
	adc dlo ; #0
	;.dlo=*-1
	tay
	lda $fe
	adc dhi;#0
	;.dhi=*-1
	sta $fe
	sta pointlist,x
	dex

	tya		; y.$fe
	clc
	adc dlo ; #0
	;.dlo=*-1
	tay
	lda $fe
	adc dhi;#0
	;.dhi=*-1
	sta $fe
	sta pointlist,x

	dex
	bne .zoo

.zog	;dec $900f

	jmp mainloop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

NUMCH = 5
chstat = 248	; NUMCH bytes

!zone musicplayer
musicplayer:

	ldx #NUMCH-1
.chans	dec chctr,x
	bne .nxch

	ldy chptr,x		; x = kanavaid
.read	lda songdata,y
	bpl .note
	    clc
	    adc chptr,x		; negatiiviset = taaksepäinhyppyjä
	    tay
	    bcs .read
.note	lsr			; alin bitti = tuplaus
	sta chstat,x
  	; clear chsubstat
	lda chtempo,x
	bcc .nodbl
	    asl
.nodbl	sta chctr,x

	iny
	tya ; jos chptr nollasivulle niin suora sty
	sta chptr,x
.nxch	dex
	bpl .chans

;;; musicplayer - synth part ;;;

!zone musicsynth
.tmp=255
	lda #$7d
	sta $900d	; drumwave reset

	lda chstat+0
	beq .c0ign
	bmi .c0set
.c0clr	ora #$80
	sta chstat+0
	lda #$7e
	sta $900a
;	lda #$7d
	sta $900b
	bne .c0done
.c0set	;and #$7f
	clc
	adc chstat+1
	tay
	ldx npitches-128,y
	stx .c0c
	ldy #$a
	lda #%110 ;;;; 11000 ; 100 ; 100 ; 10 ; 10 ; 100 ; 1110	; 110 paras?
	jsr setwave

	lda #00
	.c0c=*-1
;	clc
;	rol
	asl
	tax
	inx ; dex
	inx

	; pitch 255-x becomes 255-2x

	iny
	lda #%110 ;;;; 100 ; 1110 ; 11000 ; 1110; 11000 ; 1110 ; ; 1000
	jsr setwave

	; 1110 parempi kuin 11000
	; 100 ~ 110, 1000 parempi

	lda #0
	sta chstat+0

	beq .c0done ; jmp

; yksinäinen basso: 1110?
; 11000 liian takakumea
; 110 kivan matala

.c0ign
.c0done:

	lda chstat+3
	beq .c1done
	bmi .c1set
.c1clr	ora #$80
	sta chstat+3
	cmp #$81
	beq .c1cx

	;jsr dezignbeat

.c1cx	lda #$7b
	sta $900c
	bne .c1done
.c1set
	cmp #$81
	beq .c1done
	clc
	adc chstat+1
;	clc
;	adc chstat+4 ; shape
	tay
	ldx npitches-128,y
	ldy #$c
	lda #%110 ; %10 ; 1000 ; 1011 ; 010 ; 1100 ; %10 kiva
	c1wave=*-1
	jsr setwave

.c1done:
	; drums are simple
	ldx chstat+2
	lda drums,x
	sta $900d
	inc chstat+2

.c3done:
	ldx chstat+4
	beq .c4done

	    lda #0
	    sta chstat+4

	    dex
	    bne .c4o1

	    ; opcode 1 (2) : start lead0
.c4op1:	    lda #lead0-songdata
	    sta chptr+3
	    bne .c4done ; jmp

.c4o1:	    dex
	    bne .c4o2

	    ; opcode 2 (4): start baseshape1
.c4op2:	    lda #baseshape1-songdata
	    sta chptr+1
	    bne .c4done ; jmp

.c4o2:	    dex
	    bne .c4o3

	    ; opcode 3 (6): start baseshape0
.c4op3:	    lda #baseshape0-songdata
	    sta chptr+1
	    bne .c4done

.c4o3:	    dex
	    bne .c4o4

            ; opcode 4 (8): start lead1 & baseshape0
.c4op4:     lda #lead1-songdata
            sta chptr+3
	    lda #%1011 ; 101100
	    sta c1wave
            bne .c4op3

.c4o4:	    dex
	    bne .c4o5

.c4op5:     lda #<(lead0final-lead0finaljmp)
	    sta lead0finaljmp
	    lda #<(baseshape1b-baseshape1bjmp)
            sta baseshape1bjmp

	    dec $900e
	    beq demodone

	    jmp .c4done ; done ; .c4op1

.c4o5:	    dex
	    bne .c4o6

.c4op6:     lda #noneseq-songdata
	    sta chptr+3
	    jmp .c4op3

.c4o6:
.c4done:
synthdone:
	rts
demodone:
	jmp 64802

npitches
	;    0   1   2   3   4   5   6   7   8   9   10  11
	!byte 129,136,142,149,155,160,165,170,175,180,184,188
	!byte 192,195,198,202,205,207,210,213,215,217,219,221
	!byte 223,225,226,228,230,231,232,234,235,236,237,238

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!zone synthtab

;;; song variables ;;;

	;	,0,0	; nollasivulle -> säästyy tavuja


;;; song opcodes ;;;;;

nBASE = 30
nNONE = 0
nMUTE  = 2

nC0  = (-24+nBASE)
nCp0 = (-22+nBASE)
nD0  = (-20+nBASE)
nDp0 = (-18+nBASE)
nE0  = (-16+nBASE)
nF0  = (-14+nBASE)
nFp0 = (-12+nBASE)
nG0  = (-10+nBASE)
nGp0 = (-8+nBASE)
nA0  = (-6+nBASE)
nAp0 = (-4+nBASE)
nB0  = (-2+nBASE)

nC1  = (0+nBASE)
nCp1 = (2+nBASE)
nD1  = (4+nBASE)
nDp1 = (6+nBASE)
nE1  = (8+nBASE)
nF1  = (10+nBASE)
nFp1 = (12+nBASE)
nG1  = (14+nBASE)
nGp1 = (16+nBASE)
nA1  = (18+nBASE)
nAp1 = (20+nBASE)
nB1  = (22+nBASE)

nC2  = (24+nBASE)

nDBL = 1

nLO  = 16
nHI  = 0

nDR0  = 12*0
;nDR1  = 12*1
nDR2a = 12*1
nDR2b = 12*2
nDR3  = 12*3

;;;;; song data ;;;;;;

; **.*!.**.**

songdata:

noneseq:
	!byte nMUTE ; NONE
	!byte <(noneseq-*)

songseq0:	; tempo 8

	; basso

	!byte nC1,nC0,nC1,nC0
	!byte nC1,nNONE,nC1,nC0
	!byte nC1,nC0,nC1,nC0
	!byte nC1,nC1,nDp1,nC1
	!byte <(songseq0-*)

baseshape0:
	; bassokuvio

	!byte nC1-nBASE+nDBL
	!byte nDp1-nBASE+nDBL
	!byte nD1-nBASE+nDBL
	!byte nC1-nBASE
	!byte nG1-nBASE
	!byte <(baseshape0-*)

baseshape1:
	!byte nC1-nBASE+nDBL+10
	!byte nDp1-nBASE+nDBL+10
baseshape1b:
	!byte nD1-nBASE+nDBL+10
	!byte nC1-nBASE+10
	!byte nG1-nBASE+10
	!byte <(baseshape1-*)
	baseshape1bjmp=*-1

songseq2:

	; rumpukuvio

	!byte nDR3,nNONE,nDR2a,nDR2b
	!byte nDR3,nDR3,nDR2a,nDR2b
	!byte <(songseq2-*)

lead0:
	; melodia / C1

	!byte nC1,nNONE,nC1,nAp0
	!byte nC1,nNONE,nAp0,nC1
	!byte nMUTE,    nAp0,nC1,nMUTE
	!byte nC1,nNONE,nD1,nNONE

	; melodia / Dp1 (+3)

	!byte nDp1-6,nNONE,nDp1-6,nD1-6
	!byte nDp1-6,nNONE,nF1-6,nDp1-6
	!byte nMUTE,     nD1-6,nAp0-6,nMUTE
	!byte nG1-6, nNONE, nAp0-6,nNONE

lead0final:
	; melodia / D1 (+2)

	!byte nD1-4,nNONE,nD1-4,nC1-4
	!byte nD1-4,nNONE,nD1-4,nDp1-4
	!byte nF1-4,nDp1-4,nNONE,nD1-4
	!byte nMUTE,nDp1-4,nD1-4,nDp1-4

	; melodia / C (+0)
	!byte nD1,nC1,nNONE,nMUTE
	!byte nC1,nMUTE,nAp0,nC1

	; melodia / G (+7)

	!byte nMUTE,nNONE,nG1-14,nG1-14
	!byte nF1-14,nG1-14,nF1-14,nDp1-14

	!byte <(lead0-*)
	lead0finaljmp=*-1

lead1:
	!byte nC1,nC1,nDp1,nMUTE
	!byte nMUTE,nMUTE,nC1,nMUTE
	!byte nDp1,nMUTE,nG1,nMUTE
	!byte nC1,nNONE,nNONE,nMUTE

	;;

	!byte nC1,nC1,nDp1,nMUTE
	!byte nE1,nMUTE,nF1,nMUTE

	!byte nC1,nDp1,nG1,nDp1
	!byte nC1,nDp1,nG1,nC2

	!byte <(lead1-*)

songseq4:
	!byte 0,0

songseq4b:
	!byte  2, 0, 0, 0
	!byte  4, 0, 0, 0
	!byte  8, 0, 0, 0 ; 2,8,2 ; ,0 ; 2,8,0
	!byte  2, 0, 4, 0
	!byte 10,10,10,10,10,10

	!byte <(songseq4b-*)

chctr	!byte 2,2,2,2,1
chtempo	!byte 6,6*8,6,6,6*32
chptr	!byte songseq0-songdata
	!byte baseshape0-songdata
	!byte songseq2-songdata
	!byte noneseq-songdata
	!byte songseq4-songdata


drums	; 0
	!byte 126,126,126,126, 126,126 ; ,126,126

	; 1
;	!byte 200,180,160,140,126,130
;	!byte 210,255,160,255, 126,130 ; ,126,255	; bass

	; 2a-2b
;	!byte 250,128,240,128,250,128
;	!byte 200,128,220,140,126,128

	!byte 250,128,240,128,200,190
	!byte 180,170,160,150,140,130

	; 3
	!byte 210,130,128, 126,126,126

	; snare

	; paske

;	"tsäkä":      250,128,240,128	varsin hyvä "c64-snare"
;					jatko 0: 128,126,128,126
;					jatko 1: 126,200,230,200
;
;	BASSO         210,255,160,255	ELITE	jatko: 126,126,130,255

;vols_hi		!byte  6,5,4,3,   6,5,4,3  ; 11,6,7,2,  11,6,7,2
;vols_lo		!byte  6,5,4,3,   6,5,4,3


!zone setwave
+nocross 45
setwave:

.tmp=255
.tmp2=254

	stx .initfreq	; 4

;	txa
;	jmp .noset

	sty .ch0	; 4	; x = channel id
	sty .ch1	; 4
	ldx .ldfqmasks-$a,y ; 4
	sta .tmp	; 3	; a = waveform

	ora #$7f	; 2

	;and x, sta $9000,y ??
	+AXSabs $900c	; 4	to next store: 3+2+2+5+4 eq 16
	.ch0=*-2
	sty .tmp2	; 3	; save channel id
	ldy #7		; 2

.l0	lda #$7f	; 2
	+ASO0 .tmp	; 5  asl tmp; a = [tmp] OR $7f
	+AXSabs $900c	; 4  [$900c] = a AND x
	.ch1=*-2
	dey		; 2
	bne .l0		; 3

	lda #128	; 2
	.initfreq=*-1
	nop		; 2
	ldy .tmp2	; 3
.noset	sta $9000,y	; 5	from prev store: 5+3+2+2+2+2 eq 16

	rts		; 6	total cloks 11+4+3+2+16*7+16+6 eq 154

.ldfqmasks
     !byte $fe	; $900a - 1 x 16 clocks/bit
     !byte $fd  ; $900b - 2 x  8 clocks/bit
     !byte $fb  ; $900c - 4 x  4 clocks/bit

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


*=$1b00
pointlist
        !byte 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
        !byte 21,22,23,24,25,26,27,28,29,30                       
        !byte 31,32,33,34,35,36,37,38,39,40
        !byte 41,42,43,44,45,46,47,48,49,50
        !byte 51,52,53,54,55,56,57,58,59,60
        !byte 61,62,63,64,65,66,67,68,69,70
        !byte 71,72,73,74,75,76,77,78,79,80
        !byte 81,82,83,84,85,86,87,88,89,90
        !byte 91,92,93,94,95,96,97,98,99,100
        !byte 159,158,157,156,155,154,153,152,151,150
        !byte 149,148,147,146,145,144,143,142,141,140
        !byte 139,138,137,136,135,134,133,132,131,130
        !byte 129,128,127,126,125,124,123,122,121,120
        !byte 119,118,117,116,115,114,113,112,111,110
        !byte 109,108,107,106,105,104,103,102,101,100
        !byte 99,98,97,96,95,96,97,98,99,98,97,96,95,96,97,98,99,100
        !byte 91,92,93,94,95,96,97,98,99,100                        
        !byte 81,82,83,84,85,86,87,88,89,90 
        !byte 71,72,73,74,75,76,77,78,79,80
        !byte 61,62,63,64,65,66,67,68,69,70
        !byte 51,52,53,54,55,56,57,58,59,60
        !byte 41,42,43,44,45,46,47,48,49,50

*=$1c00
xxorrer

!byte 128, 64, 16, 4, 1, 64, 16, 4, 1, 64, 16, 4, 2, 128, 32, 8, 2, 128, 64, 16
!byte 4, 2, 128, 32, 16, 4, 1, 128, 32, 16, 4, 2, 1, 64, 32, 16, 4, 2, 1, 128, 64
!byte 32, 16, 8, 4, 2, 1, 128, 128, 64, 32, 16, 16, 8, 8, 4, 4, 4, 2, 2, 2, 2, 2
!byte 2, 2, 2, 2, 2, 2, 2, 2, 4, 4, 4, 8, 8, 16, 16, 32, 64, 128, 128, 1, 2, 4, 8
!byte 16, 32, 64, 128, 1, 2, 4, 16, 32, 64, 1, 2, 4, 16, 32, 128, 1, 4, 16, 32
!byte 128, 2, 4, 16, 64, 128, 2, 8, 32, 128, 2, 4, 16, 64, 1, 4, 16, 64, 1, 4, 16
!byte 64, 128, 2, 8, 32, 128, 2, 8, 32, 128, 2, 8, 32, 64, 1, 4, 16, 64, 1, 2, 8
!byte 32, 64, 1, 4, 8, 32, 128, 1, 4, 8, 32, 64, 128, 2, 4, 8, 32, 64, 128, 1, 2
!byte 4, 8, 16, 32, 64, 128, 1, 1, 2, 4, 8, 8, 16, 16, 32, 32, 32, 64, 64, 64, 64
!byte 64, 64, 64, 64, 64, 64, 64, 64, 64, 32, 32, 32, 16, 16, 8, 8, 4, 2, 1, 1
!byte 128, 64, 32, 16, 8, 4, 2, 1, 128, 64, 32, 8, 4, 2, 128, 64, 32, 8, 4, 1
!byte 128, 32, 8, 4, 1, 64, 32, 8, 2, 1, 64, 16, 4, 1, 64, 32, 8, 2, 128, 32, 8
!byte 2, 128, 32, 8, 2

*=$1d00
xtolineloopptr
!byte 21, 21, 21, 21, 21, 23, 23, 23, 23, 25, 25, 25, 25, 27, 27, 27, 27, 29, 29
!byte 29, 29, 29, 31, 31, 31, 31, 31, 33, 33, 33, 33, 33, 33, 35, 35, 35, 35, 35
!byte 35, 37, 37, 37, 37, 37, 37, 37, 37, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39
!byte 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39
!byte 39, 39, 39, 39, 39, 39, 37, 37, 37, 37, 37, 37, 37, 37, 35, 35, 35, 35, 35
!byte 35, 33, 33, 33, 33, 33, 33, 31, 31, 31, 31, 31, 29, 29, 29, 29, 29, 27, 27
!byte 27, 27, 25, 25, 25, 25, 23, 23, 23, 23, 21, 21, 21, 21, 21, 19, 19, 19, 19
!byte 17, 17, 17, 17, 15, 15, 15, 15, 13, 13, 13, 13, 11, 11, 11, 11, 11, 9, 9, 9
!byte 9, 9, 7, 7, 7, 7, 7, 7, 5, 5, 5, 5, 5, 5, 3, 3, 3, 3, 3, 3, 3, 3, 1, 1, 1
!byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
!byte 1, 1, 1, 1, 1, 1, 1, 3, 3, 3, 3, 3, 3, 3, 3, 5, 5, 5, 5, 5, 5, 7, 7, 7, 7
!byte 7, 7, 9, 9, 9, 9, 9, 11, 11, 11, 11, 11, 13, 13, 13, 13, 15, 15, 15, 15, 17
!byte 17, 17, 17, 19, 19, 19, 19

; kefrens algo:
; - table precalced with inherent sin lookup
; - function: linear + sintab

