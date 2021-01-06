;,; lyrics_itsnouse .withinpagefrom=lyrics
;,; <- lyrics

	!byte $1b,$6a,$29,$2d,$09	; BUT
	!byte $31,$19,$1d,$15		; IT'S
	!byte $22,$40,$46		; NO
	!byte $21,$86,$25,$29		; USE

	!byte $1d,$63,$61		; THEY
	!byte $2d,$24,$5a,$24,$09	; JUST
	!byte $26,$81			; RE
	!byte $19,$1b,$f1,$29,$1d	; PEAT
        !byte $0f

;,; lyrics_imustcontinue .withinpagefrom=lyrics
;,; <- lyrics

	!byte $4a,$41,$09,$09		; I
	!byte $28,$2a,$24,$19,$1d,$29	; MUST
	!byte $1c,$30,$22		; CON
	!byte $19,$1d,$31,$22		; TIN
	!byte $31,$86			; UE
	!byte $09,$09
	!byte $4a,$41			; I
	!byte $28,$4a,$24,$19,$1d,$29	; MUST
	!byte $1c,$50,$32		; CON
	!byte $19,$1d,$41,$42		; TIN
	!byte $31,$86			; UE
        !byte $0f

;,; deps_itsnouse
;,; <- ibpcaablocks
;,; <- lyrics_itsnouse
;,; <- lyrics_imustcontinue

;,; SC52_000
;,; <- player_ivars
;,; <- deps_itsnouse
!src "demosrc/smac.inc"

+s8bpc
+sAddr nextlyrictosing
!byte $00,lyrics_itsnouse-lyrics

; NEW FRAME
!byte $e4,2,ch0000000000000000 ; clrscr

