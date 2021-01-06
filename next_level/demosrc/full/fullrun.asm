
;,; loader .pos=888 .sz=136
!src "loader/loader_glob.inc"

;,; loader_loop .pos=879 .sz=9
; needed only before init

;,; init
;,; <- streamvars
;,; <- ibpcaablocks
;,; <- player
;,; <- irqhandler
;,; <- irqvector
;,; <- nmivector
;,; <- keyframer_mainloop
;,; <- loader_loop
;,; <- voice_vars
;,; <- SC00_000

; FRAMEWORK TODO:
; - set interrupt

init:
	sei
	ldx #$ff
	txs
	lda #8
	sta $900F
	lda #$18
	sta $900e

	lda #24+128
	sta $9002
	lda #21*2
	sta $9003
	lda #10
	sta $9000

	lda #$FC+(ibpcaablocks-$1000)/1024
	sta $9005

	ldx #0
	stx framectr
	stx lastframectr
	stx loopctr
	stx lyricsptr
	inx
	stx dontloadbefore

	lda #<SC00_000
	sta stream
	lda #>SC00_000
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

	lda #<22152	; VIA2T1 does per-frame interrupt.
	sta $9126
	lda #>22152
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
	stx $911b  ; continuous T1 interrupts, PB7 disable
	cli

	jmp keyframer_mainloop
