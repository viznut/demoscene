;,; framer
;,; <- keyframer_mainloop

;,; streamvars .sz=0
;,; <- tmp .zp .sz=1
;,; <- drawto .zp .sz=2
;,; <- datamode .zp .sz=1
;,; <- stream .zp .sz=2
;,; <- framectr .zp .sz=1
;,; <- lastframectr .zp .sz=1
;,; <- loopctr .zp .sz=1
;,; <- dontloadbefore .zp .sz=1

;,; keyframer_mainloop
;,; <- streamvars
;,; <- ibpcaa
;,; <- ibpcdecomp
;,; <- loader
;,; <- voice
;,; <- player_consts

keyframer_mainloop:
	jsr keyframer_runop
	tya
	adc stream
	sta stream
	bcc .streaminc_nohi
	inc stream+1
.streaminc_nohi
	jmp keyframer_mainloop

keyframer_runop:
	ldy #0
	lda (stream),y
	bmi .op_more
	cmp #$40
	bcs .op_fill

	;;; 00..3F DATA

	ldx datamode
	bmi .op_data1
	bne .op_data4 ; check non8

.op_data8
	;and #$3f

	tax
	; precalc drawto-1?
.l0	iny
	lda (stream),y
	dey
	sta (drawto),y	;selfmod instead?
	iny
	dex
	bpl .l0
	clc
	tya
	adc drawto
	sta drawto
	bcc .notarginc
	inc drawto+1
.notarginc
	sec
	rts

.op_data4
	;and #$3f
	adc #1 ;c=0
	sta .op_data4_endcmp
	lda drawto
	sta .l0bl0
	sta .l0bl1
	lda drawto+1
	sta .l0bh0
	sta .l0bh1
	ldx #0
.l0b	iny
	lda (stream),y
	sta $9600,x
.l0bl0=*-2
.l0bh0=*-1
	inx
	lsr
	lsr
	lsr
	lsr
	sta $9600,x
.l0bl1=*-2
.l0bh1=*-1
	inx
	cpy #0		; rather compare to y?
.op_data4_endcmp=*-1
	bne .l0b

	clc
	txa
	adc drawto
	sta drawto
	bcc *+4
	inc drawto+1

	sec
	rts
.op_data1
	jmp ibpcdecomp  ; possibly insert here?

	;;; 40..7F FILL

.op_fill
	and #$3f
	tax
	inx	; minimum looplength 2

	lda drawto
	sta .l0cl0
	lda drawto+1
	sta .l0ch0

	txa
	sec
	adc drawto
	sta drawto
	bcc *+4
	inc drawto+1

	iny
	lda (stream),y
.l0c	sta $9600,x
	.l0cl0=*-2
	.l0ch0=*-1
	dex
	bpl .l0c
	; TODO INC DRAWTO
	sec
	rts
.op_more
	cmp #$C0
	bcs .op_secondary

	;;; 80..BF SKIP

.op_skip
	and #$3f
	sec
	adc drawto
	sta drawto
	bcc .op_skip_noinchi
	inc drawto+1
.op_skip_noinchi
	sec
	rts
.op_secondary
	cmp #$E0
	bcc .op_addr	; $C0..$DF

	;;; E0..FF OPER

	cmp #$E0	; $E0 == JUMP (set stream address)
	bne .op_jump_no
.op_jump		; doing loop: set loopctr to # loops (not # jumps!)
	lda loopctr
	bmi .noloopdec
	dec loopctr
.noloopdec
	bne .op_jump_do
	ldy #3
	clc
	rts
.op_jump_do
	iny
	lda (stream),y
	tax
	iny
	lda (stream),y
	stx stream
	sta stream+1
	ldy #0
	clc
	rts
.op_jump_no
	cmp #$E1	; $E1 == WAIT (wait n frames)
	bne .op_wait_no
.op_wait
	iny
	lda (stream),y
	clc
	adc lastframectr
	sta lastframectr
.lw0	lda #0
	.chunkctr=*-1
	cmp dontloadbefore
	bmi .noload
	inc $900f
	jsr loader_irq
	dec $900f
.noload
	lda lastframectr
	cmp framectr
	bne .lw0
	inc .chunkctr
	ldy #1 ;replaces previous sty/ldy tmp clowniness
	sec
	rts

