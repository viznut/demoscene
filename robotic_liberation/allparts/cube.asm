cube_angle=209
cube_zoom=208
cube_col0=207
cube_col1=206

cube_exptab = $1b00-168
cube_logx   = $16d0
cube_logy   = $1b00-168-80
cube_dxlo   = $1b00
cube_dxhi   = $1b30

!zone drawcube

	.y0=251
	.xlo=255
	.xhi=254
	.tmp=253

drawcube:

	lda #0			; angle+0
.nx	sta .tmp

	;;; get angle

	lda cube_angle
	and #31
	ora .tmp
	cmp #17+32
	bpl .rts
	tax

	;;; get parms

	lda cube_logy+32,x	; y1
	jsr .gety
	sta .y1

	lda cube_logx,x		; x
	clc
	adc cube_zoom
	tay
	lda cube_exptab,y
	sta .xhi

	lda cube_dxlo,x		; dx
	sta .dxlo
	lda cube_dxhi,x
	sta .dxhi

	;;; get color

	ldy cube_col0
	lda .tmp
	clc
	adc cube_angle
	and #32
	bne .tsu2
	ldy cube_col1
.tsu2	sty .color

	lda cube_logy,x		; y0
	jsr .gety
	tax

	;;; drawside

	cpx #0
	bmi .nodraw
	cpx .y1
	bcs .nodraw

.l1	clc
	lda .xlo
	adc #0
	.dxlo=*-1
	sta .xlo
	lda .xhi
	adc #0
	.dxhi=*-1
	sta .xhi

	sta segw,x
	lsr
	eor #$ff
	clc
	adc #128 ;128
	cube_xmiddle=*-1
	sta segs,x

	lda #$f0
	.color=*-1
	sta segc,x

	inx
	bmi .rts	; da final rts, no more sides after this
	cpx #50
	.y1=*-1
	bne .l1

	;;;

.nodraw	;lda .y1
	;sta .y0

	lda .tmp		; redo, angle+32
	eor #32
	beq .rts
	jmp .nx
.rts	rts

.gety
 	lsr
   	php
   	clc
   	adc cube_zoom
   	tay
   	lda cube_exptab,y
	lsr
	lsr
   	plp
   	bcc .c1
  	eor #$ff
.c1	clc
	adc #80
	cube_ymiddle=*-1
	rts

cube_end:
