;,; lyrics_comewithus .withinpagefrom=lyrics
;,; <- lyrics

	!byte $1c,$2a,$48		; COME
	!byte $26,$21,$19,$1d		; WITH
	!byte $2a,$14,$19		; US
	!byte $16,$21			; WE
	!byte $24,$23,$21,$09		; SAY
	!byte $1d,$46			; TO
	!byte $1d,$41			; THE
	!byte $19,$41,$a2		; IN
	!byte $25,$a1			; FI
	!byte $22,$a1			; NI
	!byte $49,$2d,$f1		; TY
        !byte $0f

;,; deps_comewithus
;,; <- ibpcaablocks
;,; <- lyrics_comewithus

;,; SC51_000 .dur=15
;,; <- player_ivars
;,; <- deps_comewithus
!src "demosrc/smac.inc"

+s8bpc
+sAddr nextlyrictosing
!byte $00,lyrics_comewithus-lyrics

; NEW FRAME 0
; CLR FG with 3 ; eliminate if fullscreen delta
!byte $e4,3,chFFFFFFFFFFFFFFFF ; clrscr

; CLR chars with chFFFFFFFFFFFFFFFF ; eliminate if fullscreen delta
;,; <- chFFFFFFFFFFFFFFFF ; 370
;,; <- chFFFFFFFFFFFF0000 ; 9
;,; <- chFCFCFCFCFCFCFCFC ; 18
;,; <- ch3F3F3F3F3F3F3F3F ; 11
;,; <- chFCFCE0C0C0C0C0C0 ; 3
;,; <- chFCFCDCCCCCCCCCCC ; 2
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- ch0000000000000000 ; 47
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- chC0C0C0C0C0E0FCFC ; 1
;,; <- chCCCCCCCCCCECFCFC ; 2
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- ch0000207070707020 ; 1
;,; <- chFCFC303030303030 ; 2
;,; <- chCCCCCCCCCCCCCCCC ; 2
;,; <- ch0080C0E0F0F8FCFE ; 3
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- ch303030303030FCFC ; 1
;,; <- ch3030303030303030 ; 1
;,; <- chFCFC1C0C0C1CFCFC ; 1
;,; <- ch3C3C3C3C3C3C3C3C ; 2
;,; <- ch000F1F3F7F7F3F0F ; 1
;,; <- ch000103070F1F3F7F ; 3
;,; <- ch0F0F0F0F0F0F0F0F ; 1
;,; <- ch0000FFFFFFFFFFFF ; 10
; total unique chars in pic: 27 (worst case req 216 bytes)
!byte $DA,$00 ;addr
!byte $e2,1;mode4
!byte $01 ;data4
!byte $66
!byte $76
!byte $DA,$03 ;addr
!byte $53,$07 ;fill
!byte $1B ;data4
!byte $06
!byte $00
!byte $00
!byte $70
!byte $22
!byte $72
!byte $22
!byte $72
!byte $22
!byte $72
!byte $22
!byte $72
!byte $06
!byte $11
!byte $11
!byte $70
!byte $22
!byte $72
!byte $22
!byte $72
!byte $22
!byte $72
!byte $22
!byte $72
!byte $06
!byte $11
!byte $11
!byte $70
!byte $DA,$4F ;addr
!byte $4F,$07 ;fill
!byte $1C ;data4
!byte $36
!byte $77
!byte $77
!byte $11
!byte $17
!byte $21
!byte $21
!byte $27
!byte $22
!byte $27
!byte $22
!byte $27
!byte $16
!byte $11
!byte $01
!byte $11
!byte $77
!byte $27
!byte $22
!byte $27
!byte $22
!byte $27
!byte $22
!byte $27
!byte $16
!byte $11
!byte $01
!byte $11
!byte $71
!byte $DA,$99 ;addr
!byte $4D,$07 ;fill
!byte $00 ;data4
!byte $06
!byte $DA,$A9 ;addr
!byte $45,$00 ;fill
!byte $08 ;data4
!byte $22
!byte $72
!byte $22
!byte $72
!byte $22
!byte $72
!byte $22
!byte $72
!byte $06
!byte $DA,$C1 ;addr
!byte $45,$00 ;fill
!byte $09 ;data4
!byte $22
!byte $72
!byte $22
!byte $72
!byte $22
!byte $72
!byte $22
!byte $72
!byte $66
!byte $76
!byte $DA,$DB ;addr
!byte $53,$07 ;fill
!byte $06 ;data4
!byte $55
!byte $35
!byte $43
!byte $44
!byte $43
!byte $44
!byte $34
!byte $48,$04 ;fill
!byte $01 ;data4
!byte $55
!byte $35
!byte $85 ;skip
!byte $0C ;data4
!byte $77
!byte $37
!byte $33
!byte $43
!byte $44
!byte $43
!byte $34
!byte $55
!byte $55
!byte $33
!byte $33
!byte $33
!byte $37
!byte $88 ;skip
!byte $06 ;data4
!byte $34
!byte $53
!byte $55
!byte $55
!byte $33
!byte $33
!byte $73
!byte $8C ;skip
!byte $05 ;data4
!byte $55
!byte $55
!byte $55
!byte $33
!byte $33
!byte $37
!byte $8B ;skip
!byte $45,$05 ;fill
!byte $90 ;skip
!byte $46,$05 ;fill
!byte $8F ;skip
!byte $47,$05 ;fill
!byte $8E ;skip
!byte $48,$05 ;fill
!byte $00 ;data4
!byte $73
!byte $8B ;skip
!byte $49,$05 ;fill
!byte $00 ;data4
!byte $77
!byte $8A ;skip
!byte $4A,$05 ;fill
; method 0 ( bytes ) -- 364 cumulative
; method 1 ( ibpc0 bytes ) -- 415 cumulative
; method 2 ( ibpc1 bytes ) -- 415 cumulative
; method 3 ( ibpc2 bytes ) -- 415 cumulative
; method 4 ( ibpc3 bytes ) -- 415 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 328 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 328 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 328 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 328 cumulative
; METHOD 5 WAS THE BEST
!byte $CE,$3B ;addr
!byte $e2,$ff;mode1
!byte $33 ;data1
!byte $80
!byte $00
!byte $01
!byte $C0
!byte $03
!byte $FB
!byte $80
!byte $00
!byte $01
!byte $C0
!byte $00
!byte $05
!byte $C0
!byte $00
!byte $05
!byte $80
!byte $00
!byte $00
!byte $80
!byte $00
!byte $00
!byte $80
!byte $00
!byte $01
!byte $80
!byte $00
!byte $01
!byte $F0
!byte $00
!byte $01
!byte $C0
!byte $00
!byte $01
!byte $C0
!byte $00
!byte $01
!byte $80
!byte $00
!byte $00
!byte $80
!byte $00
!byte $00
!byte $80
!byte $00
!byte $00
!byte $80
!byte $00
!byte $00
!byte $80
!byte $00
!byte $00
!byte $C0
!byte $e3 ;run ibpcaa
!byte $CE,$01 ;addr
!byte $44,chFFFFFFFFFFFF0000 ;fill
!byte $90 ;skip
!byte $e2,0;mode8
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $85 ;skip
!byte $00 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte $8F ;skip
!byte $07 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chFEFEDED6D6D6D6D6
!byte chFCFCE0C0C0C0C0C0
!byte chFFFFFFFFFFFFFFFF
!byte ch3F3F3F3F3F3F3F3F
!byte $8F ;skip
!byte $07 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte chFFFFFFFFFFFFFFFF
!byte chC0C0C0C0C0E0FCFC
!byte chCCCCCCCCCCECFCFC
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCE0C0C0E0FCFC
!byte chFFFFFFFFFFFFFFFF
!byte ch7F3F1F0F07030100
!byte $84 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $91 ;skip
!byte $04 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000207070707020
!byte $8A ;skip
!byte $08 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte chC6C6C6C6C6C6C6C6
!byte chFCFC303030303030
!byte chFCFC303030303030
!byte chCCCCCCCCCCCCCCCC
!byte chFFFFFFFFFFFFFFFF
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte ch7F3F1F0F07030100
!byte $8E ;skip
!byte $07 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte chD6D6D6D6D6F6FEFE
!byte ch303030303030FCFC
!byte ch3030303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chFFFFFFFFFFFFFFFF
!byte chCCCCCCCCCCECFCFC
!byte chFCFC1C0C0C1CFCFC
!byte $8F ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $85 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $83 ;skip
!byte $00 ;data8
!byte ch000F1F3F7F7F3F0F
!byte $8A ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $86 ;skip
!byte $04 ;data8
!byte ch000103070F1F3F7F
!byte chFFFFFFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte ch0000000000000000
!byte ch0F0F0F0F0F0F0F0F
!byte $8B ;skip
!byte $45,ch0000FFFFFFFFFFFF ;fill
!byte $CF,$EB ;addr
!byte $01 ;data8
!byte ch0000FFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
; NEW FRAME 1
!byte $e1,15

