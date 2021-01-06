;,; irqhandler
;,; <- player
;,; <- streamvars

irqhandler_start:
;.w0	lda $9004
;	bpl .w0
	lda $9124	; akn

	inc $900f
	jsr player
	inc framectr

	dec $900f
	pla
	tay
	pla
	tax
	pla
	rti
