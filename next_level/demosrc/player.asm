;,; player
;,; <- chstat .zp .sz=6 .ldsz=0
;,; <- ptmp .zp .sz=1 .ldsz=0
;,; <- ptmp2 .zp .sz=1 .ldsz=0
;,; <- player_consts
;,; <- player_vars
;,; <- player_ivars
;;,; <- player_drumdata
;,; <- player_songdata
;,; <- player_pitches
;,; <- voice
;,; <- lyrics


player:
	;lda trackcmd_opcode
	;sta $900f

	ldx #NUMCH-1
	stx ptmp

.chans	dec chctr,x
	bne .nxch

	ldy chptr,x		; x = kanavaid
.read	lda songdata,y
	bpl .note

	    clc
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

!zone musicsynth
; channels:
; 0 = bassmode (900a & 900b)
;     - phuk $900b wave
;     - load $900b as either 0 or X (or X+5 maybe?)
;     - X+=oct or not
;     - load $900a as either 0, X or X
; 1 = drum
; 2 = basspitch
; 3 = non-voice melody
; 4 = voice melody
; X = basspitch other? (for arpeggios)


; kunnon bassot toisin kuin rl:ssä!


	;;; DRUMS ;;;

;	lda #$7d
;	sta $900d	; drumwave reset

	ldx chstat+1	; drumdata contains 0-terminated lists of $900d vals
	lda drumdata,x
	beq .dr0
	sta $900d
	inc chstat+1
.dr0

;        
;   11   C-0  C-1
;    0   C+1  C-1
;   01   ---  C-1

;  01    C+1  ---
;  11    C+1  C-1*
; 

;	b   a
; 01    --- ---
;  0	C-1 C+1
; 11    C-1 C-0


; 0101	clear both channels, ~silent

; 900a value
; 900b value 

	lda nextlyrictosing
	beq .kluk
	ldy chctr+2
	cpy #12*4
	bne .kluk
	ldy #nC1
	sty singfreq
	jsr voice_sing_on
	lda #0
	sta nextlyrictosing
.kluk

	;;; BASS ;;;

	ldy chstat+2
	lda npitches+12+nC1/2,y
	sta ptmp;$900a
	asl
	sta ptmp2;$900b

	;tay? replaces ldy $900b below

	; 5F -> 3F

	; X000 0111	X000 1000
	; into
	; X100 0011	X100 0100

	; 0101 1111  0110 0000
	; into
	; 0011 1111  0100 0000

	lda chstat+0
	ldx ptmp
	lsr
	bcc .noachg	; 0 = default a
	ldx #$7e	; 01 = clear a
	lsr
	bcc .noadown	; 11 = a down
	ldx ptmp2
.noadown
.noachg
	stx $900a

	ldx ptmp2
	lsr		; 0 = default b
	bcc .nobchg
	ldx #$7d	; 1 = clear b
	; lsr
	; bcc .nobchg
	; 
.nobchg
	stx $900b

	;;; VOICE ;;;

	lda chstat+4
;	clc
;	lda #nC1/2
;	adc chstat+2
	clc
	;adc #nG1/2
	adc #11
;	and #15
	sta singfreq

	lda lyricsptr
	beq .novoice

	jsr voice_setsingfreq

	lda chctr+4
	cmp #1  ; save this by switching to terminate-on-negative
	bne .novoice

	lda d_loopcount
	bne .c1
	inc d_loopcount

.c1 ;	jsr voice_setsingfreq  ; inline?
;;;	jmp .cmute ;vanity?

.novoice

	;;; MELODY ;;;

	lda #$66
	sta $900c

	lda chstat+3
	beq .cmute
;	lda #$7b
;	sta $900c
;	rts
;.nocmute
	php
	ora #$80
	sta chstat+3

	;clc
	;adc chstat+2
	plp
	bpl .noblip
	clc
	adc #12
.noblip	tay
;	ldx #4
;.jjj	lda #$fb
;	sta $900c
;	lda #$7b
;	sta $900c
;	dex
;	bne .jjj
	lda npitches-128+4,y
	sta $900c
.cmute
	rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;,; player_ivars
;,; <- player_songdata

chctr	!byte  2,2,2,   2, 2 ; ,1
chtempo	!byte  3,3,12*4,12,12
chptr	!byte bass_misery-songdata
	!byte drum_misery-songdata
	!byte shap_start-songdata
	!byte melo_start-songdata;muteseq-songdata
	!byte muteseq-songdata;muteseq-songdata
nextlyrictosing
	!byte 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;,; player_consts

NUMCH=5

nBASE = 6+2
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

nB__=%01010
nB_u=%0100
nB_D=%01110

nBn_=%0010
nBnu=%000
nBnD=%0110

nBw_=%11010
nBwu=%1100
nBwD=%11110

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;,; player_pitches

npitches
	;     0   1   2   3   4   5   6   7   8   9   10  11
	!byte $ff,$87,$8f,$95,$9b,$9f,$a5,$ab,$af,$b4,$b7,$bb
	!byte $bf,$c3,$c7,$ca,$cd,$cf,$d2,$d5,$d7,$d9,$db,$dd
	!byte $df,$e1,$e3,$e4,$e6,$e7,$e8,$ea,$eb,$ec,$ed,$ee
	!byte $ef,$f0,$f1,$f2,$f3,$f3,$f4,$f5,$f5,$f6,$f7,$f7