; CLR chars with ch0000000000000000 ; eliminate if fullscreen delta
;,; <- chFFFFFFFFFFFFFFFF ; 142
;,; <- chFFFFFFFFFFFF0000 ; 16
;,; <- chFCFCFCFCFCFCFCFC ; 36
;,; <- ch0000000000000000 ; 199
;,; <- ch3F3F3F3F3F3F3F3F ; 25
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chCCCCCCCCCCCCCCCC ; 5
;,; <- chFCFC303030303030 ; 6
;,; <- ch3030303030303030 ; 7
;,; <- chFCFCE0C0C0C0C0C0 ; 8
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chCCCCCCCCCCECFCFC ; 6
;,; <- ch303030303030FCFC ; 1
;,; <- chFCFC1C0C0C1CFCFC ; 3
;,; <- ch000103070F1F3F7F ; 7
;,; <- chFCFCDCCCCCCCCCCC ; 7
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- ch000000000000CCCC ; 1
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3C3C3C3C18180000 ; 3
;,; <- ch0000FFFFFFFFFFFF ; 15
;,; <- chFCFC0C0C0C0C0C0C ; 1
;,; <- ch3030300000000000 ; 1
;,; <- ch0080C0E0F0F8FCFE ; 1
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 26 (worst case req 208 bytes)
!byte $DA,$00 ;addr
!byte $4A,$00 ;fill
!byte $e2,1;mode4
!byte $06 ;data4
!byte $22
!byte $27
!byte $22
!byte $22
!byte $72
!byte $22
!byte $10
!byte $DA,$19 ;addr
!byte $48,$01 ;fill
!byte $4B,$07 ;fill
!byte $00 ;data4
!byte $10
!byte $DA,$31 ;addr
!byte $47,$01 ;fill
!byte $00 ;data4
!byte $27
!byte $85 ;skip
!byte $03 ;data4
!byte $27
!byte $22
!byte $22
!byte $10
!byte $DA,$49 ;addr
!byte $47,$01 ;fill
!byte $00 ;data4
!byte $27
!byte $85 ;skip
!byte $03 ;data4
!byte $27
!byte $22
!byte $22
!byte $10
!byte $DA,$61 ;addr
!byte $47,$01 ;fill
!byte $00 ;data4
!byte $27
!byte $85 ;skip
!byte $03 ;data4
!byte $27
!byte $22
!byte $22
!byte $10
!byte $DA,$79 ;addr
!byte $47,$01 ;fill
!byte $00 ;data4
!byte $27
!byte $85 ;skip
!byte $03 ;data4
!byte $27
!byte $22
!byte $22
!byte $10
!byte $DA,$91 ;addr
!byte $47,$01 ;fill
!byte $07 ;data4
!byte $77
!byte $77
!byte $12
!byte $12
!byte $72
!byte $77
!byte $77
!byte $10
!byte $DA,$A9 ;addr
!byte $47,$01 ;fill
!byte $07 ;data4
!byte $22
!byte $22
!byte $21
!byte $22
!byte $22
!byte $72
!byte $22
!byte $10
!byte $DA,$C1 ;addr
!byte $45,$01 ;fill
!byte $08 ;data4
!byte $77
!byte $22
!byte $22
!byte $21
!byte $11
!byte $11
!byte $72
!byte $22
!byte $10
!byte $DA,$D9 ;addr
!byte $45,$01 ;fill
!byte $08 ;data4
!byte $27
!byte $22
!byte $22
!byte $21
!byte $11
!byte $11
!byte $72
!byte $22
!byte $10
!byte $DA,$F1 ;addr
!byte $45,$01 ;fill
!byte $08 ;data4
!byte $27
!byte $22
!byte $22
!byte $21
!byte $22
!byte $22
!byte $72
!byte $22
!byte $10
!byte $DB,$09 ;addr
!byte $45,$01 ;fill
!byte $08 ;data4
!byte $77
!byte $77
!byte $77
!byte $22
!byte $22
!byte $72
!byte $77
!byte $77
!byte $10
!byte $DB,$21 ;addr
!byte $45,$01 ;fill
!byte $01 ;data4
!byte $27
!byte $27
!byte $87 ;skip
!byte $02 ;data4
!byte $27
!byte $22
!byte $10
!byte $DB,$39 ;addr
!byte $45,$01 ;fill
!byte $01 ;data4
!byte $27
!byte $27
!byte $87 ;skip
!byte $02 ;data4
!byte $27
!byte $22
!byte $10
!byte $DB,$51 ;addr
!byte $45,$01 ;fill
!byte $01 ;data4
!byte $22
!byte $27
!byte $87 ;skip
!byte $02 ;data4
!byte $27
!byte $22
!byte $10
!byte $DB,$69 ;addr
!byte $45,$01 ;fill
!byte $01 ;data4
!byte $22
!byte $27
!byte $86 ;skip
!byte $02 ;data4
!byte $77
!byte $22
!byte $02
!byte $45,$01 ;fill
!byte $4E,$07 ;fill
!byte $00 ;data4
!byte $10
!byte $DB,$99 ;addr
!byte $45,$01 ;fill
!byte $86 ;skip
!byte $00 ;data4
!byte $77
!byte $86 ;skip
!byte $00 ;data4
!byte $10
!byte $DB,$B1 ;addr
!byte $45,$01 ;fill
!byte $86 ;skip
!byte $00 ;data4
!byte $77
!byte $86 ;skip
!byte $00 ;data4
!byte $10
!byte $DB,$C9 ;addr
!byte $45,$01 ;fill
!byte $86 ;skip
!byte $00 ;data4
!byte $77
!byte $86 ;skip
!byte $46,$00 ;fill
!byte $04 ;data4
!byte $22
!byte $22
!byte $02
!byte $00
!byte $00
; method 0 ( bytes ) -- 579 cumulative
; method 1 ( ibpc0 bytes ) -- 630 cumulative
; method 2 ( ibpc1 bytes ) -- 657 cumulative
; method 3 ( ibpc2 bytes ) -- 630 cumulative
; method 4 ( ibpc3 bytes ) -- 657 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 416 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 560 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 416 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 560 cumulative
; METHOD 5 WAS THE BEST
!byte $CE,$00 ;addr
!byte $e2,$ff;mode1
!byte $3E ;data1
!byte $00
!byte $00
!byte $00
!byte $7F
!byte $E0
!byte $00
!byte $08
!byte $67
!byte $00
!byte $09
!byte $47
!byte $80
!byte $7F
!byte $C7
!byte $C0
!byte $11
!byte $C7
!byte $E0
!byte $10
!byte $C7
!byte $F0
!byte $7F
!byte $C7
!byte $F8
!byte $7F
!byte $C7
!byte $B8
!byte $7F
!byte $87
!byte $B8
!byte $07
!byte $87
!byte $F8
!byte $07
!byte $87
!byte $F8
!byte $7F
!byte $87
!byte $80
!byte $07
!byte $87
!byte $00
!byte $07
!byte $07
!byte $58
!byte $7F
!byte $07
!byte $F8
!byte $00
!byte $01
!byte $F8
!byte $00
!byte $01
!byte $C0
!byte $7F
!byte $01
!byte $80
!byte $7F
!byte $01
!byte $80
!byte $00
!byte $00
!byte $00
!byte $e3 ;run ibpcaa
!byte $CE,$01 ;addr
!byte $48,chFFFFFFFFFFFF0000 ;fill
!byte $A4 ;skip
!byte $e2,0;mode8
!byte $08 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte chF0F8CCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte chFCFC303030303030
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chFCFC303030303030
!byte ch3030303030303030
!byte chFCFCE0C0C0C0C0C0
!byte $8E ;skip
!byte $08 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte chFCFCCCCCCCDCFCFC
!byte chCCCCCCCCCCECFCFC
!byte ch3030303030303030
!byte ch0000000000000000
!byte ch303030303030FCFC
!byte ch3030303030303030
!byte ch0000000000000000
!byte chFCFC1C0C0C1CFCFC
!byte $A6 ;skip
!byte $06 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte $90 ;skip
!byte $07 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte chCCCCCCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte ch0000000000000000
!byte chCCCCCCCCCCECFCFC
!byte chFCFC1C0C0C1CFCFC
!byte chFCFCE0C0C0E0FCFC
!byte ch000000000000CCCC
!byte $CE,$F0 ;addr
!byte $04 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte chFCFC303030303030
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chCCCCCCCCCCECFCFC
!byte $92 ;skip
!byte $04 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch3030303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte ch3030303030303030
!byte $AA ;skip
!byte $04 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte chFCFC0C0C0C0C0C0C
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFC303030303030
!byte $92 ;skip
!byte $04 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCECFCFC
!byte chFCFC1C0C0C1CFCFC
!byte ch3030303030303030
!byte $AA ;skip
!byte $08 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chFCFC303030303030
!byte ch3030300000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $8E ;skip
!byte $08 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte chF0F8CCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0E0FCFC
!byte chFCFCDCCCCCCCCCCC
!byte ch3030303030303030
!byte ch0000000000303030
!byte ch3F3F3F3F3F3F3F3F
!byte $BF ;skip
!byte $45,ch0000FFFFFFFFFFFF ;fill
!byte $86 ;skip
!byte $01 ;data8
!byte ch0000FFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
; NEW FRAME
!byte $e1,12
;,; SC52_001 .waits=6
;,; <- deps_itsnouse
;,; <- streamvars

!byte 0xD0,loopctr,0,3	; set loopctr

.itsnouse_loop:

;,; <- chFFFFFFFFFFFFFFFF ; 142
;,; <- chFFFFFFFFFFFF0000 ; 16
;,; <- chFCFCFCFCFCFCFCFC ; 36
;,; <- ch0000000000000000 ; 199
;,; <- ch3F3F3F3F3F3F3F3F ; 25
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chCCCCCCCCCCCCCCCC ; 5
;,; <- chFCFC303030303030 ; 6
;,; <- ch3030303030303030 ; 7
;,; <- chFCFCE0C0C0C0C0C0 ; 8
;,; <- ch7F3F1F0F07030100 ; 6
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chCCCCCCCCCCECFCFC ; 6
;,; <- ch303030303030FCFC ; 1
;,; <- chFCFC1C0C0C1CFCFC ; 3
;,; <- ch000103070F1F3F7F ; 7
;,; <- chFCFCDCCCCCCCCCCC ; 7
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- ch000000000000CCCC ; 1
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3C3C3C3C18180000 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 15
;,; <- chFCFC0C0C0C0C0C0C ; 1
;,; <- chFEFCF8F0E0C08000 ; 1
;,; <- ch3030300000000000 ; 1
;,; <- ch0080C0E0F0F8FCFE ; 1
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 27 (worst case req 216 bytes)
!byte $DB,$D8 ;addr
!byte $00,$02 ;fill
!byte $93 ;skip
!byte $e2,1;mode4
!byte $00 ;data4
!byte $22
; method 0 ( bytes ) -- 608 cumulative
; method 1 ( ibpc0 bytes ) -- 649 cumulative
; method 2 ( ibpc1 bytes ) -- 713 cumulative
; method 3 ( ibpc2 bytes ) -- 649 cumulative
; method 4 ( ibpc3 bytes ) -- 713 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 490 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 618 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 490 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 618 cumulative
; METHOD 5 WAS THE BEST
!byte $CE,$3D ;addr
!byte $e2,$ff;mode1
!byte $2D ;data1
!byte $70
!byte $01
!byte $28
!byte $78
!byte $0F
!byte $F8
!byte $7C
!byte $02
!byte $38
!byte $7E
!byte $02
!byte $18
!byte $7F
!byte $0F
!byte $F8
!byte $7F
!byte $8F
!byte $F8
!byte $7B
!byte $8F
!byte $F0
!byte $7B
!byte $80
!byte $F0
!byte $7F
!byte $80
!byte $F0
!byte $7F
!byte $8F
!byte $F0
!byte $78
!byte $00
!byte $F0
!byte $70
!byte $00
!byte $E0
!byte $73
!byte $8F
!byte $E0
!byte $7F
!byte $80
!byte $00
!byte $1F
!byte $80
!byte $00
!byte $1C
!byte $91 ;skip
!byte $03 ;data1
!byte $60
!byte $3F
!byte $80
!byte $60
!byte $e3 ;run ibpcaa
!byte $8F ;skip
!byte $e2,0;mode8
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
; NEW FRAME
!byte $e1,12
;,; <- chFFFFFFFFFFFFFFFF ; 142
;,; <- chFFFFFFFFFFFF0000 ; 16
;,; <- chFCFCFCFCFCFCFCFC ; 36
;,; <- ch0000000000000000 ; 199
;,; <- ch3F3F3F3F3F3F3F3F ; 25
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chCCCCCCCCCCCCCCCC ; 5
;,; <- chFCFC303030303030 ; 6
;,; <- ch3030303030303030 ; 7
;,; <- chFCFCE0C0C0C0C0C0 ; 8
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chCCCCCCCCCCECFCFC ; 6
;,; <- ch303030303030FCFC ; 1
;,; <- chFCFC1C0C0C1CFCFC ; 3
;,; <- ch000103070F1F3F7F ; 7
;,; <- chFCFCDCCCCCCCCCCC ; 7
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- ch000000000000CCCC ; 1
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3C3C3C3C18180000 ; 3
;,; <- ch0000FFFFFFFFFFFF ; 15
;,; <- chFCFC0C0C0C0C0C0C ; 1
;,; <- ch3030300000000000 ; 1
;,; <- ch0080C0E0F0F8FCFE ; 1
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 26 (worst case req 208 bytes)
!byte $DB,$D8 ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $27
!byte $92 ;skip
!byte $00 ;data4
!byte $00
; method 0 ( bytes ) -- 682 cumulative
; method 1 ( ibpc0 bytes ) -- 723 cumulative
; method 2 ( ibpc1 bytes ) -- 774 cumulative
; method 3 ( ibpc2 bytes ) -- 723 cumulative
; method 4 ( ibpc3 bytes ) -- 774 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 564 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 653 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 564 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 653 cumulative
; METHOD 5 WAS THE BEST
!byte $CE,$3D ;addr
!byte $e2,$ff;mode1
!byte $2D ;data1
!byte $E0
!byte $01
!byte $28
!byte $F0
!byte $0F
!byte $F8
!byte $F8
!byte $02
!byte $38
!byte $FC
!byte $02
!byte $18
!byte $FE
!byte $0F
!byte $F8
!byte $FF
!byte $0F
!byte $F8
!byte $F7
!byte $0F
!byte $F0
!byte $F7
!byte $00
!byte $F0
!byte $FF
!byte $00
!byte $F0
!byte $FF
!byte $0F
!byte $F0
!byte $F0
!byte $00
!byte $F0
!byte $E0
!byte $00
!byte $E0
!byte $EB
!byte $0F
!byte $E0
!byte $FF
!byte $00
!byte $00
!byte $3F
!byte $00
!byte $00
!byte $38
!byte $91 ;skip
!byte $03 ;data1
!byte $C0
!byte $3F
!byte $80
!byte $C0
!byte $e3 ;run ibpcaa
!byte $8F ;skip
!byte $e2,0;mode8
!byte $02 ;data8
!byte ch0000FFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
; NEW FRAME
!byte $e1,12

!byte $e0,<.itsnouse_loop,>.itsnouse_loop

;,; SC52_002
;,; <- deps_itsnouse
;;; 84 (-)

;,; <- chFFFFFFFFFFFFFFFF ; 147
;,; <- ch0000000000000000 ; 198
;,; <- chFFFFFFFFFFFF0000 ; 13
;,; <- chFCFCFCFCFCFCFCFC ; 27
;,; <- ch3F3F3F3F3F3F3F3F ; 25
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chCCCCCCCCCCCCCCCC ; 5
;,; <- chFCFC303030303030 ; 6
;,; <- ch3030303030303030 ; 7
;,; <- chFCFCE0C0C0C0C0C0 ; 8
;,; <- ch7F3F1F0F07030100 ; 7
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chCCCCCCCCCCECFCFC ; 6
;,; <- ch303030303030FCFC ; 1
;,; <- chFCFC1C0C0C1CFCFC ; 3
;,; <- ch000103070F1F3F7F ; 7
;,; <- chFCFCDCCCCCCCCCCC ; 7
;,; <- chFEFCF8F0E0C08000 ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- ch000000000000CCCC ; 1
;,; <- ch000018183C3C3C3C ; 3
;,; <- ch3C3C3C3C18180000 ; 3
;,; <- ch0000F0FCFCF00000 ; 1
;,; <- ch0080C0E0F0F8FCFE ; 3
;,; <- chFCFC0C0C0C0C0C0C ; 1
;,; <- ch00000F3F3F0F0000 ; 1
;,; <- ch3030300000000000 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 13
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 29 (worst case req 232 bytes)
!byte $DB,$ED ;addr
!byte $e2,1;mode4
!byte $02 ;data4
!byte $02
!byte $00
!byte $00
; method 0 ( bytes ) -- 712 cumulative
; method 1 ( ibpc0 bytes ) -- 751 cumulative
; method 2 ( ibpc1 bytes ) -- 786 cumulative
; method 3 ( ibpc2 bytes ) -- 751 cumulative
; method 4 ( ibpc3 bytes ) -- 786 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 646 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 709 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 646 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 709 cumulative
; METHOD 5 WAS THE BEST
!byte $CE,$01 ;addr
!byte $e2,$ff;mode1
!byte $00 ;data1
!byte $80
!byte $B3 ;skip
!byte $09 ;data1
!byte $60
!byte $01
!byte $28
!byte $70
!byte $0F
!byte $F8
!byte $78
!byte $02
!byte $38
!byte $7C
!byte $AE ;skip
!byte $02 ;data1
!byte $07
!byte $FC
!byte $76
!byte $93 ;skip
!byte $00 ;data1
!byte $68
!byte $93 ;skip
!byte $0D ;data1
!byte $00
!byte $7C
!byte $3F
!byte $07
!byte $FC
!byte $79
!byte $80
!byte $7C
!byte $70
!byte $80
!byte $7C
!byte $66
!byte $87
!byte $FC
!byte $94 ;skip
!byte $04 ;data1
!byte $83
!byte $E0
!byte $00
!byte $03
!byte $00
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
!byte $96 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $96 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
; NEW FRAME
!byte $e1,18

;,; SC52_003
;,; <- deps_itsnouse

;,; <- chFFFFFFFFFFFFFFFF ; 139
;,; <- chFFFFFFFFFFFF0000 ; 15
;,; <- chFCFCFCFCFCFCFCFC ; 31
;,; <- ch0000000000000000 ; 192
;,; <- ch3F3F3F3F3F3F3F3F ; 27
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chCCCCCCCCCCCCCCCC ; 5
;,; <- chFCFC303030303030 ; 6
;,; <- ch3030303030303030 ; 7
;,; <- chFCFCE0C0C0C0C0C0 ; 8
;,; <- chFEFCF8F0E0C08000 ; 5
;,; <- ch7F3F1F0F07030100 ; 7
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chCCCCCCCCCCECFCFC ; 6
;,; <- ch303030303030FCFC ; 1
;,; <- chFCFC1C0C0C1CFCFC ; 3
;,; <- ch000103070F1F3F7F ; 6
;,; <- chFCFCDCCCCCCCCCCC ; 7
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- ch000000000000CCCC ; 1
;,; <- ch000018183C3C3C3C ; 3
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch0080C0E0F0F8FCFE ; 6
;,; <- ch00000F3F3F0F0000 ; 2
;,; <- ch0000FFFFFFFFFFFF ; 14
;,; <- chFCFC0C0C0C0C0C0C ; 1
;,; <- ch0000F0FCFCF00000 ; 1
;,; <- ch3030300000000000 ; 1
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 29 (worst case req 232 bytes)
!byte $DB,$F2 ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $22
; method 0 ( bytes ) -- 852 cumulative
; method 1 ( ibpc0 bytes ) -- 899 cumulative
; method 2 ( ibpc1 bytes ) -- 924 cumulative
; method 3 ( ibpc2 bytes ) -- 899 cumulative
; method 4 ( ibpc3 bytes ) -- 924 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 714 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 788 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 714 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 788 cumulative
; METHOD 5 WAS THE BEST
!byte $CE,$01 ;addr
!byte $e2,$ff;mode1
!byte $00 ;data1
!byte $00
!byte $B4 ;skip
!byte $00 ;data1
!byte $60
!byte $92 ;skip
!byte $00 ;data1
!byte $80
!byte $A8 ;skip
!byte $00 ;data1
!byte $00
!byte $90 ;skip
!byte $1F ;data1
!byte $03
!byte $FE
!byte $3F
!byte $03
!byte $FE
!byte $6D
!byte $83
!byte $FC
!byte $6D
!byte $80
!byte $3C
!byte $3F
!byte $00
!byte $3C
!byte $3F
!byte $83
!byte $FC
!byte $61
!byte $80
!byte $3E
!byte $61
!byte $80
!byte $3E
!byte $4C
!byte $83
!byte $FE
!byte $3F
!byte $00
!byte $03
!byte $1E
!byte $00
!byte $01
!byte $96 ;skip
!byte $00 ;data1
!byte $E6
!byte $e3 ;run ibpcaa
!byte $CE,$01 ;addr
!byte $e2,0;mode8
!byte $00,chFFFFFFFFFFFF0000 ;fill
!byte $B8 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
; NEW FRAME
!byte $e1,90


;,; SC52_004
;,; <- deps_itsnouse
;,; <- player_ivars
!src "demosrc/smac.inc"

+s8bpc
+sAddr nextlyrictosing
!byte $00,lyrics_imustcontinue-lyrics

;,; <- chFFFFFFFFFFFFFFFF ; 147
;,; <- chFFFFFFFFFFFF0000 ; 15
;,; <- chFCFCFCFCFCFCFCFC ; 30
;,; <- ch0000000000000000 ; 235
;,; <- ch3F3F3F3F3F3F3F3F ; 27
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- ch7F3F1F0F07030100 ; 8
;,; <- chFCFC303030303030 ; 1
;,; <- ch000103070F1F3F7F ; 7
;,; <- ch303030303030FCFC ; 1
;,; <- ch000018183C3C3C3C ; 3
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch0080C0E0F0F8FCFE ; 7
;,; <- ch00000F3F3F0F0000 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 14
; total unique chars in pic: 15 (worst case req 120 bytes)
; method 0 ( bytes ) -- 785 cumulative
; method 1 ( ibpc0 bytes ) -- 801 cumulative
; method 2 ( ibpc1 bytes ) -- 805 cumulative
; method 3 ( ibpc2 bytes ) -- 801 cumulative
; method 4 ( ibpc3 bytes ) -- 805 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 769 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 790 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 769 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 790 cumulative
; METHOD 5 WAS THE BEST
!byte $CF,$45 ;addr
!byte $e2,$ff;mode1
!byte $00 ;data1
!byte $02
!byte $91 ;skip
!byte $05 ;data1
!byte $08
!byte $3F
!byte $E2
!byte $10
!byte $00
!byte $21
!byte $e3 ;run ibpcaa
!byte $CE,$31 ;addr
!byte $46,ch0000000000000000 ;fill
!byte $8F ;skip
!byte $e2,0;mode8
!byte $01 ;data8
!byte ch0000000000000000
!byte chFCFC303030303030
!byte $44,ch0000000000000000 ;fill
!byte $90 ;skip
!byte $00 ;data8
!byte ch303030303030FCFC
!byte $95 ;skip
!byte $44,ch0000000000000000 ;fill
!byte $91 ;skip
!byte $45,ch0000000000000000 ;fill
!byte $CE,$F1 ;addr
!byte $42,ch0000000000000000 ;fill
!byte $93 ;skip
!byte $42,ch0000000000000000 ;fill
!byte $AB ;skip
!byte $42,ch0000000000000000 ;fill
!byte $93 ;skip
!byte $42,ch0000000000000000 ;fill
!byte $AB ;skip
!byte $45,ch0000000000000000 ;fill
!byte $90 ;skip
!byte $45,ch0000000000000000 ;fill
; NEW FRAME
!byte $e1,12

;,; SC52_005
;,; <- deps_itsnouse

;,; <- chFFFFFFFFFFFFFFFF ; 139
;,; <- chFFFFFFFFFFFF0000 ; 15
;,; <- chFCFCFCFCFCFCFCFC ; 30
;,; <- ch0000000000000000 ; 244
;,; <- ch3F3F3F3F3F3F3F3F ; 28
;,; <- chFEFCF8F0E0C08000 ; 5
;,; <- ch7F3F1F0F07030100 ; 7
;,; <- chFCFC303030303030 ; 1
;,; <- ch000103070F1F3F7F ; 6
;,; <- ch303030303030FCFC ; 1
;,; <- ch000018183C3C3C3C ; 3
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch0080C0E0F0F8FCFE ; 6
;,; <- ch00000F3F3F0F0000 ; 2
;,; <- ch0000FFFFFFFFFFFF ; 14
;,; <- ch0000F0FCFCF00000 ; 1
; total unique chars in pic: 16 (worst case req 128 bytes)
; method 0 ( bytes ) -- 793 cumulative
; method 1 ( ibpc0 bytes ) -- 802 cumulative
; method 2 ( ibpc1 bytes ) -- 808 cumulative
; method 3 ( ibpc2 bytes ) -- 802 cumulative
; method 4 ( ibpc3 bytes ) -- 808 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 798 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 820 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 803 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 820 cumulative
; METHOD 0 WAS THE BEST
!byte $CE,$90 ;addr
!byte $00,ch0000000000000000 ;fill
!byte $CF,$45 ;addr
!byte $05 ;data8
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFF0000
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte $91 ;skip
!byte $05 ;data8
!byte ch00000F3F3F0F0000
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte ch0000F0FCFCF00000
!byte $92 ;skip
!byte $42,ch0000000000000000 ;fill
; NEW FRAME
!byte $e1,24

;,; SC52_006
;,; <- deps_itsnouse

;,; <- chFFFFFFFFFFFFFFFF ; 147
;,; <- chFFFFFFFFFFFF0000 ; 15
;,; <- chFCFCFCFCFCFCFCFC ; 30
;,; <- ch0000000000000000 ; 227
;,; <- ch3F3F3F3F3F3F3F3F ; 27
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- ch7F3F1F0F07030100 ; 8
;,; <- chFCFC303030303030 ; 2
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chCCCCCCCCCCCCCCCC ; 1
;,; <- chFCFCE0C0C0C0C0C0 ; 1
;,; <- ch000103070F1F3F7F ; 7
;,; <- ch303030303030FCFC ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 1
;,; <- chFCFC1C0C0C1CFCFC ; 1
;,; <- ch3030303030303030 ; 1
;,; <- ch000018183C3C3C3C ; 3
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch0080C0E0F0F8FCFE ; 7
;,; <- ch00000F3F3F0F0000 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 14
; total unique chars in pic: 22 (worst case req 176 bytes)
; method 0 ( bytes ) -- 830 cumulative
; method 1 ( ibpc0 bytes ) -- 848 cumulative
; method 2 ( ibpc1 bytes ) -- 854 cumulative
; method 3 ( ibpc2 bytes ) -- 848 cumulative
; method 4 ( ibpc3 bytes ) -- 854 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 825 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 851 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 825 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 851 cumulative
; METHOD 5 WAS THE BEST
!byte $CE,$90 ;addr
!byte $e2,$ff;mode1
!byte $00 ;data1
!byte $7F
!byte $CF,$45 ;addr
!byte $00 ;data1
!byte $02
!byte $91 ;skip
!byte $03 ;data1
!byte $08
!byte $3F
!byte $E2
!byte $10
!byte $e3 ;run ibpcaa
!byte $CE,$4C ;addr
!byte $e2,0;mode8
!byte $03 ;data8
!byte chFEFEDED6D6D6D6D6
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFC303030303030
!byte $93 ;skip
!byte $03 ;data8
!byte chC6C6C6C6C6C6C6C6
!byte chCCCCCCCCCCECFCFC
!byte chFCFC1C0C0C1CFCFC
!byte ch3030303030303030
; NEW FRAME
!byte $e1,6

;,; SC52_007
;,; <- deps_itsnouse

;,; <- chFFFFFFFFFFFFFFFF ; 139
;,; <- chFFFFFFFFFFFF0000 ; 15
;,; <- chFCFCFCFCFCFCFCFC ; 31
;,; <- ch0000000000000000 ; 235
;,; <- ch3F3F3F3F3F3F3F3F ; 28
;,; <- chFEFCF8F0E0C08000 ; 5
;,; <- ch7F3F1F0F07030100 ; 7
;,; <- chFCFC303030303030 ; 2
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chCCCCCCCCCCCCCCCC ; 1
;,; <- chFCFCE0C0C0C0C0C0 ; 1
;,; <- ch000103070F1F3F7F ; 6
;,; <- ch303030303030FCFC ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 1
;,; <- chFCFC1C0C0C1CFCFC ; 1
;,; <- ch3030303030303030 ; 1
;,; <- ch000018183C3C3C3C ; 3
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch0080C0E0F0F8FCFE ; 6
;,; <- ch00000F3F3F0F0000 ; 2
;,; <- ch0000FFFFFFFFFFFF ; 14
;,; <- ch0000F0FCFCF00000 ; 1
; total unique chars in pic: 23 (worst case req 184 bytes)
; method 0 ( bytes ) -- 845 cumulative
; method 1 ( ibpc0 bytes ) -- 854 cumulative
; method 2 ( ibpc1 bytes ) -- 860 cumulative
; method 3 ( ibpc2 bytes ) -- 854 cumulative
; method 4 ( ibpc3 bytes ) -- 860 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 838 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 862 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 845 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 862 cumulative
; METHOD 5 WAS THE BEST
!byte $CF,$45 ;addr
!byte $e2,$ff;mode1
!byte $00 ;data1
!byte $86
!byte $91 ;skip
!byte $03 ;data1
!byte $C8
!byte $3F
!byte $E3
!byte $F0
!byte $e3 ;run ibpcaa
; NEW FRAME
!byte $e1,6

;,; SC52_008
;,; <- deps_itsnouse

;,; <- chFFFFFFFFFFFFFFFF ; 147
;,; <- chFFFFFFFFFFFF0000 ; 15
;,; <- chFCFCFCFCFCFCFCFC ; 30
;,; <- ch0000000000000000 ; 221
;,; <- ch3F3F3F3F3F3F3F3F ; 27
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- ch7F3F1F0F07030100 ; 8
;,; <- chFCFC303030303030 ; 2
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chCCCCCCCCCCCCCCCC ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 2
;,; <- ch000103070F1F3F7F ; 7
;,; <- ch303030303030FCFC ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 1
;,; <- ch3030303030303030 ; 1
;,; <- chFCFCDCCCCCCCCCCC ; 2
;,; <- chC0C0C0C0C0E0FCFC ; 1
;,; <- ch000018183C3C3C3C ; 3
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch0080C0E0F0F8FCFE ; 7
;,; <- ch00000F3F3F0F0000 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 14
; total unique chars in pic: 24 (worst case req 192 bytes)
; method 0 ( bytes ) -- 872 cumulative
; method 1 ( ibpc0 bytes ) -- 882 cumulative
; method 2 ( ibpc1 bytes ) -- 887 cumulative
; method 3 ( ibpc2 bytes ) -- 882 cumulative
; method 4 ( ibpc3 bytes ) -- 887 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 862 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 884 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 862 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 884 cumulative
; METHOD 5 WAS THE BEST
!byte $CF,$45 ;addr
!byte $00 ;data1
!byte $02
!byte $91 ;skip
!byte $03 ;data1
!byte $08
!byte $3F
!byte $E2
!byte $10
!byte $e3 ;run ibpcaa
!byte $CE,$91 ;addr
!byte $e2,0;mode8
!byte $02 ;data8
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte $94 ;skip
!byte $02 ;data8
!byte chC0C0C0C0C0E0FCFC
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCCCCCCC
; NEW FRAME
!byte $e1,6

;,; SC52_009
;,; <- deps_itsnouse

;,; <- chFFFFFFFFFFFFFFFF ; 139
;,; <- chFFFFFFFFFFFF0000 ; 15
;,; <- chFCFCFCFCFCFCFCFC ; 31
;,; <- ch0000000000000000 ; 229
;,; <- ch3F3F3F3F3F3F3F3F ; 28
;,; <- chFEFCF8F0E0C08000 ; 5
;,; <- ch7F3F1F0F07030100 ; 7
;,; <- chFCFC303030303030 ; 2
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chCCCCCCCCCCCCCCCC ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 2
;,; <- ch000103070F1F3F7F ; 6
;,; <- ch303030303030FCFC ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 1
;,; <- ch3030303030303030 ; 1
;,; <- chFCFCDCCCCCCCCCCC ; 2
;,; <- chC0C0C0C0C0E0FCFC ; 1
;,; <- ch000018183C3C3C3C ; 3
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch0080C0E0F0F8FCFE ; 6
;,; <- ch00000F3F3F0F0000 ; 2
;,; <- ch0000FFFFFFFFFFFF ; 14
;,; <- ch0000F0FCFCF00000 ; 1
; total unique chars in pic: 25 (worst case req 200 bytes)
; method 0 ( bytes ) -- 882 cumulative
; method 1 ( ibpc0 bytes ) -- 891 cumulative
; method 2 ( ibpc1 bytes ) -- 897 cumulative
; method 3 ( ibpc2 bytes ) -- 891 cumulative
; method 4 ( ibpc3 bytes ) -- 897 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 875 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 899 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 882 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 899 cumulative
; METHOD 5 WAS THE BEST
!byte $CF,$45 ;addr
!byte $e2,$ff;mode1
!byte $00 ;data1
!byte $86
!byte $91 ;skip
!byte $03 ;data1
!byte $C8
!byte $3F
!byte $E3
!byte $F0
!byte $e3 ;run ibpcaa
; NEW FRAME
!byte $e1,6

;,; SC52_010
;,; <- deps_itsnouse

;,; <- chFFFFFFFFFFFFFFFF ; 147
;,; <- chFFFFFFFFFFFF0000 ; 15
;,; <- chFCFCFCFCFCFCFCFC ; 30
;,; <- ch0000000000000000 ; 217
;,; <- ch3F3F3F3F3F3F3F3F ; 27
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- ch7F3F1F0F07030100 ; 8
;,; <- chFCFC303030303030 ; 4
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chCCCCCCCCCCCCCCCC ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 2
;,; <- ch000103070F1F3F7F ; 7
;,; <- ch303030303030FCFC ; 2
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 1
;,; <- ch3030303030303030 ; 2
;,; <- chFCFCDCCCCCCCCCCC ; 2
;,; <- chC0C0C0C0C0E0FCFC ; 1
;,; <- ch000018183C3C3C3C ; 3
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch0080C0E0F0F8FCFE ; 7
;,; <- ch00000F3F3F0F0000 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 14
; total unique chars in pic: 24 (worst case req 192 bytes)
; method 0 ( bytes ) -- 907 cumulative
; method 1 ( ibpc0 bytes ) -- 917 cumulative
; method 2 ( ibpc1 bytes ) -- 922 cumulative
; method 3 ( ibpc2 bytes ) -- 917 cumulative
; method 4 ( ibpc3 bytes ) -- 922 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 897 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 919 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 897 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 919 cumulative
; METHOD 5 WAS THE BEST
!byte $CF,$45 ;addr
!byte $00 ;data1
!byte $02
!byte $91 ;skip
!byte $03 ;data1
!byte $08
!byte $3F
!byte $E2
!byte $10
!byte $e3 ;run ibpcaa
!byte $CE,$94 ;addr
!byte $e2,0;mode8
!byte $01 ;data8
!byte chFCFC303030303030
!byte chFCFC303030303030
!byte $95 ;skip
!byte $01 ;data8
!byte ch3030303030303030
!byte ch303030303030FCFC
; NEW FRAME
!byte $e1,6

;,; SC52_011
;,; <- deps_itsnouse

;,; <- chFFFFFFFFFFFFFFFF ; 139
;,; <- chFFFFFFFFFFFF0000 ; 15
;,; <- chFCFCFCFCFCFCFCFC ; 31
;,; <- ch0000000000000000 ; 225
;,; <- ch3F3F3F3F3F3F3F3F ; 28
;,; <- chFEFCF8F0E0C08000 ; 5
;,; <- ch7F3F1F0F07030100 ; 7
;,; <- chFCFC303030303030 ; 4
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chCCCCCCCCCCCCCCCC ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 2
;,; <- ch000103070F1F3F7F ; 6
;,; <- ch303030303030FCFC ; 2
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 1
;,; <- ch3030303030303030 ; 2
;,; <- chFCFCDCCCCCCCCCCC ; 2
;,; <- chC0C0C0C0C0E0FCFC ; 1
;,; <- ch000018183C3C3C3C ; 3
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch0080C0E0F0F8FCFE ; 6
;,; <- ch00000F3F3F0F0000 ; 2
;,; <- ch0000FFFFFFFFFFFF ; 14
;,; <- ch0000F0FCFCF00000 ; 1
; total unique chars in pic: 25 (worst case req 200 bytes)
; method 0 ( bytes ) -- 917 cumulative
; method 1 ( ibpc0 bytes ) -- 926 cumulative
; method 2 ( ibpc1 bytes ) -- 932 cumulative
; method 3 ( ibpc2 bytes ) -- 926 cumulative
; method 4 ( ibpc3 bytes ) -- 932 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 910 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 934 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 917 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 934 cumulative
; METHOD 5 WAS THE BEST
!byte $CF,$45 ;addr
!byte $e2,$ff;mode1
!byte $00 ;data1
!byte $86
!byte $91 ;skip
!byte $03 ;data1
!byte $C8
!byte $3F
!byte $E3
!byte $F0
!byte $e3 ;run ibpcaa
; NEW FRAME
!byte $e1,6

;,; SC52_012
;,; <- deps_itsnouse

;,; <- chFFFFFFFFFFFFFFFF ; 147
;,; <- chFFFFFFFFFFFF0000 ; 15
;,; <- chFCFCFCFCFCFCFCFC ; 30
;,; <- ch0000000000000000 ; 209
;,; <- ch3F3F3F3F3F3F3F3F ; 27
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- ch7F3F1F0F07030100 ; 8
;,; <- chFCFC303030303030 ; 4
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- chFCFCE0C0C0C0C0C0 ; 3
;,; <- ch000103070F1F3F7F ; 7
;,; <- ch303030303030FCFC ; 2
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 3
;,; <- chFCFC1C0C0C1CFCFC ; 1
;,; <- ch3030303030303030 ; 3
;,; <- chFCFCDCCCCCCCCCCC ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- ch0000000000303030 ; 1
;,; <- ch000018183C3C3C3C ; 3
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch0080C0E0F0F8FCFE ; 7
;,; <- ch00000F3F3F0F0000 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 14
; total unique chars in pic: 26 (worst case req 208 bytes)
; method 0 ( bytes ) -- 946 cumulative
; method 1 ( ibpc0 bytes ) -- 956 cumulative
; method 2 ( ibpc1 bytes ) -- 961 cumulative
; method 3 ( ibpc2 bytes ) -- 956 cumulative
; method 4 ( ibpc3 bytes ) -- 961 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 936 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 958 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 936 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 958 cumulative
; METHOD 5 WAS THE BEST		1B1A
!byte $CF,$45 ;addr
!byte $00 ;data1
!byte $02
!byte $91 ;skip
!byte $03 ;data1
!byte $08
!byte $3F
!byte $E2
!byte $10
!byte $e3 ;run ibpcaa
!byte $CE,$96 ;addr
!byte $e2,0;mode8
!byte $03 ;data8
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte ch3030303030303030
!byte $93 ;skip
!byte $03 ;data8
!byte chCCCCCCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000303030
!byte $e1,48