;,; SC51_001 .dur=15
;,; <- deps_comewithus

;,; <- chFFFFFFFFFFFFFFFF ; 367
;,; <- chFFFFFFFFFFFF0000 ; 9
;,; <- chFCFCFCFCFCFCFCFC ; 18
;,; <- ch3F3F3F3F3F3F3F3F ; 10
;,; <- chFCFCE0C0C0C0C0C0 ; 3
;,; <- chFCFCDCCCCCCCCCCC ; 2
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- ch0000000000000000 ; 49
;,; <- ch7F3F1F0F07030100 ; 6
;,; <- chC0C0C0C0C0E0FCFC ; 1
;,; <- chCCCCCCCCCCECFCFC ; 2
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- ch0000207070707020 ; 1
;,; <- chFCFC303030303030 ; 2
;,; <- chCCCCCCCCCCCCCCCC ; 2
;,; <- ch0080C0E0F0F8FCFE ; 3
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- ch303030303030FCFC ; 1
;,; <- ch3030303030303030 ; 1
;,; <- chFCFC1C0C0C1CFCFC ; 1
;,; <- ch3C3C3C3C3C3C3C3C ; 2
;,; <- ch00030F3F0F0F0F0F ; 1
;,; <- ch000103070F1F3F7F ; 3
;,; <- ch0F0F0F0F0F0F0F0F ; 1
;,; <- ch0000FFFFFFFFFFFF ; 11
; total unique chars in pic: 27 (worst case req 216 bytes)
; method 0 ( bytes ) -- 348 cumulative
; method 1 ( ibpc0 bytes ) -- 357 cumulative
; method 2 ( ibpc1 bytes ) -- 357 cumulative
; method 3 ( ibpc2 bytes ) -- 357 cumulative
; method 4 ( ibpc3 bytes ) -- 357 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 404 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 404 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 404 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 404 cumulative
; METHOD 0 WAS THE BEST
!byte $CE,$B4 ;addr
!byte $00 ;data8
!byte ch00030F3F0F0F0F0F
!byte $AE ;skip
!byte $00 ;data8
!byte ch7F3F1F0F07030100
!byte $96 ;skip
!byte $03 ;data8
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFF0000
!byte $96 ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $95 ;skip
!byte $00 ;data8
!byte ch0000FFFFFFFFFFFF
; NEW FRAME 2
!byte $e1,15

