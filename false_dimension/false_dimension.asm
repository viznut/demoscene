*=$0a80
!cpu 6510
!to "falsedim-nc.prg"

;;; memconfig

workbuf=$8000
;fxpitchlo=$ed
;fxpitchhi=$ee
rnd_a=$e4
rnd_b=$e5
rnd_c=$e6
framehi=$e7
framelo=$e8
chstates=$e9
tmp=$ff
tmp2=$fe
tmp3=$fd
tmp4=$fc

;;; code

!zone main
mcstart:
	lda #0
	sta $d020
	lda #$f
	sta $d021

;	jmp textskip
	ldx #64
.w1	lda starttext-64,x
	jsr $ffd2
	ldy #3
.w00	lda 162
.w0	cmp 162
	beq .w0
	dey
	bne .w00
	inx
	bne .w1
textskip:
	ldx #9
	jsr setpalette

	lda #%00011110
	sta $d018
	lda #%11010000
	sta $d016
	lda #15
	sta $d418

	ldx #0
	stx framelo
	stx framehi
.l2	lda #8
	sta $d800,x
	sta $d900,x
	sta $da00,x
	sta $db00,x
	lda #0
	sta $0400-40,x
	sta $0700+40,x
	sta $0800,x
	sta $0900,x
	dex
	bne .l2

	jsr genchars
	jsr initmusic

	sei
	lda #133	; sync
.zzu	cmp $d012
	bne .zzu
	lda #127
	sta $dc0d
	and $d011
	sta $d011
	lda #255
	sta $d012
	lda #<perframe
	sta $314
	lda #>perframe
	sta $315
	lda #1
	sta $d01a
	cli

.l3	
	lda #$1f
	.vol=*-1
	sta $d418
	and #$f
	beq .reset
	cmp #$f
	beq .z33
	dec .vol
.z33
	jsr readdesignbyte
	bne .l33
	dec .vol
	jsr readdesignbyte
.l33	tax
	jsr readdesignbyte

	jsr srand

	jsr drawblots
	jsr dobackground
	jsr drawblots
	jsr doforeground
	jsr do1bpcaa

	jsr waitmanyframes
	jsr fadein
	jsr waitmanyframes
	jsr fadeout

	jmp .l3
.reset	sei
	lda #$40
	sta $d404
	sta $d011
	ldx #0
.z00	lda $d012
	bne .z00
	dex
;	bne .z00
;	dey
	bne .z00
	jmp 64738

starttext
	!byte 147,14,144
	!text 13
	!text 13
	!text 13
	!text 13
	!text 13
	!text "  dEAR AUDIENCE,"
	!text 13
	!text 13
	!text 13
	!text "  i RECENTLY VISITED A PLACE",13
	!text 13
	!text "  CALLED ",34,"fALSE dIMENSION",34,".",13,13,13
	!text "  i HOPE YOU ENJOY THIS SMALL BATCH OF",13
	!text 13
	!text "  PHOTOGRAPHS FROM THERE.",13,13
	!text 13
	!text "  rEGARDS,",13,13
	!text 13
	!text "  vIZNUT/pwp             "

;;; gfx rendering

readdesignbyte:
	inc .dbctr
	bne .c66
	inc .dbctr+1
.c66
	lda picorder-1
	.dbctr=*-2
	rts

!zone dobackground
dobackground:
	lda #$81
	sta .v0+1
	lda #128-20
	sta .v0
	lda #$04
	sta .v1+1

	ldy #0
.l1	ldx #39

.l0	lda workbuf,x
	.v0=*-2
	bmi .c1
	eor #$ff
.c1	asl
	and #$f0
	sta $0400,y
	.v1=*-2

	dex
	bpl .c3
	ldx #39
	lda .v0
	clc
	adc #64
	sta .v0
	bcc .c3
	inc .v0+1
.c3
	iny
	;cpy #$ff
	bne .l0
	inc .v1+1
	lda #8
	cmp .v1+1
	bne .l0
	rts

!zone doforeground
doforeground:
	lda #$81
	sta .v0+1
	lda #128-20 ;0 ;128-64
	sta .v0
	lda #$04
	sta .v1+1

	ldy #0
.l1	ldx #39

.l0	lda workbuf,x
	.v0=*-2
	bmi .c1
	lda #0
	sta $0400,y
	.v1=*-2

.c1	dex
	bpl .c3
	ldx #39
	lda .v0
	clc
	adc #64
	sta .v0
	bcc .c3
	inc .v0+1
.c3
	iny
	;cpy #$ff
	bne .l0
	inc .v1+1
	lda #8
	cmp .v1+1
	bne .l0
	rts

!zone do1bpcaa
do1bpcaa:
	ldx #3
	stx tmp
.l1	stx .v1+1
	stx .v4+1
	inx
	stx .v0+1
	stx .v2+1
	stx .v3+1
	stx .v5+1

.l0	lda $0400,x
	.v0=*-2
	beq .c0
	ldy $0400-40,x
	.v1=*-2
	bne .c1
	ora #1
.c1	ldy $0400+40,x
	.v2=*-2
	bne .c2
	ora #2
.c2	ldy $0400+1,x
	.v3=*-2
	bne .c3
	ora #4
.c3	ldy $0400-1,x
	.v4=*-2
	bne .c4
	ora #8
.c4	sta $0400,x
	.v5=*-2
.c0	inx
	bne .l0
	inc tmp
	ldx tmp
	cpx #7
	bne .l1
	rts


!zone random
srand:
	sta rnd_c
	stx rnd_b
	and rnd_b
	;eor #$55
	sta rnd_a
	rts

