!zone zoomer

	.xbak=255
	.ulo=254
	.tmp=253
        .halfdulo=252
        .halfduhi=251

	pic_c=$1a00
	pic_w=$1a40
	pic_s=$1a80
	     ; 1ac0-1aff in use (nrasc)

	npic_c=$1c40
	npic_w=$1c80
	npic_s=$1cc0

	npic2_c=$1d40
	npic2_w=$1d80
	npic2_s=$1dc0

	exptab=$1b00
	      ;1b40-? 1bc0-?

zoomer:

	;;; zoom presets ;;;

	;;; initial hpos ;;;

	ldy #0	; u=0
	sty .ulo

	;;; hdeltas ;;;

	lda #0
	sta .duhi

	;;; horizontal zoom factor ;;;

	lda #0		; 0..63 quite ok
	hzoom=*-1
	;clc
	;adc #<exptab
	sta .hzoomfac0
	sta .hzoomfac1

	;;; vertical zoom factor ;;;

	; 1.0 = abt half visible	64	max
	; 2.0 = nice 			48

	; using extab: +16..+127 (16..245)

	ldx #0
	vzoom=*-1
	lda exptab,x
	sta .dulo

	ldx #5
.cc0	lda .dulo
	sta .halfdulo
	lda .duhi
	sta .halfduhi

	asl .dulo
	rol .duhi
	dex
	bne .cc0


;	lda .halfduhi
;	eor #$ff
;	tay


segzoom_do:

	;;; zoom: preset uhi.ulo, duhi.dulo, hzoomfac, hmiddle ;;;

	lda #127-FIRSTLINE	; 95, xor by 1 on each frame
	.line0=*-1
	eor #1
	sta .line0
	tax
	lsr
	bcs .noh

	    lda .ulo	; u += du/2
	    adc .halfdulo
            sta .ulo
            tya
            adc .halfduhi
	    tay
.noh


.vzl0	lda .ulo	; ulo += dulo
	adc #0
	.dulo=*-1
	sta .ulo

	tya		; uhi += duhi+c
	adc #0
	.duhi=*-1
	and #63
	tay

	cpy #150
	bcc .huu
	    lda #0
	    sta segc+FIRSTLINE,x
	    beq .eob
.huu
	stx .xbak
	ldx pic_w,y	; segw[x] = exp[hzoomfac+pic.w[uhi]]
	bne .noempt

.empty	lda #255
	ldx .xbak
	sta segs+FIRSTLINE,x
	sta segs+1+FIRSTLINE,x
	jmp .sts

.noempt	lda exptab+32,x
	.hzoomfac0=*-2
	cmp #16	; w < sumthg
	bcc .empty
	ldx .xbak
.hoo	sta segw+FIRSTLINE,x
	sta segw+1+FIRSTLINE,x

	lda pic_c,y	; segc[x] = pic.colors[uhi]
	sta segc+FIRSTLINE,x
	sta segc+1+FIRSTLINE,x

	lda #128	; segs[x] = hmiddle-exp[hzoomfac+pic.s[uhi]]
	.hmiddle=*-1
	ldx pic_s,y
	sec
	sbc exptab+32,x
	.hzoomfac1=*-2

	ldx .xbak
.sts	sta segs+FIRSTLINE,x
	sta segs+1+FIRSTLINE,x

.eob	dex
	dex
	bpl .vzl0
	rts

zoomer_end:
