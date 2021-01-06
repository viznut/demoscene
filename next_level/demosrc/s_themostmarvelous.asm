;,; lyrics_themostmarvelous .withinpagefrom=lyrics
;,; <- lyrics

        !byte $1d,$1a			; THE
	!byte $18,$60,$24,$09		; MOS(T)
	!byte $28,$4a			; MAR
	!byte $26,$23			; VE
	!byte $27,$20,$24,$19		; LOUS
	!byte $1d,$21,$02		; THING
	!byte $21,$66			; YOU
	!byte $67			; 'LL
	!byte $c3			; E
	!byte $26,$ca			; VER
	!byte $54,$43,$41,$44		; FACE
        !byte $0f

;,; deps_themostmarvelous
;,; <- ibpcaablocks
;,; <- lyrics_themostmarvelous

;,; SC21_000
;,; <- deps_themostmarvelous
;,; <- player_ivars
!src "demosrc/smac.inc"
+s8bpc
+sAddr nextlyrictosing
!byte $00,lyrics_themostmarvelous-lyrics

; method 0 ( bytes ) -- 316 bytes (1088 cumu)
; method 1 ( ibpc0 bytes ) -- 353 bytes (1125 cumu)
; method 2 ( bytes ) -- 316 bytes (1088 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 342 bytes (1114 cumu)
; method 4 ( clrscr bytes ) -- 263 bytes (1035 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 288 bytes (1060 cumu)
; method 6 ( clrscr bytes ) -- 263 bytes (1035 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 280 bytes (1052 cumu)
; METHOD 4 CHOSEN
!byte $e4,4,chFFFFFFFFFFFFFFFF ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 278
;,; <- ch00101000D6001010 ; 5
;,; <- chFFFFFFFFFFFFFFFE ; 1
;,; <- chFEFCF8F0E0C08000 ; 5
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- ch0000000000000000 ; 97
;,; <- chFFFFFFFFFFFF0000 ; 16
;,; <- chFCFCFCFCFCFCFCFC ; 10
;,; <- chFCFC303030303030 ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 7
;,; <- chFCFCE0C0C0C0C0C0 ; 11
;,; <- chFEFEDED6D6D6D6D6 ; 2
;,; <- chFCFCDCCCCCCCCCCC ; 12
;,; <- ch3030303030303030 ; 5
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chCCCCCCCCCCECFCFC ; 7
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- chC0C0C0C0C0C0C0C0 ; 4
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chCCCCCCCC78783030 ; 2
;,; <- chC0C0C0C0C0E0FCFC ; 5
;,; <- ch303030303030FCFC ; 1
;,; <- ch0000FFFFFFFFFFFF ; 16
; total unique chars in pic: 24 (worst case req 192 bytes)
!byte $DA,$00 ;addr
!byte $48,$00 ;fill
!byte $e2,1;mode4
!byte $00 ;data4
!byte $05
!byte $DA,$0B ;addr
!byte $69,$00 ;fill
!byte $00 ;data4
!byte $06
!byte $DA,$37 ;addr
!byte $50,$00 ;fill
!byte $00 ;data4
!byte $01
!byte $DA,$4A ;addr
!byte $4B,$00 ;fill
!byte $02 ;data4
!byte $02
!byte $00
!byte $70
!byte $59,$00 ;fill
!byte $56,$06 ;fill
!byte $DB,$11 ;addr
!byte $03 ;data4
!byte $99
!byte $19
!byte $11
!byte $14
!byte $DB,$18 ;addr
!byte $46,$01 ;fill
!byte $88 ;skip
!byte $03 ;data4
!byte $99
!byte $19
!byte $11
!byte $14
!byte $DB,$30 ;addr
!byte $46,$01 ;fill
!byte $96 ;skip
!byte $00 ;data4
!byte $41
!byte $86 ;skip
!byte $48,$01 ;fill
!byte $02 ;data4
!byte $14
!byte $11
!byte $11
!byte $87 ;skip
!byte $48,$01 ;fill
!byte $02 ;data4
!byte $14
!byte $11
!byte $11
!byte $87 ;skip
!byte $02 ;data4
!byte $41
!byte $44
!byte $14
!byte $91 ;skip
!byte $4E,$01 ;fill
!byte $87 ;skip
!byte $4E,$01 ;fill
!byte $CE,$0A ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch00101000D6001010
!byte $AA ;skip
!byte $00 ;data8
!byte ch00101000D6001010
!byte $91 ;skip
!byte $00 ;data8
!byte ch00101000D6001010
!byte $8C ;skip
!byte $00 ;data8
!byte ch00101000D6001010
!byte $83 ;skip
!byte $00 ;data8
!byte ch00101000D6001010
!byte $8A ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFE
!byte $96 ;skip
!byte $01 ;data8
!byte chFEFCF8F0E0C08000
!byte ch7F3F1F0F07030100
!byte $88 ;skip
!byte $01 ;data8
!byte chFEFCF8F0E0C08000
!byte ch7F3F1F0F07030100
!byte $89 ;skip
!byte $03 ;data8
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte $86 ;skip
!byte $03 ;data8
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte $87 ;skip
!byte $00 ;data8
!byte chFEFCF8F0E0C08000
!byte $42,ch0000000000000000 ;fill
!byte $00 ;data8
!byte ch7F3F1F0F07030100
!byte $AB ;skip
!byte $4E,chFFFFFFFFFFFF0000 ;fill
!byte $86 ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $4E,ch0000000000000000 ;fill
!byte $86 ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $42,ch0000000000000000 ;fill
!byte $07 ;data8
!byte chFCFC303030303030
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chFEFEDED6D6D6D6D6
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFC303030303030
!byte $42,ch0000000000000000 ;fill
!byte $86 ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $42,ch0000000000000000 ;fill
!byte $07 ;data8
!byte ch3030303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000000000
!byte chC6C6C6C6C6C6C6C6
!byte chCCCCCCCCCCECFCFC
!byte chFCFC1C0C0C1CFCFC
!byte ch3030303030303030
!byte $42,ch0000000000000000 ;fill
!byte $86 ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $4E,ch0000000000000000 ;fill
!byte $86 ;skip
!byte $10 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte chFEFEDED6D6D6D6D6
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chC0C0C0C0C0C0C0C0
!byte chC0C0C0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chCCCCCCCCCCCCCCCC
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte $86 ;skip
!byte $10 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCDCCCCCCCCCCC
!byte chF0F8CCCCCCCCCCCC
!byte chCCCCCCCC78783030
!byte chFCFCE0C0C0E0FCFC
!byte chC0C0C0C0C0E0FCFC
!byte chC0C0C0C0C0E0FCFC
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCECFCFC
!byte chFCFC1C0C0C1CFCFC
!byte ch0000000000000000
!byte ch3030303030303030
!byte chFCFCDCCCCCCCCCCC
!byte ch303030303030FCFC
!byte chCCCCCCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte $86 ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $4E,ch0000000000000000 ;fill
!byte $86 ;skip
!byte $10 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte chCCCCCCCCCCECFCFC
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte ch3030303030303030
!byte chC0C0C0C0C0C0C0C0
!byte chC0C0C0C0C0C0C0C0
!byte ch0000000000000000
!byte chFCFCE0C0C0C0C0C0
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte $86 ;skip
!byte $10 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch3030303030303030
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCECFCFC
!byte ch0000000000000000
!byte chC0C0C0C0C0E0FCFC
!byte chC0C0C0C0C0E0FCFC
!byte ch0000000000000000
!byte chFCFCE0C0C0E0FCFC
!byte chCCCCCCCC78783030
!byte chFCFCE0C0C0E0FCFC
!byte chF0F8CCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chC0C0C0C0C0E0FCFC
!byte chFCFCE0C0C0E0FCFC
!byte $86 ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $4E,ch0000000000000000 ;fill
!byte $87 ;skip
!byte $4E,ch0000FFFFFFFFFFFF ;fill
!byte $e1,48

;,; *_001
;,; <- deps_themostmarvelous
; method 0 ( bytes ) -- 60 bytes (1095 cumu)
; method 1 ( ibpc0 bytes ) -- 78 bytes (1113 cumu)
; method 2 ( bytes ) -- 60 bytes (1095 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 112 bytes (1147 cumu)
; method 4 ( clrscr bytes ) -- 290 bytes (1325 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 322 bytes (1357 cumu)
; method 6 ( clrscr bytes ) -- 290 bytes (1325 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 285 bytes (1320 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 251
;,; <- ch00101000D6001010 ; 5
;,; <- chFFFFFFFFFFFFFFFE ; 1
;,; <- chFEFCF8F0E0C08000 ; 5
;,; <- ch7F3F1F0F07030100 ; 7
;,; <- ch0000000000000000 ; 113
;,; <- chFFFFFFFFFFFF0000 ; 17
;,; <- chFCFCFCFCFCFCFCFC ; 10
;,; <- chFCFC303030303030 ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 7
;,; <- chFCFCE0C0C0C0C0C0 ; 11
;,; <- chFEFEDED6D6D6D6D6 ; 2
;,; <- chFCFCDCCCCCCCCCCC ; 12
;,; <- ch0000207070707020 ; 1
;,; <- ch3030303030303030 ; 5
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chCCCCCCCCCCECFCFC ; 7
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 5
;,; <- chC0C0C0C0C0C0C0C0 ; 4
;,; <- ch000F1F3F7F7F3F0F ; 1
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chCCCCCCCC78783030 ; 2
;,; <- chC0C0C0C0C0E0FCFC ; 5
;,; <- ch303030303030FCFC ; 1
;,; <- ch0F0F0F0F0F0F0F0F ; 1
;,; <- ch0000FFFFFFFFFFFF ; 16
; total unique chars in pic: 28 (worst case req 224 bytes)
!byte $DB,$21 ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $41
!byte $CE,$D8 ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte chFFFFFFFFFFFF0000
!byte $96 ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte $95 ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte $95 ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte ch0000207070707020
!byte $95 ;skip
!byte $02 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $94 ;skip
!byte $02 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $94 ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte ch000F1F3F7F7F3F0F
!byte $95 ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte ch0F0F0F0F0F0F0F0F
!byte $95 ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $95 ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte $95 ;skip
!byte $02 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $94 ;skip
!byte $02 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $e1,12



;,; *_002
;,; <- deps_themostmarvelous
; method 0 ( bytes ) -- 97 bytes (1192 cumu)
; method 1 ( ibpc0 bytes ) -- 120 bytes (1215 cumu)
; method 2 ( bytes ) -- 97 bytes (1192 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 144 bytes (1239 cumu)
; method 4 ( clrscr bytes ) -- 331 bytes (1426 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 355 bytes (1450 cumu)
; method 6 ( clrscr bytes ) -- 331 bytes (1426 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 304 bytes (1399 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 231
;,; <- ch00101000D6001010 ; 5
;,; <- chFFFFFFFFFFFFFFFE ; 1
;,; <- chFEFCF8F0E0C08000 ; 8
;,; <- ch7F3F1F0F07030100 ; 7
;,; <- ch0000000000000000 ; 122
;,; <- chFFFFFFFFFFFF0000 ; 17
;,; <- chFCFCFCFCFCFCFCFC ; 16
;,; <- chFCFC303030303030 ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 7
;,; <- chFCFCE0C0C0C0C0C0 ; 11
;,; <- chFEFEDED6D6D6D6D6 ; 2
;,; <- chFCFCDCCCCCCCCCCC ; 12
;,; <- ch0000207070707020 ; 1
;,; <- ch3030303030303030 ; 5
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chCCCCCCCCCCECFCFC ; 7
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 5
;,; <- chC0C0C0C0C0C0C0C0 ; 4
;,; <- ch000F1F3F7F7F3F0F ; 1
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chCCCCCCCC78783030 ; 2
;,; <- chC0C0C0C0C0E0FCFC ; 5
;,; <- ch303030303030FCFC ; 1
;,; <- ch0F0F0F0F0F0F0F0F ; 1
;,; <- ch0000FFFFFFFFFFFF ; 16
; total unique chars in pic: 29 (worst case req 232 bytes)
!byte $DB,$21 ;addr
!byte $e2,1;mode4
!byte $01 ;data4
!byte $44
!byte $14
!byte $CE,$D8 ;addr
!byte $e2,0;mode8
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFF0000
!byte $93 ;skip
!byte $04 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte $92 ;skip
!byte $04 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte $92 ;skip
!byte $04 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000207070707020
!byte $92 ;skip
!byte $05 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $91 ;skip
!byte $05 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $91 ;skip
!byte $04 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch000F1F3F7F7F3F0F
!byte $92 ;skip
!byte $04 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte ch0000000000000000
!byte ch0F0F0F0F0F0F0F0F
!byte $92 ;skip
!byte $04 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $92 ;skip
!byte $04 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte $92 ;skip
!byte $05 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $91 ;skip
!byte $05 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $e1,1

;,; *_003

!byte $e1,131
