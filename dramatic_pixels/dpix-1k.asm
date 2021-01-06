; the source code for the 1k version of the c-64 demo
;
;                "DRAMATIC PIXELS" by PWP
;
; used assembler: acme

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; HEADERS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

*=$0801
!to "dpix-1k.prg",cbm
!cpu 6510

!zone basic
linenum=2010
basic:	!word .basend,linenum
        !byte $9e
	!byte $30+(mcstart/1000)
        !byte $30+((mcstart/100)%10)
        !byte $30+((mcstart/10)%10)
        !byte $30+(mcstart%10)

        !byte 0
.basend	!byte 0;,0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; TABLES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; warning: merging optimizations done to quite many tables

initvalues:
	numinitvalues=20;pixcolors+6-tonic + 1 hack extra
	!byte 0				; tonic
	!byte 6				; tempo
	!byte 0				; scaleidx
	!byte melotab_bass-melotab	; chrowptr bass
	!byte melotab_drums0-melotab	; chrowptr drum
	!byte melotab_bass-melotab	; chrowptr lead
	!byte <demostream		; demostreamptr
	!byte >demostream		; demostreamptr+1
	!word $d800+4+14*40		; pixpos red
	!word $d800			; pixpos green
	!word $d800+36+12*40		; pixpos blue
	!byte 10,7			; pixcol red
	!byte 13,11			; pixcol green
	!byte 14;,4			; pixcol blue
exitoffsets:
	!byte 4,4+40,4+80,36,36+40,36+80

!zone tables
;;; PLAYER PTRS
tonic=$de
tempo=$df
scaleidx=$e0
chrowptr=$e1	; 3 bytes; zero it
demostreamptr=$e4
pixpos=$e6	; 6 bytes
pixcolors=$ec	; 6 bytes
chnote=$f8	; 3 bytes; no need to zero (player sets)
chinsptr=$fb	; 3 bytes; no need to zero (player sets)
tmp2=$fe
tmp=$ff


