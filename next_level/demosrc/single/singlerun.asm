
;,; basic .pos=$1001
;,; <- main

!zone basic
basic:  !word .basend,2008
        !byte $9e
        !byte $30+(main/1000)
        !byte $30+((main/100)%10)
        !byte $30+((main/10)%10)
        !byte $30+(main%10)
        !byte 0
.basend !word 0

;,; main
;,; &- basic
;,; <- streamdata_wheel
;,; <- streamvars
;,; <- ibpcaablocks
;,; <- player
;,; <- irqhandler
;,; <- irqvector
;,; <- nmivector
;,; <- keyframer_mainloop

; FRAMEWORK TODO:
; - set interrupt

main:
	sei
	ldx #$ff
	txs
	lda #8
	sta $900F
	sta $900e

	lda #24+128
	sta $9002
	lda #21*2
	sta $9003
	lda #10
	sta $9000

	lda #$FC+(ibpcaablocks-$1000)/1024
	sta $9005

;	ldx #0
;.hip	lda #7
;	sta $9600,x
;	sta $9700,x
;	lda #15
;	sta $1e00,x
;	sta $1f00,x
;	dex
;	bne .hip

	lda #0
	sta framectr
	sta lastframectr
	sta loopctr

	lda #<streamdata_wheel
	sta stream
	lda #>streamdata_wheel
	sta stream+1
	lda #$01
	sta datamode

	lda #$7f
	sta $912e  ; disable all interrupts
	sta $912d  ; 
	sta $911e  ; disable all interrupts
	sta $911d

	lda #<irqhandler_start
	sta irqvector
	lda #>irqhandler_start
	sta irqvector+1

	lda #<voice_interrupt_start
	sta nmivector
	lda #>voice_interrupt_start
	sta nmivector+1

	lda #<(22152-71)	; VIA2T1 does per-frame interrupt.
	sta $9126
	lda #>(22152-71)
	sta $9125

	lda #127
.w0	cmp $9004
	bne .w0
.w1	lda $9003
	bpl .w1

	lda #$c0
        ldx #$40
	sta $912e  ; enable T1 interrupts
	stx $912b  ; continuous T1 interrupts, PB7 disable
;	sta $911e  ; enable T1 interrupts
	stx $911b  ; continuous T1 interrupts, PB7 disable
	cli

;	lda #3
;	sta singfreq
;	lda #1
;	jsr voice_sing_on

	jmp keyframer_mainloop