;	!byte 129,136,142,149,155,160,165,170,175,180,184,188
;	!byte 192,195,198,202,205,207,210,213,215,217,219,221
;	!byte 223,225,226,228,230,231,232,234,235,236,237,238
;	!byte 239,240,241,242,243,243,244,244,245,246,246,247

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;,; lyrics .extra=255

lyrics:
	!byte $0f

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;,; player_drumdata

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
	!byte 250,100,240,150,220,240 ; 160,230,130
	!byte 250,200,240,160,230,130
	!byte 250,200,240,160,230,130
	!byte 250,200,240,160,230,130
	!byte 180,128,220,126,130,126
	!byte 160,130,126,0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;,; player_songdata
;,; <- player_consts
;,; <- player_drumdata

songdata:

muteseq:
	!byte 0
	!byte <(muteseq-*)

melo_misery:
.mbC=0;+8
.mbD=0;-4;+8
.mbF=0;-10;+8
.mbG=0;-14;+8
.mbA=0;4;+8
!byte nC1+1, nC1, nAp0, nC1, nC1, nDp1, nF1
!byte nG1+1, nG1, nD1, 0   , 0,        0,         0

!byte nAp0,  nAp0, nAp0,  nAp0
!byte nAp0,  nD1,  nD1,   nF1
!byte nG1+1,       nGp1,  nC1
!byte 0,     0,    0,     0

!byte nC1+1, nC1, nC1, nC1, nC1, nDp1+1
!byte nF1+1, nDp1,nF1, 0, 0, 0, 0

!byte nAp0+1, 0, nAp0+1, nAp0,nD1,nDp1
!byte nFp1+1, 0, nG1+1,  nG1, nG1, nG1

!byte <(melo_misery-*)


melo_start:
!byte nC1+1, nC1,nC1,nC1+1, nAp0,nC1,nG1,nG1,nG1,nF1+1,nG1+1,0
!byte nAp0+1,nAp0,nAp0,nAp0+1, nDp1,nAp0,nF1,nF1,nF1,nDp1+1,nD1+1,0
!byte <(melo_start-*)         ;nDp1


;	!byte nC1,nC1,nG1,0, nC1,nC1,nG1,nAp0
;	!byte nC1,0,  nC1,nC1,nC2+1,0,0
;	!byte 0,0,0,0,0,0,0,0
;	!byte 0,0,0,0,0,0,0,0

voic_misery:
!byte nC1+1, nC1, nAp0, nC1+1, nDp1, nF1
!byte nG1+1, nG1, nD1+1   , nD1+1, nD1

!byte nAp0+1, nAp0+1
!byte nAp0,  nD1+1,   nF1
!byte nG1+1,       nGp1,  nC1
!byte nC1+1, nC1+1

!byte nC1+1, nC1+1, nC1+1, nDp1+1
!byte nF1+1, nDp1,nF1, nF1+1, nF1+1

!byte nAp0+1, nAp0+1, nAp0+1, nD1,nDp1
!byte nFp1+1, nFp1, nG1+1,  nG1+1, nG1

	!byte <(voic_misery-*)


bass_misery:
	!byte nBnD	; ta
	!byte nB_D
	!byte nBnD	; ta
	!byte nB_D	
	!byte nBnu	; ta
	!byte nB_u
	!byte nBnu	; ta
	!byte nB_u

	!byte nBnD	; taaaa
	!byte nBnD
	!byte nBnD
	!byte nB_u
	!byte nBnD	; ta
	!byte nB_u
	!byte nBnD	; ta
	!byte nB_u

;

;	!byte nBnD
;	!byte nBnD
;	!byte nBnu
;	!byte nB_u
;	!byte nBnD
;	!byte nBnD
;	!byte nB_u
;	!byte nB_u

	!byte <(bass_misery-*)

drum_misery:
	!byte nDR1+1
	!byte nDRN+1
	!byte nDR0+1
	!byte nDRN+1
	!byte nDR1+1
	!byte nDRN+1
	!byte nDR0+1
	!byte nDRN+1

;	!byte nDR1+1
;	!byte nDRN+1
;	!byte nDR0+1
;	!byte nDRN+1
;	!byte nDR2+1
;	!byte nDR2+1+32
;	!byte nDR2+1
;	!byte nDR2+1+32

;	!byte nMUTE

	!byte <(drum_misery-*)

shap_start:
	!byte nC1,  nC1,  nG1, nG1
	!byte nAp0, nAp0, nF1, nF1
	!byte <(shap_start-*)

shap_misery:
	!byte nC1,  nC1,  nG1, nD1
	!byte nAp0, nAp0, nG1, nC1
	!byte nC1,  nC1,  nF1, nAp0
	!byte nAp0, nAp0, nF1, nG1

;	!byte nC1,   nC1,   nC1,   nC1
;	!byte nG1,   nG1,   nG1,   nG1

;	!byte nC1,   nC1,   nDp1,   nAp0
;	!byte nC1,   nC1,   nDp1,   nAp0
;	!byte nC1+6, nC1+6, nDp1+6, nAp0+6
;	!byte nC1+6, nC1+6, nDp1+6, nAp0+6
	!byte <(shap_misery-*)