demostream:
; format: 00..7F = wait n rows, 80..FF = 0page address to store next byte

	;;;;;;;;;;;;;;;;;;;;;;;;; ACT #1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	!byte 64,chrowptr+2,melotab_redwalk-melotab
	!byte 32,pixpos+0,<($d800+4+14*40),pixpos+1,>($d800+4+14*40),tonic,3
	!byte 32,pixpos+0,<($d800+4+14*40),pixpos+1,>($d800+4+14*40),tonic,7
	!byte 16,chrowptr+2,melotab_silence-melotab
	!byte 16,chrowptr+2,melotab_bluewalk-melotab,tonic,5

	!byte 32,tonic,0,chrowptr+2,melotab_redwonder-melotab
	!byte 16,chrowptr+2,melotab_redwonder2-melotab
	!byte 16,tonic,3,chrowptr+2,melotab_redhurry-melotab
	!byte 18,pixpos+0,<($d800+36+14*40),pixpos+1,>($d800+36+14*40)
	!byte    pixpos+4,<($d800+26+12*40),pixpos+5,>($d800+26+12*40)
	!byte    chrowptr+2,melotab_redhurry-1-melotab
	!byte 14,tonic,7,chrowptr+2,melotab_redwonder-melotab
	!byte 32,tonic,5,chrowptr+2,melotab_redwonderresp-melotab

	!byte 32,tonic,0+5,chrowptr+2,melotab_redwonder2-melotab
	!byte 16,chrowptr+2,melotab_bluenegs-melotab
	!byte 16,tonic,3+5,chrowptr+2,melotab_pickup0-melotab
	!byte 16,chrowptr+2,melotab_bluenegs-melotab
	!byte 16,tonic,7+5,chrowptr+2,melotab_pickup0-melotab
	!byte 32,tonic,5+5
	!byte 16,chrowptr+2,melotab_bluenegs-melotab
	!byte 16-12,tonic,0+5
	!byte 2,chrowptr+2,melotab_silence-melotab

	!byte 14+16,       chrowptr+2,melotab_pickup1-melotab
	!byte 16,          chrowptr+2,melotab_pickup1resp-melotab
	!byte 16,tonic,3+5,chrowptr+2,melotab_pickup1-melotab
	!byte 16,          chrowptr+2,melotab_pickup1resp-melotab
	!byte 16,tonic,7+5,chrowptr+2,melotab_pickup1-melotab
	!byte  8,          chrowptr+2,melotab_pickup1resp-melotab
	!byte  8,          chrowptr+2,melotab_pickup1-melotab
	!byte  8,          chrowptr+2,melotab_pickup1resp-melotab
	!byte  7,pixcolors+4,0
	!byte  1,tonic,5+5,chrowptr+2,melotab_success-melotab
	!byte  8,tempo,5
	!byte  8,tempo,4,pixcolors+1,14,chrowptr+2,melotab_firstfuck-melotab
	!byte 14,pixcolors+1,0
	!byte  2,tempo,6,chrowptr+2,melotab_silence-melotab,tonic,0
	!byte    chrowptr+1,melotab_nodrums-melotab

	;;;;;;;;;;;;;;;;;;;;;;;;; ACT #2 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	!byte 32
	!byte    pixpos+0,<($d800+8+13*40),pixpos+1,>($d800+8+13*40)
	!byte	 pixpos+2,<($d800+4+12*40),pixpos+3,>($d800+4+12*40)
	!byte    pixpos+4,<($d800+35+13*40),pixpos+5,>($d800+35+13*40)
	!byte    scaleidx,8
	!byte    pixcolors+4,14
	!byte    chrowptr+1,melotab_drums1-melotab
	!byte    tonic,0,chrowptr+2,melotab_working-melotab
	!byte 32,tonic,3
	!byte 32,tonic,7,chrowptr+2,melotab_returnhome-melotab
	!byte 32,tonic,5,chrowptr+2,melotab_gotowork-melotab

	!byte 32,tonic,0,chrowptr+2,melotab_working-melotab
	!byte 32,tonic,3,chrowptr+2,melotab_redseduced-melotab
	!byte 32,chrowptr+2,melotab_returnhome-melotab,6,tonic,7
	!byte 32,tonic,5,chrowptr+2,melotab_gotowork-melotab

	!byte 32,tonic,0,chrowptr+2,melotab_working-melotab
	!byte    pixpos+2,<($d800+36+14*40),pixpos+3,>($d800+36+14*40)
	!byte 32,tonic,3,chrowptr+2,melotab_blueseduced-melotab
	!byte 32,chrowptr+2,melotab_returnhome-melotab,8,tonic,7
	!byte 32,tonic,5,chrowptr+2,melotab_gotowork-melotab

	!byte 32,tonic,0,chrowptr+2,melotab_working-melotab
	!byte 16,chrowptr+2,melotab_suspicion-melotab
	!byte 16,tonic,3,chrowptr+2,melotab_blueseduced-melotab

	;;;;;;;;;;;;;;;;;;;;;;;;; ACT #3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	!byte 32,tempo,5,chrowptr+1,melotab_drums0-melotab
	!byte            chrowptr+2,melotab_redwonder2-melotab
	!byte	         scaleidx,4,tonic,3
	!byte            pixcolors+1,1
	!byte 16,chrowptr+2,melotab_redwalk-melotab
	!byte 15
	!byte    pixpos+0,<($d800+4+14*40),pixpos+1,>($d800+4+14*40)
	!byte 32
	!byte	 chrowptr+2,melotab_redwalk_checkothas-melotab
	!byte    pixpos+0,<($d800+4+14*40),pixpos+1,>($d800+4+14*40)
	!byte	 pixpos+2,<($d800+18+14*40),pixpos+3,>($d800+18+14*40)
	!byte	 pixpos+4,<($d800+18+8*40),pixpos+5,>($d800+18+8*40)
	!byte 16
	!byte    chrowptr+2,melotab_murder0-melotab
	!byte	 pixcolors+3,11,pixcolors+5,3
	!byte 8, chrowptr+2,melotab_redhurry-melotab
	!byte 14,chrowptr+2,melotab_sorrow0-melotab
	!byte    tempo,12,chrowptr+1,melotab_nodrums-melotab
	!byte 32,tempo,5,chrowptr+1,melotab_drums0-melotab
	!byte            chrowptr+2,melotab_blueupandwalk-melotab
	!byte 18,pixpos+0,<($d800+36+13*40),pixpos+1,>($d800+36+13*40)
	!byte    pixpos+4,<($d800+36+13*40),pixpos+5,>($d800+36+13*40)
	!byte    chrowptr+2,melotab_redhurry-melotab
	!byte 16,chrowptr+2,melotab_bluewalk-melotab
	!byte 15,chrowptr+2,melotab_murder1-melotab,pixcolors+1,11
	!byte 17,chrowptr+2,melotab_sorrow1-melotab
	!byte    tempo,12,chrowptr+1,melotab_nodrums-melotab
	!byte 16,chrowptr+1,melotab_drums2-melotab
	!byte    tempo,10,8,tempo,8,8,tempo,6,8,tempo,4
	!byte 16,chrowptr+2,melotab_suicide-melotab
	!byte 16,pixcolors+5,11
	!byte  4,chrowptr+2,melotab_silence-melotab
	!byte    chrowptr+1,melotab_nodrums-melotab
	!byte    tempo,6,tonic,0
	!byte    16,tempo,8,8,tempo,10,8,tempo,12,8,tempo;,64

	;	;	;	;	;	;	;	;

