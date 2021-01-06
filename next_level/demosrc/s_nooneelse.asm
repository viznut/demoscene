;,; lyrics_nooneelse .withinpagefrom=lyrics
;,; <- lyrics

	!byte $22,$20,$66		; NO
	!byte $4a,$22			; ONE
	!byte $33,$37,$34		; ELSE
	!byte $31,$44			; IS
	!byte $21,$43,$29,$1d		; YET
	!byte $2a,$53			; REA
	!byte $19,$2d,$51,$09		; DY
	!byte $29,$1d,$a6		; TO
	!byte $a1			; E
	!byte $26,$a0,$87,$16		; VOLVE
	!byte $0f

;,; deps_nooneelse
;,; <- ibpcaablocks
;,; <- lyrics_nooneelse

;,; SC60_000
;,; <- deps_nooneelse
;,; <- streamvars
;,; <- player_ivars
!src "demosrc/smac.inc"

+s8bpc
+sAddr chptr+2
!byte $02
!byte shap_misery-songdata
!byte melo_misery-songdata;muteseq-songdata
!byte voic_misery-songdata;muteseq-songdata
+sAddr nextlyrictosing
!byte $00,lyrics_nooneelse-lyrics

; method 4 ( clrscr0 bytes ) -- 513 bytes (513 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 554 bytes (554 cumu)
; method 6 ( clrscr0 bytes ) -- 513 bytes (513 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 395 bytes (395 cumu)
; method 8 ( clrscr1 bytes ) -- 520 bytes (520 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 561 bytes (561 cumu)
; method 10 ( clrscr1 bytes ) -- 520 bytes (520 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 402 bytes (402 cumu)
; method 12 ( clrscr2 bytes ) -- 519 bytes (519 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 548 bytes (548 cumu)
; method 14 ( clrscr2 bytes ) -- 519 bytes (519 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 389 bytes (389 cumu)
; method 16 ( clrscr3 bytes ) -- 526 bytes (526 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 555 bytes (555 cumu)
; method 18 ( clrscr3 bytes ) -- 526 bytes (526 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 396 bytes (396 cumu)
; METHOD 15 CHOSEN
!byte $e4,5,chFFFFFFFFFFFFFFFF ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 152
;,; <- chFFFFFFFFFFFF0000 ; 7
;,; <- chFCFCFCFCFCFCFCFC ; 25
;,; <- ch0000000000000000 ; 220
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFCFCE0C0C0C0C0C0 ; 9
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 7
;,; <- chFCFCE0C0C0E0FCFC ; 7
;,; <- ch3F3F3F3F3F3F3F3F ; 13
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- chFCFC303030303030 ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch303030303030FCFC ; 1
;,; <- ch0080C0E0F0F8FCFE ; 7
;,; <- ch0000FFFFFFFFFFFF ; 10
;,; <- ch3030303030303030 ; 4
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3C3C3C3C18180000 ; 1
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- ch000103070F1F3F7F ; 2
;,; <- ch00000F3F3F0F0000 ; 1
;,; <- ch0000FFFFFFFF0000 ; 2
;,; <- chCCCCCCCC78783030 ; 2
; total unique chars in pic: 27 (worst case req 216 bytes)
!byte $DA,$00 ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $60
!byte $DA,$01 ;addr
!byte $45,$06 ;fill
!byte $03 ;data4
!byte $55
!byte $66
!byte $66
!byte $66
!byte $47,$00 ;fill
!byte $07 ;data4
!byte $66
!byte $66
!byte $66
!byte $55
!byte $55
!byte $66
!byte $66
!byte $16
!byte $DA,$28 ;addr
!byte $46,$01 ;fill
!byte $07 ;data4
!byte $60
!byte $66
!byte $66
!byte $55
!byte $55
!byte $65
!byte $66
!byte $66
!byte $46,$01 ;fill
!byte $07 ;data4
!byte $60
!byte $66
!byte $66
!byte $55
!byte $55
!byte $55
!byte $66
!byte $66
!byte $46,$01 ;fill
!byte $07 ;data4
!byte $60
!byte $66
!byte $66
!byte $55
!byte $55
!byte $55
!byte $66
!byte $66
!byte $46,$01 ;fill
!byte $08 ;data4
!byte $50
!byte $66
!byte $66
!byte $56
!byte $55
!byte $55
!byte $66
!byte $66
!byte $15
!byte $DA,$89 ;addr
!byte $45,$01 ;fill
!byte $08 ;data4
!byte $50
!byte $66
!byte $66
!byte $56
!byte $55
!byte $65
!byte $66
!byte $66
!byte $16
!byte $DA,$A1 ;addr
!byte $45,$01 ;fill
!byte $1A ;data4
!byte $50
!byte $65
!byte $66
!byte $66
!byte $52
!byte $65
!byte $66
!byte $65
!byte $66
!byte $11
!byte $11
!byte $11
!byte $20
!byte $65
!byte $66
!byte $66
!byte $22
!byte $66
!byte $66
!byte $65
!byte $66
!byte $11
!byte $11
!byte $11
!byte $20
!byte $66
!byte $16
!byte $DA,$DD ;addr
!byte $46,$01 ;fill
!byte $07 ;data4
!byte $25
!byte $55
!byte $15
!byte $11
!byte $11
!byte $01
!byte $52
!byte $55
!byte $46,$01 ;fill
!byte $05 ;data4
!byte $25
!byte $55
!byte $15
!byte $11
!byte $11
!byte $01
!byte $86 ;skip
!byte $00 ;data4
!byte $22
!byte $87 ;skip
!byte $03 ;data4
!byte $11
!byte $11
!byte $11
!byte $50
!byte $85 ;skip
!byte $00 ;data4
!byte $22
!byte $86 ;skip
!byte $45,$01 ;fill
!byte $00 ;data4
!byte $50
!byte $86 ;skip
!byte $00 ;data4
!byte $52
!byte $85 ;skip
!byte $45,$01 ;fill
!byte $00 ;data4
!byte $50
!byte $8E ;skip
!byte $45,$01 ;fill
!byte $00 ;data4
!byte $50
!byte $8E ;skip
!byte $45,$01 ;fill
!byte $00 ;data4
!byte $50
!byte $8E ;skip
!byte $45,$01 ;fill
!byte $00 ;data4
!byte $50
!byte $8E ;skip
!byte $45,$01 ;fill
!byte $00 ;data4
!byte $50
!byte $8E ;skip
!byte $45,$01 ;fill
!byte $00 ;data4
!byte $50
!byte $8F ;skip
!byte $0B ;data4
!byte $11
!byte $11
!byte $11
!byte $50
!byte $55
!byte $55
!byte $00
!byte $00
!byte $50
!byte $55
!byte $55
!byte $05
!byte $DB,$F1 ;addr
!byte $46,$00 ;fill
!byte $CE,$28 ;addr
!byte $e2,$ff;mode1
!byte $38 ;data1
!byte $C8
!byte $01
!byte $E0
!byte $C8
!byte $03
!byte $F0
!byte $FF
!byte $07
!byte $F8
!byte $84
!byte $0F
!byte $F8
!byte $84
!byte $1F
!byte $F8
!byte $7F
!byte $7F
!byte $F8
!byte $38
!byte $1F
!byte $F8
!byte $38
!byte $0F
!byte $E8
!byte $3F
!byte $07
!byte $EC
!byte $20
!byte $07
!byte $FC
!byte $20
!byte $07
!byte $FC
!byte $7F
!byte $07
!byte $FC
!byte $7C
!byte $07
!byte $F0
!byte $7C
!byte $07
!byte $80
!byte $7F
!byte $07
!byte $F0
!byte $40
!byte $07
!byte $F0
!byte $40
!byte $07
!byte $F0
!byte $7F
!byte $03
!byte $C0
!byte $7F
!byte $01
!byte $C0
!byte $e3 ;run ibpcaa
!byte $CE,$10 ;addr
!byte $e2,0;mode8
!byte $01 ;data8
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFF0000
!byte $97 ;skip
!byte $05 ;data8
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte $91 ;skip
!byte $05 ;data8
!byte chCCCCCCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte ch0000000000000000
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte $97 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $8F ;skip
!byte $06 ;data8
!byte chFCFCE0C0C0C0C0C0
!byte chC0C0C0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chFCFCE0C0C0C0C0C0
!byte $90 ;skip
!byte $06 ;data8
!byte chFCFCE0C0C0E0FCFC
!byte chC0C0C0C0C0E0FCFC
!byte chFCFC1C0C0C1CFCFC
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000000000
!byte ch303030303030FCFC
!byte chFCFC1C0C0C1CFCFC
!byte $97 ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $93 ;skip
!byte $02 ;data8
!byte chCCCCCCCCCCECFCFC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFC303030303030
!byte $94 ;skip
!byte $02 ;data8
!byte ch3030303030303030
!byte chFCFCE0C0C0E0FCFC
!byte ch3030303030303030
!byte $97 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $91 ;skip
!byte $04 ;data8
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chF0F8CCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte $92 ;skip
!byte $04 ;data8
!byte chF0F8CCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte ch3030303030303030
!byte $97 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $94 ;skip
!byte $01 ;data8
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte $95 ;skip
!byte $01 ;data8
!byte ch3030303030303030
!byte chCCCCCCCCCCECFCFC
!byte $97 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $90 ;skip
!byte $05 ;data8
!byte chFCFCE0C0C0C0C0C0
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chC0C0C0C0C0C0C0C0
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte $91 ;skip
!byte $05 ;data8
!byte chFCFCE0C0C0E0FCFC
!byte chCCCCCCCC78783030
!byte chCCCCCCCCCCECFCFC
!byte chC0C0C0C0C0E0FCFC
!byte chCCCCCCCC78783030
!byte chFCFCE0C0C0E0FCFC
!byte $97 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $9C ;skip
!byte $04 ;data8
!byte ch0080C0E0F0F8FCFE
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $85 ;skip
!byte $45,ch0000FFFFFFFFFFFF ;fill
!byte $e1,24



;,; *_001
;,; <- deps_nooneelse
; method 0 ( bytes ) -- 105 bytes (494 cumu)
; method 1 ( ibpc0 bytes ) -- 147 bytes (536 cumu)
; method 2 ( bytes ) -- 105 bytes (494 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 116 bytes (505 cumu)
; method 4 ( clrscr0 bytes ) -- 523 bytes (912 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 546 bytes (935 cumu)
; method 6 ( clrscr0 bytes ) -- 523 bytes (912 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 412 bytes (801 cumu)
; method 8 ( clrscr1 bytes ) -- 530 bytes (919 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 553 bytes (942 cumu)
; method 10 ( clrscr1 bytes ) -- 530 bytes (919 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 419 bytes (808 cumu)
; method 12 ( clrscr2 bytes ) -- 521 bytes (910 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 540 bytes (929 cumu)
; method 14 ( clrscr2 bytes ) -- 521 bytes (910 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 406 bytes (795 cumu)
; method 16 ( clrscr3 bytes ) -- 528 bytes (917 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 547 bytes (936 cumu)
; method 18 ( clrscr3 bytes ) -- 528 bytes (917 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 413 bytes (802 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 177
;,; <- chFFFFFFFFFFFF0000 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 29
;,; <- ch0000000000000000 ; 203
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFCFCE0C0C0C0C0C0 ; 9
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 2
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 7
;,; <- chFCFCE0C0C0E0FCFC ; 7
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- chFCFC303030303030 ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch303030303030FCFC ; 1
;,; <- ch0080C0E0F0F8FCFE ; 5
;,; <- ch3030303030303030 ; 4
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3F3F3F3F3F3F3F3F ; 8
;,; <- ch3C3C3C3C18180000 ; 1
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- ch000103070F1F3F7F ; 3
;,; <- ch00000F3F3F0F0000 ; 1
;,; <- ch0000FFFFFFFF0000 ; 3
;,; <- chCCCCCCCC78783030 ; 2
;,; <- ch0000FFFFFFFFFFFF ; 7
; total unique chars in pic: 27 (worst case req 216 bytes)
!byte $CE,$64 ;addr
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $87 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $8C ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte $87 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $8A ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte $88 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $89 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte $88 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $8A ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte $88 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $8C ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte $83 ;skip
!byte $04 ;data8
!byte ch000018183C3C3C3C
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $8D ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $83 ;skip
!byte $05 ;data8
!byte ch3C3C3C3C18180000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $91 ;skip
!byte $01 ;data8
!byte ch00000F3F3F0F0000
!byte ch0000FFFFFFFF0000
!byte $B0 ;skip
!byte $01 ;data8
!byte ch000103070F1F3F7F
!byte chFFFFFFFFFFFFFFFF
!byte $8E ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte $83 ;skip
!byte $02 ;data8
!byte ch000103070F1F3F7F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $8F ;skip
!byte $06 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte $91 ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $e1,24



;,; *_002
;,; <- deps_nooneelse
; method 0 ( bytes ) -- 102 bytes (596 cumu)
; method 1 ( ibpc0 bytes ) -- 144 bytes (638 cumu)
; method 2 ( bytes ) -- 102 bytes (596 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 109 bytes (603 cumu)
; method 4 ( clrscr0 bytes ) -- 529 bytes (1023 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 562 bytes (1056 cumu)
; method 6 ( clrscr0 bytes ) -- 529 bytes (1023 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 393 bytes (887 cumu)
; method 8 ( clrscr1 bytes ) -- 536 bytes (1030 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 569 bytes (1063 cumu)
; method 10 ( clrscr1 bytes ) -- 536 bytes (1030 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 400 bytes (894 cumu)
; method 12 ( clrscr2 bytes ) -- 539 bytes (1033 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 568 bytes (1062 cumu)
; method 14 ( clrscr2 bytes ) -- 539 bytes (1033 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 399 bytes (893 cumu)
; method 16 ( clrscr3 bytes ) -- 546 bytes (1040 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 575 bytes (1069 cumu)
; method 18 ( clrscr3 bytes ) -- 546 bytes (1040 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 406 bytes (900 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 186
;,; <- chFFFFFFFFFFFF0000 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 31
;,; <- ch0000000000000000 ; 185
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFCFCE0C0C0C0C0C0 ; 9
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 7
;,; <- chFCFCE0C0C0E0FCFC ; 7
;,; <- ch3F3F3F3F3F3F3F3F ; 16
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- chFCFC303030303030 ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch303030303030FCFC ; 1
;,; <- ch0080C0E0F0F8FCFE ; 4
;,; <- ch3030303030303030 ; 4
;,; <- ch000018183C3C3C3C ; 2
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- ch00000F3F3F0F0000 ; 1
;,; <- ch0000FFFFFFFF0000 ; 3
;,; <- ch0000F0FCFCF00000 ; 1
;,; <- ch000103070F1F3F7F ; 2
;,; <- chCCCCCCCC78783030 ; 2
;,; <- ch0000FFFFFFFFFFFF ; 7
; total unique chars in pic: 28 (worst case req 224 bytes)
!byte $DA,$E4 ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $55
!byte $95 ;skip
!byte $00 ;data4
!byte $55
!byte $CE,$54 ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte $96 ;skip
!byte $00 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte $8E ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $86 ;skip
!byte $00 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte $8D ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte $86 ;skip
!byte $00 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte $8D ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte $86 ;skip
!byte $00 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte $8D ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte $86 ;skip
!byte $00 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte $8E ;skip
!byte $09 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch000018183C3C3C3C
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch000018183C3C3C3C
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte $8F ;skip
!byte $07 ;data8
!byte ch3C3C3C3C18180000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3C3C3C3C18180000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $00 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte $90 ;skip
!byte $06 ;data8
!byte ch00000F3F3F0F0000
!byte ch0000FFFFFFFF0000
!byte ch0000FFFFFFFF0000
!byte ch0000FFFFFFFF0000
!byte ch0000F0FCFCF00000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $A6 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte $96 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte $96 ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $e1,24



;,; *_003
;,; <- deps_nooneelse
; method 0 ( bytes ) -- 81 bytes (677 cumu)
; method 1 ( ibpc0 bytes ) -- 101 bytes (697 cumu)
; method 2 ( bytes ) -- 81 bytes (677 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 96 bytes (692 cumu)
; method 4 ( clrscr0 bytes ) -- 528 bytes (1124 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 557 bytes (1153 cumu)
; method 6 ( clrscr0 bytes ) -- 528 bytes (1124 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 411 bytes (1007 cumu)
; method 8 ( clrscr1 bytes ) -- 535 bytes (1131 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 564 bytes (1160 cumu)
; method 10 ( clrscr1 bytes ) -- 535 bytes (1131 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 418 bytes (1014 cumu)
; method 12 ( clrscr2 bytes ) -- 529 bytes (1125 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 551 bytes (1147 cumu)
; method 14 ( clrscr2 bytes ) -- 529 bytes (1125 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 405 bytes (1001 cumu)
; method 16 ( clrscr3 bytes ) -- 536 bytes (1132 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 558 bytes (1154 cumu)
; method 18 ( clrscr3 bytes ) -- 536 bytes (1132 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 412 bytes (1008 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 177
;,; <- chFFFFFFFFFFFF0000 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 24
;,; <- ch0000000000000000 ; 202
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFCFCE0C0C0C0C0C0 ; 9
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 2
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 7
;,; <- chFCFCE0C0C0E0FCFC ; 7
;,; <- ch3F3F3F3F3F3F3F3F ; 14
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- chFCFC303030303030 ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch303030303030FCFC ; 1
;,; <- ch0080C0E0F0F8FCFE ; 5
;,; <- ch3030303030303030 ; 4
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch000103070F1F3F7F ; 3
;,; <- ch3C3C3C3C18180000 ; 1
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- ch0000FFFFFFFF0000 ; 3
;,; <- ch0000F0FCFCF00000 ; 1
;,; <- chCCCCCCCC78783030 ; 2
;,; <- ch0000FFFFFFFFFFFF ; 7
; total unique chars in pic: 27 (worst case req 216 bytes)
!byte $CE,$64 ;addr
!byte $00 ;data8
!byte chFEFCF8F0E0C08000
!byte $96 ;skip
!byte $00,ch0000000000000000 ;fill
!byte $86 ;skip
!byte $00 ;data8
!byte ch7F3F1F0F07030100
!byte $8E ;skip
!byte $47,ch0000000000000000 ;fill
!byte $00 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte $8D ;skip
!byte $47,ch0000000000000000 ;fill
!byte $00 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte $8D ;skip
!byte $47,ch0000000000000000 ;fill
!byte $00 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte $8C ;skip
!byte $04 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch000018183C3C3C3C
!byte $41,ch0000000000000000 ;fill
!byte $01 ;data8
!byte ch0000000000000000
!byte ch000103070F1F3F7F
!byte $8D ;skip
!byte $04 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3C3C3C3C18180000
!byte $41,ch0000000000000000 ;fill
!byte $8F ;skip
!byte $01 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte $95 ;skip
!byte $01 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte $95 ;skip
!byte $01 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte $96 ;skip
!byte $00 ;data8
!byte ch0080C0E0F0F8FCFE
!byte $96 ;skip
!byte $06 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch0000FFFFFFFF0000
!byte ch0000FFFFFFFF0000
!byte ch0000FFFFFFFF0000
!byte ch0000F0FCFCF00000
!byte ch0000000000000000
!byte ch0000000000000000
!byte $AF ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $94 ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte ch000103070F1F3F7F
!byte $95 ;skip
!byte $00 ;data8
!byte ch000103070F1F3F7F
!byte $e1,24



;,; *_004
;,; <- deps_nooneelse
; method 0 ( bytes ) -- 145 bytes (822 cumu)
; method 1 ( ibpc0 bytes ) -- 172 bytes (849 cumu)
; method 2 ( bytes ) -- 145 bytes (822 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 125 bytes (802 cumu)
; method 4 ( clrscr0 bytes ) -- 521 bytes (1198 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 559 bytes (1236 cumu)
; method 6 ( clrscr0 bytes ) -- 521 bytes (1198 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 395 bytes (1072 cumu)
; method 8 ( clrscr1 bytes ) -- 534 bytes (1211 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 572 bytes (1249 cumu)
; method 10 ( clrscr1 bytes ) -- 534 bytes (1211 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 408 bytes (1085 cumu)
; method 12 ( clrscr2 bytes ) -- 531 bytes (1208 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 553 bytes (1230 cumu)
; method 14 ( clrscr2 bytes ) -- 531 bytes (1208 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 389 bytes (1066 cumu)
; method 16 ( clrscr3 bytes ) -- 544 bytes (1221 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 566 bytes (1243 cumu)
; method 18 ( clrscr3 bytes ) -- 544 bytes (1221 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 402 bytes (1079 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 152
;,; <- chFFFFFFFFFFFF0000 ; 7
;,; <- chFCFCFCFCFCFCFCFC ; 29
;,; <- ch0000000000000000 ; 220
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFCFCE0C0C0C0C0C0 ; 9
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 7
;,; <- chFCFCE0C0C0E0FCFC ; 7
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- chFCFC303030303030 ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch303030303030FCFC ; 1
;,; <- ch0080C0E0F0F8FCFE ; 4
;,; <- ch3F3F3F3F3F3F3F3F ; 9
;,; <- ch000103070F1F3F7F ; 5
;,; <- ch0000FFFFFFFFFFFF ; 10
;,; <- ch3030303030303030 ; 4
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3C3C3C3C18180000 ; 1
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- ch0000FFFFFFFF0000 ; 2
;,; <- ch0000F0FCFCF00000 ; 1
;,; <- chCCCCCCCC78783030 ; 2
; total unique chars in pic: 27 (worst case req 216 bytes)
!byte $DA,$B6 ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $11
!byte $A6 ;skip
!byte $02 ;data4
!byte $25
!byte $62
!byte $56
!byte $91 ;skip
!byte $02 ;data4
!byte $75
!byte $52
!byte $55
!byte $CE,$36 ;addr
!byte $e2,$ff;mode1
!byte $05 ;data1
!byte $F0
!byte $32
!byte $01
!byte $F8
!byte $3F
!byte $C3
!byte $9D ;skip
!byte $00 ;data1
!byte $88
!byte $90 ;skip
!byte $0D ;data1
!byte $8F
!byte $E1
!byte $FF
!byte $E7
!byte $01
!byte $FF
!byte $87
!byte $01
!byte $7F
!byte $07
!byte $E3
!byte $7E
!byte $04
!byte $03
!byte $95 ;skip
!byte $03 ;data1
!byte $FF
!byte $83
!byte $F8
!byte $FF
!byte $AC ;skip
!byte $00 ;data1
!byte $F0
!byte $A4 ;skip
!byte $03 ;data1
!byte $FE
!byte $08
!byte $00
!byte $FE
!byte $94 ;skip
!byte $00 ;data1
!byte $81
!byte $e3 ;run ibpcaa
!byte $CE,$30 ;addr
!byte $e2,0;mode8
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $96 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
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
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $96 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $96 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $96 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $96 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $A0 ;skip
!byte $00 ;data8
!byte ch000103070F1F3F7F
!byte $e1,24



;,; *_005
;,; <- deps_nooneelse
; method 0 ( bytes ) -- 209 bytes (1011 cumu)
; method 1 ( ibpc0 bytes ) -- 231 bytes (1033 cumu)
; method 2 ( bytes ) -- 209 bytes (1011 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 118 bytes (920 cumu)
; method 4 ( clrscr0 bytes ) -- 458 bytes (1260 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 502 bytes (1304 cumu)
; method 6 ( clrscr0 bytes ) -- 458 bytes (1260 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 381 bytes (1183 cumu)
; method 8 ( clrscr1 bytes ) -- 469 bytes (1271 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 513 bytes (1315 cumu)
; method 10 ( clrscr1 bytes ) -- 469 bytes (1271 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 392 bytes (1194 cumu)
; method 12 ( clrscr2 bytes ) -- 461 bytes (1263 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 495 bytes (1297 cumu)
; method 14 ( clrscr2 bytes ) -- 461 bytes (1263 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 374 bytes (1176 cumu)
; method 16 ( clrscr3 bytes ) -- 472 bytes (1274 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 506 bytes (1308 cumu)
; method 18 ( clrscr3 bytes ) -- 472 bytes (1274 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 385 bytes (1187 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 172
;,; <- chFFFFFFFFFFFF0000 ; 7
;,; <- chFCFCFCFCFCFCFCFC ; 19
;,; <- ch0000000000000000 ; 213
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFCFCE0C0C0C0C0C0 ; 9
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 7
;,; <- chFCFCE0C0C0E0FCFC ; 7
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- chFCFC303030303030 ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch303030303030FCFC ; 1
;,; <- ch0080C0E0F0F8FCFE ; 4
;,; <- ch3F3F3F3F3F3F3F3F ; 9
;,; <- ch3030303030303030 ; 4
;,; <- ch000103070F1F3F7F ; 4
;,; <- ch0000FFFFFFFFFFFF ; 9
;,; <- ch000018183C3C3C3C ; 1
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- ch3C3C3C3C18180000 ; 1
;,; <- ch0000FFFFFFFF0000 ; 2
;,; <- ch0000F0FCFCF00000 ; 1
;,; <- chCCCCCCCC78783030 ; 2
; total unique chars in pic: 27 (worst case req 216 bytes)
!byte $DA,$B6 ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $65
!byte $B8 ;skip
!byte $00 ;data4
!byte $51
!byte $95 ;skip
!byte $00 ;data4
!byte $51
!byte $DB,$E2 ;addr
!byte $04 ;data4
!byte $00
!byte $00
!byte $00
!byte $55
!byte $55
!byte $CE,$36 ;addr
!byte $e2,$ff;mode1
!byte $36 ;data1
!byte $00
!byte $32
!byte $0F
!byte $00
!byte $3F
!byte $DF
!byte $80
!byte $21
!byte $3F
!byte $C0
!byte $21
!byte $3F
!byte $E0
!byte $1F
!byte $FF
!byte $F0
!byte $0E
!byte $3F
!byte $FC
!byte $0E
!byte $3F
!byte $F0
!byte $0F
!byte $EF
!byte $E0
!byte $08
!byte $2F
!byte $C0
!byte $08
!byte $3F
!byte $C0
!byte $1F
!byte $FF
!byte $C0
!byte $1F
!byte $3F
!byte $C0
!byte $1F
!byte $1F
!byte $C0
!byte $1F
!byte $C3
!byte $C0
!byte $10
!byte $1F
!byte $C0
!byte $10
!byte $1F
!byte $C0
!byte $1F
!byte $DF
!byte $C0
!byte $1F
!byte $C7
!byte $80
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
!byte chFEFCF8F0E0C08000
!byte $CF,$68 ;addr
!byte $00 ;data8
!byte ch0080C0E0F0F8FCFE
!byte $96 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $96 ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $96 ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $96 ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $97 ;skip
!byte $01 ;data8
!byte ch0000FFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte $83 ;skip
!byte $00 ;data8
!byte ch000103070F1F3F7F
!byte $41,chFFFFFFFFFFFFFFFF ;fill
!byte $e1,24



;,; *_006
;,; <- deps_nooneelse
; method 0 ( bytes ) -- 132 bytes (1052 cumu)
; method 1 ( ibpc0 bytes ) -- 193 bytes (1113 cumu)
; method 2 ( bytes ) -- 132 bytes (1052 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 86 bytes (1006 cumu)
; method 4 ( clrscr0 bytes ) -- 414 bytes (1334 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 463 bytes (1383 cumu)
; method 6 ( clrscr0 bytes ) -- 414 bytes (1334 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 357 bytes (1277 cumu)
; method 8 ( clrscr1 bytes ) -- 430 bytes (1350 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 479 bytes (1399 cumu)
; method 10 ( clrscr1 bytes ) -- 430 bytes (1350 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 373 bytes (1293 cumu)
; method 12 ( clrscr2 bytes ) -- 425 bytes (1345 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 471 bytes (1391 cumu)
; method 14 ( clrscr2 bytes ) -- 425 bytes (1345 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 365 bytes (1285 cumu)
; method 16 ( clrscr3 bytes ) -- 441 bytes (1361 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 487 bytes (1407 cumu)
; method 18 ( clrscr3 bytes ) -- 441 bytes (1361 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 381 bytes (1301 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 280
;,; <- chFFFFFFFFFFFF0000 ; 3
;,; <- chFCFCFCFCFCFCFCFC ; 16
;,; <- ch0000000000000000 ; 121
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFCFCE0C0C0C0C0C0 ; 9
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 7
;,; <- chFCFCE0C0C0E0FCFC ; 7
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- chFCFC303030303030 ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch303030303030FCFC ; 1
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 9
;,; <- ch000103070F1F3F7F ; 5
;,; <- ch0000FFFFFFFFFFFF ; 8
;,; <- ch3030303030303030 ; 4
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chFEFCF8F0E0C08000 ; 1
;,; <- chCCCCCCCC78783030 ; 2
; total unique chars in pic: 23 (worst case req 184 bytes)
!byte $DA,$DD ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $55
!byte $91 ;skip
!byte $02 ;data4
!byte $52
!byte $55
!byte $55
!byte $91 ;skip
!byte $e2,0;mode8
!byte $00,$05 ;fill
!byte $DB,$E2 ;addr
!byte $44,$05 ;fill
!byte $CE,$48 ;addr
!byte $e2,$ff;mode1
!byte $03 ;data1
!byte $80
!byte $00
!byte $FF
!byte $C0
!byte $92 ;skip
!byte $00 ;data1
!byte $00
!byte $90 ;skip
!byte $00 ;data1
!byte $00
!byte $91 ;skip
!byte $27 ;data1
!byte $00
!byte $0E
!byte $3C
!byte $00
!byte $0E
!byte $38
!byte $00
!byte $0F
!byte $F0
!byte $00
!byte $08
!byte $30
!byte $00
!byte $08
!byte $30
!byte $00
!byte $1F
!byte $F0
!byte $00
!byte $1F
!byte $30
!byte $00
!byte $1F
!byte $30
!byte $00
!byte $1F
!byte $F0
!byte $00
!byte $10
!byte $30
!byte $00
!byte $10
!byte $30
!byte $00
!byte $1F
!byte $E0
!byte $00
!byte $1F
!byte $C0
!byte $00
!byte $e3 ;run ibpcaa
!byte $CF,$E0 ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch000103070F1F3F7F
!byte $45,chFFFFFFFFFFFFFFFF ;fill
!byte $e1,24



;,; *_007
;,; <- deps_nooneelse
; method 0 ( bytes ) -- 58 bytes (1064 cumu)
; method 1 ( ibpc0 bytes ) -- 114 bytes (1120 cumu)
; method 2 ( bytes ) -- 58 bytes (1064 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 115 bytes (1121 cumu)
; method 4 ( clrscr0 bytes ) -- 361 bytes (1367 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 404 bytes (1410 cumu)
; method 6 ( clrscr0 bytes ) -- 361 bytes (1367 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 370 bytes (1376 cumu)
; method 8 ( clrscr1 bytes ) -- 377 bytes (1383 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 420 bytes (1426 cumu)
; method 10 ( clrscr1 bytes ) -- 377 bytes (1383 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 386 bytes (1392 cumu)
; method 12 ( clrscr2 bytes ) -- 374 bytes (1380 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 413 bytes (1419 cumu)
; method 14 ( clrscr2 bytes ) -- 374 bytes (1380 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 379 bytes (1385 cumu)
; method 16 ( clrscr3 bytes ) -- 390 bytes (1396 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 429 bytes (1435 cumu)
; method 18 ( clrscr3 bytes ) -- 390 bytes (1396 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 395 bytes (1401 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 343
;,; <- chFFFFFFFFFFFF0000 ; 2
;,; <- chFCFCFCFCFCFCFCFC ; 16
;,; <- ch0000000000000000 ; 79
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFCFCE0C0C0C0C0C0 ; 9
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chCCCCCCCCCCECFCFC ; 7
;,; <- chFCFCE0C0C0E0FCFC ; 7
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- chFCFC303030303030 ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch303030303030FCFC ; 1
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- ch3030303030303030 ; 4
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chFEFCF8F0E0C08000 ; 1
;,; <- chCCCCCCCC78783030 ; 2
;,; <- ch0000FFFFFFFFFFFF ; 7
; total unique chars in pic: 20 (worst case req 160 bytes)
!byte $CE,$30 ;addr
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $96 ;skip
!byte $40,chFFFFFFFFFFFFFFFF ;fill
!byte $95 ;skip
!byte $41,chFFFFFFFFFFFFFFFF ;fill
!byte $94 ;skip
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $93 ;skip
!byte $44,chFFFFFFFFFFFFFFFF ;fill
!byte $91 ;skip
!byte $45,chFFFFFFFFFFFFFFFF ;fill
!byte $90 ;skip
!byte $44,chFFFFFFFFFFFFFFFF ;fill
!byte $91 ;skip
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $93 ;skip
!byte $41,chFFFFFFFFFFFFFFFF ;fill
!byte $94 ;skip
!byte $41,chFFFFFFFFFFFFFFFF ;fill
!byte $94 ;skip
!byte $41,chFFFFFFFFFFFFFFFF ;fill
!byte $94 ;skip
!byte $41,chFFFFFFFFFFFFFFFF ;fill
!byte $94 ;skip
!byte $41,chFFFFFFFFFFFFFFFF ;fill
!byte $94 ;skip
!byte $41,chFFFFFFFFFFFFFFFF ;fill
!byte $94 ;skip
!byte $41,chFFFFFFFFFFFFFFFF ;fill
!byte $94 ;skip
!byte $41,chFFFFFFFFFFFFFFFF ;fill
!byte $94 ;skip
!byte $41,chFFFFFFFFFFFFFFFF ;fill
!byte $94 ;skip
!byte $40,chFFFFFFFFFFFFFFFF ;fill
!byte $95 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $e1,24

; total compressed size 1064 bytes
