;	sing_on: a = pointer to lyrics (relative to lyrics label)
;	setsingfreq: get freq from chstat+5 -- FIXIT
;	sing_off: sets 0 to lyricsptr and reasonable irq freq

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;,; voice .sz=0 .ldsz=0
;,; <- voice_vars
;,; <- voice_phones
;,; <- voice_pointers
;,; <- voice_interrupt
;,; <- voice_sing_on
;,; <- lyrics

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;,; voice_vars .sz=0 .ldsz=0
;,; <- d_bitfetch .zp .sz=1 .ldsz=0
;,; <- d_bitcount .zp .sz=1 .ldsz=0
;,; <- d_offset .zp .sz=1 .ldsz=0
;,; <- d_loopcount .zp .sz=1 .ldsz=0
;,; <- lyricsptr .zp .sz=1 .ldsz=0
;,; <- singfreq .zp .sz=1 .ldsz=0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;,; voice_interrupt
;,; <- voice_vars
;,; <- voice_phones
;,; <- voice_pointers
;,; <- lyrics
;,; <- ptmp2 .zp .sz=1

voice_interrupt_start:
	cmp $9114
;	inc $900f
	pha
;	dec $900f

	asl d_bitfetch
	bcc .down

.up	lda #$1f ; de ; 10	tämän volumen vaihtelullahan saisi painotuseffektejä
	d_volvalue1=*-1
	sta $900e
;	lda ptmp2
	lda #$f0
	sta $900c
;	sta $900b
	;lda #$ff
	;sta $900b

	dec d_bitcount
	beq .fetch

	pla
	rti

.down	lda #$15;14 ; 4
	d_volvalue2=*-1
	sta $900e
	lda #$7e
	sta $900c
;	sta $900b

	dec d_bitcount
	beq .fetch	; a=8 already

	pla
	rti

.fetch	; FETCH NEW BYTE
	tya
	pha

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
   	    lda #$7f  ; voice off
	    sta $911e
	    lda #0
	    sta lyricsptr
	    sta $900c
	    lda #9
.nooff	tay
	lda ph_pointers,y
	tay
	sty .samplebase0
	sty .samplebase1

	lda voice_phones&0xff00,y
	sta .smplgt
	tay
	jmp .rl1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;,; voice_sing_on
;,; <- voice_vars
;,; -> voice_setsingfreq
;,; <- qtmp .zp .sz=1

voice_sing_on:
	sta lyricsptr

	lda #$7f
	sta $911e;sta $911e

	lda #0
	sta d_bitfetch
	lda #1
	sta d_bitcount
	lda #0
	sta d_offset
	lda #1
	sta d_loopcount

voice_setsingfreq:

	;KLU
	lda #0
	sta qtmp

	ldx singfreq

;	clc	; req!?
;	adc #8

;	and #15
;	tax
	lda digifreqs,x
	
;	lda #1
;	sta $9114
;	sta $9115

	asl
;	rol qtmp
;	asl
	rol qtmp
	sta $9114;$9114
	lda qtmp
	sta $9115;$9115

;KLU
;	asl
;	sta $9114
;	lda #0
;	rol
;	nop
;	sta $9115

	lda #$c0
	sta $911e;sta $911e
.rts	rts

digifreqs:	; korkeudet bassohömpästä
;!byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
!byte $ff
!byte $ff
!byte $ff
!byte (($ff-$95)*76)/32
!byte (($ff-$9b)*76)/32
!byte (($ff-$9f)*76)/32
!byte (($ff-$a5)*76)/32
!byte (($ff-$ab)*76)/32
!byte (($ff-$af)*76)/32
!byte (($ff-$b4)*76)/32
!byte (($ff-$b7)*76)/32
!byte (($ff-$bb)*76)/32
!byte (($ff-$bf)*76)/32
!byte (($ff-$c3)*76)/32
!byte (($ff-$c7)*76)/32
!byte (($ff-$ca)*76)/32
!byte (($ff-$cd)*76)/32
!byte (($ff-$cf)*76)/32
!byte (($ff-$d2)*76)/32
!byte (($ff-$d5)*76)/32
!byte (($ff-$d7)*76)/32
!byte (($ff-$d9)*76)/32
!byte (($ff-$db)*76)/32
!byte (($ff-$dd)*76)/32
!byte (($ff-$df)*76)/32
!byte (($ff-$e1)*76)/32
!byte (($ff-$e3)*76)/32
!byte (($ff-$e4)*76)/32

; nBase=8->4	eli taajuus #4 on perus-C (6)

; reqd range starts fron CAp0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;,; voice_pointers
;,; <- voice_phones
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;,; voice_phones .nocross

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