melotab:
; format:
; LEAD+DANCE CHANNEL
;	7	6	5	4	3	2	1	0
;	jump	dir	dir	pixno	pixno	emo	note	note
; BASS CHANNEL
;	7	6	5	4	3	2	1	0
;	jump	-	-	-	-	-	note	note
; DRUM CHANNEL
;	7	6	5	4	3	2	1	0
;	jump	insptr	insptr	insptr	insptr	insptr	insptr	insptr

cLEFT=$00
cRIGHT=$20
cUP=$40
cDOWN=$60

cRED=$08
cGREEN=$10
cBLUE=$18

cEMO=$04

cA=$00
cB=$01
cC=$02
cD=$03

melotab_pickup0:
	!byte 0+cRED+cUP
	!byte 1+cRED+cUP
	!byte 2+cRED+cDOWN
	!byte 3+cRED+cLEFT
	!byte 0+cRED+cRIGHT
	!byte 3+cRED+cDOWN
	!byte 1+cRED+cLEFT
	!byte 2+cRED+cRIGHT
	!byte 256-8
melotab_drums0:
	!byte wavetab_kick-wavetab
	!byte wavetab_kick-wavetab+6
	!byte wavetab_snare-wavetab
	!byte wavetab_silence-wavetab
	!byte 256-4
melotab_drums1:
	!byte wavetab_kick-wavetab
	!byte wavetab_kick-wavetab+6
	!byte wavetab_kick-wavetab
	!byte wavetab_kick-wavetab+6
	!byte wavetab_snare-wavetab
	!byte wavetab_silence-wavetab
	!byte wavetab_kick-wavetab
	!byte wavetab_kick-wavetab+6
	!byte 256-8
melotab_pickup1:
	!byte 0+cRED+cLEFT
	!byte 0+cRED+cLEFT
	!byte 0+cRED+cLEFT
	!byte 0
	!byte 1+cRED+cRIGHT
	!byte 1
	!byte 2+cRED+cLEFT
	!byte 3+cRED+cUP
	!byte 3
	!byte 3
	!byte 2+cRED+cDOWN
	!byte 2
	!byte 1+cRED+cLEFT
	!byte 1
	!byte 2+cRED+cRIGHT
	!byte 1+cRED+cRIGHT
	!byte 256-16
melotab_pickup1resp:
	!byte 0+cBLUE+cRIGHT
	!byte 0+cBLUE+cRIGHT
	!byte 0+cBLUE+cRIGHT
	!byte 0
	!byte 1+cBLUE+cLEFT
	!byte 1
	!byte 2+cBLUE+cLEFT
	!byte 3+cBLUE+cRIGHT
	!byte 3
	!byte 256-1
melotab_redwalk_checkothas:
	!byte 0+cBLUE+cRIGHT
	!byte 0+cGREEN+cRIGHT
melotab_redwalk:
	!byte 0+cRED+cRIGHT
	!byte 1+cRED+cRIGHT
	!byte 2+cRED+cRIGHT
	!byte 3+cRED+cRIGHT
	!byte 256-4
melotab_blueupandwalk:
	!byte 0+cBLUE+cUP
	!byte 2+cBLUE+cUP
	!byte 3+cBLUE+cUP
melotab_bluewalk:
	!byte 0+cBLUE+cLEFT
	!byte 1+cBLUE+cLEFT
	!byte 2+cBLUE+cLEFT
	!byte 3+cBLUE+cLEFT
	!byte 256-4
melotab_redwonder:
	!byte 0+cRED+cRIGHT
	!byte 1+cRED+cUP+cEMO
	!byte 0+cRED+cLEFT
	!byte 2+cRED+cDOWN+cEMO
	!byte 256-4
melotab_redwonderresp:
	!byte 0+cBLUE+cLEFT
	!byte 1+cBLUE+cLEFT
	!byte 0+cBLUE+cRIGHT
	!byte 2+cBLUE+cLEFT
	!byte 256-4
melotab_redwonder2:
	!byte 2+cRED+cLEFT
	!byte 2+cRED+cRIGHT
	!byte 3+cRED+cEMO+cLEFT
	!byte 1+cRED+cEMO+cRIGHT
	!byte 0+cRED+cRIGHT
	!byte 0
	!byte 256-6
melotab_redhurry_bluecheckb4:
	!byte 0+cBLUE+cLEFT
melotab_redhurry:
	!byte 0+cRED+cLEFT
	!byte 3+cRED+cEMO+cLEFT
	!byte 256-2
melotab_success:
	!byte 0+cRED+cRIGHT
	!byte 0
	!byte 3+cRED+cEMO+cLEFT
	!byte 0
	!byte 1+cRED+cRIGHT
	!byte 0
	!byte 2+cRED+cEMO+cLEFT
	!byte 0
	!byte 256-8
melotab_firstfuck:
	!byte 0+cRED+cRIGHT
	!byte 0+cRED+cEMO+cLEFT
	!byte 256-2
melotab_working:
	!byte 0+cRED+cUP
	!byte 1+cRED+cLEFT
	!byte 2+cRED+cRIGHT
	!byte 0+cBLUE+cUP
	!byte 0+cRED+cDOWN
	!byte 3+cBLUE+cLEFT
	!byte 1+cBLUE+cRIGHT
	!byte 2+cBLUE+cDOWN
	!byte 256-8
melotab_suspicion:
	!byte 0+cRED+cRIGHT
	!byte 1+cRED+cRIGHT
	!byte 2+cRED+cRIGHT
	!byte 0+cBLUE+cUP
	!byte 0+cRED+cRIGHT
	!byte 3+cBLUE+cLEFT
	!byte 1+cBLUE+cRIGHT
	!byte 2+cBLUE+cDOWN
	!byte 256-8
melotab_returnhome:
	!byte 0+cRED+cRIGHT
	!byte 0+cBLUE+cLEFT
	!byte 256-2
melotab_blueseduced:
	!byte 0+cGREEN+cLEFT
	!byte 1+cGREEN+cLEFT
	!byte 2+cGREEN+cLEFT
	!byte 0+cGREEN+cLEFT
	!byte 0+cBLUE+cRIGHT
	!byte 1+cGREEN+cRIGHT
	!byte 1+cBLUE+cRIGHT
	!byte 2+cGREEN+cRIGHT
	!byte 2+cBLUE+cRIGHT
	!byte 3+cGREEN+cRIGHT
	!byte 3+cBLUE+cRIGHT
	!byte 3+cGREEN+cRIGHT
	!byte 0
	!byte 256-1
melotab_bluenegs:
	!byte 3+cBLUE+cRIGHT
	!byte 2+cBLUE+cLEFT
	!byte 256-2
melotab_murder0:
	!byte 3+cRED+cLEFT
	!byte 3+cRED+cRIGHT
	!byte 3+cGREEN+cRIGHT
	!byte 2+cGREEN+cRIGHT+cEMO
	!byte 1+cGREEN+cDOWN+cEMO
	!byte 0+cGREEN+cDOWN+cEMO
	!byte 0
	!byte 256-1
melotab_murder1:
	!byte 3+cBLUE+cRIGHT
	!byte 3+cBLUE+cLEFT
	!byte 3+cRED+cLEFT
	!byte 2+cRED+cLEFT+cEMO
	!byte 1+cRED+cDOWN+cEMO
	!byte 0+cRED+cDOWN+cEMO
	!byte 0
	;!byte 256-1
movedirshi:
	!byte 255
	!byte 0,255;0
scaletab:
	!byte 0,5,7,12		; list of scale structures
	!byte 0,3,4,10
	!byte 0,7,10,12
melotab_sorrow0:
	!byte 3+cBLUE+cDOWN
	!byte 0+cBLUE+cDOWN+cEMO
	!byte 3+cBLUE+cDOWN
	!byte 0+cBLUE+cDOWN+cEMO
	!byte 3+cBLUE+cDOWN
	!byte 0+cBLUE+cDOWN+cEMO
melotab_sorrow1:
	!byte 3+cBLUE+cLEFT
	!byte 3
	!byte 2+cBLUE+cRIGHT
	!byte 2
	!byte 1+cBLUE+cDOWN+cEMO
	!byte 1
	!byte 1
	!byte 0+cBLUE+cUP
	!byte 256-4
melotab_suicide:			; 3 free bytes
	!byte 1+cBLUE+cLEFT
	!byte 1+cBLUE+cRIGHT+cEMO
	!byte 256-2
melotab_redseduced:
	!byte 0+cGREEN+cRIGHT
	!byte 1+cGREEN+cRIGHT
	!byte 2+cGREEN+cRIGHT
	!byte 3+cGREEN+cRIGHT
	!byte 0+cGREEN+cLEFT
	!byte 0+cRED+cLEFT
	!byte 1+cGREEN+cLEFT
	!byte 1+cRED+cLEFT
	!byte 2+cGREEN+cLEFT
	!byte 2+cRED+cLEFT
	!byte 3+cGREEN+cLEFT
	!byte 3+cRED+cLEFT
	!byte 0
;	!byte 256-1
drumfreqtab:
movedirslo:
	!byte <-1,<1,<-40,<40
melotab_nodrums:
	!byte wavetab_silence-wavetab
	!byte 256-1
	!byte 228,2,220,60,15
	!byte 20, 10, 6,  4,  3,  2,   2,  1,  1 ;, 0
sidinitvalues:
	!byte $00,$99			; d400+5..+6
melotab_gotowork:			; 5 free bytes, merge tables of 3+2
	!byte 0+cRED+cLEFT
	!byte 0+cBLUE+cRIGHT
	!byte 256-2
	;;
melotab_drums2:
	!byte wavetab_snare-wavetab
	!byte 256-1
	;;
	  !byte $00,$f8			; d400+12..+13
melotab_bass:				; 5 free bytes, merge table of 5
melotab_silence: ; can be used as silence for melody
	!byte 3,0,0,0,256-4
	  !byte $00,$99			; d400+19..+20
	!byte 0,0,0			; non-free zeros
	;;
	  !byte $0f			; d400+24

; some more static tables
chstaticdelta:
	!byte 12+18,36+18,36+18
pixstaticdelta: ; separate staticdelta for emomode; needed?
	!byte 36+18,36+18, 41+18,41+18, 48+18,48+18
wavetab:
wavetab_lead:
	!byte $09,$21,$20,0	; normal melody
wavetab_snare:
	!byte $09,$81,$81,$81,$80,$80,0
wavetab_kick:
	!byte $09,$81,$11,$11,$10,$10,$10,$10,$10,0
wavetab_silence:
	!byte $09;,0
chregtab:
	!byte 0,7,14

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CODE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!zone start
mcstart:
	sei

initdemo:				; clear screen etc
	ldx #0
	stx $d020
	stx $d021