rand:
	sec
	lda rnd_a
	adc rnd_b
	eor rnd_c
	sta rnd_a
	ror rnd_c
	rol rnd_b

;	lda rnd_a
;	eor rnd_c
;	adc rnd_b
;	sta rnd_a
;	bmi .c1
;	ror rnd_c
;.c1	ror rnd_b
	rts

!zone drawbase
drawbase:
	jsr rand
	sta .v2
	lda rnd_c
	and rnd_b
	and #31 ; FIXED!
	sta .v0
	lda #0
	bcc .c1
	lda rnd_c
.c1	sta .v3

;	lda #$85
;	sta .v1+1
	ldx #0
.l0	jsr rand
	and #0
	.v0=*-1
	adc #0
	.v2=*-1
	sta $8000,x
	sta $80f0,x
	sta $81e0,x
	sta $82d8,x
	sta $83c8,x
	eor #0
	.v3=*-1
	sta $8500-64-20,x
	sta $85f0-64-20,x
	sta $86e0-64-20,x
	sta $87d0-64-20,x
	dex
	bne .l0

	;dec .v1+1
	;bpl .l0
	rts

!zone drawblots
drawblots:
	jsr rand
	;and rnd_c
	and #63
	adc #8
	sta tmp4
	jsr drawbase
.l0	jsr drawblot
	dec tmp4
	bne .l0	
	rts

!zone drawblot
drawblot:
	;inc $d020
	jsr rand
	ora rnd_c
	and #$3
	ora #$80
	sta .linemid0+1
	sta .linemid1+1
	sta .linestart0+1
	sta .linestart1+1

	jsr rand
	ora rnd_c
	sta .linemid0
	sta .linemid1
	sta .linestart0
	sta .linestart1

	jsr rand
	and rnd_b
	and #7
	adc #2
	tax
	stx tmp3

	jsr rand
	and rnd_c
	;and rnd_b
	and #15
	bcc .c1
	asl
.c1	adc #1
;	lda #2
	;lda #10	; da: 
	sta .da0
	eor #$ff
	tax
	inx
	stx .da1

	lda #63
	sta .dlinestart

	ldx #1
	stx tmp2
.l5	jsr drawblotlines
	inc tmp2
	ldx tmp2
	cpx tmp3
	bne .l5

	lda #65
	sta .dlinestart

.l6	jsr drawblotlines
	dec tmp2
	ldx tmp2
;	ldx tmp2
;	dex
;	stx tmp2
	bne .l6
	;dec $d020
	rts

drawblotlines:
	; x = width
	; preset .da0, .da1, ..linemid*, .linestart* and .dlinestart

	ldy #1
	;cpx #0
	;beq .l1c
	;bmi .l1c
	stx tmp
.l0	tya
	adc #0
	.da0=*-1
	tay
	clc
	adc 666,x	; points to midpoint
	.linemid0=*-2
	;lda #0
	sta 666,x
	.linemid1=*-2
	dex
	bne .l0

	ldx tmp
	dex
	beq .l1c
.l1	tya
	clc
	adc #0	; negated
	.da1=*-1
	tay
	adc 666,x	; points to left end
	.linestart0=*-2
	;lda #0
	sta 666,x
	.linestart1=*-2
	dex
	bne .l1
.l1c
	lda .linemid0
	clc
	adc #64
	sta .linemid0
	sta .linemid1
	bcc .c2
	inc .linemid0+1
	inc .linemid1+1
.c2
	lda .linestart0
	clc
	adc #64
	.dlinestart=*-1
	sta .linestart0
	sta .linestart1
	bcc .c3
	inc .linestart0+1
	inc .linestart1+1
.c3
	rts

!zone perframe
perframe:
;	inc $d020
;	pha
;	txa
;	pha
;	tya
;	pha

	lda $d011
	eor #2 ; 1
	and #$f7
	sta $d011
 
;	lda #8
	;sta $d400
;	sta $d401

;	lda framelo
;	sta $d402
;	sta $d403
;	eor framehi
;	sta $d405
;	lsr
;	sta $d400
;	sta $d406
;	eor framelo
;	eor #$40
;	and #$f1
;	sta $d404

	jsr playmusic

;	lda framelo

;	ldx #0
;	.v0=*-1
;	dex
;	bpl .c1
;	ldx #4
;.c1	stx .v0
;	lda hwiggle,x
;	sta $d016
;perframe_q:
;	dec $d020
;	pla
;	tay
;	pla
;	tax
;	pla
	asl $d019
	jmp $ea31

!zone genchars
genchars:
	ldy #7
.l1	ldx #127
.l0	lda edgechars,x
	ora rasterchars,y
	.v1=*-2
	sta $3800,x
	.v2=*-2
	dey
	bpl .c1
	ldy #7
.c1	dex
	bpl .l0
	lda .v1
	clc
	adc #8
	sta .v1
	bcc .c2
	inc .v1+1
.c2	lda .v2
	clc
	adc #128
	sta .v2
	bcc .l1
	inc .v2+1
	bpl .l1
	rts

!zone miscroutines
waitmanyframes:
	lda #31
	ldx chptrs+2
	cpx #fxfastpats-musicdata+128
	bpl .c4
	asl
.c4	sta tmp
.zu0	jsr waitframe
	lda framelo
	and tmp
	bne .zu0
	rts
waitframe:
;	jsr waitframe2
waitframe2:
.c01	lda $d012
	php
	adc #0
	wfctr=*-1
	and #15
	eor #11
	cmp #8
	bcc .zz0
	eor #15
.zz0	ora #%11010000
	ldy $d012
.c00	cpy $d012
	beq .c00
	sta $d016
	plp
	bne .c01
	inc wfctr
	rts

waitframe3:
	lda #0
	inc *-1
	;eor $d012
	and #7
	ora #%11010000
	ldy $d012
.c0	cpy $d012
	beq .c0
	sta $d016
	cpy #0
	bne waitframe2

.c1	lda $d012
	beq .c1
	rts

setpalette:
	lda palette,x
	sta $d021
	lda palette+2,x
	sta $d022
	lda palette+4,x
	sta $d023
	rts

fadeout:
	ldx #0
.l0	jsr waitframe
	jsr setpalette
	inx
	cpx #10
	bne .l0
	rts

fadein:
	ldx #9
.l1	jsr waitframe
	jsr setpalette
	dex
	bpl .l1
	rts

;;;;;;;;;;;;;;;;;;; MUSIC CODE & DATA ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!zone playmusic_init
initmusic:
	lda #$f1
	sta $d417
;	lda #100
;	sta $d416

	lda #$ff
	sta $d405
	sta $d406
;	lda #4
;	sta $d400
;	sta $d401
;	lda #10
;	sta $d402
;	sta $d403
;	lda #$08
;	sta $d404
	lda #$41
	sta $d404

	lda #$04
	sta $d405+7
	lda #$fc ;f8
	sta $d406+7
;	lda #$08
;	sta $d402+14

	lda #$8
	sta $d403+14

;	lda #$ff
;	sta $d405+14
;	lda #$ff
;	sta $d406+14
;	lda #$09
;	sta $d404+14

;	tilutus: ADSR 44 F8, wavetable 210C 2000

	; precalc pitchtables

	ldx #0
.cptl	lda pitchlo,x
	asl
	sta pitchlo+12,x
	lda pitchhi,x
	rol
	sta pitchhi+12,x
	inx
	bne .cptl

	rts

	;inc $d020

!zone playmusic
playmusic:
	inc framelo
	bne .c6
	inc framehi
	lda framehi
	and #3
	bne .c6

	ldx #0
	.v4=*-1
	inc .v4
	lda ch0pats,x
	sta chptrs
	lda ch1pats,x
	sta chptrs+1
	lda ch2pats,x
	sta chptrs+2
	lda ch2speeds,x
	sta chspds+2
.c6

!zone playmusic_score
playmusic_score:
;	inc $d020
	ldx #2
.l0	dec chticks,x
	bne .c1
	lda chspds,x
	sta chticks,x
	ldy chptrs,x
.c3	lda musicdata-128,y
	bpl .c2
	tay
	bmi .c3
.c2	sta chstates,x
	iny
	tya
	sta chptrs,x
.c1	dex
	bpl .l0
;	dec $d020

!zone playmusic_bass
playmusic_bass:
	ldx chstates+0
;	stx $d403+14
	lda pitchlo,x
	sta $d400
	lda pitchhi,x
	sta $d401

	lda chticks+1
	and #7
	bne .z8
	lda #0
	windctr=*-1
	bpl .z88
	eor #$ff
.z88	adc #8
	sta $d416
	inc windctr
.z8

	ldx #0
	.v0=*-1
	inx
	inx
	stx .v0
	txa
	bmi .c7
	eor #$ff
.c7	adc #4
	ror
	ror
	ror
	sta $d403
	sta $d402

	;;; leadchannel sound

!zone playmusic_lead
playmusic_lead:
	lda chstates+1
	beq .z3
	ldx chticks+1
	;cpx #5
	;bcc .z3
	lda leadwaves,x
	sta $d404+7
	lda leadarps,x
	clc
	adc chstates+1
	adc chstates+0
	tay
	lda pitchlo,y
	sta $d407
	lda pitchhi,y
	sta $d408
.z3	

	;;; fxchannel sound

!zone playmusic_fx
playmusic_fx:
	lda chstates+2
	beq .c0
	pha
	lsr
	lsr
	tax
	lda fxad,x
	sta $d405+14
	lda fxsr,x
	sta $d406+14
	pla
	tax
	cmp #4
	bcs .c1
	clc
	lda #0
	fxpitchlo=*-1
	adc fxpitchdeltalo-1,x
	sta fxpitchlo
	sta $d400+14
	lda fxpitchdeltahi-1,x
	pha
	adc #6
	fxpitchhi=*-1
	sta fxpitchhi
	sta $d401+14
	pla
	and #1
	eor #$81
	sta $d404+14
	bmi .c0
.c1	lda fxwave-4,x
	beq .c0
	sta $d404+14
	lda fxpitch-4,x
	sta $d400+14
	sta $d401+14
	inx
	stx chstates+2
.c0
	rts

chticks	!byte 1,1,1
chspds	!byte 128,8,64
chptrs	!byte basspat0-musicdata+128
	!byte 128 ; leadpat0-musicdata+128
	!byte fxpat0-musicdata+128

leadwaves !byte $10,$10,$10,$10,$20,$20,$11,$09
leadarps  !byte $00,$00,$00,$00,$0c,$00,$18;,$0c

ch0pats
	; 8 kuvaa per askel -> 32 askelta
	!byte basspat0-musicdata+128	; melo
	!byte basspat0h-musicdata+128

	!byte basspat0-musicdata+128	; pikatilu
	!byte basspat0h-musicdata+128

	!byte basspat0-musicdata+128	; suvanto
	;!byte basspat0h-musicdata+128

	!byte basspat0-musicdata+128	; melo
	!byte basspat0h-musicdata+128

	!byte basspat0-musicdata+128	; pikatilu
	!byte basspat0h-musicdata+128

	!byte basspat0-musicdata+128	; suvanto
	;!byte basspat0-musicdata+128	; suvanto

	!byte basspat0-musicdata+128
	!byte basspat0h-musicdata+128
	!byte basspat0h-musicdata+128
	!byte basspat0h-musicdata+128
ch1pats
	!byte leadpat0-musicdata+128	; melo
	!byte leadpat0-musicdata+128

	!byte leadpat2-musicdata+128	; pikatilu
	!byte leadpat2-musicdata+128

	!byte leadpat3-musicdata+128	; suvanto
	;!byte leadpat3-musicdata+128

	!byte leadpat0-musicdata+128	; melo
	!byte leadpat0-musicdata+128

	!byte leadpat4-musicdata+128	; pikatilu
	!byte leadpat4-musicdata+128

	!byte leadpat3-musicdata+128	; suvanto
	;!byte leadpat3-musicdata+128	; suvanto

	!byte leadpat0-musicdata+128
	!byte leadpat2-musicdata+128
	!byte 128 ; leadpat2-musicdata+128
	!byte 128 ; leadpat2-musicdata+128
ch2pats
	!byte fxpat1-musicdata+128	; melo
	!byte fxpat1-musicdata+128

	!byte fxpat2-musicdata+128	; pikatilu
	!byte fxpat2-musicdata+128

	!byte fxpat0-musicdata+128	; suvanto

	!byte fxpat1-musicdata+128	; melo
	!byte fxpat1-musicdata+128

	!byte fxpat2-musicdata+128	; pikatilu
	!byte fxpat3-musicdata+128

;	!byte fxpat1-musicdata+128	; melo
;	!byte fxpat1-musicdata+128

	!byte fxpatrare-musicdata+128	; suvanto

	!byte fxpat0-musicdata+128
	!byte fxpatendfast-musicdata+128
	!byte fxpatendfast-musicdata+128
	!byte fxpatendfast-musicdata+128
	!byte 128

;	!byte fxpat0-musicdata+128	; suvanto

;	!byte 128
;	!byte 128
;	!byte 128
;	!byte 128
;	!byte 128
;	!byte 128
;	!byte 128
ch2speeds
	!byte 16	; melo
	!byte 16

	!byte 16	; pikatilu
	!byte 16

	!byte 16	; suvanto
	!byte 16

	!byte 16	; melo
	!byte 16

	!byte 16	; pikatilu
	!byte 16

	!byte 128	; suvanto

	!byte 32	; melo
	!byte 128
	!byte 128
	!byte 128

musicdata:
zeropat:
	!byte 0,128
basspat0:
;	!byte 36,38,39,38,36,38,34,36,basspat0-musicdata+128
	!byte 36,36,38,39,36,36,38,34,basspat0-musicdata+128
;	!byte 36,36,39,38,36,36,34,41,basspat0-musicdata+128
;	!byte 36,36,38,39,38,38,34,36,basspat0-musicdata+128
basspat0h:
	!byte 41,41,48,44,39,39,46,43,basspat0h-musicdata+128
	; tähän enemmän kohoa
basspat1:
	!byte 36,36,34,39,basspat1-musicdata+128
leadpat0:
	!byte 12,36,24
	!byte leadpat0-musicdata+128
leadpat1:
	!byte 36,24,12,31 ; ,36,24,24,36,24
;	!byte 36,24,12,36,24,12,36,24
	!byte leadpat1-musicdata+128
leadpat2:
	!byte 48,36,24,36
;	!byte 24,12,24,12
	!byte 48,36
	;!byte 24,0,36,12
	!byte leadpat2-musicdata+128
;	!byte 24,24,27,24,31,24,27,24,12,24,27,24,31,24,27,24

leadpat4:
	!byte 12,24,36,48
	!byte 36,24,12,24
	!byte leadpat4-musicdata+128
leadpat3:
	!byte 36,39,38,0,0,0,0,0
	!byte leadpat3-musicdata+128
fxpat0:
;	!byte 0,0
fxpat0r:
	!byte 1,1,1
	!byte 3,3
	!byte fxpat0r-musicdata+128
fxpat1:
	!byte 4,0,12,4,20,0,12,0
	;,4,0,0
	;!byte 4,0,4,0
	!byte fxpat1-musicdata+128
fxpatrare:
	!byte 4,1,3,1,4,3,1,3
	!byte fxpatrare-musicdata+128
fxfastpats:
fxpat2:
	!byte 20,4,12,4 ; 20,12,20,4,4,20
	!byte fxpat2-musicdata+128
fxpat3:
	!byte 20,20,4,4
	!byte fxpat3-musicdata+128
fxpatendfast:
	!byte 20,0
	!byte fxpatendfast-musicdata+128

fxad ; for groups of 4 steps ; todo -> 8
	!byte $ff, $04,$04, $00,$00, $04,$04,$04,$04
fxsr ; for groups of 4 steps
	!byte $ff, $e6,$e6, $fd,$fd, $fc,$fa,$e8,$e7
fxpitchdeltalo ; for steps 1..3
	!byte $04,$f0,$fc
fxpitchdeltahi ; for steps 1..3
	!byte $00,$ff,$ff
fxwave ; starting from step 4
	!byte $09,$81,$41,$41,$80,$80,$80,0	; tuhnusnare
	!byte $09,$81,$11,$41,$11,$11,$10,0
	!byte $09,$81,$41,$81,$41,$40,$81,$41
	!byte $40,$40,$81,$41,$40,$80,$40,0

fxpitch ; starting from step 4
	!byte $00,$c0,$04,$05,$90,$60,$40,0	; tuhnusnare
	!byte $00,$50,$20,$10,$08,$04,$02,0
	!byte $00,$c0,$04,$90,$04,$05,$b0,$03
	!byte $04,$05,$60,$06,$07,$08,$04,0

;!byte 0,0,0,0,0,0,0,0,0,0,0,0

rasterchars:
	!byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	!byte $BF,$FB,$FF,$EE,$FF,$BF,$FB,$FF
	!byte $EE,$FE,$BB,$FB,$EF,$EE,$FB,$BB
	!byte $BB,$AB,$EE,$AE,$BA,$BB,$AE,$EE
	!byte $EA,$AE,$AA,$BB,$AA,$EA,$AE,$AA
	!byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
	!byte $6A,$A6,$AA,$99,$AA,$6A,$A6,$AA
	!byte $99,$A9,$66,$A6,$9A,$99,$A6,$66
	!byte $66,$56,$99,$59,$65,$66,$59,$99
	!byte $95,$59,$55,$66,$55,$95,$59,$55
	!byte $55,$55,$55,$55,$55,$55,$55,$55
	!byte $15,$51,$55,$44,$55,$15,$51,$55
	!byte $44,$54,$11,$51,$45,$44,$51,$11
	!byte $11,$01,$44,$04,$10,$11,$04,$44
	!byte $40,$04,$00,$11,$00,$40,$04,$00
edgechars:
	!byte $00,$00,$00,$00,$00,$00,$00,$00
	; ----
	;!byte $00,$00,$00,$00,$00,$00,$00,$00

	; ---u
	;!byte $FF,$3F,$3C,$00,$00,$00,$00,$00
	!byte %11111111
	!byte %00111111
	!byte %00000000
	!byte %00000000
	!byte %00000000
	!byte %00000000
	!byte %00000000
	!byte %00000000

	; --d-
	;!byte $00,$00,$00,$00,$00,$3C,$FC,$FF
	!byte %00000000
	!byte %00000000
	!byte %00000000
	!byte %00000000
	!byte %00000000
	!byte %00000000
	!byte %00111111
	!byte %11111111

	; --du
	!byte $FF,$3F,$3C,$00,$00,$3C,$FC,$FF

	; -r--
	;!byte $00,$03,$0F,$03,$0F,$03,$03,$00
	!byte %00000000
	!byte %00000011
	!byte %00001111
	!byte %01111111
	!byte %00000011
	!byte %00001111
	!byte %00000011
	!byte %00000000

	; -r-u
	!byte $FF,$3F,$3F,$03,$0F,$03,$03,$00

	; -rd--
	;!byte $00,$03,$0F,$03,$0F,$3F,$FF,$FF
	!byte %00000000
	!byte %00000000
	!byte %00000011
	!byte %00000011
	!byte %00001111
	!byte %00001111
	!byte %00111111
	!byte %11111111

	; -rdu
	!byte $FF,$3F,$3F,$03,$0F,$3F,$FF,$FF

	; l---
	;!byte $00,$C0,$C0,$F0,$C0,$F0,$C0,$00
	!byte %11000000
	!byte %11110000
	!byte %11110000
	!byte %11100000
	!byte %11111100
	!byte %11100000
	!byte %11000000
	!byte %00000000

	; l--u
	;!byte $FF,$FF,$FC,$F0,$C0,$F0,$C0,$00
	!byte %11111111
	!byte %11111100
	!byte %11100000
	!byte %11100000
	!byte %11100000
	!byte %11000000
	!byte %11000000
	!byte %00000000

	; l-d-
	;!byte $00,$C0,$C0,$F0,$C0,$FC,$FC,$FF
	!byte %00000000
	!byte %11000000
	!byte %11000000
	!byte %11000000
	!byte %11110000
	!byte %11110000
	!byte %11111100
	!byte %11111111

	; l-du
	!byte $FF,$FF,$FC,$F0,$C0,$FC,$FC,$FF

	; lr--
	;!byte $00,$C3,$CF,$F3,$CF,$F3,$C3,$00
	!byte %11000011
	!byte %11110011
	!byte %11110011
	!byte %11110011
	!byte %11001111
	!byte %11001111
	!byte %11001111
	!byte %11000011

	; lr-u
	;!byte $FF,$FF,$FF,$F3,$CF,$F3,$C3,$00
	!byte %11111111
	!byte %11111111
	!byte %11110011
	!byte %11111111
	!byte %11110011
	!byte %11110011
	!byte %11000011
	!byte %00000011

	; lrd-
	;!byte $00,$C3,$CF,$F3,$CF,$FF,$FF,$FF
	!byte %00000011
	!byte %11000011
	!byte %11001111
	!byte %11001111
	!byte %11111111
	!byte %11001111
	!byte %11111111
	!byte %11111111

	; lrdu
	;!byte $FF,$FF,$FF,$F3,$CF,$FF,$FF,$FF
	!byte %11111111
	!byte %11110011
	!byte %11000011
	!byte %11000011
	!byte %11001111
	!byte %11111111
	!byte %11111111
	!byte %11111111

palette:
	!byte $1,$f,$f,$f,$c,$c,$c,$b,$b,$0,$0,$0,$0,0,0,0,0

picorder

;;; ALKU ;;;