;,; SC51_002 .dur=15
;,; <- deps_comewithus

;,; <- chFFFFFFFFFFFFFFFF ; 311
;,; <- chFFFFFFFFFFFF0000 ; 16
;,; <- chFCFCFCFCFCFCFCFC ; 22
;,; <- ch3F3F3F3F3F3F3F3F ; 14
;,; <- chFCFCE0C0C0C0C0C0 ; 5
;,; <- chFCFCDCCCCCCCCCCC ; 4
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch0000000000000000 ; 71
;,; <- ch7F3F1F0F07030100 ; 6
;,; <- chC0C0C0C0C0E0FCFC ; 1
;,; <- chCCCCCCCCCCECFCFC ; 3
;,; <- chC6C6C6C6C6C6C6C6 ; 3
;,; <- chFCFCE0C0C0E0FCFC ; 2
;,; <- ch0000207070707020 ; 1
;,; <- chFCFC303030303030 ; 2
;,; <- chCCCCCCCCCCCCCCCC ; 2
;,; <- ch0080C0E0F0F8FCFE ; 3
;,; <- chD6D6D6D6D6F6FEFE ; 2
;,; <- ch303030303030FCFC ; 1
;,; <- ch3030303030303030 ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch3C3C3C3C3C3C3C3C ; 2
;,; <- ch000F1F3F7F7F3F0F ; 1
;,; <- ch000103070F1F3F7F ; 4
;,; <- ch0F0F0F0F0F0F0F0F ; 1
;,; <- ch0000FFFFFFFFFFFF ; 18
; total unique chars in pic: 27 (worst case req 216 bytes)
!byte $DB,$82 ;addr
!byte $e2,1;mode4
!byte $02 ;data4
!byte $11
!byte $11
!byte $11
!byte $91 ;skip
!byte $02 ;data4
!byte $11
!byte $11
!byte $11
; method 0 ( bytes ) -- 426 cumulative
; method 1 ( ibpc0 bytes ) -- 446 cumulative
; method 2 ( ibpc1 bytes ) -- 455 cumulative
; method 3 ( ibpc2 bytes ) -- 446 cumulative
; method 4 ( ibpc3 bytes ) -- 455 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 467 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 486 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 467 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 486 cumulative
; METHOD 0 WAS THE BEST
!byte $CE,$B4 ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch000F1F3F7F7F3F0F
!byte $B1 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFF0000
!byte $95 ;skip
!byte $02 ;data8
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $95 ;skip
!byte $01 ;data8
!byte ch000103070F1F3F7F
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $A0 ;skip
!byte $46,chFFFFFFFFFFFF0000 ;fill
!byte $8E ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $46,ch0000000000000000 ;fill
!byte $00 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte $8D ;skip
!byte $09 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $8D ;skip
!byte $09 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte chD6D6D6D6D6F6FEFE
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000000000
!byte chFCFC1C0C0C1CFCFC
!byte chFCFCDCCCCCCCCCCC
!byte ch3030303030303030
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $8D ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $46,ch0000000000000000 ;fill
!byte $00 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte $8E ;skip
!byte $46,ch0000FFFFFFFFFFFF ;fill
; NEW FRAME 3
!byte $e1,15

;,; SC51_003 .dur=15
;,; <- deps_comewithus

;,; <- chFFFFFFFFFFFFFFFF ; 311
;,; <- chFFFFFFFFFFFF0000 ; 16
;,; <- chFCFCFCFCFCFCFCFC ; 22
;,; <- ch3F3F3F3F3F3F3F3F ; 14
;,; <- chFCFCE0C0C0C0C0C0 ; 5
;,; <- chFCFCDCCCCCCCCCCC ; 4
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch0000000000000000 ; 71
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- chC0C0C0C0C0E0FCFC ; 1
;,; <- chCCCCCCCCCCECFCFC ; 3
;,; <- chC6C6C6C6C6C6C6C6 ; 3
;,; <- chFCFCE0C0C0E0FCFC ; 2
;,; <- ch0000207070707020 ; 1
;,; <- chFCFC303030303030 ; 2
;,; <- chCCCCCCCCCCCCCCCC ; 2
;,; <- ch0080C0E0F0F8FCFE ; 3
;,; <- chD6D6D6D6D6F6FEFE ; 2
;,; <- ch303030303030FCFC ; 1
;,; <- ch3030303030303030 ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch3C3C3C3C3C3C3C3C ; 2
;,; <- ch00030F3F0F0F0F0F ; 1
;,; <- ch000103070F1F3F7F ; 5
;,; <- ch0F0F0F0F0F0F0F0F ; 1
;,; <- ch0000FFFFFFFFFFFF ; 17
;,; <- ch3C3C3C3C18180000 ; 1
; total unique chars in pic: 28 (worst case req 224 bytes)
; method 0 ( bytes ) -- 451 cumulative
; method 1 ( ibpc0 bytes ) -- 464 cumulative
; method 2 ( ibpc1 bytes ) -- 469 cumulative
; method 3 ( ibpc2 bytes ) -- 464 cumulative
; method 4 ( ibpc3 bytes ) -- 469 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 504 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 508 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 504 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 508 cumulative
; METHOD 0 WAS THE BEST
!byte $CE,$B4 ;addr
!byte $00 ;data8
!byte ch00030F3F0F0F0F0F
!byte $99 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFF0000
!byte $95 ;skip
!byte $02 ;data8
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $93 ;skip
!byte $03 ;data8
!byte ch3C3C3C3C18180000
!byte ch0000000000000000
!byte ch000103070F1F3F7F
!byte chFFFFFFFFFFFFFFFF
!byte $94 ;skip
!byte $01 ;data8
!byte ch000103070F1F3F7F
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
; NEW FRAME 4
!byte $e1,15

;,; SC51_004 .dur=15
;,; <- deps_comewithus

;,; <- chFFFFFFFFFFFFFFFF ; 367
;,; <- chFFFFFFFFFFFF0000 ; 10
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- ch0000000000000000 ; 62
;,; <- ch7F3F1F0F07030100 ; 2
;,; <- chFCFCFCFCFCFCFCFC ; 16
;,; <- ch0000207070707020 ; 1
;,; <- ch0080C0E0F0F8FCFE ; 3
;,; <- ch3F3F3F3F3F3F3F3F ; 15
;,; <- ch000F1F3F7F7F3F0F ; 1
;,; <- ch0F0F0F0F0F0F0F0F ; 1
;,; <- ch3C3C3C3C18180000 ; 1
;,; <- ch000103070F1F3F7F ; 2
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- chFCFCE0C0C0C0C0C0 ; 2
;,; <- chFCFCDCCCCCCCCCCC ; 2
;,; <- chCCCCCCCCCCECFCFC ; 1
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- chFCFC1C0C0C1CFCFC ; 1
;,; <- ch3030303030303030 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 10
; total unique chars in pic: 22 (worst case req 176 bytes)
!byte $DA,$19 ;addr
!byte $e2,1;mode4
!byte $02 ;data4
!byte $66
!byte $27
!byte $22
!byte $91 ;skip
!byte $02 ;data4
!byte $66
!byte $27
!byte $22
!byte $91 ;skip
!byte $02 ;data4
!byte $66
!byte $77
!byte $77
!byte $91 ;skip
!byte $04 ;data4
!byte $66
!byte $27
!byte $72
!byte $22
!byte $17
!byte $8D ;skip
!byte $03 ;data4
!byte $66
!byte $27
!byte $72
!byte $22
!byte $8F ;skip
!byte $00 ;data4
!byte $66
!byte $44,$07 ;fill
!byte $8F ;skip
!byte $03 ;data4
!byte $66
!byte $27
!byte $22
!byte $27
!byte $8F ;skip
!byte $03 ;data4
!byte $66
!byte $27
!byte $22
!byte $27
; method 0 ( bytes ) -- 559 cumulative
; method 1 ( ibpc0 bytes ) -- 583 cumulative
; method 2 ( ibpc1 bytes ) -- 589 cumulative
; method 3 ( ibpc2 bytes ) -- 583 cumulative
; method 4 ( ibpc3 bytes ) -- 589 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 555 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 568 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 555 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 568 cumulative
; METHOD 5 WAS THE BEST
!byte $CE,$61 ;addr
!byte $e2,$ff;mode1
!byte $00 ;data1
!byte $00
!byte $AE ;skip
!byte $03 ;data1
!byte $38
!byte $00
!byte $00
!byte $30
!byte $94 ;skip
!byte $09 ;data1
!byte $80
!byte $00
!byte $02
!byte $80
!byte $00
!byte $07
!byte $80
!byte $00
!byte $07
!byte $00
!byte $e3 ;run ibpcaa
!byte $CE,$01 ;addr
!byte $5B,chFFFFFFFFFFFFFFFF ;fill
!byte $92 ;skip
!byte $44,chFFFFFFFFFFFFFFFF ;fill
!byte $91 ;skip
!byte $44,chFFFFFFFFFFFFFFFF ;fill
!byte $85 ;skip
!byte $51,chFFFFFFFFFFFFFFFF ;fill
!byte $84 ;skip
!byte $52,chFFFFFFFFFFFFFFFF ;fill
!byte $8E ;skip
!byte $47,chFFFFFFFFFFFFFFFF ;fill
!byte $8F ;skip
!byte $45,chFFFFFFFFFFFFFFFF ;fill
!byte $83 ;skip
!byte $e2,0;mode8
!byte $01 ;data8
!byte ch000F1F3F7F7F3F0F
!byte chFFFFFFFFFFFF0000
!byte $AD ;skip
!byte $00 ;data8
!byte ch3C3C3C3C18180000
; NEW FRAME 5
!byte $e1,15

;,; SC51_005 .dur=15
;,; <- ibpcaablocks
;,; &- lyrics_comewithus

;,; <- chFFFFFFFFFFFFFFFF ; 271
;,; <- chFFFFFFFFFFFF0000 ; 14
;,; <- chFEFCF8F0E0C08000 ; 7
;,; <- ch0000000000000000 ; 98
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- chFCFCFCFCFCFCFCFC ; 19
;,; <- ch0000207070707020 ; 1
;,; <- ch0080C0E0F0F8FCFE ; 5
;,; <- ch3F3F3F3F3F3F3F3F ; 22
;,; <- ch00030F3F0F0F0F0F ; 1
;,; <- ch0F0F0F0F0F0F0F0F ; 1
;,; <- ch3C3C3C3C18180000 ; 1
;,; <- ch000103070F1F3F7F ; 2
;,; <- chFCFC303030303030 ; 6
;,; <- chFCFCDCCCCCCCCCCC ; 6
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- chFCFCE0C0C0C0C0C0 ; 5
;,; <- ch3030303030303030 ; 6
;,; <- chCCCCCCCCCCECFCFC ; 3
;,; <- chFCFCE0C0C0E0FCFC ; 2
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- chFCFC1C0C0C1CFCFC ; 1
;,; <- ch303030303030FCFC ; 3
;,; <- ch0000000000303030 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 19
; total unique chars in pic: 26 (worst case req 208 bytes)
!byte $DB,$48 ;addr
!byte $45,$01 ;fill
!byte $90 ;skip
!byte $45,$01 ;fill
!byte $A6 ;skip
!byte $47,$01 ;fill
!byte $8E ;skip
!byte $47,$01 ;fill
; method 0 ( bytes ) -- 677 cumulative
; method 1 ( ibpc0 bytes ) -- 702 cumulative
; method 2 ( ibpc1 bytes ) -- 718 cumulative
; method 3 ( ibpc2 bytes ) -- 702 cumulative
; method 4 ( ibpc3 bytes ) -- 718 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 659 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 684 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 659 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 684 cumulative
; METHOD 5 WAS THE BEST
!byte $CE,$E8 ;addr
!byte $e2,$ff;mode1
!byte $00 ;data1
!byte $80
!byte $90 ;skip
!byte $0F ;data1
!byte $80
!byte $00
!byte $F0
!byte $C0
!byte $00
!byte $71
!byte $FC
!byte $00
!byte $72
!byte $44
!byte $00
!byte $62
!byte $44
!byte $FF
!byte $27
!byte $FC
!byte $BC ;skip
!byte $01 ;data1
!byte $FF
!byte $80
!byte $e3 ;run ibpcaa
!byte $CE,$55 ;addr
!byte $e2,0;mode8
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $96 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $CE,$B4 ;addr
!byte $01 ;data8
!byte ch00030F3F0F0F0F0F
!byte chFFFFFFFFFFFF0000
!byte $AD ;skip
!byte $00 ;data8
!byte ch3C3C3C3C18180000
!byte $CF,$46 ;addr
!byte $07 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte $91 ;skip
!byte $05 ;data8
!byte ch3030303030303030
!byte chCCCCCCCCCCECFCFC
!byte ch0000000000000000
!byte ch3030303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte $A6 ;skip
!byte $0A ;data8
!byte chFCFCFCFCFCFCFCFC
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chFCFC303030303030
!byte chFCFC303030303030
!byte chCCCCCCCCCCECFCFC
!byte ch3030303030303030
!byte ch3F3F3F3F3F3F3F3F
!byte $8C ;skip
!byte $0A ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch303030303030FCFC
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte ch303030303030FCFC
!byte chCCCCCCCCCCCCCCCC
!byte ch303030303030FCFC
!byte ch3030303030303030
!byte ch3030303030303030
!byte ch0000000000303030
!byte ch3F3F3F3F3F3F3F3F
; NEW FRAME 6
!byte $e1,15

;,; SC51_006 .dur=15
;,; <- deps_comewithus

;,; <- chFFFFFFFFFFFFFFFF ; 324
;,; <- chFFFFFFFFFFFF0000 ; 7
;,; <- chFEFCF8F0E0C08000 ; 7
;,; <- ch0000000000000000 ; 77
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- chFCFCFCFCFCFCFCFC ; 15
;,; <- ch0000207070707020 ; 1
;,; <- ch0080C0E0F0F8FCFE ; 5
;,; <- ch3F3F3F3F3F3F3F3F ; 18
;,; <- ch000F1F3F7F7F3F0F ; 1
;,; <- ch0F0F0F0F0F0F0F0F ; 1
;,; <- ch3C3C3C3C18180000 ; 1
;,; <- ch000103070F1F3F7F ; 2
;,; <- ch0000FFFFFFFFFFFF ; 12
;,; <- chFCFC303030303030 ; 6
;,; <- chFCFCDCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- chFCFCE0C0C0C0C0C0 ; 3
;,; <- ch3030303030303030 ; 5
;,; <- chCCCCCCCCCCECFCFC ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- ch303030303030FCFC ; 3
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 23 (worst case req 184 bytes)
!byte $DB,$82 ;addr
!byte $e2,1;mode4
!byte $02 ;data4
!byte $55
!byte $55
!byte $55
!byte $91 ;skip
!byte $44,$05 ;fill
; method 0 ( bytes ) -- 705 cumulative
; method 1 ( ibpc0 bytes ) -- 723 cumulative
; method 2 ( ibpc1 bytes ) -- 738 cumulative
; method 3 ( ibpc2 bytes ) -- 723 cumulative
; method 4 ( ibpc3 bytes ) -- 738 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 723 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 745 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 723 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 745 cumulative
; METHOD 0 WAS THE BEST
!byte $CE,$B4 ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch000F1F3F7F7F3F0F
!byte $CE,$F8 ;addr
!byte $00 ;data8
!byte chFFFFFFFFFFFF0000
!byte $95 ;skip
!byte $01 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte $96 ;skip
!byte $00 ;data8
!byte ch0000FFFFFFFFFFFF
!byte $A7 ;skip
!byte $46,chFFFFFFFFFFFFFFFF ;fill
!byte $8E ;skip
!byte $48,chFFFFFFFFFFFFFFFF ;fill
!byte $8D ;skip
!byte $48,chFFFFFFFFFFFFFFFF ;fill
!byte $8D ;skip
!byte $48,chFFFFFFFFFFFFFFFF ;fill
!byte $8D ;skip
!byte $48,chFFFFFFFFFFFFFFFF ;fill
!byte $8E ;skip
!byte $46,chFFFFFFFFFFFFFFFF ;fill
; NEW FRAME 7
!byte $e1,15

;,; SC51_007 .dur=15
;,; <- deps_comewithus

;,; <- chFFFFFFFFFFFFFFFF ; 321
;,; <- chFFFFFFFFFFFF0000 ; 9
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- ch0000000000000000 ; 79
;,; <- ch7F3F1F0F07030100 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 16
;,; <- ch0000207070707020 ; 1
;,; <- ch0080C0E0F0F8FCFE ; 5
;,; <- ch3F3F3F3F3F3F3F3F ; 16
;,; <- ch00030F3F0F0F0F0F ; 1
;,; <- ch0F0F0F0F0F0F0F0F ; 1
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch0000FFFFFFFFFFFF ; 12
;,; <- ch000103070F1F3F7F ; 2
;,; <- chFCFC303030303030 ; 6
;,; <- chFCFCDCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- chFCFCE0C0C0C0C0C0 ; 3
;,; <- ch3030303030303030 ; 5
;,; <- chCCCCCCCCCCECFCFC ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- ch303030303030FCFC ; 3
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 23 (worst case req 184 bytes)
; method 0 ( bytes ) -- 745 cumulative
; method 1 ( ibpc0 bytes ) -- 757 cumulative
; method 2 ( ibpc1 bytes ) -- 757 cumulative
; method 3 ( ibpc2 bytes ) -- 757 cumulative
; method 4 ( ibpc3 bytes ) -- 757 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 744 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 746 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 744 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 746 cumulative
; METHOD 5 WAS THE BEST
!byte $CE,$CD ;addr
!byte $e2,$ff;mode1
!byte $05 ;data1
!byte $00
!byte $00
!byte $02
!byte $10
!byte $00
!byte $3F
!byte $91 ;skip
!byte $00 ;data1
!byte $BE
!byte $e3 ;run ibpcaa
!byte $CE,$55 ;addr
!byte $e2,0;mode8
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $96 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $CE,$B4 ;addr
!byte $01 ;data8
!byte ch00030F3F0F0F0F0F
!byte chFFFFFFFFFFFFFFFF
!byte $96 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $00 ;data8
!byte ch7F3F1F0F07030100
!byte $CF,$46 ;addr
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
; NEW FRAME 8
!byte $e1,15

;,; SC51_008 .dur=15
;,; <- deps_comewithus

;,; <- chFFFFFFFFFFFFFFFF ; 319
;,; <- chFFFFFFFFFFFF0000 ; 10
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- ch0000000000000000 ; 79
;,; <- ch7F3F1F0F07030100 ; 7
;,; <- chFCFCFCFCFCFCFCFC ; 15
;,; <- ch0000207070707020 ; 1
;,; <- ch0080C0E0F0F8FCFE ; 6
;,; <- ch3F3F3F3F3F3F3F3F ; 15
;,; <- ch000F1F3F7F7F3F0F ; 1
;,; <- ch0F0F0F0F0F0F0F0F ; 1
;,; <- ch0000FFFFFFFFFFFF ; 14
;,; <- ch000103070F1F3F7F ; 2
;,; <- chFCFC303030303030 ; 6
;,; <- chFCFCDCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- chFCFCE0C0C0C0C0C0 ; 3
;,; <- ch3030303030303030 ; 5
;,; <- chCCCCCCCCCCECFCFC ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- ch303030303030FCFC ; 3
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 22 (worst case req 176 bytes)
; method 0 ( bytes ) -- 783 cumulative
; method 1 ( ibpc0 bytes ) -- 795 cumulative
; method 2 ( ibpc1 bytes ) -- 807 cumulative
; method 3 ( ibpc2 bytes ) -- 795 cumulative
; method 4 ( ibpc3 bytes ) -- 807 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 782 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 801 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 782 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 801 cumulative
; METHOD 5 WAS THE BEST
!byte $CE,$F5 ;addr
!byte $e2,$ff;mode1
!byte $07 ;data1
!byte $FF
!byte $08
!byte $00
!byte $0F
!byte $0C
!byte $00
!byte $07
!byte $9F
!byte $e3 ;run ibpcaa
!byte $CE,$55 ;addr
!byte $e2,0;mode8
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $96 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $CE,$B4 ;addr
!byte $01 ;data8
!byte ch000F1F3F7F7F3F0F
!byte chFFFFFFFFFFFFFFFF
!byte $96 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $00 ;data8
!byte ch7F3F1F0F07030100
!byte $CF,$46 ;addr
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
; NEW FRAME 9
!byte $e1,15

;,; SC51_009 .dur=15
;,; <- deps_comewithus

;,; <- chFFFFFFFFFFFFFFFF ; 320
;,; <- chFFFFFFFFFFFF0000 ; 10
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- ch0000000000000000 ; 78
;,; <- ch7F3F1F0F07030100 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 15
;,; <- ch0000207070707020 ; 1
;,; <- ch0080C0E0F0F8FCFE ; 6
;,; <- ch3F3F3F3F3F3F3F3F ; 17
;,; <- ch00030F3F0F0F0F0F ; 1
;,; <- ch0F0F0F0F0F0F0F0F ; 1
;,; <- ch0000FFFFFFFFFFFF ; 14
;,; <- chFCFC303030303030 ; 6
;,; <- chFCFCDCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- chFCFCE0C0C0C0C0C0 ; 3
;,; <- ch000103070F1F3F7F ; 1
;,; <- ch3030303030303030 ; 5
;,; <- chCCCCCCCCCCECFCFC ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- ch303030303030FCFC ; 3
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 22 (worst case req 176 bytes)
!byte $DA,$FC ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $33
!byte $95 ;skip
!byte $00 ;data4
!byte $33
; method 0 ( bytes ) -- 808 cumulative
; method 1 ( ibpc0 bytes ) -- 814 cumulative
; method 2 ( ibpc1 bytes ) -- 814 cumulative
; method 3 ( ibpc2 bytes ) -- 814 cumulative
; method 4 ( ibpc3 bytes ) -- 814 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 822 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 822 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 822 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 822 cumulative
; METHOD 0 WAS THE BEST
!byte $CE,$B4 ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch00030F3F0F0F0F0F
!byte $CF,$15 ;addr
!byte $00 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte $96 ;skip
!byte $01 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $00 ;data8
!byte ch3F3F3F3F3F3F3F3F
; total compressed size 808 bytes

!byte $e1,57
