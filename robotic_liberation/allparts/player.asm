chstat=200

NUMCH=5

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!zone musicplayer
player:
.tmp=255

	;lda trackcmd_opcode
	;sta $900f

	ldx #NUMCH-1
	stx .tmp

.chans	dec chctr,x
	bne .nxch

	ldy chptr,x		; x = kanavaid
.read	lda songdata,y
	bpl .note

	    cpx #4		; on ch#4 loop: potential tracktick
	    bne .pff
                sta .tmp
.pff	    clc
	    adc chptr,x		; negatiiviset = taaksepäinhyppyjä
	    tay

	    bcs .read

.note	;cpx #7
	;bmi .cz1
	;    clc
	;    bcc .cz2
.cz1	lsr

.cz2	sta chstat,x
	lda chtempo,x
	bcc .nodbl
	    asl
.nodbl	sta chctr,x

	iny
	tya ; jos chptr nollasivulle niin suora sty
	sta chptr,x
.nxch	dex
	bpl .chans

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	lda .tmp
	bpl .nonew2

        lda trackcmd_opcode
        beq .nonew2

	;inc $900f

        ;lsr

        lda loader_bpf
        bne .nonew2

        sta trackcmd_opcode

	jsr loader_on

        ldx #(NUMCH*3)+2
.newl   lda trackcmd_newptrs,x
	sta chctr,x
	dex
        bpl .newl

	jmp player

	;lda chtempo+4
	;sta chctr+4
	;jmp player

.nonew2 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!zone musicsynth
.tmp=255

	;;; DRUMS ;;;

	lda #$7d
	sta $900d	; drumwave reset

	ldx chstat+3	; drumdata contains 0-terminated lists of $900d vals
	lda drumdata,x
	beq .dr0
	sta $900d
	inc chstat+3
.dr0

	;;; MELODY - default shit ;;;

	ldx #2

.mel	lda chstat,x
	beq .me0	; 00     = none (skip)
	bmi .me1	; 80..ff = play sound
			; 02..7f = mute and prepare for sound


	cmp #$01	; 01     = mute
	beq .mute

	ora #$80	; 02..7f is 82..ff on next tick
	sta chstat,x

	ldy chwave,x	; wave 00..7f: initial mute
	bmi .blip

.mute	lda chinits,x	; mute
	sta $900a,x
	bne .me0

.blip	;clc		; wave 80..ff: initial blip	c known due to cmp
	adc #11

.me1	clc
	adc chstat+4
	tay
	lda npitches-128-20,y   ; was -12
	jsr setwave_real
	setwavevector=*-2

	;;;

.me0	dex
	bpl .mel

	rts

trackcmd:
trackcmd_opcode:	!byte 0
trackcmd_newptrs:	!byte 3,3,3,2,2	; or data to stuff
			!byte 12,6,6,12,6*16
			!byte 0,0,0,0,0
			!byte $81,$94,$82

			; ^^ tämänhän saisi nollasivulle

;!byte 0,0,0

;;;;;;; setwave routines ;;;;;;;;;

;setwave_dummy
;
;	sta $900a,x
;	rts

;	samantien koko paska (4x5 == 20 bytes)

chctr	!byte  3,3,3,2,2 ; ,1
chtempo	!byte 12,6,6,12,6*16 ; ,6*32
chptr	!byte bass0seq-songdata
	!byte cobass0seq-songdata ; cobass0seq-songdata
	!byte muteseq-songdata ; melo0seq-songdata
	!byte drummuteseq-songdata
	!byte shape0seq-songdata
	;!byte design0seq-songdata
chwave	!byte $81,$94,$82 ; 8e ; $80,$24,$24

chinits !byte $7e,$7d,$7b

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!zone setwave_real
setwave_real	; here: x = channelid, a = stuff
.tmp=255
.tmp2=254

	ldy $900a,x	; already playing? no setwave
	bmi .noset

	sta .initfreq	; a = initfreq

	txa		; x = channel#	
	tay		; -> also to y
	clc
	adc #$a
	sta .ch0
	sta .ch1

;	lda #0		; ignore channel on next tick
;	sta chstat,x

	lda chinits,x		; taikka ldy, ja sitten aiempaan and - save 1
	ora #$80
	tax

	lda chwave,y	; waveform
	asl
	sta .tmp
	ora #$7f

	;;; NO PAGESKIPS FROM HERE -- 

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
	ldx .tmp2	; 3
.noset	sta $900a,x	; 5	from prev store: 5+3+2+2+2+2 eq 16

	;;; -- TO HERE

	rts		; 6	total cloks 11+4+3+2+16*7+16+6 eq 154

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

npitches
	;    0   1   2   3   4   5   6   7   8   9   10  11
	!byte 129,136,142,149,155,160,165,170,175,180,184,188
	!byte 192,195,198,202,205,207,210,213,215,217,219,221
	!byte 223,225,226,228,230,231,232,234,235,236,237,238
;	!byte 239,240,241,242,243,243,244,244,245,246,246,247

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; rumpudata on aika perustavaraa

drumdata:
nDRN=0*2
	; 0..2
	!byte 126,126,0
nDR0=3*2
	; 3..
	!byte 250,200,240,160,230,130
	!byte 180,128,220,126,130,126
	!byte 126,130,126,0
nDR1=19*2
	; 19..
	!byte 210,180,160,140,126,130,126,0
nDR2=27*2
	!byte 250,200,240,250,220,240 ; 160,230,130
	!byte 250,200,240,160,230,130
	!byte 250,200,240,160,230,130
	!byte 250,200,240,160,230,130
	!byte 180,128,220,126,130,126
	!byte 160,130,126,0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; song opcodes ;;;;;

nBASE = 18+4
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

;;;;;;;;;;;;;;;;;;

songdata:
	muteseq:
	drummuteseq:
	!byte nMUTE
	!byte <(muteseq-*)

	bass0seq:
	!byte nC1+nDBL,nC1+nDBL,nC2,nC1,nC2,nC1
	!byte <(bass0seq-*)

	cobass0seq:
	!byte nC1,nC1,nC2,nC1+nDBL,nMUTE,nC2,nMUTE
	!byte nC1,nMUTE,nC1,nMUTE,nC1+nDBL,nC2,nC1
	!byte <(cobass0seq-*)

	shape0seq:
	!byte nC1,   nC1,   nDp1,   nAp0
	!byte nC1,   nC1,   nDp1,   nAp0
	;!byte nC1+6, nC1+6, nDp1+6, nAp0+6
	;!byte nC1+6, nC1+6, nDp1+6, nAp0+6
	!byte <(shape0seq-*)


;;; optimoi vähän. täytyy tappaa joku 90 tavua niin rutiini mahtuu
;   512 alkutavuun.