.op_wait_no
	cmp #$E2	; $E2 == mode (set datamode) -- TODO sep into 3
	bne .op_mode_no
.op_mode
	iny
	lda (stream),y
	sta datamode
	sec
	rts
.op_mode_no
	cmp #$E3	; $E3 == ibpcaa -- TODO replace with direct call?
	bne .op_ibpcaa_no
	jmp ibpcaa
.op_ibpcaa_no
	cmp #$E4	; $E4 == clrscr -- TOOD replace with direct call?
	beq .op_clrscr_sub
;	cmp #$E5	; $E5 == sing
;	bne .op_sing_no
;.op_sing
;	iny
;	lda (stream),y
;	tay
;	lda #nC1
;	sta singfreq
;	jsr voice_sing_on
;	ldy #1
;	sec
;	rts
;.op_sing_no
.op_hlt			; HLT -- wait
	ldy #0
	clc
	rts

	;;; C0..DF ADDR

.op_addr		; can address all ram & i/o
	and #$1f
	cmp #$14
	bcc .hou
	adc #$80-$14-1	; 14..1F -> 90..9B
.hou	eor #$10	; 00..0F -> 10..1F; 10..13 -> 00..03
	sta drawto+1
	iny
	lda (stream),y
	sta drawto
	sec
	rts

.op_clrscr_sub
	iny
	lda (stream),y
	sta .fillcolor
	iny
	lda (stream),y
	sta .fillchar
	ldx #0
.clrl0	lda #0
	.fillcolor=*-1
	sta $9600,x
	sta $9700,x
	lda #0
	.fillchar=*-1
	sta $1e00,x
	sta $1f00,x
	dex
	bne .clrl0
	sec
	rts

;,; ibpcaa
;,; <- tmp .sz=1 .zp
;,; <- ibpcaablocks
ibpcaa:
     ldx #0
     lda #15
.l0  cmp $1e00+24,x     ; only affects chars 0..15
     bcc .c0		; recheck comparisons. must branch if >=16
     cmp $1e00+25,x        ; c=1 if >=16
     rol tmp
     cmp $1e00+23,x
     rol tmp
     cmp $1e00,x
     rol tmp
     cmp $1e00+48,x
     lda tmp
     rol
     and #15 ; faster than clear
     sta $1e00+24,x     ; 15 = all-zero neighbors (full-N)
     lda #15
.c0  dex
     bne .l0

     ldx #200
     lda #15
.l0b cmp $1e00+24+255,x
     bcc .c0b
     cmp $1e00+25+255,x
     rol tmp
     cmp $1e00+23+255,x
     rol tmp
     cmp $1e00+0+255,x
     rol tmp
     cmp $1e00+48+255,x
     lda tmp
     rol
     and #15 ; faster than clear
     sta $1e00+24+255,x  ; 0 = all-zero neighbors (full-N)
     lda #15
.c0b dex
     bne .l0b
     sec
     rts

;,; ibpcdecomp
;,; <- streamvars

ibpcdecomp:
	tax
	inx
	stx .endctr

.l1	iny
	lda (stream),y
        sta tmp

        lda drawto	; OPT combine to drawto+=8
	sta .p0
	sta .p1
	sta .p2
	sta .p3
	lda drawto+1
	sta .p0+1
	sta .p1+1
	sta .p2+1
	sta .p3+1

        ldx #7 

        lda #16
.l0     lsr tmp
        bcc .noblock             ; B (16) may replace 0..15
        cmp $1e00,x
	.p0=*-2
        bcc .nochange
        sta $1e00,x
	.p1=*-2
        dex
        bpl .l0
        bmi .o0
.noblock                        ; N (15) may replace 16
        cmp $1e00,x  ; OPT sbc? c=1 already, replace lda#0
	.p2=*-2
        bne .nochange
        lda #15
        sta $1e00,x
	.p3=*-2
        lda #16
.nochange
        dex
        bpl .l0
.o0
        lda drawto	; TODO make subroutine for drawto incrementing?
        clc
        adc #8
        sta drawto
        bcc .nohi 
        inc drawto+1
.nohi
	cpy #0
	.endctr=*-1
	bne .l1

	sec
	rts

