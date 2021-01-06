;	debuggausta: MIKÄ INTERRUPTEISSA HÄIRITSEE
;	- timer-interruptiin käytetään eri viaa kuin sarjaliikenteeseen
;	- jos interruptit enabloituna, tuleeko turhapasketta?
;	  (testaa part0:lla)

;	voicesynth interface:
;
;	sing_on: a = pointer to lyrics (relative to lyrics label)
;	setsingfreq: get freq from chstat+5 -- FIXIT
;	sing_off: sets 0 to lyricsptr and reasonable irq freq
;	

viat1lo=$9124
viat1hi=$9125

d_bitfetch=232
d_bitcount=231
d_offset=229
d_loopcount=230
lyricsptr=228
singfreq=227

; jos playerin (TMP0) koko "vähän päälle 256" (esim. 292) niin ei alignia

;!align 255,0

phones
phone_pause
!byte 3,0,0,0

qphone_a ; length 76 - expanded by factor 1.9
!byte 5
!byte %01100110
!byte %00011110
!byte %01100111
!byte %00111000
!byte %10100011

qphone_e ; length 76 - expanded by factor 1.9
!byte 5
!byte %00011100
!byte %00001111
!byte %10000111
!byte %11010011
!byte %10101000

qphone_i ; length 76 - expanded by factor 1.9
!byte 5
!byte %10101101
!byte %00101000
!byte %01011111
!byte %01111101
!byte %10000101

qphone_o ; length 76 - expanded by factor 1.9
!byte 5
!byte %11111100
!byte %11111000
!byte %01111001
!byte %01110000
!byte %11110100

qphone_u ; length 76 - expanded by factor 1.9
!byte 5
!byte %11111111
!byte %11000000
!byte %00000111
!byte %11111100
!byte %00000001

qphone_m ; length 76 - expanded by factor 1.9
!byte 5
!byte %01111111
!byte %10000011
!byte %00010101
!byte %00100110
!byte %00000000

qphone_n ; length 75 - expanded by factor 1.875
!byte 5
!byte %10100100
!byte %11111111
!byte %00011111
!byte %00000000
!byte %10101101

qphone_l ; length 76 - expanded by factor 1.9
!byte 5
!byte %11110000
!byte %11100000
!byte %11000011
!byte %10001111
!byte %11111100

qphone_k ; length 54 - expanded by factor 1.6875
!byte 4
!byte %11010011
!byte %01101100
!byte %11001001
!byte %00100110

qphone_t ; length 40 - expanded by factor 1.66666666666667
!byte 3
!byte %01100100
!byte %00010011
!byte %01010110

qphone_s ; length 67 - expanded by factor 1.675
!byte 5
!byte %10101101
!byte %10101011
!byte %01011010
!byte %01110101
!byte %10100101

qphone_p ; length 65 - expanded by factor 1.625
!byte 5
!byte %10011111
!byte %11011111
!byte %11111100
!byte %11110000
!byte %00000001

qphone_h ; length 63 - expanded by factor 1.96875
!byte 4
!byte %00000110
!byte %01010010
!byte %11010110
!byte %10101010

qphone_x
!byte 8
!byte 220|$88,67|$aa,190|$88,57|$aa,180|$88,47|$aa,37|$88,160|$aa
;!byte 105|$88,95|$aa,218|$88,18|$aa,141|$88,198|$aa,131|$88,254

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;	need player globals

!zone digi_ticksync
digi_ticksync:

	lda chstat+4
	beq .rts
	cmp #1
	beq .rts

	clc ; KNOWN STATE
	adc chstat+5
	sta singfreq
.c2	lda lyricsptr
	beq .sei

	lda chctr+1
	cmp #1
	bne .rts

	lda d_loopcount
	bne .c1
	inc d_loopcount

.c1	jsr setsingfreq

.rts	rts
.sei	lda #$57 ; was $67
	sta $900e
	d_volvalue0=*-1
	sei
	rts

!zone voicesynth
digi_int:	; PLAY 1 BIT
	lda viat1lo

	asl d_bitfetch	;!!!
	bcc .down	;!!!

	; ORIG:de

.up	lda #$de ; de ; 10	tämän volumen vaihtelullahan saisi painotuseffektejä
	d_volvalue1=*-1
	sta $900e
	sta $900b
	sta $900c

	dec d_bitcount
	beq .fetch	;!!!

	pla
	tay
	pla
	tax
	pla
	rti

.down	lda #$58;14 ; 4
	d_volvalue2=*-1
	sta $900e
	lda #$7e ; e
	sta $900c
	sta $900b

	dec d_bitcount
	beq .fetch	; a=8 already

.rti	pla
	tay
	pla
	tax
	pla
	rti

	; e on liian "ö"?
	; o on liian "ö/e" myös

.fetch	; FETCH NEW BYTE
	lda #8
.fetch8	sta d_bitcount

	ldy d_offset
	beq .looped

	lda phone_pause,y
	.samplebase0=*-2

	sta d_bitfetch

	dec d_offset	; 5  (vs dey+sty = 5)

	pla
	tay
	pla
	tax
	pla
	rti

.looped	; NEXT ROUND
	dec d_loopcount
	beq .ldphn
	bpl .noinf
	inc d_loopcount	; keep at zero
.noinf

	ldy #2		; samplelength (offset of last byte)
	.smplgt=*-1
.rl1	lda phone_pause,y	; fetch last byte
	.samplebase1=*-2

	dey
	sty d_offset

	pla
	tay
	pla
	tax
	pla
	rti

.ldphn	; LOAD NEW PHONEME   (DONT USE X)

	ldy lyricsptr
	lda lyrics,y
	lyricbaseptr=*-2
	inc lyricsptr

	pha		; high nybble = length (1..f, or 0 = wait)
	and #$f0
	lsr
	lsr

	sta d_loopcount
	pla

	and #$0f	; low nybble = phoneme id
	cmp #$0f
	bne .nooff
	    jsr sing_off
	    lda #9
.nooff	tay
	lda ph_pointers,y
	tay
	sty .samplebase0
	sty .samplebase1

	lda phones,y
	sta .smplgt
	tay
	jmp .rl1

sing_on:
	sta lyricsptr

	    sei
	    ldx #<digi_int
	    stx $314
	    ldx #>digi_int
	    stx $315

	    lda #0
	    sta d_bitfetch
	    lda #1
	    sta d_bitcount
	    lda #0
	    sta d_offset
	    sta d_loopcount

setsingfreq:
	;lda #8 ; 4 ; 8 ; chstat+4
	;lda chstat+5

;	lda chstat+5
;	cmp #1
;	beq .seirts

	lda singfreq

	 clc
	 adc #8

	 and #15
	 tax
	 lda digifreqs,x

	 asl
	 ;clc

	 sei

	 sta viat1lo	;!!!
	 lda #0
	 adc #0
	 sta viat1hi	;!!!
	 cli

.rts	rts
;.seirts	sei
;	rts

sing_off:
	lda #0
	sta lyricsptr
	sta $900c
	sei
	lda #128
	sta viat1hi	;!!!
	rts


digifreqs:	; korkeudet bassohömpästä
;!byte $ff
;!byte 121*2
;!byte 114*2
;!byte 108*2
;!byte 203
;!byte 191

;!byte 181	; -- nBASE 28 mätsää tässä

;!byte 171

;; lowside

!byte 161, 152, 144, 136, 128, 121, 114, 108
!byte 102,  96,  91,  86,  81,  76,  72,  68

;; hiside


;;
;!byte 255,255,255,255,255,255

ph_pointers
	!byte <qphone_o	; 0
	!byte <qphone_i	; 1
	!byte <qphone_n	; 2
	!byte <qphone_e	; 3
	!byte <qphone_h	; 4
	!byte <qphone_s	; 5
	!byte <qphone_u	; 6
	!byte <qphone_l	; 7
	!byte <qphone_m	; 8
	!byte <phone_pause	; 9
	!byte <qphone_a	; a
	!byte <qphone_p	; b
	!byte <qphone_k	; c
	!byte <qphone_t	; d
	!byte <qphone_x ; e
	!byte <phone_pause

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

lyrics:
	!byte $0f
texts=lyrics+$ca
texts_end=texts+$a9
