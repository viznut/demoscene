;,; lyrics_enterthenextlevel .withinpagefrom=lyrics
;,; <- lyrics

	!byte $33,$02			; EN
	!byte $29,$1d,$6a		; TER
	!byte $29,$1d,$2a		; THE
	!byte $22,$43,$29,$1c,$19,$35,$19,$1d,$39	; NEXT
	!byte $27,$43,$26,$20,$47	; LEVEL

	!byte $33,$52			; EN
	!byte $29,$1d,$6a		; TER
	!byte $29,$1d,$2a		; THE
	!byte $22,$43,$29,$1c,$19,$35,$19,$1d,$19	; NEXT
	!byte $27,$43,$26,$20,$47	; LEVEL
	!byte $0f

;,; deps_enterthenextlevel
;,; <- lyrics_enterthenextlevel
;,; <- ibpcaablocks

;,; SC33_000
;,; <- deps_enterthenextlevel
;,; <- streamvars
;,; <- player_ivars
!src "demosrc/smac.inc"

+sAddr nextlyrictosing
!byte $00,lyrics_enterthenextlevel-lyrics

; method 4 ( clrscr bytes ) -- 448 bytes (448 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 436 bytes (436 cumu)
; method 6 ( clrscr bytes ) -- 448 bytes (448 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 320 bytes (320 cumu)
; METHOD 7 CHOSEN
!byte $e4,0,ch0000000000000000 ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 159
;,; <- chFCFCFCFCFCFCFCFC ; 35
;,; <- ch0000000000000000 ; 227
;,; <- chFFFFFFFFFFFF0000 ; 3
;,; <- ch0000000000183C7E ; 1
;,; <- chFEFCF8F0E0C08000 ; 5
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- ch000103070F1F3F7F ; 5
;,; <- ch0080C0E0F0F8FCFE ; 8
;,; <- ch0000207070707020 ; 1
;,; <- ch3F3F3F3F3F3F3F3F ; 13
;,; <- ch3C3C3C3C3C3C3C3C ; 3
;,; <- ch00030F3F0F0F0F0F ; 1
;,; <- ch0F0F0F0F0F0F0F0F ; 1
;,; <- ch0000FFFFFFFFFFFF ; 3
;,; <- chFCFCE0C0C0C0C0C0 ; 6
;,; <- chFCFCDCCCCCCCCCCC ; 4
;,; <- chFCFC303030303030 ; 3
;,; <- chFCFCE0C0C0E0FCFC ; 6
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- ch3030303030303030 ; 3
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- chCCCCCCCC78783030 ; 2
;,; <- ch30307878CCCCCCCC ; 1
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- chC0C0C0C0C0E0FCFC ; 2
; total unique chars in pic: 26 (worst case req 208 bytes)
!byte $DA,$0D ;addr
!byte $49,$01 ;fill
!byte $96 ;skip
!byte $e2,1;mode4
!byte $00 ;data4
!byte $01
!byte $95 ;skip
!byte $00 ;data4
!byte $01
!byte $95 ;skip
!byte $00 ;data4
!byte $01
!byte $95 ;skip
!byte $00 ;data4
!byte $01
!byte $95 ;skip
!byte $00 ;data4
!byte $01
!byte $95 ;skip
!byte $00 ;data4
!byte $01
!byte $95 ;skip
!byte $00 ;data4
!byte $01
!byte $95 ;skip
!byte $00 ;data4
!byte $01
!byte $95 ;skip
!byte $00 ;data4
!byte $01
!byte $8B ;skip
!byte $49,$01 ;fill
!byte $8C ;skip
!byte $05 ;data4
!byte $11
!byte $00
!byte $00
!byte $00
!byte $11
!byte $01
!byte $8B ;skip
!byte $05 ;data4
!byte $11
!byte $00
!byte $00
!byte $00
!byte $11
!byte $01
!byte $8B ;skip
!byte $49,$01 ;fill
!byte $8C ;skip
!byte $05 ;data4
!byte $01
!byte $00
!byte $80
!byte $00
!byte $00
!byte $01
!byte $8B ;skip
!byte $00 ;data4
!byte $01
!byte $87 ;skip
!byte $00 ;data4
!byte $01
!byte $8B ;skip
!byte $00 ;data4
!byte $01
!byte $86 ;skip
!byte $00 ;data4
!byte $11
!byte $8C ;skip
!byte $00 ;data4
!byte $01
!byte $85 ;skip
!byte $01 ;data4
!byte $17
!byte $01
!byte $8B ;skip
!byte $00 ;data4
!byte $01
!byte $86 ;skip
!byte $00 ;data4
!byte $11
!byte $8C ;skip
!byte $49,$01 ;fill
!byte $8C ;skip
!byte $49,$01 ;fill
!byte $CE,$00 ;addr
!byte $e2,$ff;mode1
!byte $3D ;data1
!byte $00
!byte $07
!byte $FF
!byte $00
!byte $07
!byte $DF
!byte $02
!byte $07
!byte $8F
!byte $07
!byte $07
!byte $07
!byte $0E
!byte $06
!byte $03
!byte $07
!byte $07
!byte $DF
!byte $17
!byte $47
!byte $DF
!byte $16
!byte $47
!byte $DF
!byte $12
!byte $47
!byte $DF
!byte $12
!byte $47
!byte $FF
!byte $1F
!byte $C7
!byte $FF
!byte $0F
!byte $07
!byte $07
!byte $07
!byte $07
!byte $07
!byte $07
!byte $07
!byte $FF
!byte $06
!byte $04
!byte $61
!byte $02
!byte $04
!byte $61
!byte $02
!byte $07
!byte $FF
!byte $02
!byte $07
!byte $07
!byte $02
!byte $07
!byte $07
!byte $03
!byte $07
!byte $FF
!byte $00
!byte $07
!byte $e3 ;run ibpcaa
!byte $CE,$0C ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $8A ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $90 ;skip
!byte $00 ;data8
!byte ch0000000000183C7E
!byte $84 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $96 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $86 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $8E ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $00 ;data8
!byte ch0000207070707020
!byte $86 ;skip
!byte $09 ;data8
!byte ch000103070F1F3F7F
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte chFFFFFFFFFFFFFFFF
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte $90 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $84 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $90 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $84 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $00 ;data8
!byte ch00030F3F0F0F0F0F
!byte $89 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $84 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $00 ;data8
!byte ch0F0F0F0F0F0F0F0F
!byte $89 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $84 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $96 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $96 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $8E ;skip
!byte $08 ;data8
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chFCFC303030303030
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte $8E ;skip
!byte $08 ;data8
!byte chFCFCE0C0C0E0FCFC
!byte chCCCCCCCCCCCCCCCC
!byte ch3030303030303030
!byte chFCFCE0C0C0E0FCFC
!byte chF0F8CCCCCCCCCCCC
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte $96 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $8C ;skip
!byte $0A ;data8
!byte chFCFC303030303030
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chCCCCCCCC78783030
!byte chFCFC303030303030
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte $8C ;skip
!byte $0A ;data8
!byte ch3030303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000000000
!byte ch0000000000000000
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte ch30307878CCCCCCCC
!byte ch3030303030303030
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte $96 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $8E ;skip
!byte $08 ;data8
!byte chC0C0C0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chC0C0C0C0C0C0C0C0
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte $8E ;skip
!byte $08 ;data8
!byte chC0C0C0C0C0E0FCFC
!byte chFCFCE0C0C0E0FCFC
!byte chCCCCCCCC78783030
!byte chFCFCE0C0C0E0FCFC
!byte chC0C0C0C0C0E0FCFC
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte $9C ;skip
!byte $01 ;data8
!byte ch0000FFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte $83 ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $e1,12

; total compressed size 320 bytes

;,; SC33_001
;,; <- deps_enterthenextlevel
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$68
!byte $e1,6

;,; SC33_002
;,; <- deps_enterthenextlevel
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$28
!byte $e1,6

;,; SC33_003
;,; <- deps_enterthenextlevel
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$48
!byte $e1,6

;,; SC33_004
;,; <- deps_enterthenextlevel
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$e8
!byte $e1,6

;,; SC33_005
;,; <- deps_enterthenextlevel
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$58
!byte $e1,6

;,; SC33_007
;,; <- deps_enterthenextlevel
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$a8
!byte $e1,6

;,; SC33_008
;,; <- deps_enterthenextlevel
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$c8
!byte $e1,6

;,; SC33_009
;,; <- deps_enterthenextlevel
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$38
!byte $e1,6

;,; SC33_010
;,; <- deps_enterthenextlevel
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$78
!byte $e1,6

;,; SC33_011
;,; <- deps_enterthenextlevel
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$c8
!byte $e1,6

;,; SC33_012
;,; <- deps_enterthenextlevel
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$b8
!byte $e1,6

;,; SC33_013
;,; <- deps_enterthenextlevel
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$f8
!byte $e1,6

;,; SC33_014
;,; <- deps_enterthenextlevel
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$18
!byte $e1,6

;,; SC33_015
;,; <- deps_enterthenextlevel
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$f8
!byte $e1,6

;,; SC33_100
;,; <- deps_enterthenextlevel
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$08

; method 4 ( clrscr bytes ) -- 347 bytes (347 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 367 bytes (367 cumu)
; method 6 ( clrscr bytes ) -- 347 bytes (347 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 225 bytes (225 cumu)
; METHOD 7 CHOSEN
!byte $e4,3,chFFFFFFFFFFFFFFFF ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 390
;,; <- chFFFFFFFFFFFF0000 ; 12
;,; <- chFCFCFCFCFCFCFCFC ; 16
;,; <- ch0000000000000000 ; 44
;,; <- ch3C3C3C3C3C3C3C3C ; 12
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- ch00000F3F3F0F0000 ; 5
;,; <- ch000018183C3C3C3C ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 10
;,; <- ch0080C0E0F0F8FCFE ; 1
;,; <- ch000103070F1F3F7F ; 1
;,; <- ch0000183C3C180000 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 9
; total unique chars in pic: 13 (worst case req 104 bytes)
!byte $DA,$00 ;addr
!byte $57,$00 ;fill
!byte $e2,1;mode4
!byte $01 ;data4
!byte $33
!byte $13
!byte $DA,$1C ;addr
!byte $4E,$01 ;fill
!byte $04 ;data4
!byte $33
!byte $03
!byte $30
!byte $33
!byte $11
!byte $8C ;skip
!byte $05 ;data4
!byte $31
!byte $33
!byte $00
!byte $33
!byte $13
!byte $31
!byte $8B ;skip
!byte $05 ;data4
!byte $31
!byte $33
!byte $00
!byte $33
!byte $13
!byte $31
!byte $8B ;skip
!byte $06 ;data4
!byte $31
!byte $33
!byte $00
!byte $33
!byte $13
!byte $31
!byte $13
!byte $DA,$80 ;addr
!byte $47,$01 ;fill
!byte $07 ;data4
!byte $33
!byte $31
!byte $33
!byte $00
!byte $33
!byte $13
!byte $31
!byte $13
!byte $DA,$98 ;addr
!byte $47,$01 ;fill
!byte $3F ;data4
!byte $33
!byte $31
!byte $33
!byte $00
!byte $33
!byte $13
!byte $31
!byte $13
!byte $31
!byte $33
!byte $33
!byte $11
!byte $33
!byte $31
!byte $33
!byte $00
!byte $33
!byte $13
!byte $31
!byte $13
!byte $31
!byte $11
!byte $31
!byte $11
!byte $33
!byte $31
!byte $33
!byte $00
!byte $33
!byte $13
!byte $31
!byte $13
!byte $31
!byte $31
!byte $31
!byte $11
!byte $33
!byte $31
!byte $33
!byte $00
!byte $33
!byte $13
!byte $31
!byte $13
!byte $31
!byte $11
!byte $31
!byte $11
!byte $33
!byte $31
!byte $33
!byte $00
!byte $33
!byte $13
!byte $31
!byte $13
!byte $31
!byte $33
!byte $33
!byte $11
!byte $33
!byte $31
!byte $33
!byte $00
!byte $03 ;data4
!byte $33
!byte $13
!byte $31
!byte $13
!byte $DB,$28 ;addr
!byte $47,$01 ;fill
!byte $07 ;data4
!byte $33
!byte $31
!byte $33
!byte $00
!byte $33
!byte $13
!byte $31
!byte $13
!byte $DB,$40 ;addr
!byte $47,$01 ;fill
!byte $06 ;data4
!byte $33
!byte $31
!byte $33
!byte $00
!byte $33
!byte $13
!byte $31
!byte $8B ;skip
!byte $05 ;data4
!byte $31
!byte $33
!byte $00
!byte $33
!byte $13
!byte $31
!byte $8B ;skip
!byte $05 ;data4
!byte $31
!byte $33
!byte $00
!byte $33
!byte $13
!byte $31
!byte $8B ;skip
!byte $04 ;data4
!byte $31
!byte $33
!byte $00
!byte $33
!byte $13
!byte $DB,$9C ;addr
!byte $4E,$01 ;fill
!byte $03 ;data4
!byte $33
!byte $03
!byte $30
!byte $33
!byte $4E,$01 ;fill
!byte $03 ;data4
!byte $33
!byte $03
!byte $30
!byte $33
!byte $4E,$01 ;fill
!byte $01 ;data4
!byte $33
!byte $03
!byte $DB,$DF ;addr
!byte $58,$00 ;fill
!byte $CE,$AC ;addr
!byte $e2,$ff;mode1
!byte $0E ;data1
!byte $DD
!byte $DB
!byte $00
!byte $94
!byte $92
!byte $80
!byte $D4
!byte $9B
!byte $00
!byte $94
!byte $92
!byte $80
!byte $D4
!byte $9A
!byte $80
!byte $e3 ;run ibpcaa
!byte $e1,5



;,; *_101
;,; <- deps_enterthenextlevel
; method 0 ( bytes ) -- 217 bytes (442 cumu)
; method 1 ( ibpc0 bytes ) -- 238 bytes (463 cumu)
; method 2 ( bytes ) -- 217 bytes (442 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 25 bytes (250 cumu)
; method 4 ( clrscr bytes ) -- 419 bytes (644 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 443 bytes (668 cumu)
; method 6 ( clrscr bytes ) -- 419 bytes (644 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 231 bytes (456 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 320
;,; <- chFFFFFFFFFFFF0000 ; 21
;,; <- chFCFCFCFCFCFCFCFC ; 31
;,; <- ch0000000000000000 ; 67
;,; <- ch3C3C3C3C3C3C3C3C ; 10
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- ch000103070F1F3F7F ; 6
;,; <- ch0000FFFFFFFFFFFF ; 17
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 21
;,; <- ch000018183C3C3C3C ; 2
;,; <- ch3C3C3C3C18180000 ; 1
;,; <- ch00000F3F3F0F0000 ; 1
; total unique chars in pic: 13 (worst case req 104 bytes)
!byte $CE,$A9 ;addr
!byte $14 ;data1
!byte $EF
!byte $7D
!byte $D8
!byte $89
!byte $11
!byte $14
!byte $89
!byte $11
!byte $14
!byte $E9
!byte $11
!byte $D8
!byte $89
!byte $11
!byte $14
!byte $89
!byte $11
!byte $14
!byte $E9
!byte $11
!byte $D4
!byte $e3 ;run ibpcaa
!byte $e1,5



;,; *_102
;,; <- deps_enterthenextlevel
; method 0 ( bytes ) -- 297 bytes (547 cumu)
; method 1 ( ibpc0 bytes ) -- 337 bytes (587 cumu)
; method 2 ( bytes ) -- 297 bytes (547 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 47 bytes (297 cumu)
; method 4 ( clrscr bytes ) -- 503 bytes (753 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 545 bytes (795 cumu)
; method 6 ( clrscr bytes ) -- 503 bytes (753 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 253 bytes (503 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 236
;,; <- chFFFFFFFFFFFF0000 ; 25
;,; <- chFCFCFCFCFCFCFCFC ; 46
;,; <- ch0000000000000000 ; 119
;,; <- ch3F3F3F3F3F3F3F3F ; 42
;,; <- ch0000FFFFFFFF0000 ; 2
;,; <- ch0000FFFFFFFFFFFF ; 21
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- ch000103070F1F3F7F ; 4
;,; <- ch3C3C3C3C3C3C3C3C ; 5
;,; <- ch7F3F1F0F07030100 ; 2
; total unique chars in pic: 11 (worst case req 88 bytes)
!byte $CE,$37 ;addr
!byte $27 ;data1
!byte $FF
!byte $E0
!byte $00
!byte $FF
!byte $E0
!byte $00
!byte $FF
!byte $E0
!byte $00
!byte $0E
!byte $00
!byte $2F
!byte $8E
!byte $3D
!byte $08
!byte $8E
!byte $21
!byte $08
!byte $8E
!byte $21
!byte $08
!byte $8E
!byte $21
!byte $28
!byte $8E
!byte $39
!byte $08
!byte $8E
!byte $21
!byte $08
!byte $8E
!byte $21
!byte $08
!byte $8E
!byte $21
!byte $28
!byte $8E
!byte $3D
!byte $00
!byte $0E
!byte $93 ;skip
!byte $00 ;data1
!byte $E0
!byte $e3 ;run ibpcaa
!byte $e1,5



;,; *_103
;,; <- deps_enterthenextlevel
; method 0 ( bytes ) -- 168 bytes (465 cumu)
; method 1 ( ibpc0 bytes ) -- 181 bytes (478 cumu)
; method 2 ( bytes ) -- 168 bytes (465 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 67 bytes (364 cumu)
; method 4 ( clrscr bytes ) -- 347 bytes (644 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 395 bytes (692 cumu)
; method 6 ( clrscr bytes ) -- 347 bytes (644 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 281 bytes (578 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 182
;,; <- chFFFFFFFFFFFF0000 ; 22
;,; <- chFCFCFCFCFCFCFCFC ; 18
;,; <- ch0000000000000000 ; 242
;,; <- ch3F3F3F3F3F3F3F3F ; 18
;,; <- ch0000FFFFFFFFFFFF ; 20
;,; <- ch0080C0E0F0F8FCFE ; 1
;,; <- ch000103070F1F3F7F ; 1
; total unique chars in pic: 8 (worst case req 64 bytes)
!byte $CE,$19 ;addr
!byte $08 ;data1
!byte $FF
!byte $FF
!byte $FC
!byte $FF
!byte $FF
!byte $FC
!byte $FF
!byte $FF
!byte $FC
!byte $9D ;skip
!byte $2B ;data1
!byte $FF
!byte $E0
!byte $00
!byte $FF
!byte $E0
!byte $00
!byte $FF
!byte $E0
!byte $00
!byte $FF
!byte $E0
!byte $00
!byte $FF
!byte $E0
!byte $00
!byte $FF
!byte $E0
!byte $00
!byte $FF
!byte $E0
!byte $00
!byte $FF
!byte $E0
!byte $00
!byte $FF
!byte $E0
!byte $00
!byte $FF
!byte $E0
!byte $00
!byte $FF
!byte $E0
!byte $00
!byte $FF
!byte $E0
!byte $00
!byte $FF
!byte $E0
!byte $00
!byte $FF
!byte $E0
!byte $00
!byte $FF
!byte $E0
!byte $e3 ;run ibpcaa
!byte $CE,$01 ;addr
!byte $54,chFFFFFFFFFFFF0000 ;fill
!byte $CF,$E7 ;addr
!byte $49,ch0000FFFFFFFFFFFF ;fill
!byte $e1,5



;,; *_104
;,; <- deps_enterthenextlevel
; method 0 ( bytes ) -- 24 bytes (388 cumu)
; method 1 ( ibpc0 bytes ) -- 66 bytes (430 cumu)
; method 2 ( bytes ) -- 24 bytes (388 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 67 bytes (431 cumu)
; method 4 ( clrscr bytes ) -- 204 bytes (568 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 204 bytes (568 cumu)
; method 6 ( clrscr bytes ) -- 204 bytes (568 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 205 bytes (569 cumu)
; METHOD 0 CHOSEN
;,; <- ch0000000000000000 ; 504
; total unique chars in pic: 1 (worst case req 8 bytes)
!byte $CE,$00 ;addr
!byte $6F,ch0000000000000000 ;fill
!byte $95 ;skip
!byte $76,ch0000000000000000 ;fill
!byte $8A ;skip
!byte $7B,ch0000000000000000 ;fill
!byte $8A ;skip
!byte $7B,ch0000000000000000 ;fill
!byte $8A ;skip
!byte $7B,ch0000000000000000 ;fill
!byte $8A ;skip
!byte $7B,ch0000000000000000 ;fill
!byte $8A ;skip
!byte $7F,ch0000000000000000 ;fill
!byte $4B,ch0000000000000000 ;fill
!byte $e1,5



;,; *_105
;,; <- deps_enterthenextlevel
; method 0 ( bytes ) -- 110 bytes (498 cumu)
; method 1 ( ibpc0 bytes ) -- 156 bytes (544 cumu)
; method 2 ( bytes ) -- 110 bytes (498 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 67 bytes (455 cumu)
; method 4 ( clrscr bytes ) -- 294 bytes (682 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 313 bytes (701 cumu)
; method 6 ( clrscr bytes ) -- 294 bytes (682 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 224 bytes (612 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 438
;,; <- chFFFFFFFFFFFF0000 ; 7
;,; <- chFCFCFCFCFCFCFCFC ; 8
;,; <- ch0000000000000000 ; 26
;,; <- ch3C3C3C3C3C3C3C3C ; 8
;,; <- ch3F3F3F3F3F3F3F3F ; 6
;,; <- ch0080C0E0F0F8FCFE ; 1
;,; <- ch000103070F1F3F7F ; 1
;,; <- ch3C3C3C3C18180000 ; 1
;,; <- ch00000F3F3F0F0000 ; 2
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch0000FFFFFFFFFFFF ; 5
; total unique chars in pic: 12 (worst case req 96 bytes)
!byte $CE,$00 ;addr
!byte $3E ;data1
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $01
!byte $D5
!byte $80
!byte $00
!byte $95
!byte $00
!byte $00
!byte $9D
!byte $80
!byte $00
!byte $95
!byte $00
!byte $00
!byte $95
!byte $80
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $e3 ;run ibpcaa
!byte $e1,5



;,; *_106
;,; <- deps_enterthenextlevel
; method 0 ( bytes ) -- 150 bytes (605 cumu)
; method 1 ( ibpc0 bytes ) -- 169 bytes (624 cumu)
; method 2 ( bytes ) -- 150 bytes (605 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 24 bytes (479 cumu)
; method 4 ( clrscr bytes ) -- 350 bytes (805 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 373 bytes (828 cumu)
; method 6 ( clrscr bytes ) -- 350 bytes (805 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 230 bytes (685 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 393
;,; <- chFFFFFFFFFFFF0000 ; 13
;,; <- chFCFCFCFCFCFCFCFC ; 16
;,; <- ch0000000000000000 ; 41
;,; <- ch3C3C3C3C3C3C3C3C ; 8
;,; <- ch3F3F3F3F3F3F3F3F ; 12
;,; <- ch0000FFFFFFFFFFFF ; 11
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- ch000103070F1F3F7F ; 4
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chFEFCF8F0E0C08000 ; 1
; total unique chars in pic: 11 (worst case req 88 bytes)
!byte $CE,$AC ;addr
!byte $13 ;data1
!byte $FA
!byte $2E
!byte $00
!byte $22
!byte $28
!byte $00
!byte $22
!byte $28
!byte $00
!byte $23
!byte $EE
!byte $00
!byte $22
!byte $28
!byte $00
!byte $22
!byte $28
!byte $00
!byte $22
!byte $2E
!byte $e3 ;run ibpcaa
!byte $e1,5



;,; *_107
;,; <- deps_enterthenextlevel
; method 0 ( bytes ) -- 364 bytes (843 cumu)
; method 1 ( ibpc0 bytes ) -- 411 bytes (890 cumu)
; method 2 ( bytes ) -- 364 bytes (843 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 54 bytes (533 cumu)
; method 4 ( clrscr bytes ) -- 566 bytes (1045 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 617 bytes (1096 cumu)
; method 6 ( clrscr bytes ) -- 566 bytes (1045 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 260 bytes (739 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 222
;,; <- chFFFFFFFFFFFF0000 ; 18
;,; <- chFCFCFCFCFCFCFCFC ; 48
;,; <- ch0000000000000000 ; 146
;,; <- ch3F3F3F3F3F3F3F3F ; 44
;,; <- ch000103070F1F3F7F ; 4
;,; <- ch0000FFFFFFFFFFFF ; 16
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chFEFCF8F0E0C08000 ; 1
; total unique chars in pic: 10 (worst case req 80 bytes)
!byte $CE,$37 ;addr
!byte $31 ;data1
!byte $E0
!byte $E0
!byte $00
!byte $E0
!byte $E0
!byte $00
!byte $E0
!byte $E0
!byte $00
!byte $E0
!byte $E7
!byte $3C
!byte $E0
!byte $E4
!byte $10
!byte $E0
!byte $E4
!byte $10
!byte $E0
!byte $E4
!byte $10
!byte $FF
!byte $E4
!byte $10
!byte $FF
!byte $E7
!byte $10
!byte $FF
!byte $E4
!byte $10
!byte $E0
!byte $E4
!byte $10
!byte $E0
!byte $E4
!byte $10
!byte $E0
!byte $E4
!byte $00
!byte $E0
!byte $E7
!byte $00
!byte $E0
!byte $E0
!byte $00
!byte $E0
!byte $E0
!byte $00
!byte $E0
!byte $E0
!byte $e3 ;run ibpcaa
!byte $e1,5



;,; *_108
;,; <- deps_enterthenextlevel
; method 0 ( bytes ) -- 174 bytes (707 cumu)
; method 1 ( ibpc0 bytes ) -- 215 bytes (748 cumu)
; method 2 ( bytes ) -- 174 bytes (707 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 75 bytes (608 cumu)
; method 4 ( clrscr bytes ) -- 359 bytes (892 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 415 bytes (948 cumu)
; method 6 ( clrscr bytes ) -- 359 bytes (892 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 287 bytes (820 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 88
;,; <- chFFFFFFFFFFFF0000 ; 20
;,; <- chFCFCFCFCFCFCFCFC ; 25
;,; <- ch0000000000000000 ; 322
;,; <- ch3F3F3F3F3F3F3F3F ; 25
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- chFEFCF8F0E0C08000 ; 1
;,; <- ch000103070F1F3F7F ; 1
;,; <- ch0000FFFFFFFFFFFF ; 20
;,; <- ch0080C0E0F0F8FCFE ; 1
; total unique chars in pic: 10 (worst case req 80 bytes)
!byte $CE,$19 ;addr
!byte $38 ;data1
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $FF
!byte $FF
!byte $FC
!byte $FF
!byte $FF
!byte $FC
!byte $FF
!byte $FF
!byte $FC
!byte $FF
!byte $FF
!byte $FC
!byte $FF
!byte $FF
!byte $FC
!byte $FF
!byte $FF
!byte $FC
!byte $FF
!byte $FF
!byte $FC
!byte $FF
!byte $FF
!byte $FC
!byte $FF
!byte $FF
!byte $FC
!byte $FF
!byte $FF
!byte $FC
!byte $FF
!byte $FF
!byte $FC
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $e3 ;run ibpcaa
!byte $CE,$01 ;addr
!byte $43,chFFFFFFFFFFFF0000 ;fill
!byte $8B ;skip
!byte $43,chFFFFFFFFFFFF0000 ;fill
!byte $CF,$E1 ;addr
!byte $43,ch0000FFFFFFFFFFFF ;fill
!byte $8B ;skip
!byte $43,ch0000FFFFFFFFFFFF ;fill
!byte $e1,5



;,; *_109
;,; <- deps_enterthenextlevel
; method 0 ( bytes ) -- 22 bytes (630 cumu)
; method 1 ( ibpc0 bytes ) -- 66 bytes (674 cumu)
; method 2 ( bytes ) -- 22 bytes (630 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 67 bytes (675 cumu)
; method 4 ( clrscr bytes ) -- 204 bytes (812 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 204 bytes (812 cumu)
; method 6 ( clrscr bytes ) -- 204 bytes (812 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 205 bytes (813 cumu)
; METHOD 0 CHOSEN
;,; <- ch0000000000000000 ; 504
; total unique chars in pic: 1 (worst case req 8 bytes)
!byte $CE,$00 ;addr
!byte $7F,ch0000000000000000 ;fill
!byte $76,ch0000000000000000 ;fill
!byte $95 ;skip
!byte $70,ch0000000000000000 ;fill
!byte $95 ;skip
!byte $70,ch0000000000000000 ;fill
!byte $95 ;skip
!byte $70,ch0000000000000000 ;fill
!byte $95 ;skip
!byte $7F,ch0000000000000000 ;fill
!byte $7F,ch0000000000000000 ;fill
!byte $4D,ch0000000000000000 ;fill
!byte $e1,5



;,; *_110
;,; <- deps_enterthenextlevel
; method 0 ( bytes ) -- 141 bytes (771 cumu)
; method 1 ( ibpc0 bytes ) -- 186 bytes (816 cumu)
; method 2 ( bytes ) -- 141 bytes (771 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 67 bytes (697 cumu)
; method 4 ( clrscr bytes ) -- 324 bytes (954 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 343 bytes (973 cumu)
; method 6 ( clrscr bytes ) -- 324 bytes (954 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 224 bytes (854 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 412
;,; <- chFFFFFFFFFFFF0000 ; 10
;,; <- chFCFCFCFCFCFCFCFC ; 10
;,; <- ch0000000000000000 ; 35
;,; <- ch3C3C3C3C3C3C3C3C ; 13
;,; <- ch3F3F3F3F3F3F3F3F ; 8
;,; <- ch000018183C3C3C3C ; 2
;,; <- ch00000F3F3F0F0000 ; 3
;,; <- ch3C3C3C3C18180000 ; 1
;,; <- ch0080C0E0F0F8FCFE ; 1
;,; <- ch000103070F1F3F7F ; 1
;,; <- ch0000F0FCFCF00000 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 7
; total unique chars in pic: 13 (worst case req 104 bytes)
!byte $CE,$00 ;addr
!byte $3E ;data1
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $03
!byte $B5
!byte $70
!byte $02
!byte $A5
!byte $20
!byte $02
!byte $B2
!byte $20
!byte $02
!byte $A5
!byte $20
!byte $02
!byte $B5
!byte $20
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $e3 ;run ibpcaa
!byte $e1,5



;,; *_111
;,; <- deps_enterthenextlevel
; method 0 ( bytes ) -- 184 bytes (881 cumu)
; method 1 ( ibpc0 bytes ) -- 204 bytes (901 cumu)
; method 2 ( bytes ) -- 184 bytes (881 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 25 bytes (722 cumu)
; method 4 ( clrscr bytes ) -- 390 bytes (1087 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 414 bytes (1111 cumu)
; method 6 ( clrscr bytes ) -- 390 bytes (1087 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 231 bytes (928 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 356
;,; <- chFFFFFFFFFFFF0000 ; 16
;,; <- chFCFCFCFCFCFCFCFC ; 22
;,; <- ch0000000000000000 ; 54
;,; <- ch3C3C3C3C3C3C3C3C ; 10
;,; <- ch3F3F3F3F3F3F3F3F ; 18
;,; <- ch000103070F1F3F7F ; 6
;,; <- ch0080C0E0F0F8FCFE ; 4
;,; <- ch0000FFFFFFFFFFFF ; 12
;,; <- ch7F3F1F0F07030100 ; 4
;,; <- chFEFCF8F0E0C08000 ; 2
; total unique chars in pic: 11 (worst case req 88 bytes)
!byte $CE,$AC ;addr
!byte $14 ;data1
!byte $F7
!byte $4B
!byte $E0
!byte $94
!byte $48
!byte $80
!byte $94
!byte $30
!byte $80
!byte $97
!byte $30
!byte $80
!byte $94
!byte $30
!byte $80
!byte $94
!byte $48
!byte $80
!byte $97
!byte $48
!byte $80
!byte $e3 ;run ibpcaa
!byte $e1,5



;,; *_112
;,; <- deps_enterthenextlevel
; method 0 ( bytes ) -- 253 bytes (975 cumu)
; method 1 ( ibpc0 bytes ) -- 280 bytes (1002 cumu)
; method 2 ( bytes ) -- 253 bytes (975 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 37 bytes (759 cumu)
; method 4 ( clrscr bytes ) -- 450 bytes (1172 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 479 bytes (1201 cumu)
; method 6 ( clrscr bytes ) -- 450 bytes (1172 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 243 bytes (965 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 303
;,; <- chFFFFFFFFFFFF0000 ; 13
;,; <- chFCFCFCFCFCFCFCFC ; 29
;,; <- ch0000000000000000 ; 95
;,; <- ch3F3F3F3F3F3F3F3F ; 25
;,; <- ch7F3F1F0F07030100 ; 7
;,; <- chFEFCF8F0E0C08000 ; 5
;,; <- ch000103070F1F3F7F ; 7
;,; <- ch0000FFFFFFFFFFFF ; 13
;,; <- ch0080C0E0F0F8FCFE ; 5
;,; <- ch0000F0FCFCF00000 ; 1
;,; <- ch00000F3F3F0F0000 ; 1
; total unique chars in pic: 12 (worst case req 96 bytes)
!byte $CE,$79 ;addr
!byte $20 ;data1
!byte $9F
!byte $02
!byte $04
!byte $9F
!byte $03
!byte $0C
!byte $98
!byte $03
!byte $9C
!byte $98
!byte $01
!byte $F8
!byte $98
!byte $00
!byte $F0
!byte $9E
!byte $30
!byte $60
!byte $98
!byte $00
!byte $F0
!byte $98
!byte $01
!byte $F8
!byte $98
!byte $03
!byte $9C
!byte $9F
!byte $03
!byte $0C
!byte $9F
!byte $02
!byte $04
!byte $e3 ;run ibpcaa
!byte $e1,5



;,; *_113
;,; <- deps_enterthenextlevel
; method 0 ( bytes ) -- 232 bytes (991 cumu)
; method 1 ( ibpc0 bytes ) -- 293 bytes (1052 cumu)
; method 2 ( bytes ) -- 232 bytes (991 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 79 bytes (838 cumu)
; method 4 ( clrscr bytes ) -- 423 bytes (1182 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 466 bytes (1225 cumu)
; method 6 ( clrscr bytes ) -- 423 bytes (1182 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 268 bytes (1027 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 342
;,; <- chFFFFFFFFFFFF0000 ; 16
;,; <- chFCFCFCFCFCFCFCFC ; 26
;,; <- ch0000000000000000 ; 61
;,; <- ch3F3F3F3F3F3F3F3F ; 20
;,; <- ch0000FFFFFFFFFFFF ; 17
;,; <- ch3C3C3C3C3C3C3C3C ; 13
;,; <- ch00000F3F3F0F0000 ; 4
;,; <- ch7F3F1F0F07030100 ; 2
;,; <- ch3C3C3C3C18180000 ; 1
;,; <- ch0080C0E0F0F8FCFE ; 1
;,; <- ch000103070F1F3F7F ; 1
; total unique chars in pic: 12 (worst case req 96 bytes)
!byte $CE,$19 ;addr
!byte $08 ;data1
!byte $C0
!byte $00
!byte $0C
!byte $C0
!byte $00
!byte $0C
!byte $C0
!byte $00
!byte $0C
!byte $97 ;skip
!byte $20 ;data1
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $09
!byte $AB
!byte $40
!byte $09
!byte $2A
!byte $40
!byte $09
!byte $AB
!byte $40
!byte $09
!byte $2A
!byte $40
!byte $0D
!byte $93
!byte $60
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $97 ;skip
!byte $08 ;data1
!byte $C0
!byte $00
!byte $0C
!byte $C0
!byte $00
!byte $0C
!byte $C0
!byte $00
!byte $0C
!byte $e3 ;run ibpcaa
!byte $CE,$01 ;addr
!byte $e2,0;mode8
!byte $01 ;data8
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFF0000
!byte $91 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFF0000
!byte $CF,$E1 ;addr
!byte $01 ;data8
!byte ch0000FFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte $91 ;skip
!byte $01 ;data8
!byte ch0000FFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte $e1,5



;,; *_114
;,; <- deps_enterthenextlevel
; method 0 ( bytes ) -- 227 bytes (1065 cumu)
; method 1 ( ibpc0 bytes ) -- 278 bytes (1116 cumu)
; method 2 ( bytes ) -- 227 bytes (1065 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 58 bytes (896 cumu)
; method 4 ( clrscr bytes ) -- 422 bytes (1260 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 448 bytes (1286 cumu)
; method 6 ( clrscr bytes ) -- 422 bytes (1260 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 231 bytes (1069 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 348
;,; <- chFFFFFFFFFFFF0000 ; 14
;,; <- chFCFCFCFCFCFCFCFC ; 28
;,; <- ch0000000000000000 ; 55
;,; <- ch3F3F3F3F3F3F3F3F ; 18
;,; <- ch3C3C3C3C3C3C3C3C ; 9
;,; <- ch000103070F1F3F7F ; 6
;,; <- ch0000FFFFFFFFFFFF ; 15
;,; <- ch7F3F1F0F07030100 ; 7
;,; <- chFEFCF8F0E0C08000 ; 1
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- ch3C3C3C3C18180000 ; 1
; total unique chars in pic: 12 (worst case req 96 bytes)
!byte $CE,$19 ;addr
!byte $e2,$ff;mode1
!byte $08 ;data1
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $CE,$C2 ;addr
!byte $14 ;data1
!byte $8E
!byte $8B
!byte $A0
!byte $88
!byte $8A
!byte $20
!byte $88
!byte $8A
!byte $20
!byte $8C
!byte $8B
!byte $20
!byte $88
!byte $8A
!byte $20
!byte $88
!byte $52
!byte $20
!byte $EE
!byte $23
!byte $B8
!byte $AE ;skip
!byte $08 ;data1
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $e3 ;run ibpcaa
!byte $CE,$01 ;addr
!byte $54,chFFFFFFFFFFFFFFFF ;fill
!byte $CF,$E1 ;addr
!byte $54,chFFFFFFFFFFFFFFFF ;fill
!byte $e1,5



;,; *_115
;,; <- deps_enterthenextlevel
; method 0 ( bytes ) -- 337 bytes (1233 cumu)
; method 1 ( ibpc0 bytes ) -- 378 bytes (1274 cumu)
; method 2 ( bytes ) -- 337 bytes (1233 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 78 bytes (974 cumu)
; method 4 ( clrscr bytes ) -- 538 bytes (1434 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 591 bytes (1487 cumu)
; method 6 ( clrscr bytes ) -- 538 bytes (1434 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 284 bytes (1180 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 245
;,; <- chFFFFFFFFFFFF0000 ; 18
;,; <- chFCFCFCFCFCFCFCFC ; 30
;,; <- ch0000000000000000 ; 141
;,; <- ch3F3F3F3F3F3F3F3F ; 26
;,; <- ch3C3C3C3C3C3C3C3C ; 10
;,; <- ch0000FFFFFFFFFFFF ; 14
;,; <- ch000103070F1F3F7F ; 7
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- ch0080C0E0F0F8FCFE ; 5
; total unique chars in pic: 11 (worst case req 88 bytes)
!byte $CE,$1E ;addr
!byte $36 ;data1
!byte $E0
!byte $38
!byte $00
!byte $E0
!byte $38
!byte $00
!byte $E0
!byte $38
!byte $00
!byte $E0
!byte $38
!byte $1C
!byte $E0
!byte $3B
!byte $80
!byte $E0
!byte $3A
!byte $00
!byte $E0
!byte $3A
!byte $00
!byte $E0
!byte $3A
!byte $00
!byte $E0
!byte $3A
!byte $10
!byte $E0
!byte $3B
!byte $00
!byte $E0
!byte $3A
!byte $00
!byte $E0
!byte $3A
!byte $00
!byte $E0
!byte $3A
!byte $00
!byte $F0
!byte $7A
!byte $1C
!byte $78
!byte $F3
!byte $80
!byte $3F
!byte $E0
!byte $00
!byte $1F
!byte $C0
!byte $00
!byte $0F
!byte $80
!byte $00
!byte $07
!byte $e3 ;run ibpcaa
!byte $CE,$06 ;addr
!byte $e2,0;mode8
!byte $02 ;data8
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFF0000
!byte $86 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFF0000
!byte $CF,$EB ;addr
!byte $02 ;data8
!byte ch0000FFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte $e1,5



;,; *_116
;,; <- deps_enterthenextlevel
; method 0 ( bytes ) -- 270 bytes (1244 cumu)
; method 1 ( ibpc0 bytes ) -- 311 bytes (1285 cumu)
; method 2 ( bytes ) -- 270 bytes (1244 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 81 bytes (1055 cumu)
; method 4 ( clrscr bytes ) -- 449 bytes (1423 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 473 bytes (1447 cumu)
; method 6 ( clrscr bytes ) -- 449 bytes (1423 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 281 bytes (1255 cumu)
; METHOD 3 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 218
;,; <- chFFFFFFFFFFFF0000 ; 10
;,; <- chFCFCFCFCFCFCFCFC ; 38
;,; <- ch0000000000000000 ; 190
;,; <- ch3F3F3F3F3F3F3F3F ; 38
;,; <- ch0000FFFFFFFFFFFF ; 10
; total unique chars in pic: 6 (worst case req 48 bytes)
!byte $CE,$19 ;addr
!byte $e2,$ff;mode1
!byte $38 ;data1
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $F8
!byte $00
!byte $7C
!byte $e3 ;run ibpcaa
!byte $CE,$01 ;addr
!byte $43,chFFFFFFFFFFFF0000 ;fill
!byte $4A,chFFFFFFFFFFFFFFFF ;fill
!byte $43,chFFFFFFFFFFFF0000 ;fill
!byte $CF,$E1 ;addr
!byte $43,ch0000FFFFFFFFFFFF ;fill
!byte $84 ;skip
!byte $41,chFFFFFFFFFFFFFFFF ;fill
!byte $83 ;skip
!byte $43,ch0000FFFFFFFFFFFF ;fill
!byte $e1,5



;,; *_117
;,; <- deps_enterthenextlevel
; method 0 ( bytes ) -- 24 bytes (1079 cumu)
; method 1 ( ibpc0 bytes ) -- 85 bytes (1140 cumu)
; method 2 ( bytes ) -- 24 bytes (1079 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 69 bytes (1124 cumu)
; method 4 ( clrscr bytes ) -- 204 bytes (1259 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 204 bytes (1259 cumu)
; method 6 ( clrscr bytes ) -- 204 bytes (1259 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 205 bytes (1260 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 504
; total unique chars in pic: 1 (worst case req 8 bytes)
!byte $CE,$01 ;addr
!byte $7F,chFFFFFFFFFFFFFFFF ;fill
!byte $7B,chFFFFFFFFFFFFFFFF ;fill
!byte $89 ;skip
!byte $7C,chFFFFFFFFFFFFFFFF ;fill
!byte $89 ;skip
!byte $7C,chFFFFFFFFFFFFFFFF ;fill
!byte $89 ;skip
!byte $7C,chFFFFFFFFFFFFFFFF ;fill
!byte $89 ;skip
!byte $7C,chFFFFFFFFFFFFFFFF ;fill
!byte $89 ;skip
!byte $7B,chFFFFFFFFFFFFFFFF ;fill
!byte $8B ;skip
!byte $43,chFFFFFFFFFFFFFFFF ;fill
!byte $e1,5+6

; total compressed size 1079 bytes