.poho	lda #0
	sta zerozone,x
	sta $d800,x
	sta $d900,x
	sta $da00,x
	sta $db00,x
	lda #160
	sta $0400,x
	sta $0500,x
	sta $0600,x
	sta $0700,x
	dex
	bne .poho

	ldx #numinitvalues-1		; init variables & sid
.vinits	lda initvalues,x
	sta tonic,x
	lda sidinitvalues,x
	sta $d405,x
	dex
	bpl .vinits

	inx ;ldx #0			; extend pitch table
.cptl	lda pitchlo,x
	asl
	sta pitchlo+12,x
	lda pitchhi,x
	rol
	sta pitchhi+12,x
	inx
	bne .cptl

	ldx #5				; disable fg color at exit points
	lda #32
.mxlp	ldy exitoffsets,x
	sta $0400+12*40,y
	dex
	bpl .mxlp

	;;; main loop begins ;;;

.pimps	lda $d011			; wait for raster
	bmi .pimps
.pimp2	lda $d011
	bpl .pimp2
	ldx #1				; handle tempo
	tickctr=*-1
	dex
	bne .pfonly
	jsr player_perrow
.pfonly	stx tickctr

player_everyframe:

	ldx #2
.dochs	lda chnote,x
	clc
	adc scaleidx
	tay
	lda scaletab,y
	adc tonic
	adc chstaticdelta,x
	tay
	lda pitchlo,y
	pha
	lda pitchhi,y
	pha
	ldy chinsptr,x
	lda wavetab,y
	ldy chregtab,x
	cmp #$0
	beq .nowave
	inc chinsptr,x
	sta $d404,y
.nowave	pla
	sta $d401,y
	pla
	sta $d400,y
	dex
	bpl .dochs

	ldx chinsptr+1
	lda drumfreqtab-1,x
	sta $d401+1*7

	lda tempo
	asl
	bpl .pimps

.hiu	ldx #7
.tsiu	lda endtext,x
	sta $0400+16+14*40,x
	lda #15
	sta $d800+16+14*40,x
	dex
	bpl .tsiu
	bmi .hiu

endtext:
	!scr "pwp 2010"

;;;;;;;;;;;;;;;;;;;;;;;;;;;; PER-NOTE CODE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

player_perrow:
	; channel pointers, jumps & noteindexes
	ldx #2
.zuu	ldy chrowptr,x
.zuu2	lda melotab,y
	bpl .nojmp
	clc
	adc chrowptr,x
	tay		; jumps never nested -> should work
	bcs .zuu2
.nojmp	iny
	sty chrowptr,x
	pha
	and #3
	sta chnote,x
	dex
	bpl .zuu

	inx
	stx chinsptr+0	; bass reset

	; bass channel
	pla

	; drum channel
	pla
	sta chinsptr+1

	; melody channel
	pla	; melody
	lsr
	lsr
	pha
	and #6 ; which pixel to move, 0=none
	tax
	pla
	beq .msile
	pha
	lda #0		; melody reset
	sta chinsptr+2
	sta (pixpos-2,x) ; unplot pixel
	pla
	lsr
	php		; emotioncolor bit
	lsr
	lsr
	pha
	and #3		; y = direction
	tay
	pla
	lda pixpos-2,x
	clc
	adc movedirslo,y
	sta pixpos-2,x
	lda pixpos-2+1,x
	adc movedirshi,y
	sta pixpos-2+1,x
	txa
	plp
	adc #0
	tay
	lda pixcolors-2,y
	sta (pixpos-2,x)
	lda pixstaticdelta-2,y
	sta chstaticdelta+2
.msile	
.xoox
	;readstream
	lda #0
	streamtimer=*-1
	bne .nostream
	ldy #0
.getop	lda (demostreamptr),y
	bpl .strmdono
.strmdo	tax
	iny
	lda (demostreamptr),y
	sta $00,x
	iny
	bne .getop
.strmdono
	sta streamtimer
.incstr	sec
	tya
	adc demostreamptr
	sta demostreamptr
	bcc .nostream
	inc demostreamptr+1
.nostream
	dec streamtimer
	ldx tempo
	rts

pitchlo
	!byte 116,123,130,138,146,155,164,174,184,195,207,219
zerozone:
	pitchhi=zerozone+256-12
