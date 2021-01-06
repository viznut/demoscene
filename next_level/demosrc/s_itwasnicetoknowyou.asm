;,; lyrics_itwasnicetoknowyou .withinpagefrom=lyrics
;,; <- lyrics

	!byte $31,$19,$1d		; IT
	!byte $26,$30,$14,$09		; WAS
	!byte $22,$2a,$21,$24		; NICE
	!byte $29,$1d,$36		; TO
	!byte $22,$30,$36		; KNOW
	!byte $21,$06			; YOU
	!byte $06,$09,$89
	!byte $31,$19,$1d		; IT
	!byte $26,$30,$14		; WAS
	!byte $22,$3a,$21,$24		; NICE
	!byte $29,$1d,$36		; TO
	!byte $22,$30,$36		; KNOW
	!byte $21,$a6			; YOU
	!byte $0f

;,; deps_itwasnicetoknowyou
;,; <- lyrics_itwasnicetoknowyou
;,; <- ibpcaablocks

;,; SC63_000
;,; <- deps_itwasnicetoknowyou
;,; <- streamvars
;,; <- player_ivars
!src "demosrc/smac.inc"

+s8bpc
+sAddr nextlyrictosing
!byte $00,lyrics_itwasnicetoknowyou-lyrics

; method 4 ( clrscr0 bytes ) -- 382 bytes (382 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 432 bytes (432 cumu)
; method 6 ( clrscr0 bytes ) -- 382 bytes (382 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 308 bytes (308 cumu)
; method 8 ( clrscr1 bytes ) -- 389 bytes (389 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 439 bytes (439 cumu)
; method 10 ( clrscr1 bytes ) -- 389 bytes (389 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 315 bytes (315 cumu)
; method 12 ( clrscr2 bytes ) -- 398 bytes (398 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 446 bytes (446 cumu)
; method 14 ( clrscr2 bytes ) -- 398 bytes (398 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 322 bytes (322 cumu)
; method 16 ( clrscr3 bytes ) -- 405 bytes (405 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 453 bytes (453 cumu)
; method 18 ( clrscr3 bytes ) -- 405 bytes (405 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 329 bytes (329 cumu)
; METHOD 7 CHOSEN
!byte $e4,3,chFFFFFFFFFFFFFFFF ; clrscr
;,; <- chFCFC303030303030 ; 4
;,; <- chFFFFFFFFFFFFFFFF ; 340
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFCDCCCCCCCCCCC ; 7
;,; <- chFCFCE0C0C0C0C0C0 ; 3
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- ch303030303030FCFC ; 2
;,; <- ch3030303030303030 ; 3
;,; <- chD6D6D6D6D6F6FEFE ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- ch0000FFFFFFFFFFFF ; 28
;,; <- ch0000FFFFFFFF0000 ; 2
;,; <- chFEFCF8F0E0C08000 ; 5
;,; <- ch0000000000000000 ; 48
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- chFCFCFCFCFCFCFCFC ; 16
;,; <- ch3F3F3F3F3F3F3F3F ; 16
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- ch000103070F1F3F7F ; 2
;,; <- ch000018183C3C3C3C ; 2
;,; <- ch3C3C3C3C3C3C3C3C ; 2
; total unique chars in pic: 25 (worst case req 200 bytes)
!byte $DA,$00 ;addr
!byte $e2,1;mode4
!byte $1A ;data4
!byte $11
!byte $10
!byte $11
!byte $10
!byte $11
!byte $01
!byte $11
!byte $10
!byte $11
!byte $01
!byte $11
!byte $01
!byte $11
!byte $10
!byte $11
!byte $10
!byte $11
!byte $01
!byte $11
!byte $10
!byte $11
!byte $01
!byte $11
!byte $01
!byte $22
!byte $22
!byte $31
!byte $8A ;skip
!byte $05 ;data4
!byte $21
!byte $22
!byte $22
!byte $20
!byte $22
!byte $12
!byte $8B ;skip
!byte $05 ;data4
!byte $21
!byte $22
!byte $22
!byte $20
!byte $22
!byte $12
!byte $8B ;skip
!byte $05 ;data4
!byte $21
!byte $22
!byte $22
!byte $20
!byte $22
!byte $12
!byte $8B ;skip
!byte $05 ;data4
!byte $21
!byte $22
!byte $22
!byte $20
!byte $22
!byte $12
!byte $8B ;skip
!byte $05 ;data4
!byte $21
!byte $22
!byte $22
!byte $20
!byte $22
!byte $12
!byte $8B ;skip
!byte $05 ;data4
!byte $21
!byte $22
!byte $22
!byte $20
!byte $22
!byte $12
!byte $8B ;skip
!byte $05 ;data4
!byte $21
!byte $22
!byte $22
!byte $20
!byte $22
!byte $12
!byte $8B ;skip
!byte $05 ;data4
!byte $21
!byte $22
!byte $22
!byte $00
!byte $00
!byte $10
!byte $8B ;skip
!byte $00 ;data4
!byte $01
!byte $DB,$02 ;addr
!byte $48,$00 ;fill
!byte $00 ;data4
!byte $31
!byte $8A ;skip
!byte $00 ;data4
!byte $01
!byte $DB,$1A ;addr
!byte $48,$00 ;fill
!byte $00 ;data4
!byte $31
!byte $8A ;skip
!byte $00 ;data4
!byte $01
!byte $DB,$32 ;addr
!byte $48,$00 ;fill
!byte $00 ;data4
!byte $31
!byte $8A ;skip
!byte $00 ;data4
!byte $01
!byte $DB,$4A ;addr
!byte $48,$00 ;fill
!byte $00 ;data4
!byte $31
!byte $8A ;skip
!byte $00 ;data4
!byte $01
!byte $DB,$62 ;addr
!byte $48,$00 ;fill
!byte $00 ;data4
!byte $31
!byte $8A ;skip
!byte $00 ;data4
!byte $01
!byte $DB,$7A ;addr
!byte $48,$00 ;fill
!byte $00 ;data4
!byte $31
!byte $8A ;skip
!byte $00 ;data4
!byte $01
!byte $DB,$92 ;addr
!byte $48,$00 ;fill
!byte $00 ;data4
!byte $31
!byte $8A ;skip
!byte $00 ;data4
!byte $01
!byte $DB,$AA ;addr
!byte $48,$00 ;fill
!byte $00 ;data4
!byte $31
!byte $8A ;skip
!byte $00 ;data4
!byte $01
!byte $DB,$C2 ;addr
!byte $48,$00 ;fill
!byte $00 ;data4
!byte $31
!byte $8A ;skip
!byte $00 ;data4
!byte $01
!byte $DB,$DA ;addr
!byte $5D,$00 ;fill
!byte $CE,$52 ;addr
!byte $e2,$ff;mode1
!byte $30 ;data1
!byte $C0
!byte $00
!byte $01
!byte $E0
!byte $00
!byte $01
!byte $E0
!byte $00
!byte $01
!byte $E0
!byte $00
!byte $00
!byte $C0
!byte $00
!byte $00
!byte $C0
!byte $00
!byte $01
!byte $E0
!byte $00
!byte $02
!byte $D0
!byte $00
!byte $02
!byte $D0
!byte $00
!byte $00
!byte $C0
!byte $00
!byte $00
!byte $C0
!byte $00
!byte $01
!byte $20
!byte $00
!byte $01
!byte $20
!byte $00
!byte $01
!byte $20
!byte $00
!byte $01
!byte $20
!byte $00
!byte $01
!byte $20
!byte $00
!byte $03
!byte $30
!byte $e3 ;run ibpcaa
!byte $CE,$00 ;addr
!byte $e2,0;mode8
!byte $2F ;data8
!byte chFCFC303030303030
!byte chFCFC303030303030
!byte chFFFFFFFFFFFFFFFF
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCDCCCCCCCCCCC
!byte chFCFC303030303030
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte chFFFFFFFFFFFFFFFF
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chFFFFFFFFFFFFFFFF
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chC6C6C6C6C6C6C6C6
!byte chFFFFFFFFFFFFFFFF
!byte chCCCCCCCCCCECFCFC
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte chFFFFFFFFFFFFFFFF
!byte ch303030303030FCFC
!byte ch3030303030303030
!byte chFFFFFFFFFFFFFFFF
!byte chD6D6D6D6D6F6FEFE
!byte chFCFCDCCCCCCCCCCC
!byte chFCFC1C0C0C1CFCFC
!byte chFFFFFFFFFFFFFFFF
!byte chCCCCCCCCCCCCCCCC
!byte ch303030303030FCFC
!byte chC0C0C0C0C0E0FCFC
!byte chFCFCE0C0C0E0FCFC
!byte chFFFFFFFFFFFFFFFF
!byte ch3030303030303030
!byte chCCCCCCCCCCECFCFC
!byte chFFFFFFFFFFFFFFFF
!byte chF0F8CCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte chD6D6D6D6D6F6FEFE
!byte chFFFFFFFFFFFFFFFF
!byte ch3030303030303030
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCECFCFC
!byte chFFFFFFFFFFFFFFFF
!byte $48,ch0000FFFFFFFFFFFF ;fill
!byte $01 ;data8
!byte ch0000FFFFFFFF0000
!byte ch0000FFFFFFFF0000
!byte $4A,ch0000FFFFFFFFFFFF ;fill
!byte $CF,$E8 ;addr
!byte $05 ;data8
!byte ch0000FFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte $e1,12



;,; *_001
;,; <- deps_itwasnicetoknowyou
; method 0 ( bytes ) -- 103 bytes (411 cumu)
; method 1 ( ibpc0 bytes ) -- 100 bytes (408 cumu)
; method 2 ( bytes ) -- 103 bytes (411 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 172 bytes (480 cumu)
; method 4 ( clrscr0 bytes ) -- 431 bytes (739 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 437 bytes (745 cumu)
; method 6 ( clrscr0 bytes ) -- 431 bytes (739 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 378 bytes (686 cumu)
; method 8 ( clrscr1 bytes ) -- 452 bytes (760 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 458 bytes (766 cumu)
; method 10 ( clrscr1 bytes ) -- 452 bytes (760 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 399 bytes (707 cumu)
; method 12 ( clrscr2 bytes ) -- 441 bytes (749 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 450 bytes (758 cumu)
; method 14 ( clrscr2 bytes ) -- 441 bytes (749 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 391 bytes (699 cumu)
; method 16 ( clrscr3 bytes ) -- 462 bytes (770 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 471 bytes (779 cumu)
; method 18 ( clrscr3 bytes ) -- 462 bytes (770 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 412 bytes (720 cumu)
; METHOD 1 CHOSEN
;,; <- chFCFC303030303030 ; 4
;,; <- chFFFFFFFFFFFFFFFF ; 240
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFCDCCCCCCCCCCC ; 7
;,; <- chFCFCE0C0C0C0C0C0 ; 3
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- ch3030303030303030 ; 4
;,; <- ch303030303030FCFC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- ch0000000000303030 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 28
;,; <- ch0000FFFFFFFF0000 ; 2
;,; <- chFEFCF8F0E0C08000 ; 5
;,; <- ch0000000000000000 ; 148
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- chFCFCFCFCFCFCFCFC ; 15
;,; <- ch3F3F3F3F3F3F3F3F ; 15
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- ch000103070F1F3F7F ; 2
;,; <- ch000018183C3C3C3C ; 2
;,; <- ch3C3C3C3C3C3C3C3C ; 2
; total unique chars in pic: 26 (worst case req 208 bytes)
!byte $DA,$17 ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $11
!byte $95 ;skip
!byte $00 ;data4
!byte $21
!byte $95 ;skip
!byte $00 ;data4
!byte $22
!byte $95 ;skip
!byte $00 ;data4
!byte $22
!byte $95 ;skip
!byte $00 ;data4
!byte $22
!byte $95 ;skip
!byte $00 ;data4
!byte $22
!byte $95 ;skip
!byte $00 ;data4
!byte $22
!byte $95 ;skip
!byte $00 ;data4
!byte $22
!byte $95 ;skip
!byte $00 ;data4
!byte $22
!byte $95 ;skip
!byte $00 ;data4
!byte $02
!byte $CE,$F0 ;addr
!byte $e2,$ff;mode1
!byte $1D ;data1
!byte $F0
!byte $B4
!byte $3F
!byte $F0
!byte $B4
!byte $3F
!byte $F0
!byte $30
!byte $3F
!byte $F0
!byte $70
!byte $3F
!byte $F0
!byte $48
!byte $3F
!byte $F0
!byte $48
!byte $3F
!byte $F0
!byte $48
!byte $3F
!byte $F0
!byte $48
!byte $3F
!byte $F0
!byte $C8
!byte $3F
!byte $F0
!byte $0C
!byte $3F
!byte $CE,$17 ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch3030303030303030
!byte $96 ;skip
!byte $00 ;data8
!byte ch0000000000303030
!byte $CF,$29 ;addr
!byte $00 ;data8
!byte chFEFCF8F0E0C08000
!byte $95 ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $CF,$A0 ;addr
!byte $00 ;data8
!byte chFEFCF8F0E0C08000
!byte $95 ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $96 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $94 ;skip
!byte $40,chFFFFFFFFFFFFFFFF ;fill
!byte $e1,12



;,; *_002
;,; <- deps_itwasnicetoknowyou
; method 0 ( bytes ) -- 53 bytes (461 cumu)
; method 1 ( ibpc0 bytes ) -- 60 bytes (468 cumu)
; method 2 ( bytes ) -- 53 bytes (461 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 63 bytes (471 cumu)
; method 4 ( clrscr0 bytes ) -- 383 bytes (791 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 433 bytes (841 cumu)
; method 6 ( clrscr0 bytes ) -- 383 bytes (791 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 311 bytes (719 cumu)
; method 8 ( clrscr1 bytes ) -- 404 bytes (812 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 454 bytes (862 cumu)
; method 10 ( clrscr1 bytes ) -- 404 bytes (812 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 332 bytes (740 cumu)
; method 12 ( clrscr2 bytes ) -- 399 bytes (807 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 447 bytes (855 cumu)
; method 14 ( clrscr2 bytes ) -- 399 bytes (807 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 325 bytes (733 cumu)
; method 16 ( clrscr3 bytes ) -- 420 bytes (828 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 468 bytes (876 cumu)
; method 18 ( clrscr3 bytes ) -- 420 bytes (828 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 346 bytes (754 cumu)
; METHOD 0 CHOSEN
;,; <- chFCFC303030303030 ; 4
;,; <- chFFFFFFFFFFFFFFFF ; 343
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFCDCCCCCCCCCCC ; 7
;,; <- chFCFCE0C0C0C0C0C0 ; 3
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- ch3030303030303030 ; 4
;,; <- ch303030303030FCFC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- ch0000000000303030 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 28
;,; <- ch0000FFFFFFFF0000 ; 2
;,; <- chFEFCF8F0E0C08000 ; 5
;,; <- ch0000000000000000 ; 46
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- chFCFCFCFCFCFCFCFC ; 14
;,; <- ch3F3F3F3F3F3F3F3F ; 15
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- ch000103070F1F3F7F ; 1
;,; <- ch000018183C3C3C3C ; 3
;,; <- ch3C3C3C3C3C3C3C3C ; 2
; total unique chars in pic: 26 (worst case req 208 bytes)
!byte $CE,$F0 ;addr
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $8D ;skip
!byte $48,chFFFFFFFFFFFFFFFF ;fill
!byte $8D ;skip
!byte $48,chFFFFFFFFFFFFFFFF ;fill
!byte $8D ;skip
!byte $48,chFFFFFFFFFFFFFFFF ;fill
!byte $85 ;skip
!byte $00 ;data8
!byte ch000018183C3C3C3C
!byte $86 ;skip
!byte $48,chFFFFFFFFFFFFFFFF ;fill
!byte $85 ;skip
!byte $00 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte $86 ;skip
!byte $48,chFFFFFFFFFFFFFFFF ;fill
!byte $8D ;skip
!byte $48,chFFFFFFFFFFFFFFFF ;fill
!byte $83 ;skip
!byte $00 ;data8
!byte chFEFCF8F0E0C08000
!byte $88 ;skip
!byte $48,chFFFFFFFFFFFFFFFF ;fill
!byte $04 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte $88 ;skip
!byte $4C,chFFFFFFFFFFFFFFFF ;fill
!byte $02 ;data8
!byte ch0000FFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $86 ;skip
!byte $4E,chFFFFFFFFFFFFFFFF ;fill
!byte $87 ;skip
!byte $44,chFFFFFFFFFFFFFFFF ;fill
!byte $e1,12



;,; *_003
;,; <- deps_itwasnicetoknowyou
; method 0 ( bytes ) -- 44 bytes (505 cumu)
; method 1 ( ibpc0 bytes ) -- 54 bytes (515 cumu)
; method 2 ( bytes ) -- 44 bytes (505 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 59 bytes (520 cumu)
; method 4 ( clrscr0 bytes ) -- 394 bytes (855 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 444 bytes (905 cumu)
; method 6 ( clrscr0 bytes ) -- 394 bytes (855 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 319 bytes (780 cumu)
; method 8 ( clrscr1 bytes ) -- 409 bytes (870 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 459 bytes (920 cumu)
; method 10 ( clrscr1 bytes ) -- 409 bytes (870 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 334 bytes (795 cumu)
; method 12 ( clrscr2 bytes ) -- 410 bytes (871 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 458 bytes (919 cumu)
; method 14 ( clrscr2 bytes ) -- 410 bytes (871 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 333 bytes (794 cumu)
; method 16 ( clrscr3 bytes ) -- 425 bytes (886 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 473 bytes (934 cumu)
; method 18 ( clrscr3 bytes ) -- 425 bytes (886 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 348 bytes (809 cumu)
; METHOD 0 CHOSEN
;,; <- chFCFC303030303030 ; 4
;,; <- chFFFFFFFFFFFFFFFF ; 343
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFCDCCCCCCCCCCC ; 7
;,; <- chFCFCE0C0C0C0C0C0 ; 3
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- ch3030303030303030 ; 4
;,; <- ch303030303030FCFC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- ch0000000000303030 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 28
;,; <- ch0000FFFFFFFF0000 ; 2
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch0000000000000000 ; 46
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- chFCFCFCFCFCFCFCFC ; 15
;,; <- ch3F3F3F3F3F3F3F3F ; 14
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- ch000103070F1F3F7F ; 2
;,; <- ch000018183C3C3C3C ; 2
;,; <- ch3C3C3C3C3C3C3C3C ; 2
;,; <- chFFFFFFFFFFFF0000 ; 1
; total unique chars in pic: 27 (worst case req 216 bytes)
!byte $DB,$88 ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $31
!byte $94 ;skip
!byte $01 ;data4
!byte $11
!byte $31
!byte $93 ;skip
!byte $01 ;data4
!byte $11
!byte $31
!byte $93 ;skip
!byte $01 ;data4
!byte $11
!byte $31
!byte $CF,$42 ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch0000000000000000
!byte $96 ;skip
!byte $00 ;data8
!byte ch000103070F1F3F7F
!byte $AC ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $95 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFF0000
!byte ch0000FFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $93 ;skip
!byte $02 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $95 ;skip
!byte $00 ;data8
!byte ch0000FFFFFFFFFFFF
!byte $e1,12



;,; *_004
;,; <- deps_itwasnicetoknowyou
; method 0 ( bytes ) -- 120 bytes (625 cumu)
; method 1 ( ibpc0 bytes ) -- 148 bytes (653 cumu)
; method 2 ( bytes ) -- 120 bytes (625 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 91 bytes (596 cumu)
; method 4 ( clrscr0 bytes ) -- 335 bytes (840 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 389 bytes (894 cumu)
; method 6 ( clrscr0 bytes ) -- 335 bytes (840 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 259 bytes (764 cumu)
; method 8 ( clrscr1 bytes ) -- 352 bytes (857 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 406 bytes (911 cumu)
; method 10 ( clrscr1 bytes ) -- 352 bytes (857 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 276 bytes (781 cumu)
; method 12 ( clrscr2 bytes ) -- 355 bytes (860 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 400 bytes (905 cumu)
; method 14 ( clrscr2 bytes ) -- 355 bytes (860 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 271 bytes (776 cumu)
; method 16 ( clrscr3 bytes ) -- 372 bytes (877 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 417 bytes (922 cumu)
; method 18 ( clrscr3 bytes ) -- 372 bytes (877 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 288 bytes (793 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 406
;,; <- chFFFFFFFFFFFF0000 ; 2
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch0000000000000000 ; 45
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- chFCFCFCFCFCFCFCFC ; 14
;,; <- ch3F3F3F3F3F3F3F3F ; 14
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- ch000103070F1F3F7F ; 1
;,; <- ch000018183C3C3C3C ; 3
;,; <- ch3C3C3C3C3C3C3C3C ; 2
;,; <- ch0000FFFFFFFFFFFF ; 5
;,; <- ch0000FFFFFFFF0000 ; 1
; total unique chars in pic: 13 (worst case req 104 bytes)
!byte $DA,$00 ;addr
!byte $e2,1;mode4
!byte $02 ;data4
!byte $22
!byte $22
!byte $31
!byte $DA,$05 ;addr
!byte $4A,$03 ;fill
!byte $00 ;data4
!byte $21
!byte $DA,$12 ;addr
!byte $48,$02 ;fill
!byte $00 ;data4
!byte $31
!byte $DA,$1D ;addr
!byte $4A,$03 ;fill
!byte $00 ;data4
!byte $21
!byte $DA,$2A ;addr
!byte $44,$02 ;fill
!byte $DB,$58 ;addr
!byte $01 ;data4
!byte $11
!byte $31
!byte $93 ;skip
!byte $01 ;data4
!byte $11
!byte $31
!byte $94 ;skip
!byte $00 ;data4
!byte $31
!byte $CE,$3A ;addr
!byte $e2,$ff;mode1
!byte $03 ;data1
!byte $C0
!byte $00
!byte $01
!byte $E0
!byte $BE ;skip
!byte $00 ;data1
!byte $60
!byte $A7 ;skip
!byte $03 ;data1
!byte $E0
!byte $00
!byte $01
!byte $70
!byte $A6 ;skip
!byte $00 ;data1
!byte $34
!byte $A9 ;skip
!byte $02 ;data1
!byte $40
!byte $00
!byte $00
!byte $CF,$B8 ;addr
!byte $00 ;data1
!byte $08
!byte $e3 ;run ibpcaa
!byte $CE,$00 ;addr
!byte $60,chFFFFFFFFFFFFFFFF ;fill
!byte $e2,0;mode8
!byte $01 ;data8
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFF0000
!byte $53,chFFFFFFFFFFFFFFFF ;fill
!byte $03 ;data8
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte $49,chFFFFFFFFFFFFFFFF ;fill
!byte $e1,12



;,; *_005
;,; <- deps_itwasnicetoknowyou
; method 0 ( bytes ) -- 148 bytes (744 cumu)
; method 1 ( ibpc0 bytes ) -- 177 bytes (773 cumu)
; method 2 ( bytes ) -- 148 bytes (744 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 95 bytes (691 cumu)
; method 4 ( clrscr0 bytes ) -- 327 bytes (923 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 378 bytes (974 cumu)
; method 6 ( clrscr0 bytes ) -- 327 bytes (923 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 261 bytes (857 cumu)
; method 8 ( clrscr1 bytes ) -- 322 bytes (918 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 373 bytes (969 cumu)
; method 10 ( clrscr1 bytes ) -- 322 bytes (918 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 256 bytes (852 cumu)
; method 12 ( clrscr2 bytes ) -- 346 bytes (942 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 392 bytes (988 cumu)
; method 14 ( clrscr2 bytes ) -- 346 bytes (942 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 275 bytes (871 cumu)
; method 16 ( clrscr3 bytes ) -- 341 bytes (937 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 387 bytes (983 cumu)
; method 18 ( clrscr3 bytes ) -- 341 bytes (937 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 270 bytes (866 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 422
;,; <- chFFFFFFFFFFFF0000 ; 3
;,; <- chFEFCF8F0E0C08000 ; 2
;,; <- ch0000000000000000 ; 38
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- chFCFCFCFCFCFCFCFC ; 9
;,; <- ch3F3F3F3F3F3F3F3F ; 10
;,; <- ch0000F0FCFCF00000 ; 2
;,; <- ch00000F3F3F0F0000 ; 1
;,; <- ch0080C0E0F0F8FCFE ; 4
;,; <- ch000103070F1F3F7F ; 1
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3C3C3C3C3C3C3C3C ; 2
;,; <- ch0000FFFFFFFFFFFF ; 4
; total unique chars in pic: 14 (worst case req 112 bytes)
!byte $DA,$3A ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $11
!byte $94 ;skip
!byte $01 ;data4
!byte $11
!byte $31
!byte $92 ;skip
!byte $01 ;data4
!byte $11
!byte $11
!byte $93 ;skip
!byte $01 ;data4
!byte $11
!byte $11
!byte $93 ;skip
!byte $01 ;data4
!byte $11
!byte $11
!byte $93 ;skip
!byte $01 ;data4
!byte $11
!byte $11
!byte $93 ;skip
!byte $02 ;data4
!byte $11
!byte $11
!byte $31
!byte $90 ;skip
!byte $02 ;data4
!byte $11
!byte $11
!byte $31
!byte $91 ;skip
!byte $02 ;data4
!byte $11
!byte $31
!byte $31
!byte $91 ;skip
!byte $02 ;data4
!byte $11
!byte $11
!byte $31
!byte $93 ;skip
!byte $01 ;data4
!byte $11
!byte $31
!byte $93 ;skip
!byte $00 ;data4
!byte $11
!byte $DB,$B7 ;addr
!byte $41,$03 ;fill
!byte $94 ;skip
!byte $41,$03 ;fill
!byte $CE,$69 ;addr
!byte $e2,$ff;mode1
!byte $00 ;data1
!byte $60
!byte $CE,$CC ;addr
!byte $03 ;data1
!byte $80
!byte $00
!byte $03
!byte $40
!byte $A5 ;skip
!byte $00 ;data1
!byte $40
!byte $A6 ;skip
!byte $00 ;data1
!byte $30
!byte $A7 ;skip
!byte $03 ;data1
!byte $10
!byte $00
!byte $00
!byte $10
!byte $AB ;skip
!byte $03 ;data1
!byte $80
!byte $00
!byte $00
!byte $00
!byte $e3 ;run ibpcaa
!byte $8E ;skip
!byte $40,chFFFFFFFFFFFFFFFF ;fill
!byte $e1,12



;,; *_006
;,; <- deps_itwasnicetoknowyou
; method 0 ( bytes ) -- 137 bytes (828 cumu)
; method 1 ( ibpc0 bytes ) -- 175 bytes (866 cumu)
; method 2 ( bytes ) -- 137 bytes (828 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 81 bytes (772 cumu)
; method 4 ( clrscr0 bytes ) -- 313 bytes (1004 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 360 bytes (1051 cumu)
; method 6 ( clrscr0 bytes ) -- 313 bytes (1004 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 250 bytes (941 cumu)
; method 8 ( clrscr1 bytes ) -- 323 bytes (1014 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 370 bytes (1061 cumu)
; method 10 ( clrscr1 bytes ) -- 323 bytes (1014 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 260 bytes (951 cumu)
; method 12 ( clrscr2 bytes ) -- 333 bytes (1024 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 380 bytes (1071 cumu)
; method 14 ( clrscr2 bytes ) -- 333 bytes (1024 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 270 bytes (961 cumu)
; method 16 ( clrscr3 bytes ) -- 343 bytes (1034 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 390 bytes (1081 cumu)
; method 18 ( clrscr3 bytes ) -- 343 bytes (1034 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 280 bytes (971 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 430
;,; <- chFFFFFFFFFFFF0000 ; 5
;,; <- chFCFCFCFCFCFCFCFC ; 12
;,; <- ch0000000000000000 ; 28
;,; <- ch3F3F3F3F3F3F3F3F ; 11
;,; <- chFEFCF8F0E0C08000 ; 1
;,; <- ch7F3F1F0F07030100 ; 4
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- ch000103070F1F3F7F ; 2
;,; <- ch0000F0FCFCF00000 ; 2
;,; <- ch0000183C3C180000 ; 1
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch0000FFFFFFFFFFFF ; 5
; total unique chars in pic: 13 (worst case req 104 bytes)
!byte $DA,$3A ;addr
!byte $40,$03 ;fill
!byte $94 ;skip
!byte $41,$03 ;fill
!byte $95 ;skip
!byte $40,$03 ;fill
!byte $95 ;skip
!byte $40,$03 ;fill
!byte $95 ;skip
!byte $40,$03 ;fill
!byte $96 ;skip
!byte $e2,1;mode4
!byte $00 ;data4
!byte $33
!byte $96 ;skip
!byte $00 ;data4
!byte $33
!byte $DB,$2B ;addr
!byte $00 ;data4
!byte $33
!byte $AA ;skip
!byte $41,$03 ;fill
!byte $94 ;skip
!byte $41,$03 ;fill
!byte $94 ;skip
!byte $40,$03 ;fill
!byte $94 ;skip
!byte $41,$03 ;fill
!byte $CE,$51 ;addr
!byte $e2,$ff;mode1
!byte $06 ;data1
!byte $60
!byte $00
!byte $00
!byte $F0
!byte $00
!byte $00
!byte $60
!byte $A8 ;skip
!byte $09 ;data1
!byte $40
!byte $00
!byte $00
!byte $A0
!byte $00
!byte $02
!byte $50
!byte $00
!byte $00
!byte $90
!byte $90 ;skip
!byte $06 ;data1
!byte $00
!byte $00
!byte $00
!byte $C0
!byte $00
!byte $00
!byte $40
!byte $CF,$A5 ;addr
!byte $03 ;data1
!byte $80
!byte $00
!byte $00
!byte $00
!byte $e3 ;run ibpcaa
!byte $e1,12



;,; *_007
;,; <- deps_itwasnicetoknowyou
; method 0 ( bytes ) -- 140 bytes (912 cumu)
; method 1 ( ibpc0 bytes ) -- 180 bytes (952 cumu)
; method 2 ( bytes ) -- 140 bytes (912 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 89 bytes (861 cumu)
; method 4 ( clrscr0 bytes ) -- 293 bytes (1065 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 325 bytes (1097 cumu)
; method 6 ( clrscr0 bytes ) -- 293 bytes (1065 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 237 bytes (1009 cumu)
; method 8 ( clrscr1 bytes ) -- 294 bytes (1066 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 326 bytes (1098 cumu)
; method 10 ( clrscr1 bytes ) -- 294 bytes (1066 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 238 bytes (1010 cumu)
; method 12 ( clrscr2 bytes ) -- 314 bytes (1086 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 361 bytes (1133 cumu)
; method 14 ( clrscr2 bytes ) -- 314 bytes (1086 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 273 bytes (1045 cumu)
; method 16 ( clrscr3 bytes ) -- 315 bytes (1087 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 362 bytes (1134 cumu)
; method 18 ( clrscr3 bytes ) -- 315 bytes (1087 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 274 bytes (1046 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 452
;,; <- chFFFFFFFFFFFF0000 ; 8
;,; <- chFCFCFCFCFCFCFCFC ; 10
;,; <- ch0000000000000000 ; 13
;,; <- ch3C3C3C3C3C3C3C3C ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 9
;,; <- ch0000FFFFFFFFFFFF ; 9
;,; <- ch7F3F1F0F07030100 ; 1
; total unique chars in pic: 8 (worst case req 64 bytes)
!byte $DA,$38 ;addr
!byte $e2,1;mode4
!byte $02 ;data4
!byte $11
!byte $11
!byte $31
!byte $91 ;skip
!byte $02 ;data4
!byte $11
!byte $11
!byte $31
!byte $93 ;skip
!byte $01 ;data4
!byte $11
!byte $31
!byte $93 ;skip
!byte $01 ;data4
!byte $11
!byte $11
!byte $93 ;skip
!byte $01 ;data4
!byte $11
!byte $11
!byte $94 ;skip
!byte $01 ;data4
!byte $11
!byte $31
!byte $94 ;skip
!byte $00 ;data4
!byte $11
!byte $95 ;skip
!byte $00 ;data4
!byte $11
!byte $93 ;skip
!byte $01 ;data4
!byte $11
!byte $11
!byte $95 ;skip
!byte $00 ;data4
!byte $31
!byte $94 ;skip
!byte $00 ;data4
!byte $11
!byte $95 ;skip
!byte $00 ;data4
!byte $11
!byte $CE,$3A ;addr
!byte $e2,$ff;mode1
!byte $06 ;data1
!byte $00
!byte $00
!byte $01
!byte $40
!byte $00
!byte $00
!byte $00
!byte $90 ;skip
!byte $03 ;data1
!byte $40
!byte $00
!byte $00
!byte $00
!byte $A6 ;skip
!byte $06 ;data1
!byte $00
!byte $00
!byte $00
!byte $10
!byte $00
!byte $00
!byte $10
!byte $90 ;skip
!byte $03 ;data1
!byte $80
!byte $00
!byte $00
!byte $00
!byte $CF,$8D ;addr
!byte $03 ;data1
!byte $80
!byte $00
!byte $00
!byte $00
!byte $e3 ;run ibpcaa
!byte $e1,12



;,; *_008
;,; <- deps_itwasnicetoknowyou
; method 0 ( bytes ) -- 82 bytes (943 cumu)
; method 1 ( ibpc0 bytes ) -- 113 bytes (974 cumu)
; method 2 ( bytes ) -- 82 bytes (943 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 73 bytes (934 cumu)
; method 4 ( clrscr0 bytes ) -- 228 bytes (1089 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 238 bytes (1099 cumu)
; method 6 ( clrscr0 bytes ) -- 228 bytes (1089 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 214 bytes (1075 cumu)
; method 8 ( clrscr1 bytes ) -- 230 bytes (1091 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 240 bytes (1101 cumu)
; method 10 ( clrscr1 bytes ) -- 230 bytes (1091 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 216 bytes (1077 cumu)
; method 12 ( clrscr2 bytes ) -- 245 bytes (1106 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 296 bytes (1157 cumu)
; method 14 ( clrscr2 bytes ) -- 245 bytes (1106 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 272 bytes (1133 cumu)
; method 16 ( clrscr3 bytes ) -- 247 bytes (1108 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 298 bytes (1159 cumu)
; method 18 ( clrscr3 bytes ) -- 247 bytes (1108 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 274 bytes (1135 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 494
;,; <- chFFFFFFFFFFFF0000 ; 2
;,; <- chFCFCFCFCFCFCFCFC ; 2
;,; <- ch0000000000000000 ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 2
;,; <- ch0000FFFFFFFFFFFF ; 2
; total unique chars in pic: 6 (worst case req 48 bytes)
!byte $DA,$DF ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $33
!byte $95 ;skip
!byte $03 ;data4
!byte $33
!byte $11
!byte $11
!byte $11
!byte $8F ;skip
!byte $03 ;data4
!byte $33
!byte $11
!byte $11
!byte $11
!byte $95 ;skip
!byte $00 ;data4
!byte $11
!byte $95 ;skip
!byte $00 ;data4
!byte $31
!byte $93 ;skip
!byte $01 ;data4
!byte $11
!byte $31
!byte $93 ;skip
!byte $01 ;data4
!byte $11
!byte $31
!byte $93 ;skip
!byte $01 ;data4
!byte $11
!byte $31
!byte $94 ;skip
!byte $00 ;data4
!byte $11
!byte $95 ;skip
!byte $00 ;data4
!byte $11
!byte $CE,$51 ;addr
!byte $e2,$ff;mode1
!byte $00 ;data1
!byte $00
!byte $A8 ;skip
!byte $00 ;data1
!byte $00
!byte $A8 ;skip
!byte $00 ;data1
!byte $00
!byte $A9 ;skip
!byte $06 ;data1
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $80
!byte $A6 ;skip
!byte $03 ;data1
!byte $00
!byte $00
!byte $00
!byte $00
!byte $A7 ;skip
!byte $00 ;data1
!byte $00
!byte $e3 ;run ibpcaa
!byte $e1,12



;,; *_009
;,; <- deps_itwasnicetoknowyou
; method 0 ( bytes ) -- 52 bytes (986 cumu)
; method 1 ( ibpc0 bytes ) -- 62 bytes (996 cumu)
; method 2 ( bytes ) -- 52 bytes (986 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 56 bytes (990 cumu)
; method 4 ( clrscr0 bytes ) -- 197 bytes (1131 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 197 bytes (1131 cumu)
; method 6 ( clrscr0 bytes ) -- 197 bytes (1131 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 198 bytes (1132 cumu)
; method 8 ( clrscr1 bytes ) -- 217 bytes (1151 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 217 bytes (1151 cumu)
; method 10 ( clrscr1 bytes ) -- 217 bytes (1151 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 218 bytes (1152 cumu)
; method 12 ( clrscr2 bytes ) -- 215 bytes (1149 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 265 bytes (1199 cumu)
; method 14 ( clrscr2 bytes ) -- 215 bytes (1149 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 266 bytes (1200 cumu)
; method 16 ( clrscr3 bytes ) -- 235 bytes (1169 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 285 bytes (1219 cumu)
; method 18 ( clrscr3 bytes ) -- 235 bytes (1169 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 286 bytes (1220 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 504
; total unique chars in pic: 1 (worst case req 8 bytes)
!byte $DA,$38 ;addr
!byte $43,$03 ;fill
!byte $92 ;skip
!byte $43,$03 ;fill
!byte $92 ;skip
!byte $43,$03 ;fill
!byte $92 ;skip
!byte $e2,1;mode4
!byte $02 ;data4
!byte $13
!byte $31
!byte $33
!byte $91 ;skip
!byte $02 ;data4
!byte $13
!byte $31
!byte $33
!byte $91 ;skip
!byte $44,$03 ;fill
!byte $91 ;skip
!byte $01 ;data4
!byte $33
!byte $33
!byte $94 ;skip
!byte $01 ;data4
!byte $33
!byte $13
!byte $93 ;skip
!byte $00 ;data4
!byte $33
!byte $95 ;skip
!byte $00 ;data4
!byte $33
!byte $95 ;skip
!byte $00 ;data4
!byte $33
!byte $95 ;skip
!byte $00 ;data4
!byte $33
!byte $CE,$FD ;addr
!byte $6F,chFFFFFFFFFFFFFFFF ;fill
!byte $AD ;skip
!byte $6F,chFFFFFFFFFFFFFFFF ;fill
!byte $e1,12



;,; *_010
;,; <- deps_itwasnicetoknowyou
; method 0 ( bytes ) -- 42 bytes (1028 cumu)
; method 1 ( ibpc0 bytes ) -- 42 bytes (1028 cumu)
; method 2 ( bytes ) -- 42 bytes (1028 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 43 bytes (1029 cumu)
; method 4 ( clrscr0 bytes ) -- 185 bytes (1171 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 185 bytes (1171 cumu)
; method 6 ( clrscr0 bytes ) -- 185 bytes (1171 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 186 bytes (1172 cumu)
; method 8 ( clrscr1 bytes ) -- 218 bytes (1204 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 218 bytes (1204 cumu)
; method 10 ( clrscr1 bytes ) -- 218 bytes (1204 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 219 bytes (1205 cumu)
; method 12 ( clrscr2 bytes ) -- 203 bytes (1189 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 253 bytes (1239 cumu)
; method 14 ( clrscr2 bytes ) -- 203 bytes (1189 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 254 bytes (1240 cumu)
; method 16 ( clrscr3 bytes ) -- 236 bytes (1222 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 286 bytes (1272 cumu)
; method 18 ( clrscr3 bytes ) -- 236 bytes (1222 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 287 bytes (1273 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 504
; total unique chars in pic: 1 (worst case req 8 bytes)
!byte $DA,$81 ;addr
!byte $40,$03 ;fill
!byte $95 ;skip
!byte $40,$03 ;fill
!byte $B0 ;skip
!byte $00 ;data4
!byte $33
!byte $95 ;skip
!byte $00 ;data4
!byte $33
!byte $94 ;skip
!byte $01 ;data4
!byte $33
!byte $33
!byte $93 ;skip
!byte $01 ;data4
!byte $33
!byte $31
!byte $93 ;skip
!byte $01 ;data4
!byte $33
!byte $33
!byte $93 ;skip
!byte $01 ;data4
!byte $33
!byte $33
!byte $93 ;skip
!byte $01 ;data4
!byte $33
!byte $33
!byte $93 ;skip
!byte $00 ;data4
!byte $13
!byte $95 ;skip
!byte $00 ;data4
!byte $13
!byte $AE ;skip
!byte $00 ;data4
!byte $33
!byte $e1,12



;,; *_011
;,; <- deps_itwasnicetoknowyou
; method 0 ( bytes ) -- 14 bytes (1042 cumu)
; method 1 ( ibpc0 bytes ) -- 14 bytes (1042 cumu)
; method 2 ( bytes ) -- 14 bytes (1042 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 15 bytes (1043 cumu)
; method 4 ( clrscr0 bytes ) -- 183 bytes (1211 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 183 bytes (1211 cumu)
; method 6 ( clrscr0 bytes ) -- 183 bytes (1211 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 184 bytes (1212 cumu)
; method 8 ( clrscr1 bytes ) -- 210 bytes (1238 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 210 bytes (1238 cumu)
; method 10 ( clrscr1 bytes ) -- 210 bytes (1238 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 211 bytes (1239 cumu)
; method 12 ( clrscr2 bytes ) -- 201 bytes (1229 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 251 bytes (1279 cumu)
; method 14 ( clrscr2 bytes ) -- 201 bytes (1229 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 252 bytes (1280 cumu)
; method 16 ( clrscr3 bytes ) -- 228 bytes (1256 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 278 bytes (1306 cumu)
; method 18 ( clrscr3 bytes ) -- 228 bytes (1256 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 279 bytes (1307 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 504
; total unique chars in pic: 1 (worst case req 8 bytes)
!byte $DB,$15 ;addr
!byte $00 ;data4
!byte $33
!byte $DB,$74 ;addr
!byte $00 ;data4
!byte $33
!byte $95 ;skip
!byte $00 ;data4
!byte $33
!byte $95 ;skip
!byte $00 ;data4
!byte $33

;!byte $e1,12
;;,; *_012

;,; <- deps_itwasnicetoknowyou
; method 0 ( bytes ) -- 107 bytes (1149 cumu)
; method 1 ( ibpc0 bytes ) -- 111 bytes (1153 cumu)
; method 2 ( bytes ) -- 107 bytes (1149 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 116 bytes (1158 cumu)
; method 4 ( clrscr0 bytes ) -- 258 bytes (1300 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 262 bytes (1304 cumu)
; method 6 ( clrscr0 bytes ) -- 258 bytes (1300 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 267 bytes (1309 cumu)
; method 8 ( clrscr1 bytes ) -- 279 bytes (1321 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 283 bytes (1325 cumu)
; method 10 ( clrscr1 bytes ) -- 279 bytes (1321 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 288 bytes (1330 cumu)
; method 12 ( clrscr2 bytes ) -- 272 bytes (1314 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 322 bytes (1364 cumu)
; method 14 ( clrscr2 bytes ) -- 272 bytes (1314 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 327 bytes (1369 cumu)
; method 16 ( clrscr3 bytes ) -- 293 bytes (1335 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 343 bytes (1385 cumu)
; method 18 ( clrscr3 bytes ) -- 293 bytes (1335 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 348 bytes (1390 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 420
;,; <- ch0000000000000000 ; 9
;,; <- chFFFFFFFFFFFF0000 ; 14
;,; <- chFCFC303030303030 ; 4
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFCDCCCCCCCCCCC ; 7
;,; <- chFCFCE0C0C0C0C0C0 ; 3
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- ch3030303030303030 ; 4
;,; <- ch303030303030FCFC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- ch0000000000303030 ; 1
;,; <- ch5555555555555555 ; 23
; total unique chars in pic: 18 (worst case req 144 bytes)
!byte $DB,$98 ;addr
!byte $01 ;data4
!byte $11
!byte $10
!byte $8D ;skip
!byte $1D ;data4
!byte $01
!byte $11
!byte $01
!byte $11
!byte $10
!byte $11
!byte $10
!byte $11
!byte $01
!byte $11
!byte $10
!byte $11
!byte $01
!byte $11
!byte $11
!byte $11
!byte $10
!byte $11
!byte $10
!byte $11
!byte $01
!byte $11
!byte $10
!byte $11
!byte $01
!byte $11
!byte $11
!byte $AA
!byte $AA
!byte $B9
!byte $DB,$E5 ;addr
!byte $4A,$0B ;fill
!byte $02 ;data4
!byte $A9
!byte $AA
!byte $AA
!byte $CF,$98 ;addr
!byte $42,ch0000000000000000 ;fill
!byte $4C,chFFFFFFFFFFFF0000 ;fill
!byte $43,ch0000000000000000 ;fill
!byte $e2,0;mode8
!byte $30 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFCFC303030303030
!byte chFCFC303030303030
!byte chFFFFFFFFFFFFFFFF
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCDCCCCCCCCCCC
!byte chFCFC303030303030
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte chFFFFFFFFFFFFFFFF
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chFFFFFFFFFFFFFFFF
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chC6C6C6C6C6C6C6C6
!byte chFFFFFFFFFFFFFFFF
!byte chCCCCCCCCCCECFCFC
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte ch3030303030303030
!byte ch303030303030FCFC
!byte ch3030303030303030
!byte chFFFFFFFFFFFFFFFF
!byte chD6D6D6D6D6F6FEFE
!byte chFCFCDCCCCCCCCCCC
!byte chFCFC1C0C0C1CFCFC
!byte chFFFFFFFFFFFFFFFF
!byte chCCCCCCCCCCCCCCCC
!byte ch303030303030FCFC
!byte chC0C0C0C0C0E0FCFC
!byte chFCFCE0C0C0E0FCFC
!byte chFFFFFFFFFFFFFFFF
!byte ch3030303030303030
!byte chCCCCCCCCCCECFCFC
!byte chFFFFFFFFFFFFFFFF
!byte chF0F8CCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte chD6D6D6D6D6F6FEFE
!byte chFFFFFFFFFFFFFFFF
!byte ch3030303030303030
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCECFCFC
!byte ch0000000000303030
!byte $55,ch5555555555555555 ;fill
!byte $e1,48+12

; total compressed size 1149 bytes
