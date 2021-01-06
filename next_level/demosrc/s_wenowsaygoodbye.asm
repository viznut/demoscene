;,; lyrics_wenowsaygoodbye .withinpagefrom=lyrics
;,; <- lyrics

	; we now say goodbye to all flesh and bone

	!byte $26,$31			; WE
	!byte $22,$4a,$06		; NOW
	!byte $24,$33,$31		; SAY
	!byte $19,$1c,$46,$19,$1d	; GOOD
	!byte $29,$1b,$4a,$41		; BYE
	!byte $19,$1d,$46		; TO
	!byte $00,$37			; ALL
	!byte $25,$27,$63,$24		; FLESH
	!byte $33,$02			; AND
	!byte $29,$1b,$60,$66,$02	; BONE
	!byte $0f

;,; deps_wenowsaygoodbye
;,; <- ibpcaablocks
;,; <- lyrics_wenowsaygoodbye

;,; SC62_000
;,; <- deps_wenowsaygoodbye
;,; <- streamvars
;,; <- player_ivars
!src "demosrc/smac.inc"

+sAddr nextlyrictosing
!byte $00,lyrics_wenowsaygoodbye-lyrics

; method 4 ( clrscr0 bytes ) -- 436 bytes (436 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 432 bytes (432 cumu)
; method 6 ( clrscr0 bytes ) -- 436 bytes (436 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 403 bytes (403 cumu)
; method 8 ( clrscr1 bytes ) -- 466 bytes (466 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 462 bytes (462 cumu)
; method 10 ( clrscr1 bytes ) -- 466 bytes (466 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 433 bytes (433 cumu)
; method 12 ( clrscr2 bytes ) -- 436 bytes (436 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 437 bytes (437 cumu)
; method 14 ( clrscr2 bytes ) -- 436 bytes (436 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 408 bytes (408 cumu)
; method 16 ( clrscr3 bytes ) -- 466 bytes (466 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 467 bytes (467 cumu)
; method 18 ( clrscr3 bytes ) -- 466 bytes (466 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 438 bytes (438 cumu)
; METHOD 7 CHOSEN
!byte $e4,1,chFFFFFFFFFFFFFFFF ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 220
;,; <- chFFFFFFFFFFFF0000 ; 7
;,; <- ch0000000000000000 ; 176
;,; <- ch7F3F1F0F07030100 ; 6
;,; <- ch3F3F3F3F3F3F3F3F ; 12
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 1
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3C7E7E7E7E7E0000 ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chFCFCDCCCCCCCCCCC ; 13
;,; <- ch0808181C1C1C0C00 ; 1
;,; <- chD6D6D6D6D6F6FEFE ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 9
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- ch000103070F1F3F7F ; 3
;,; <- ch0000FFFFFFFFFFFF ; 3
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch3030303030303030 ; 4
;,; <- chFCFCCCCCCCDCFCFC ; 2
;,; <- ch00000F3F3F0F0000 ; 1
;,; <- chFCFC303030303030 ; 2
;,; <- chC0C0C0C0C0C0C0C0 ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 3
;,; <- ch7C7C7C6C6C6C6C6C ; 1
;,; <- chF0F0DEDECCCCFEFE ; 1
; total unique chars in pic: 29 (worst case req 232 bytes)
!byte $DA,$00 ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $20
!byte $DA,$01 ;addr
!byte $55,$02 ;fill
!byte $00 ;data4
!byte $10
!byte $87 ;skip
!byte $4C,$02 ;fill
!byte $04 ;data4
!byte $10
!byte $11
!byte $33
!byte $33
!byte $13
!byte $4C,$02 ;fill
!byte $00 ;data4
!byte $10
!byte $85 ;skip
!byte $00 ;data4
!byte $13
!byte $4C,$02 ;fill
!byte $04 ;data4
!byte $10
!byte $11
!byte $31
!byte $13
!byte $13
!byte $4C,$02 ;fill
!byte $04 ;data4
!byte $10
!byte $11
!byte $31
!byte $13
!byte $13
!byte $4C,$02 ;fill
!byte $04 ;data4
!byte $10
!byte $11
!byte $31
!byte $13
!byte $13
!byte $4C,$02 ;fill
!byte $04 ;data4
!byte $10
!byte $11
!byte $31
!byte $13
!byte $13
!byte $4C,$02 ;fill
!byte $04 ;data4
!byte $10
!byte $11
!byte $31
!byte $13
!byte $13
!byte $4C,$02 ;fill
!byte $04 ;data4
!byte $10
!byte $11
!byte $31
!byte $13
!byte $13
!byte $4C,$02 ;fill
!byte $04 ;data4
!byte $10
!byte $11
!byte $31
!byte $11
!byte $13
!byte $46,$02 ;fill
!byte $07 ;data4
!byte $11
!byte $11
!byte $11
!byte $10
!byte $11
!byte $33
!byte $11
!byte $13
!byte $46,$02 ;fill
!byte $07 ;data4
!byte $11
!byte $11
!byte $11
!byte $10
!byte $11
!byte $31
!byte $11
!byte $13
!byte $8D ;skip
!byte $04 ;data4
!byte $10
!byte $11
!byte $31
!byte $11
!byte $13
!byte $8D ;skip
!byte $04 ;data4
!byte $10
!byte $11
!byte $31
!byte $13
!byte $13
!byte $8D ;skip
!byte $04 ;data4
!byte $10
!byte $11
!byte $33
!byte $13
!byte $13
!byte $8D ;skip
!byte $04 ;data4
!byte $10
!byte $13
!byte $33
!byte $13
!byte $13
!byte $8D ;skip
!byte $04 ;data4
!byte $10
!byte $11
!byte $33
!byte $13
!byte $13
!byte $8D ;skip
!byte $04 ;data4
!byte $10
!byte $11
!byte $33
!byte $13
!byte $13
!byte $8D ;skip
!byte $04 ;data4
!byte $10
!byte $11
!byte $33
!byte $13
!byte $13
!byte $8D ;skip
!byte $04 ;data4
!byte $10
!byte $11
!byte $33
!byte $13
!byte $13
!byte $CE,$31 ;addr
!byte $e2,$ff;mode1
!byte $38 ;data1
!byte $E0
!byte $00
!byte $00
!byte $F0
!byte $00
!byte $00
!byte $F8
!byte $00
!byte $00
!byte $F8
!byte $00
!byte $00
!byte $F8
!byte $00
!byte $30
!byte $F8
!byte $00
!byte $78
!byte $F8
!byte $00
!byte $FC
!byte $E8
!byte $01
!byte $FE
!byte $EC
!byte $03
!byte $90
!byte $EC
!byte $07
!byte $90
!byte $FC
!byte $7F
!byte $FE
!byte $FC
!byte $71
!byte $00
!byte $F0
!byte $71
!byte $00
!byte $C0
!byte $7F
!byte $FE
!byte $80
!byte $79
!byte $10
!byte $F0
!byte $79
!byte $10
!byte $F0
!byte $7F
!byte $FE
!byte $C0
!byte $60
!byte $A0
!byte $C0
!byte $60
!byte $A1
!byte $e3 ;run ibpcaa
!byte $CE,$30 ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $96 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $96 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $96 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $96 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $AE ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $96 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $96 ;skip
!byte $04 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3C7E7E7E7E7E0000
!byte $8C ;skip
!byte $0A ;data8
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chC6C6C6C6C6C6C6C6
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0808181C1C1C0C00
!byte $84 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $84 ;skip
!byte $06 ;data8
!byte chD6D6D6D6D6F6FEFE
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000000000
!byte chCCCCCCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte chD6D6D6D6D6F6FEFE
!byte chFFFFFFFFFFFFFFFF
!byte $87 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $8D ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $87 ;skip
!byte $0F ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte ch0000000000000000
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chF0F8CCCCCCCCCCCC
!byte chF0F8CCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte chFCFCE0C0C0C0C0C0
!byte chFFFFFFFFFFFFFFFF
!byte $87 ;skip
!byte $07 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFCFC1C0C0C1CFCFC
!byte chFCFCDCCCCCCCCCCC
!byte ch3030303030303030
!byte ch0000000000000000
!byte $42,chCCCCCCCCCCECFCFC ;fill
!byte $03 ;data8
!byte chFCFCCCCCCCDCFCFC
!byte ch3030303030303030
!byte chFCFCE0C0C0E0FCFC
!byte chFFFFFFFFFFFFFFFF
!byte $87 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $8D ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $87 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $83 ;skip
!byte $0A ;data8
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chC0C0C0C0C0C0C0C0
!byte chC0C0C0C0C0C0C0C0
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFFFFFFFFFFFFFFFF
!byte $87 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $83 ;skip
!byte $0A ;data8
!byte ch3030303030303030
!byte chCCCCCCCCCCECFCFC
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chC0C0C0C0C0E0FCFC
!byte chC0C0C0C0C0E0FCFC
!byte ch0000000000000000
!byte ch3030303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte chFFFFFFFFFFFFFFFF
!byte $87 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $8D ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $87 ;skip
!byte $12 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFCFCE0C0C0C0C0C0
!byte chC0C0C0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte chCCCCCCCCCCCCCCCC
!byte ch0000000000000000
!byte ch7C7C7C6C6C6C6C6C
!byte ch0000000000000000
!byte chF0F8CCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $87 ;skip
!byte $0B ;data8
!byte chFCFCE0C0C0C0C0C0
!byte chC0C0C0C0C0E0FCFC
!byte chFCFCE0C0C0E0FCFC
!byte chFCFC1C0C0C1CFCFC
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chF0F0DEDECCCCFEFE
!byte ch0000000000000000
!byte chFCFCCCCCCCDCFCFC
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte $e1,24



;,; *_001
;,; <- deps_wenowsaygoodbye
; method 0 ( bytes ) -- 4 bytes (407 cumu)
; method 1 ( ibpc0 bytes ) -- 4 bytes (407 cumu)
; method 2 ( bytes ) -- 4 bytes (407 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 90 bytes (493 cumu)
; method 4 ( clrscr0 bytes ) -- 436 bytes (839 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 432 bytes (835 cumu)
; method 6 ( clrscr0 bytes ) -- 436 bytes (839 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 403 bytes (806 cumu)
; method 8 ( clrscr1 bytes ) -- 466 bytes (869 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 462 bytes (865 cumu)
; method 10 ( clrscr1 bytes ) -- 466 bytes (869 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 433 bytes (836 cumu)
; method 12 ( clrscr2 bytes ) -- 436 bytes (839 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 437 bytes (840 cumu)
; method 14 ( clrscr2 bytes ) -- 436 bytes (839 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 408 bytes (811 cumu)
; method 16 ( clrscr3 bytes ) -- 466 bytes (869 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 467 bytes (870 cumu)
; method 18 ( clrscr3 bytes ) -- 466 bytes (869 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 438 bytes (841 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 220
;,; <- chFFFFFFFFFFFF0000 ; 7
;,; <- ch0000000000000000 ; 176
;,; <- ch7F3F1F0F07030100 ; 6
;,; <- ch3F3F3F3F3F3F3F3F ; 12
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 1
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3C7E7E7E7E7E0000 ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chFCFCDCCCCCCCCCCC ; 13
;,; <- ch0800080C1C1C1C0C ; 1
;,; <- chD6D6D6D6D6F6FEFE ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 9
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- ch000103070F1F3F7F ; 3
;,; <- ch0000FFFFFFFFFFFF ; 3
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch3030303030303030 ; 4
;,; <- chFCFCCCCCCCDCFCFC ; 2
;,; <- ch00000F3F3F0F0000 ; 1
;,; <- chFCFC303030303030 ; 2
;,; <- chC0C0C0C0C0C0C0C0 ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 3
;,; <- ch7C7C7C6C6C6C6C6C ; 1
;,; <- chF0F0DEDECCCCFEFE ; 1
; total unique chars in pic: 29 (worst case req 232 bytes)
!byte $CF,$0C ;addr
!byte $00 ;data8
!byte ch0800080C1C1C1C0C
!byte $e1,24



;,; *_002
;,; <- deps_wenowsaygoodbye
; method 0 ( bytes ) -- 15 bytes (422 cumu)
; method 1 ( ibpc0 bytes ) -- 15 bytes (422 cumu)
; method 2 ( bytes ) -- 15 bytes (422 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 102 bytes (509 cumu)
; method 4 ( clrscr0 bytes ) -- 439 bytes (846 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 435 bytes (842 cumu)
; method 6 ( clrscr0 bytes ) -- 439 bytes (846 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 407 bytes (814 cumu)
; method 8 ( clrscr1 bytes ) -- 469 bytes (876 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 465 bytes (872 cumu)
; method 10 ( clrscr1 bytes ) -- 469 bytes (876 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 437 bytes (844 cumu)
; method 12 ( clrscr2 bytes ) -- 440 bytes (847 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 440 bytes (847 cumu)
; method 14 ( clrscr2 bytes ) -- 440 bytes (847 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 412 bytes (819 cumu)
; method 16 ( clrscr3 bytes ) -- 470 bytes (877 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 470 bytes (877 cumu)
; method 18 ( clrscr3 bytes ) -- 470 bytes (877 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 442 bytes (849 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 220
;,; <- chFFFFFFFFFFFF0000 ; 7
;,; <- ch0000000000000000 ; 175
;,; <- ch7F3F1F0F07030100 ; 6
;,; <- ch3F3F3F3F3F3F3F3F ; 12
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 1
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3C7E7E7E7E7E0000 ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chFCFCDCCCCCCCCCCC ; 13
;,; <- ch0808080008181C1C ; 1
;,; <- chD6D6D6D6D6F6FEFE ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 9
;,; <- ch0C00000000000000 ; 1
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- ch000103070F1F3F7F ; 3
;,; <- ch0000FFFFFFFFFFFF ; 3
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch3030303030303030 ; 4
;,; <- chFCFCCCCCCCDCFCFC ; 2
;,; <- ch00000F3F3F0F0000 ; 1
;,; <- chFCFC303030303030 ; 2
;,; <- chC0C0C0C0C0C0C0C0 ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 3
;,; <- ch7C7C7C6C6C6C6C6C ; 1
;,; <- chF0F0DEDECCCCFEFE ; 1
; total unique chars in pic: 30 (worst case req 240 bytes)
!byte $DB,$24 ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $33
!byte $CF,$0C ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch0808080008181C1C
!byte $96 ;skip
!byte $00 ;data8
!byte ch0C00000000000000
!byte $e1,12



;,; *_003
;,; <- deps_wenowsaygoodbye
; method 0 ( bytes ) -- 7 bytes (429 cumu)
; method 1 ( ibpc0 bytes ) -- 7 bytes (429 cumu)
; method 2 ( bytes ) -- 7 bytes (429 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 94 bytes (516 cumu)
; method 4 ( clrscr0 bytes ) -- 439 bytes (861 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 435 bytes (857 cumu)
; method 6 ( clrscr0 bytes ) -- 439 bytes (861 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 407 bytes (829 cumu)
; method 8 ( clrscr1 bytes ) -- 469 bytes (891 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 465 bytes (887 cumu)
; method 10 ( clrscr1 bytes ) -- 469 bytes (891 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 437 bytes (859 cumu)
; method 12 ( clrscr2 bytes ) -- 440 bytes (862 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 440 bytes (862 cumu)
; method 14 ( clrscr2 bytes ) -- 440 bytes (862 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 412 bytes (834 cumu)
; method 16 ( clrscr3 bytes ) -- 470 bytes (892 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 470 bytes (892 cumu)
; method 18 ( clrscr3 bytes ) -- 470 bytes (892 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 442 bytes (864 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 220
;,; <- chFFFFFFFFFFFF0000 ; 7
;,; <- ch0000000000000000 ; 175
;,; <- ch7F3F1F0F07030100 ; 6
;,; <- ch3F3F3F3F3F3F3F3F ; 12
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 1
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3C7E7E7E7E7E0000 ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chFCFCDCCCCCCCCCCC ; 13
;,; <- ch00080808080C0C1E ; 1
;,; <- chD6D6D6D6D6F6FEFE ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 9
;,; <- ch1E1C0C0000000000 ; 1
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- ch000103070F1F3F7F ; 3
;,; <- ch0000FFFFFFFFFFFF ; 3
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch3030303030303030 ; 4
;,; <- chFCFCCCCCCCDCFCFC ; 2
;,; <- ch00000F3F3F0F0000 ; 1
;,; <- chFCFC303030303030 ; 2
;,; <- chC0C0C0C0C0C0C0C0 ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 3
;,; <- ch7C7C7C6C6C6C6C6C ; 1
;,; <- chF0F0DEDECCCCFEFE ; 1
; total unique chars in pic: 30 (worst case req 240 bytes)
!byte $CF,$0C ;addr
!byte $00 ;data8
!byte ch00080808080C0C1E
!byte $96 ;skip
!byte $00 ;data8
!byte ch1E1C0C0000000000
!byte $e1,12



;,; *_004
;,; <- deps_wenowsaygoodbye
; method 0 ( bytes ) -- 15 bytes (444 cumu)
; method 1 ( ibpc0 bytes ) -- 15 bytes (444 cumu)
; method 2 ( bytes ) -- 15 bytes (444 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 102 bytes (531 cumu)
; method 4 ( clrscr0 bytes ) -- 439 bytes (868 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 435 bytes (864 cumu)
; method 6 ( clrscr0 bytes ) -- 439 bytes (868 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 407 bytes (836 cumu)
; method 8 ( clrscr1 bytes ) -- 469 bytes (898 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 465 bytes (894 cumu)
; method 10 ( clrscr1 bytes ) -- 469 bytes (898 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 437 bytes (866 cumu)
; method 12 ( clrscr2 bytes ) -- 440 bytes (869 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 440 bytes (869 cumu)
; method 14 ( clrscr2 bytes ) -- 440 bytes (869 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 412 bytes (841 cumu)
; method 16 ( clrscr3 bytes ) -- 470 bytes (899 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 470 bytes (899 cumu)
; method 18 ( clrscr3 bytes ) -- 470 bytes (899 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 442 bytes (871 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 220
;,; <- chFFFFFFFFFFFF0000 ; 7
;,; <- ch0000000000000000 ; 175
;,; <- ch7F3F1F0F07030100 ; 6
;,; <- ch3F3F3F3F3F3F3F3F ; 12
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 1
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3C7E7E7E7E7E0000 ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chFCFCDCCCCCCCCCCC ; 13
;,; <- ch0000000000080808 ; 1
;,; <- chD6D6D6D6D6F6FEFE ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 9
;,; <- ch080C0C1E1E1C0C00 ; 1
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- ch000103070F1F3F7F ; 3
;,; <- ch0000FFFFFFFFFFFF ; 3
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch3030303030303030 ; 4
;,; <- chFCFCCCCCCCDCFCFC ; 2
;,; <- ch00000F3F3F0F0000 ; 1
;,; <- chFCFC303030303030 ; 2
;,; <- chC0C0C0C0C0C0C0C0 ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 3
;,; <- ch7C7C7C6C6C6C6C6C ; 1
;,; <- chF0F0DEDECCCCFEFE ; 1
; total unique chars in pic: 30 (worst case req 240 bytes)
!byte $DB,$3C ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $33
!byte $CF,$0C ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch0000000000080808
!byte $96 ;skip
!byte $00 ;data8
!byte ch080C0C1E1E1C0C00
!byte $e1,12



;,; *_005
;,; <- deps_wenowsaygoodbye
; method 0 ( bytes ) -- 18 bytes (462 cumu)
; method 1 ( ibpc0 bytes ) -- 18 bytes (462 cumu)
; method 2 ( bytes ) -- 18 bytes (462 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 106 bytes (550 cumu)
; method 4 ( clrscr0 bytes ) -- 442 bytes (886 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 435 bytes (879 cumu)
; method 6 ( clrscr0 bytes ) -- 442 bytes (886 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 411 bytes (855 cumu)
; method 8 ( clrscr1 bytes ) -- 472 bytes (916 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 465 bytes (909 cumu)
; method 10 ( clrscr1 bytes ) -- 472 bytes (916 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 441 bytes (885 cumu)
; method 12 ( clrscr2 bytes ) -- 444 bytes (888 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 440 bytes (884 cumu)
; method 14 ( clrscr2 bytes ) -- 444 bytes (888 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 416 bytes (860 cumu)
; method 16 ( clrscr3 bytes ) -- 474 bytes (918 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 470 bytes (914 cumu)
; method 18 ( clrscr3 bytes ) -- 474 bytes (918 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 446 bytes (890 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 221
;,; <- chFFFFFFFFFFFF0000 ; 7
;,; <- ch0000000000000000 ; 174
;,; <- ch7F3F1F0F07030100 ; 6
;,; <- ch3F3F3F3F3F3F3F3F ; 12
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 1
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3C7E7E7E7E7E0000 ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chFCFCDCCCCCCCCCCC ; 13
;,; <- chD6D6D6D6D6F6FEFE ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 9
;,; <- ch0000000000080808 ; 1
;,; <- ch080C0C1E1E1C0C00 ; 1
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- ch000103070F1F3F7F ; 3
;,; <- ch0000FFFFFFFFFFFF ; 3
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch3030303030303030 ; 4
;,; <- chFCFCCCCCCCDCFCFC ; 2
;,; <- ch00000F3F3F0F0000 ; 1
;,; <- chFCFC303030303030 ; 2
;,; <- chC0C0C0C0C0C0C0C0 ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 3
;,; <- ch7C7C7C6C6C6C6C6C ; 1
;,; <- chF0F0DEDECCCCFEFE ; 1
; total unique chars in pic: 30 (worst case req 240 bytes)
!byte $DB,$0C ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $30
!byte $CF,$0C ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $96 ;skip
!byte $00 ;data8
!byte ch0000000000080808
!byte $96 ;skip
!byte $00 ;data8
!byte ch080C0C1E1E1C0C00
!byte $e1,12



;,; *_006
;,; <- deps_wenowsaygoodbye
; method 0 ( bytes ) -- 25 bytes (487 cumu)
; method 1 ( ibpc0 bytes ) -- 27 bytes (489 cumu)
; method 2 ( bytes ) -- 25 bytes (487 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 115 bytes (577 cumu)
; method 4 ( clrscr0 bytes ) -- 437 bytes (899 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 433 bytes (895 cumu)
; method 6 ( clrscr0 bytes ) -- 437 bytes (899 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 413 bytes (875 cumu)
; method 8 ( clrscr1 bytes ) -- 467 bytes (929 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 463 bytes (925 cumu)
; method 10 ( clrscr1 bytes ) -- 467 bytes (929 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 443 bytes (905 cumu)
; method 12 ( clrscr2 bytes ) -- 438 bytes (900 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 438 bytes (900 cumu)
; method 14 ( clrscr2 bytes ) -- 438 bytes (900 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 418 bytes (880 cumu)
; method 16 ( clrscr3 bytes ) -- 468 bytes (930 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 468 bytes (930 cumu)
; method 18 ( clrscr3 bytes ) -- 468 bytes (930 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 448 bytes (910 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 220
;,; <- chFFFFFFFFFFFF0000 ; 7
;,; <- ch0000000000000000 ; 175
;,; <- ch7F3F1F0F07030100 ; 6
;,; <- ch3F3F3F3F3F3F3F3F ; 12
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 1
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3C7E7E7E7E7E0000 ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chFCFCDCCCCCCCCCCC ; 13
;,; <- chD6D6D6D6D6F6FEFE ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 9
;,; <- ch00080808080C0C1E ; 1
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- ch1E1C0C0000000000 ; 1
;,; <- ch000103070F1F3F7F ; 3
;,; <- ch0000FFFFFFFFFFFF ; 3
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch3030303030303030 ; 4
;,; <- chFCFCCCCCCCDCFCFC ; 2
;,; <- ch00000F3F3F0F0000 ; 1
;,; <- chFCFC303030303030 ; 2
;,; <- chC0C0C0C0C0C0C0C0 ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 3
;,; <- ch7C7C7C6C6C6C6C6C ; 1
;,; <- chF0F0DEDECCCCFEFE ; 1
; total unique chars in pic: 30 (worst case req 240 bytes)
!byte $DB,$0C ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $33
!byte $DB,$54 ;addr
!byte $00 ;data4
!byte $33
!byte $CF,$0C ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch0000000000000000
!byte $96 ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $96 ;skip
!byte $00 ;data8
!byte ch00080808080C0C1E
!byte $96 ;skip
!byte $00 ;data8
!byte ch1E1C0C0000000000
!byte $e1,12



;,; *_007
;,; <- deps_wenowsaygoodbye
; method 0 ( bytes ) -- 7 bytes (494 cumu)
; method 1 ( ibpc0 bytes ) -- 7 bytes (494 cumu)
; method 2 ( bytes ) -- 7 bytes (494 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 93 bytes (580 cumu)
; method 4 ( clrscr0 bytes ) -- 433 bytes (920 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 429 bytes (916 cumu)
; method 6 ( clrscr0 bytes ) -- 433 bytes (920 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 399 bytes (886 cumu)
; method 8 ( clrscr1 bytes ) -- 463 bytes (950 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 459 bytes (946 cumu)
; method 10 ( clrscr1 bytes ) -- 463 bytes (950 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 429 bytes (916 cumu)
; method 12 ( clrscr2 bytes ) -- 432 bytes (919 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 434 bytes (921 cumu)
; method 14 ( clrscr2 bytes ) -- 432 bytes (919 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 404 bytes (891 cumu)
; method 16 ( clrscr3 bytes ) -- 462 bytes (949 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 464 bytes (951 cumu)
; method 18 ( clrscr3 bytes ) -- 462 bytes (949 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 434 bytes (921 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 220
;,; <- chFFFFFFFFFFFF0000 ; 7
;,; <- ch0000000000000000 ; 177
;,; <- ch7F3F1F0F07030100 ; 6
;,; <- ch3F3F3F3F3F3F3F3F ; 12
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 1
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3C7E7E7E7E7E0000 ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chFCFCDCCCCCCCCCCC ; 13
;,; <- chD6D6D6D6D6F6FEFE ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 9
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- ch000103070F1F3F7F ; 3
;,; <- ch0000FFFFFFFFFFFF ; 3
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch3030303030303030 ; 4
;,; <- chFCFCCCCCCCDCFCFC ; 2
;,; <- ch00000F3F3F0F0000 ; 1
;,; <- chFCFC303030303030 ; 2
;,; <- chC0C0C0C0C0C0C0C0 ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 3
;,; <- ch7C7C7C6C6C6C6C6C ; 1
;,; <- chF0F0DEDECCCCFEFE ; 1
; total unique chars in pic: 28 (worst case req 224 bytes)
!byte $CF,$3C ;addr
!byte $00 ;data8
!byte ch0000000000000000
!byte $96 ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $e1,12+96-24

; total compressed size 494 bytes