!word $0590 ; 9090 tulee jostain syystä
!word $5fac ; kaukopuolisarastus harmaataivas sky=0/25 gnd=0 
!word $20c2 ; lähipuolisarastus mustataivas sky=0 gnd=0 
!word $17f1 ; kaukopuolisarastus++ harmaataivas sky=0/25 gnd=0 
!word $55a7 ; kirkkaampi kaukopuolisarastus. gnd=44 
!word $9918 ; puolilähipuolisarastus sky=51 gnd=51 
!word $b191 ; lähipuolisarastus artifaktin takana harmaataivas. sky=25 gnd=0 
;!word $dd1c ; pilviä sky=0 gnd=0 
!word $182d ; pilviä sky=0 gnd=0 
;!word $601b ; pilviä sky=6 gnd=0 

;;; TILU+0 ;;;

!word $9ab5 ; aurinko jo reilusti taivaanrannan yllä, leijuva mötikkä. sky=25koko gnd=25 
!word $8ec7 ; T kaukopuolisarastus, puhdas harmaatausta, artifakti etualalla. sky=25 gnd=25 
!word $ec61 ; pääsiäissaariartifakti valopilviharmaan taivaan edessä. kuu? sky=0/25 gnd=0 
!word $aa5b ; kirkas taivas silhuettipyramidien takaa sky=178 gnd=0

!word $e802 ; puolisarastus + valopilviä + vinoneliöartifakti sky=0 gnd=0 
!word $e407 ; kokosarastus + valopilviä + vinoneliöartifakti lähempää sky=38 gnd=0 
!word $ac0d ; harmaavalopilviä + bubblebobbleartifakti. sky=0/25 gnd=0 
!word $1924 ; harmaa taivas, valopilviä, artifakteja. sky=25 gnd=25 

;;; TILU+5 ;;;

!word $cf41 ; aurinko noussut, maassakin jotain. sky=121 gnd=121 
!word $29f3 ; sky=117 gnd=0 
!word $48d5 ; aurinko noussut kunnolla, maassakin jotain sky=111 gnd=111 
!word $e268 ; lähipuolisarastus, harmaa taivas, kirkas maa, lehtiä edessä. sky=6 gnd=kirkas 

!word $65cf ; aurinko noussut, maassakin jotain. sky=51 
!word $b042 ; kirkas taivas, maassakin jotain. sky=178 
!word $5678 ; sky=121 gnd=121 
!word $c7c8 ; sky=15 gnd=0 

;;; PIKATILU+0 (16) ;;;
; tilussa liikaa suht samannäköisiä puoliharmaakuvia - karsi vähän

!word $6dcd ; maakin vähitelen kirkastuu. sky=51 gnd=95 
!word $b210 ; kirkkaita valopilviä sysipimeässä. sky=0 gnd=0 
!word $3607 ; sky=51 gnd=63 
;!word $f0d3 ; syrj ; -> pikatiluun ; tästä dupe jossain?
!word $1d76 ; sky=0 gnd=0  ; testfiller

!word $1eff ; sky=0 gnd=0  ; testfiller
!word $fbeb ; sky=255 gnd=255  ; pikatiluun
!word $ec0b ; kokosarastus mustataivas (kuu) sky=0 gnd=0 
!word $02b8 ; sky=153 gnd=153

!word $c21d ; T pilviä sky=0 gnd=0 
!word $f00a ; harmaapilviä + neliöartifaktia sky=31 gnd=25 
!word $7d5c ; sky=111 gnd=111  ; -> pikatiluun
!word $8fff ; sky=140 gnd=140  -> pikatiluun

!word $fedf ; sky=210 gnd=210 -> pikatiluun
!word $20b6 ; pilviä + taivaanvaloja. sky=0 gnd=0 
!word $436b ; sky=0 gnd=0 ; -> pikatilu
!word $22f3 ; sky=0 gnd=0 ; pikatiluun ; tämä on likidupe f0d3:sta

;!word $b752 ; syrj T kirkas taivas, maassakin jotain. sky=165 gnd=165 
;syrjäytetty !word $5b3c ; TT kirkkaampi taivas, aurinko noussut reilusti, sky~76 ; paska?
;!word $ff1e ; T lähipuolisarastus+lisävalo harmaataivas "lehtiä" sky=19 gnd=19 
;!word $58a5 ; sky=25 gnd=12  -> pikatiluun
;!word $c5f8 ; T harmaa taivas, valopilviä, sky=25 gnd=25 
;syrj !word $22cb ; T harmaa taivas, artifakti, aurinko reilusti, sky=51 gnd=51 
;syrj !word $4ec5 ; T liki pimeässä neliöartifakti sky=6 gnd=0 
;!word $3bc3 ; syrj T kirkkaampi taivas, horisontissa valoa sky=76 gnd=76 
;!word $a011 ;syrj T sky=0 gnd=0 
;!word $a686 ;syrj T sky=31 gnd=31 

;;; PIKATILU+5 (16) ;;; ; yksi dupe pikatiluissa?

!word $1129 ; lentoalus puolihämärässä valonlähteen (kuun) edessä sky=0 gnd=6 
!word $14e0 ; sky=121 gnd=121  -> pikatiluun
!word $42df ; aurinko jo noussut, artifakti edessä sky=130 gnd=130 
!word $28f4 ; gnd=114 

!word $f522 ; sky=31 gnd=12  ; muodostelma, ei paska, mutta pikatiluun?
!word $3f13 ; sky=51 gnd=51 -> pikatiluun
!word $4d15 ; sky=95 gnd=95 -> pikatiluun
;!word $35ff ; syrj T sky=76 gnd=51 
!word $f40e ; gnd=0 

!word $f93f ; syrj T sky=0 gnd=12 
!word $0c5b ; sky=191 gnd=191 
!word $2ca0 ; sky=133 gnd=133 
!word $328e ; sky=184 gnd=178 

!word $f9d6 ; sky=242 gnd=255 
!word $5365 ; taivas hyvin kirkas maahan nähden. sky=216 gnd=xx
!word $7f99 ; sky=121 gnd=121 
!word $99e3 ; hyvin kirkas taivas verrattuna maahan. sky=229 gnd=0

;!word $b837 ; syrj T möykkyartifakti keskiharmaassa sumussa sky=51 gnd=51 -> nop
;syrj !word $4e51 ; T sky=76 gnd=76 
;!word $353b ; syrj T sky=146 gnd=146 
;!word $35f6 ; syrj T sky=0 gnd=0 

;;; SUVANTO ;;; - tähän 

!word $1efc ; sky=0 gnd=0 ; suvanto!
!word $02f9 ; sky=0 gnd=0 ; suvanto!
!word $f93e ; sky=0 gnd=0  ; tämä on kiva (pylväät taustalla)
!word $fc30 ; naama harmaapilvissä. sky=0 gnd=0  ; !!! vasta suvantoon

!word $c2cd ; sky=0 gnd=0 ; suvanto!
!word $033e ; sky=0 gnd=0 ; hmm, sattui aika hyvä muoto. seur.suvantoon?
!word $3d2e ; sky=184 gnd=184 ; hyvä!
!word $484b ; sky=89 gnd=89  ; hyvä!

;;; MELO+0 ;;;

!word $87ca ; sky=76 gnd=76 
!word $7779 ; sky=108 gnd=108  mustia lentoaluksia kaukaa
!word $e0fb ; sky=137 gnd=137 
!word $b25f ; 

!word $2e4b ; sky=0 gnd=0 
;tylsä !word $9689 ; sky=38 gnd=38 
!word $c8cf ; sky=229 
!word $701d ; sky=95 gnd=95 
!word $2893 ; sky=255 gnd=255 ; hidas

;;; MELO+5 ;;;

!word $4c99 ; sky=0 gnd=0 
!word $fcbe ; sky=242 gnd=255  ; maanpinnalla ufoja
!word $f562 ; sky=0 gnd=0  ; muodostelma
;paska !word $b816 ; sky=51 gnd=51 
!word $c860 ; sky=0 gnd=0

!word $3a46 ; sky=0 gnd=0  ; hmm!
!word $96f1 ; sky=121 gnd=127
!word $97ff ; sky=76 gnd=140
!word $8c0a ; sky=0 gnd=0 ; parhaat symbolit tähän mennessä
; jotain tilalle

;;; PIKATILU+0, T:t katsomatta

!word $8ac8 ; sky=102 gnd=102 kaukoufokuva, seur.pikatiluun peräkkäin
	; tästäkin taivasilmiö?
!word $b1de ; sky=117 gnd=117  ; ufo
!word $35ca ; sky=0 gnd=0 
!word $5a1b ; sky=38 gnd=31 

!word $5349 ; sky=117 gnd=121  ; ufo läheltä
!word $1d60 ; sky=140 gnd=140 ; melo voisi alkaa tällaisella lentoneliöshowlla?
!word $50dc ; sky=102 
!word $61d4 ; gnd=111 ; -> seur.pikaan

!word $9542 ; sky=0 gnd=0 
!word $a644 ; sky=153 gnd=153  ; jee, kontrastia
!word $475c ; sky=0 gnd=0 
!word $4e26 ; sky=0 gnd=0 
;!word $5756 ; T sky=0 gnd=12 

!word $6421 ; sky=76 gnd=76 
!word $85cd ; gnd=0 
!word $3c51 ; sky=178 gnd=178  ; hmm?
!word $3ebc ; sky=0 gnd=0 

;;; PIKATILU+5 ;;;

!word $622e ; sky=51 ; taivasilmiö 
;poistettu, identtinen. !word $8a20 ; sky=102 gnd=102  identtinen ensimmäisen kanssa?
!word $daf2 ; sky=216 gnd=216 ; taivasilmiöiden kanssa yhteen
!word $9809 ; sky=153 gnd=153 
!word $49c0 ; sky=0 gnd=0 
;pika 

;syrj !word $d246 ; T sky=0 gnd=19 

;syrj !word $7c6b ; T sky=117 gnd=121 
!word $51d8 ; sky=0 gnd=0  ; muodostelma
!word $9a71 ; sky=121 gnd=121 
!word $9cc1 ; sky=114 gnd=114 
!word $ace0 ; sky=133 gnd=133 

;syrj !word $a94a ; T sky=137 gnd=137 
!word $3842 ; sky=0 gnd=0 
!word $b663 ; sky=0 gnd=0 
!word $c86d ; gnd=117 
!word $e102 ; sky=63 gnd=70 

!word $0c25 ; sky=0 gnd=0 
;syrj !word $e867 ; TT sky=95 (autio)
!word $007a ; sky=25 gnd=25 ; tämä on tosi hyvä hei
!word $3aff ; sky=0 gnd=0 ; tämäkin hyvä
!word $e3b2 ; sky=0 gnd=0 ; siirrä ufokuva suvantoon? 

;;; SUVANTO, artifaktinesittely? ;;;
; auringonlaskuhenkistä/varjojenpitenemisjuttua? tämän jälkeen pimeyskuvia

;paska !word $3d5a ; sky=0 gnd=0 
;paska !word $5812 ; sky=0 gnd=0 

; !word $5eac ; sky=0 gnd=0 ; iso artifakti ennen auringonlaskua - ei hyvä
!word $e4e6 ; sky=0 gnd=0  ; ok! - kirkkaat taivaspallo ja horisonttijuttu
!word $f5c0 ; sky=0 gnd=0  ; kauniit varjot horisonttimuodostelmilla!!
!word $8ec2 ; sky=0 gnd=0  ; muodostelma taivaalla, hämäräkuvan kanssa yhteen
!word $f00b ; sky=0 gnd=0  ; ok! (hämärä mutta hyvä varjo)

!word $60da ; sky=0 gnd=0 ; ok - ranta
!word $92f1 ; sky=0 gnd=0  ; ok! - ranta - rannat peräkkäin
;mieluummin selkeämpi auringonlasku !word $c14b ; sky=0 gnd=0 ensimmäiseksi sarastuskuvaksi?
!word $1928 ; auringonlaskukuvat  -- lähipuolisarastus mustataivas + pilviä, sivukuva sky=0 gnd=0 
!word $f646 ; sky=0 gnd=0 ; vihoviimeinen auringonlasku (pilviä näkyy !hieman)

;pika !word $ec7e ; sky=0 gnd=0 

;;; HISSUMELO+0

!word $46d4 ; sky=0 gnd=0 ; ok ; ei vielä niin pimeä, toinen horisonttiobjekti
!word $b542 ; sky=0 gnd=0  ; horisonttiobjektista kuva
!word $d4c4 ; sky=0 gnd=0  ; horisonttiobjektista kuva
!word $fad8 ; sky=0 gnd=0  ; horisonttiobjekti kirkkaana keskellä pimeää

!word $24ee ; sky=0 gnd=0 
!word $823c ; sky=0 gnd=0  ; ok pimeys! jee!
!word $91f2 ; sky=0 gnd=0 ; pimeysjaksoon ok!
!word $82d1 ; sky=0 gnd=0 ; jee, kuvio taivaalla! ; ok!

;;; HISSUMELO+5 - tästä alkaa loppupika!
; karsitaan muutama ruma pois...

!word $f1b3 ; sky=0 gnd=0 
!word $858e ; sky=25 gnd=25 
;hidas !word $1220 ; sky=0 gnd=0  ; ei vielä täyspimeä, artifaktin luona
;!word $5835 ; sky=0 gnd=0 ; ok - on jo täyspimeä, "jotain" näkyy
;!word $0869 ; sky=0 gnd=0  ; "on jo täyspimeän" kanssa yhteen
!word $0c21 ; sky=0 gnd=0 
!word $1777 ; sky=0 gnd=0  ; paljon maavaloja
!word $671a ; sky=0 gnd=0 ; loistava horisonttiartifakti

;!word $22f6 ; sky=0 gnd=0 ; on jo täyspimeä
;!word $658b ; sky=0 gnd=0  ; täyspimeä. taivaan tähtiä
;!word $baad ; sky=0 gnd=0  ; hmm tasaneliökuviota - ei käytetä?
!word $94cc ; sky=0 gnd=0  ; hämärtymä - kuuluu hämäräkauteen - aiempaan !pikaan?
;!word $f60c ; sky=0 gnd=0  ; pimeyskuviin 

!byte 00 ; signal fadeout

!word $92aa ; sky=0 gnd=0  ; pimeysjaksoon (taivaan tähdet)
!word $df69 ; sky=0 gnd=0 ; ok pimeys

!word $143d ; sky=0 gnd=0 ; ok pimeysotus
;!word $2018 ; sky=0 gnd=0 
;!word $2df5 ; sky=0 gnd=0 
;!word $6796 ; sky=0 gnd=0

!word $2418 ; sky=0 gnd=0 ; pimeyttä: taivaanvaloja
;!word $84bd ; sky=0 gnd=0 ; pimeys ok

!word $1426 ; sky=0 gnd=0 
!word $5319 ; sky=0 gnd=0 

!word $a6f6 ; sky=0 gnd=0 ; iso valo horisontissa, muuten pikimustaa
;!word $b252 ; sky=0 gnd=0 ; valoja hajallaan
!word $0f3a ; sky=0 gnd=0  ; viimeisten joukkoon (umpipimeys)
!word $1108 ; sky=0 gnd=0 ; viimeisten jukkoon (yksi piste)
!word $452f ; sky=0 gnd=0 ; viimeisten joukkoon (pari pientä pistettä)

;;; fadeout ;;;


!word $9a89 ; sky=0 gnd=0 ; viimeisten kuvien joukkoon (antisarastus)
!word $f18b ; sky=0 gnd=0 ; viimeisten joukkoon
!word $fbb3 ; sky=0 gnd=0 ; viimeisten joukkoon
!word $0a24 ; sky=0 gnd=0  ; viimeisten joukkoon (vain vähän näkyy)

!word $0ca9 ; sky=0 gnd=0 ; viimeinen kuva? (vain yksi piste)
!word $e563 ; sky=0 gnd=0  ; loppupimeys
!word $e563 ; sky=0 gnd=0  ; loppupimeys
!word $e563 ; sky=0 gnd=0  ; loppupimeys

!word $7db0 ; sky=0 gnd=0 ; viimeisten joukkoon (2 pientä pistettä ;hajallaan)

!word $e892
!word $e892

pitchlo
	!byte 116,123,130,138,146,155,164,174,184,195,207,219
pitchhi=$0800
