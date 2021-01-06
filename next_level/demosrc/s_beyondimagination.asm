;,; lyrics_beyondimagination .withinpagefrom=lyrics
;,; <- lyrics

	!byte $1b,$31			; BEY
	!byte $00,$22,$19,$1d		; OND
	!byte $21			; I
	!byte $28,$43			; MA
	!byte $29,$1d,$24,$21		; GI
	!byte $22,$23,$21		; NA
	!byte $24,$20,$02		; TION

	!byte $1b,$51			; BEY
	!byte $80,$32,$19,$1d		; OND
	!byte $31			; I
	!byte $28,$73			; MA
	!byte $29,$1d,$34,$51		; GI
	!byte $22,$53,$51		; NA
	!byte $44,$30,$42		; TION

        !byte $0f

;,; deps_beyondimagination
;,; <- ibpcaablocks
;,; <- lyrics_beyondimagination

;,; SC23_000
;,; <- deps_beyondimagination
;,; <- player_ivars
!src "demosrc/smac.inc"
+s8bpc
+sAddr nextlyrictosing
!byte $00,lyrics_beyondimagination-lyrics


; method 4 ( clrscr bytes ) -- 326 bytes (326 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 365 bytes (365 cumu)
; method 6 ( clrscr bytes ) -- 326 bytes (326 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 288 bytes (288 cumu)
; METHOD 7 CHOSEN
!byte $e4,2,ch0000000000000000 ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 137
;,; <- chFEFCF8F0E0C08000 ; 13
;,; <- ch0000000000000000 ; 203
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 2
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFFFFFFFFF8F8F8F0 ; 2
;,; <- chFFFFFFFFFFFF7F3F ; 2
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- ch3030303030303030 ; 2
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- chF0E0E0E0E0F0E0E0 ; 2
;,; <- ch1F1F0F0F07030003 ; 2
;,; <- chFFFFFFFFFFFF7F83 ; 2
;,; <- chFFFFFFFFFFFFFF7F ; 2
;,; <- chE0E0E8E0E0C0C0A0 ; 2
;,; <- ch0100000000000000 ; 2
;,; <- chFCFE7C611B270F1F ; 2
;,; <- ch0F1F1FBFBF7F7F7F ; 2
;,; <- chFCFC303030303030 ; 4
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- ch2060000060000020 ; 2
;,; <- ch0E06050503030301 ; 2
;,; <- ch303030303030FCFC ; 3
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- ch0000000000600000 ; 2
;,; <- ch0000C0F0F8FCF3F1 ; 2
;,; <- ch0000000000000080 ; 2
;,; <- chFFFFFF7F3F3F3F3F ; 2
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- chFCFCFCFCFCFCFCFC ; 12
;,; <- ch7F3F1F0F07030100 ; 9
;,; <- chFFFFFFFFFFFF0000 ; 5
;,; <- chFC7F3F0000000000 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 37
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3C3C3C3C18180000 ; 1
;,; <- ch000103070F1F3F7F ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 3
;,; <- ch0101010101010101 ; 2
;,; <- chFF88888888FF0000 ; 9
;,; <- ch3C3C3C3C3C3C3C3C ; 1
; total unique chars in pic: 44 (worst case req 352 bytes)
!byte $DA,$10 ;addr
!byte $46,$01 ;fill
!byte $90 ;skip
!byte $45,$01 ;fill
!byte $8E ;skip
!byte $46,$01 ;fill
!byte $8D ;skip
!byte $49,$01 ;fill
!byte $8C ;skip
!byte $49,$01 ;fill
!byte $DA,$C9 ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $21
!byte $95 ;skip
!byte $00 ;data4
!byte $21
!byte $9F ;skip
!byte $02 ;data4
!byte $25
!byte $22
!byte $72
!byte $DB,$08 ;addr
!byte $7F,$07 ;fill
!byte $7F,$07 ;fill
!byte $7F,$07 ;fill
!byte $53,$07 ;fill
!byte $57,$00 ;fill
!byte $CE,$00 ;addr
!byte $e2,$ff;mode1
!byte $3E ;data1
!byte $00
!byte $01
!byte $C0
!byte $00
!byte $03
!byte $C0
!byte $00
!byte $07
!byte $FF
!byte $00
!byte $08
!byte $00
!byte $04
!byte $48
!byte $00
!byte $00
!byte $07
!byte $FF
!byte $0C
!byte $C0
!byte $00
!byte $0F
!byte $E0
!byte $00
!byte $1F
!byte $B0
!byte $00
!byte $3F
!byte $B8
!byte $00
!byte $3F
!byte $FC
!byte $18
!byte $3F
!byte $FC
!byte $3C
!byte $3F
!byte $80
!byte $00
!byte $3F
!byte $80
!byte $00
!byte $3F
!byte $83
!byte $33
!byte $1F
!byte $F0
!byte $00
!byte $1F
!byte $F7
!byte $FF
!byte $1F
!byte $87
!byte $FF
!byte $3F
!byte $87
!byte $FF
!byte $7F
!byte $C7
!byte $FF
!byte $00
!byte $00
!byte $00
!byte $e3 ;run ibpcaa
!byte $CE,$0E ;addr
!byte $e2,0;mode8
!byte $09 ;data8
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte chF0F8CCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chCCCCCCCCCCECFCFC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chF0F8CCCCCCCCCCCC
!byte $83 ;skip
!byte $05 ;data8
!byte chFFFFFFFFF8F8F8F0
!byte chFFFFFFFFFFFF7F3F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFF8F8F8F0
!byte chFFFFFFFFFFFF7F3F
!byte $87 ;skip
!byte $05 ;data8
!byte chFCFCCCCCCCDCFCFC
!byte chFCFCE0C0C0E0FCFC
!byte ch3030303030303030
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte $83 ;skip
!byte $07 ;data8
!byte chF0E0E0E0E0F0E0E0
!byte ch1F1F0F0F07030003
!byte chFFFFFFFFFFFF7F83
!byte chFFFFFFFFFFFFFF7F
!byte chF0E0E0E0E0F0E0E0
!byte ch1F1F0F0F07030003
!byte chFFFFFFFFFFFF7F83
!byte chFFFFFFFFFFFFFF7F
!byte $8B ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $16 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chE0E0E8E0E0C0C0A0
!byte ch0100000000000000
!byte chFCFE7C611B270F1F
!byte ch0F1F1FBFBF7F7F7F
!byte chE0E0E8E0E0C0C0A0
!byte ch0100000000000000
!byte chFCFE7C611B270F1F
!byte ch0F1F1FBFBF7F7F7F
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chFEFEDED6D6D6D6D6
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFC303030303030
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte $83 ;skip
!byte $13 ;data8
!byte ch2060000060000020
!byte ch0000000000000000
!byte ch0E06050503030301
!byte chFFFFFFFFFFFFFFFF
!byte ch2060000060000020
!byte ch0000000000000000
!byte ch0E06050503030301
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch303030303030FCFC
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte ch303030303030FCFC
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte ch3030303030303030
!byte ch303030303030FCFC
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCCCCCCC
!byte $83 ;skip
!byte $07 ;data8
!byte ch0000000000600000
!byte ch0000C0F0F8FCF3F1
!byte ch0000000000000080
!byte chFFFFFF7F3F3F3F3F
!byte ch0000000000600000
!byte ch0000C0F0F8FCF3F1
!byte ch0000000000000080
!byte chFFFFFF7F3F3F3F3F
!byte $8B ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFF0000
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFC7F3F0000000000
!byte $CE,$EB ;addr
!byte $01 ;data8
!byte chFEFCF8F0E0C08000
!byte ch7F3F1F0F07030100
!byte $90 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $96 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte $83 ;skip
!byte $00 ;data8
!byte ch7F3F1F0F07030100
!byte $92 ;skip
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $8F ;skip
!byte $48,chFFFFFFFFFFFFFFFF ;fill
!byte $8C ;skip
!byte $0B ;data8
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte $8B ;skip
!byte $0A ;data8
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte $97 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $96 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $96 ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $97 ;skip
!byte $47,ch0000FFFFFFFFFFFF ;fill
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $49,ch0000FFFFFFFFFFFF ;fill
!byte $e1,11

;,; *_001 .waits=12
;,; <- deps_beyondimagination
;,; <- streamvars

!byte 0xD0,loopctr,0,2	; set loopctr

.loop:

; method 0 ( bytes ) -- 46 bytes (334 cumu)
; method 1 ( ibpc0 bytes ) -- 58 bytes (346 cumu)
; method 2 ( bytes ) -- 46 bytes (334 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 129 bytes (417 cumu)
; method 4 ( clrscr bytes ) -- 325 bytes (613 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 366 bytes (654 cumu)
; method 6 ( clrscr bytes ) -- 325 bytes (613 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 288 bytes (576 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 136
;,; <- chFEFCF8F0E0C08000 ; 13
;,; <- ch0000000000000000 ; 204
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 2
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFFFFFFFFF8F8F8F0 ; 2
;,; <- chFFFFFFFFFFFF7F3F ; 2
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- ch3030303030303030 ; 2
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- chF0E0E0E0E0F0E0E0 ; 2
;,; <- ch1F1F0F0F07030003 ; 2
;,; <- chFFFFFFFFFFFF7F83 ; 2
;,; <- chFFFFFFFFFFFFFF7F ; 2
;,; <- chE0E0E8E0E0C0C0A0 ; 2
;,; <- ch0100000000000000 ; 2
;,; <- chFCFE7C611B270F1F ; 2
;,; <- ch0F1F1FBFBF7F7F7F ; 2
;,; <- chFCFC303030303030 ; 4
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- ch2060000060000020 ; 2
;,; <- ch0E06050503030301 ; 2
;,; <- ch303030303030FCFC ; 3
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- ch0000000000600000 ; 2
;,; <- ch0000C0F0F8FCF3F1 ; 2
;,; <- ch0000000000000080 ; 2
;,; <- chFFFFFF7F3F3F3F3F ; 2
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- chFCFCFCFCFCFCFCFC ; 11
;,; <- ch7F3F1F0F07030100 ; 8
;,; <- chFFFFFFFFFFFF0000 ; 6
;,; <- chFC7F3F0000000000 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 36
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3C3C3C3C18180000 ; 1
;,; <- ch000103070F1F3F7F ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 3
;,; <- ch0101010101010101 ; 3
;,; <- chFF88888888FF0000 ; 9
;,; <- ch3C3C3C3C3C3C3C3C ; 2
; total unique chars in pic: 44 (worst case req 352 bytes)
!byte $CF,$59 ;addr
!byte $0E ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte $88 ;skip
!byte $0E ;data8
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte $A0 ;skip
!byte $03 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3C3C3C3C3C3C3C3C
!byte $93 ;skip
!byte $02 ;data8
!byte ch0000000000000000
!byte ch000103070F1F3F7F
!byte ch0000FFFFFFFFFFFF
!byte $e1,11



; method 0 ( bytes ) -- 52 bytes (386 cumu)
; method 1 ( ibpc0 bytes ) -- 68 bytes (402 cumu)
; method 2 ( bytes ) -- 52 bytes (386 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 146 bytes (480 cumu)
; method 4 ( clrscr bytes ) -- 330 bytes (664 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 371 bytes (705 cumu)
; method 6 ( clrscr bytes ) -- 330 bytes (664 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 297 bytes (631 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 134
;,; <- chFEFCF8F0E0C08000 ; 14
;,; <- ch0000000000000000 ; 203
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 2
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFFFFFFFFF8F8F8F0 ; 2
;,; <- chFFFFFFFFFFFF7F3F ; 2
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- ch3030303030303030 ; 2
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- chF0E0E0E0E0F0E0E0 ; 2
;,; <- ch1F1F0F0F07030003 ; 2
;,; <- chFFFFFFFFFFFF7F83 ; 2
;,; <- chFFFFFFFFFFFFFF7F ; 2
;,; <- chE0E0E8E0E0C0C0A0 ; 2
;,; <- ch0100000000000000 ; 2
;,; <- chFCFE7C611B270F1F ; 2
;,; <- ch0F1F1FBFBF7F7F7F ; 2
;,; <- chFCFC303030303030 ; 4
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- ch2060000060000020 ; 2
;,; <- ch0E06050503030301 ; 2
;,; <- ch303030303030FCFC ; 3
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- ch0000000000600000 ; 2
;,; <- ch0000C0F0F8FCF3F1 ; 2
;,; <- ch0000000000000080 ; 2
;,; <- chFFFFFF7F3F3F3F3F ; 2
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- chFCFCFCFCFCFCFCFC ; 12
;,; <- ch7F3F1F0F07030100 ; 9
;,; <- chFFFFFFFFFFFF0000 ; 5
;,; <- chFC7F3F0000000000 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 37
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3C3C3C3C18180000 ; 1
;,; <- ch000103070F1F3F7F ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 3
;,; <- ch0101010101010101 ; 3
;,; <- chFF88888888FF0000 ; 10
;,; <- ch3C3C3C3C3C3C3C3C ; 1
; total unique chars in pic: 44 (worst case req 352 bytes)
!byte $CF,$42 ;addr
!byte $03 ;data8
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte $92 ;skip
!byte $0E ;data8
!byte ch7F3F1F0F07030100
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte $88 ;skip
!byte $0E ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte $A0 ;skip
!byte $03 ;data8
!byte ch000103070F1F3F7F
!byte ch0000FFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte $93 ;skip
!byte $02 ;data8
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $e1,11



; method 0 ( bytes ) -- 52 bytes (438 cumu)
; method 1 ( ibpc0 bytes ) -- 65 bytes (451 cumu)
; method 2 ( bytes ) -- 52 bytes (438 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 143 bytes (529 cumu)
; method 4 ( clrscr bytes ) -- 326 bytes (712 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 365 bytes (751 cumu)
; method 6 ( clrscr bytes ) -- 326 bytes (712 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 294 bytes (680 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 141
;,; <- chFEFCF8F0E0C08000 ; 13
;,; <- ch0000000000000000 ; 205
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 2
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFFFFFFFFF8F8F8F0 ; 2
;,; <- chFFFFFFFFFFFF7F3F ; 2
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- ch3030303030303030 ; 2
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- chF0E0E0E0E0F0E0E0 ; 2
;,; <- ch1F1F0F0F07030003 ; 2
;,; <- chFFFFFFFFFFFF7F83 ; 2
;,; <- chFFFFFFFFFFFFFF7F ; 2
;,; <- chE0E0E8E0E0C0C0A0 ; 2
;,; <- ch0100000000000000 ; 2
;,; <- chFCFE7C611B270F1F ; 2
;,; <- ch0F1F1FBFBF7F7F7F ; 2
;,; <- chFCFC303030303030 ; 4
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- ch2060000060000020 ; 2
;,; <- ch0E06050503030301 ; 2
;,; <- ch303030303030FCFC ; 3
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- ch0000000000600000 ; 2
;,; <- ch0000C0F0F8FCF3F1 ; 2
;,; <- ch0000000000000080 ; 2
;,; <- chFFFFFF7F3F3F3F3F ; 2
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- chFCFCFCFCFCFCFCFC ; 13
;,; <- ch7F3F1F0F07030100 ; 8
;,; <- chFFFFFFFFFFFF0000 ; 4
;,; <- chFC7F3F0000000000 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 33
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3C3C3C3C18180000 ; 1
;,; <- chFF88888888FF0000 ; 10
;,; <- ch0101010101010101 ; 2
;,; <- ch000103070F1F3F7F ; 3
;,; <- ch3F3F3F3F3F3F3F3F ; 1
; total unique chars in pic: 43 (worst case req 344 bytes)
!byte $CF,$29 ;addr
!byte $02 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte $94 ;skip
!byte $01 ;data8
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte $41,chFFFFFFFFFFFFFFFF ;fill
!byte $92 ;skip
!byte $0E ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte $8A ;skip
!byte $0B ;data8
!byte ch000103070F1F3F7F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte $8A ;skip
!byte $02 ;data8
!byte ch000103070F1F3F7F
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte $94 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $e1,11



; method 0 ( bytes ) -- 48 bytes (486 cumu)
; method 1 ( ibpc0 bytes ) -- 61 bytes (499 cumu)
; method 2 ( bytes ) -- 48 bytes (486 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 142 bytes (580 cumu)
; method 4 ( clrscr bytes ) -- 326 bytes (764 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 365 bytes (803 cumu)
; method 6 ( clrscr bytes ) -- 326 bytes (764 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 291 bytes (729 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 137
;,; <- chFEFCF8F0E0C08000 ; 13
;,; <- ch0000000000000000 ; 203
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 2
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFFFFFFFFF8F8F8F0 ; 2
;,; <- chFFFFFFFFFFFF7F3F ; 2
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- ch3030303030303030 ; 2
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- chF0E0E0E0E0F0E0E0 ; 2
;,; <- ch1F1F0F0F07030003 ; 2
;,; <- chFFFFFFFFFFFF7F83 ; 2
;,; <- chFFFFFFFFFFFFFF7F ; 2
;,; <- chE0E0E8E0E0C0C0A0 ; 2
;,; <- ch0100000000000000 ; 2
;,; <- chFCFE7C611B270F1F ; 2
;,; <- ch0F1F1FBFBF7F7F7F ; 2
;,; <- chFCFC303030303030 ; 4
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- ch2060000060000020 ; 2
;,; <- ch0E06050503030301 ; 2
;,; <- ch303030303030FCFC ; 3
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- ch0000000000600000 ; 2
;,; <- ch0000C0F0F8FCF3F1 ; 2
;,; <- ch0000000000000080 ; 2
;,; <- chFFFFFF7F3F3F3F3F ; 2
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- chFCFCFCFCFCFCFCFC ; 12
;,; <- ch7F3F1F0F07030100 ; 9
;,; <- chFFFFFFFFFFFF0000 ; 5
;,; <- chFC7F3F0000000000 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 37
;,; <- ch000018183C3C3C3C ; 1
;,; <- ch3C3C3C3C18180000 ; 1
;,; <- ch000103070F1F3F7F ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 4
;,; <- ch0101010101010101 ; 2
;,; <- chFF88888888FF0000 ; 9
; total unique chars in pic: 43 (worst case req 344 bytes)
!byte $CF,$29 ;addr
!byte $02 ;data8
!byte ch000103070F1F3F7F
!byte ch0000FFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte $94 ;skip
!byte $01 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $0D ;data8
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte $8B ;skip
!byte $0A ;data8
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte $8B ;skip
!byte $02 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $94 ;skip
!byte $01 ;data8
!byte ch0000FFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte $e1,11

; total compressed size 532 bytes

!byte $e0,<.loop,>.loop

;,; *_002
;,; <- deps_beyondimagination
; method 4 ( clrscr bytes ) -- 228 bytes (228 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 243 bytes (243 cumu)
; method 6 ( clrscr bytes ) -- 228 bytes (228 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 251 bytes (251 cumu)
; METHOD 4 CHOSEN
!byte $e4,4,chFFFFFFFFFFFFFFFF ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 362
;,; <- ch0000000000000000 ; 31
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 2
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFCFC303030303030 ; 4
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- ch3030303030303030 ; 3
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- ch303030303030FCFC ; 3
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- ch0000000000303030 ; 1
;,; <- chFFFFFFFFFFFF0000 ; 11
;,; <- chFCFCFCFCFCFCFCFC ; 4
;,; <- ch3C7EFFFFFFFF7E3C ; 4
;,; <- ch3F3F3F3F3F3F3F3F ; 4
;,; <- ch0000FFFFFFFFFFFF ; 19
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- chFFFFFFFFF8F8F8F0 ; 1
;,; <- chFFFFFFFFFFFF7F3F ; 1
;,; <- chF0E0E0E0E0F0E0E0 ; 1
;,; <- ch1F1F0F0F07030003 ; 1
;,; <- chFFFFFFFFFFFF7F83 ; 1
;,; <- chFFFFFFFFFFFFFF7F ; 1
;,; <- chE0E0E8E0E0C0C0A0 ; 1
;,; <- ch0100000000000000 ; 1
;,; <- chFCFE7C611B270F1F ; 1
;,; <- ch0F1F1FBFBF7F7F7F ; 1
;,; <- ch2060000060000020 ; 1
;,; <- ch0E06050503030301 ; 1
;,; <- ch0000000000600000 ; 1
;,; <- ch0000C0F0F8FCF3F1 ; 1
;,; <- ch0000000000000080 ; 1
;,; <- chFFFFFF7F3F3F3F3F ; 1
;,; <- ch0101010101010101 ; 2
;,; <- chFC7F3F0000000000 ; 1
;,; <- chFF88888888FF0000 ; 9
; total unique chars in pic: 41 (worst case req 328 bytes)
!byte $DA,$00 ;addr
!byte $56,$00 ;fill
!byte $e2,1;mode4
!byte $00 ;data4
!byte $55
!byte $51,$01 ;fill
!byte $02 ;data4
!byte $55
!byte $55
!byte $15
!byte $DA,$32 ;addr
!byte $51,$01 ;fill
!byte $01 ;data4
!byte $55
!byte $05
!byte $DA,$48 ;addr
!byte $56,$00 ;fill
!byte $DA,$A1 ;addr
!byte $00 ;data4
!byte $42
!byte $87 ;skip
!byte $00 ;data4
!byte $42
!byte $DB,$13 ;addr
!byte $00 ;data4
!byte $42
!byte $9F ;skip
!byte $00 ;data4
!byte $42
!byte $98 ;skip
!byte $7F,$05 ;fill
!byte $78,$05 ;fill
!byte $00 ;data4
!byte $22
!byte $51,$05 ;fill
!byte $03 ;data4
!byte $00
!byte $55
!byte $55
!byte $05
!byte $DB,$E7 ;addr
!byte $50,$00 ;fill
!byte $CE,$18 ;addr
!byte $e2,0;mode8
!byte $14 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte chF0F8CCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chCCCCCCCCCCECFCFC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chF0F8CCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chFEFEDED6D6D6D6D6
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFC303030303030
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte ch3030303030303030
!byte $43,ch0000000000000000 ;fill
!byte $15 ;data8
!byte chFCFCCCCCCCDCFCFC
!byte chFCFCE0C0C0E0FCFC
!byte ch3030303030303030
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte ch0000000000000000
!byte ch303030303030FCFC
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte ch303030303030FCFC
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte ch3030303030303030
!byte ch303030303030FCFC
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCCCCCCC
!byte ch0000000000303030
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte $CE,$89 ;addr
!byte $00 ;data8
!byte chFFFFFFFFFFFF0000
!byte $88 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFF0000
!byte $8B ;skip
!byte $02 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch3C7EFFFFFFFF7E3C
!byte ch3F3F3F3F3F3F3F3F
!byte $86 ;skip
!byte $02 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch3C7EFFFFFFFF7E3C
!byte ch3F3F3F3F3F3F3F3F
!byte $8B ;skip
!byte $00 ;data8
!byte ch0000FFFFFFFFFFFF
!byte $88 ;skip
!byte $00 ;data8
!byte ch0000FFFFFFFFFFFF
!byte $B6 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFF0000
!byte $95 ;skip
!byte $02 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch3C7EFFFFFFFF7E3C
!byte ch3F3F3F3F3F3F3F3F
!byte $87 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFF0000
!byte $8C ;skip
!byte $00 ;data8
!byte ch0000FFFFFFFFFFFF
!byte $87 ;skip
!byte $02 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch3C7EFFFFFFFF7E3C
!byte ch3F3F3F3F3F3F3F3F
!byte $8F ;skip
!byte $01 ;data8
!byte chFEFCF8F0E0C08000
!byte ch7F3F1F0F07030100
!byte $83 ;skip
!byte $00 ;data8
!byte ch0000FFFFFFFFFFFF
!byte $84 ;skip
!byte $01 ;data8
!byte chFFFFFFFFF8F8F8F0
!byte chFFFFFFFFFFFF7F3F
!byte $95 ;skip
!byte $03 ;data8
!byte chF0E0E0E0E0F0E0E0
!byte ch1F1F0F0F07030003
!byte chFFFFFFFFFFFF7F83
!byte chFFFFFFFFFFFFFF7F
!byte $93 ;skip
!byte $03 ;data8
!byte chE0E0E8E0E0C0C0A0
!byte ch0100000000000000
!byte chFCFE7C611B270F1F
!byte ch0F1F1FBFBF7F7F7F
!byte $93 ;skip
!byte $02 ;data8
!byte ch2060000060000020
!byte ch0000000000000000
!byte ch0E06050503030301
!byte $94 ;skip
!byte $03 ;data8
!byte ch0000000000600000
!byte ch0000C0F0F8FCF3F1
!byte ch0000000000000080
!byte chFFFFFF7F3F3F3F3F
!byte $85 ;skip
!byte $08 ;data8
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte $45,ch0000000000000000 ;fill
!byte $02 ;data8
!byte chFC7F3F0000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte $43,chFFFFFFFFFFFF0000 ;fill
!byte $0C ;data8
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte $43,ch0000000000000000 ;fill
!byte $05 ;data8
!byte ch0000FFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $49,ch0000FFFFFFFFFFFF ;fill
!byte $e1,12



;,; *_003
;,; <- deps_beyondimagination
; method 0 ( bytes ) -- 36 bytes (264 cumu)
; method 1 ( ibpc0 bytes ) -- 48 bytes (276 cumu)
; method 2 ( bytes ) -- 36 bytes (264 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 84 bytes (312 cumu)
; method 4 ( clrscr bytes ) -- 221 bytes (449 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 234 bytes (462 cumu)
; method 6 ( clrscr bytes ) -- 221 bytes (449 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 242 bytes (470 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 361
;,; <- ch0000000000000000 ; 26
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 2
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFCFC303030303030 ; 4
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- ch3030303030303030 ; 3
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- ch303030303030FCFC ; 3
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- ch0000000000303030 ; 1
;,; <- chFFFFFFFFFFFF0000 ; 11
;,; <- chFCFCFCFCFCFCFCFC ; 4
;,; <- ch3C7EFFFFFFFF7E3C ; 4
;,; <- ch3F3F3F3F3F3F3F3F ; 4
;,; <- ch0000FFFFFFFFFFFF ; 24
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- chFFFFFFFFF8F8F8F0 ; 1
;,; <- chFFFFFFFFFFFF7F3F ; 1
;,; <- chF0E0E0E0E0F0E0E0 ; 1
;,; <- ch1F1F0F0F07030003 ; 1
;,; <- chFFFFFFFFFFFF7F83 ; 1
;,; <- chFFFFFFFFFFFFFF7F ; 1
;,; <- chE0E0E8E0E0C0C0A0 ; 1
;,; <- ch0100000000000000 ; 1
;,; <- chFCFE7C611B270F1F ; 1
;,; <- ch0F1F1FBFBF7F7F7F ; 1
;,; <- ch2060000060000020 ; 1
;,; <- ch0E06050503030301 ; 1
;,; <- ch0000000000600000 ; 1
;,; <- ch0000C0F0F8FCF3F1 ; 1
;,; <- ch0000000000000080 ; 1
;,; <- chFFFFFF7F3F3F3F3F ; 1
;,; <- ch0101010101010101 ; 3
;,; <- chFC7F3F0000000000 ; 1
;,; <- chFF88888888FF0000 ; 9
; total unique chars in pic: 41 (worst case req 328 bytes)
!byte $DB,$E2 ;addr
!byte $43,$00 ;fill
!byte $CF,$BC ;addr
!byte $0B ;data8
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte $8B ;skip
!byte $0C ;data8
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFFFFFF
!byte $44,ch0000FFFFFFFFFFFF ;fill
!byte $e1,12



;,; *_004
;,; <- deps_beyondimagination
; method 0 ( bytes ) -- 35 bytes (299 cumu)
; method 1 ( ibpc0 bytes ) -- 42 bytes (306 cumu)
; method 2 ( bytes ) -- 35 bytes (299 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 82 bytes (346 cumu)
; method 4 ( clrscr bytes ) -- 226 bytes (490 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 237 bytes (501 cumu)
; method 6 ( clrscr bytes ) -- 226 bytes (490 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 246 bytes (510 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 358
;,; <- ch0000000000000000 ; 27
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 2
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFCFC303030303030 ; 4
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- ch3030303030303030 ; 3
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- ch303030303030FCFC ; 3
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- ch0000000000303030 ; 1
;,; <- chFFFFFFFFFFFF0000 ; 10
;,; <- chFCFCFCFCFCFCFCFC ; 4
;,; <- ch3C7EFFFFFFFF7E3C ; 4
;,; <- ch3F3F3F3F3F3F3F3F ; 4
;,; <- ch0000FFFFFFFFFFFF ; 24
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 2
;,; <- chFFFFFFFFF8F8F8F0 ; 1
;,; <- chFFFFFFFFFFFF7F3F ; 1
;,; <- chF0E0E0E0E0F0E0E0 ; 1
;,; <- ch1F1F0F0F07030003 ; 1
;,; <- chFFFFFFFFFFFF7F83 ; 1
;,; <- chFFFFFFFFFFFFFF7F ; 1
;,; <- chE0E0E8E0E0C0C0A0 ; 1
;,; <- ch0100000000000000 ; 1
;,; <- chFCFE7C611B270F1F ; 1
;,; <- ch0F1F1FBFBF7F7F7F ; 1
;,; <- ch2060000060000020 ; 1
;,; <- ch0E06050503030301 ; 1
;,; <- chF1F1F1FFF1F1F1FF ; 1
;,; <- ch0000000000600000 ; 1
;,; <- ch0000C0F0F8FCF3F1 ; 1
;,; <- ch0000000000000080 ; 1
;,; <- chFFFFFF7F3F3F3F3F ; 1
;,; <- ch0101010101010101 ; 3
;,; <- chFC7F3F0000000000 ; 1
;,; <- chFF88888888FF0000 ; 10
; total unique chars in pic: 42 (worst case req 336 bytes)
!byte $CF,$A2 ;addr
!byte $01 ;data8
!byte chF1F1F1FFF1F1F1FF
!byte ch7F3F1F0F07030100
!byte $96 ;skip
!byte $0C ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte $8A ;skip
!byte $0C ;data8
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte $e1,12



;,; *_005
;,; <- deps_beyondimagination
; method 0 ( bytes ) -- 33 bytes (332 cumu)
; method 1 ( ibpc0 bytes ) -- 41 bytes (340 cumu)
; method 2 ( bytes ) -- 33 bytes (332 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 86 bytes (385 cumu)
; method 4 ( clrscr bytes ) -- 230 bytes (529 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 241 bytes (540 cumu)
; method 6 ( clrscr bytes ) -- 230 bytes (529 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 250 bytes (549 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 356
;,; <- ch0000000000000000 ; 28
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 2
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFCFC303030303030 ; 4
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- ch3030303030303030 ; 3
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- ch303030303030FCFC ; 3
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- ch0000000000303030 ; 1
;,; <- chFFFFFFFFFFFF0000 ; 10
;,; <- chFCFCFCFCFCFCFCFC ; 4
;,; <- ch3C7EFFFFFFFF7E3C ; 4
;,; <- ch3F3F3F3F3F3F3F3F ; 4
;,; <- ch0000FFFFFFFFFFFF ; 24
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 2
;,; <- chFFFFFFFFF8F8F8F0 ; 1
;,; <- chFFFFFFFFFFFF7F3F ; 1
;,; <- chF0E0E0E0E0F0E0E0 ; 1
;,; <- ch1F1F0F0F07030003 ; 1
;,; <- chFFFFFFFFFFFF7F83 ; 1
;,; <- chFFFFFFFFFFFFFF7F ; 1
;,; <- chE0E0E8E0E0C0C0A0 ; 1
;,; <- ch0100000000000000 ; 1
;,; <- chFCFE7C611B270F1F ; 1
;,; <- ch0F1F1FBFBF7F7F7F ; 1
;,; <- chF1F1F1FFF1F1F1FF ; 2
;,; <- ch2060000060000020 ; 1
;,; <- ch0E06050503030301 ; 1
;,; <- ch0000000000600000 ; 1
;,; <- ch0000C0F0F8FCF3F1 ; 1
;,; <- ch0000000000000080 ; 1
;,; <- chFFFFFF7F3F3F3F3F ; 1
;,; <- ch0101010101010101 ; 3
;,; <- chFC7F3F0000000000 ; 1
;,; <- chFF88888888FF0000 ; 10
; total unique chars in pic: 42 (worst case req 336 bytes)
!byte $CF,$8A ;addr
!byte $01 ;data8
!byte chF1F1F1FFF1F1F1FF
!byte ch7F3F1F0F07030100
!byte $96 ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $97 ;skip
!byte $0A ;data8
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte $8C ;skip
!byte $09 ;data8
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte $e1,12



;,; *_006
;,; <- deps_beyondimagination
; method 0 ( bytes ) -- 37 bytes (369 cumu)
; method 1 ( ibpc0 bytes ) -- 47 bytes (379 cumu)
; method 2 ( bytes ) -- 37 bytes (369 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 95 bytes (427 cumu)
; method 4 ( clrscr bytes ) -- 236 bytes (568 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 249 bytes (581 cumu)
; method 6 ( clrscr bytes ) -- 236 bytes (568 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 260 bytes (592 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 354
;,; <- ch0000000000000000 ; 29
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 2
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFCFC303030303030 ; 4
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- ch3030303030303030 ; 3
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- ch303030303030FCFC ; 3
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- ch0000000000303030 ; 1
;,; <- chFFFFFFFFFFFF0000 ; 11
;,; <- chFCFCFCFCFCFCFCFC ; 4
;,; <- ch3C7EFFFFFFFF7E3C ; 4
;,; <- ch3F3F3F3F3F3F3F3F ; 4
;,; <- ch0000FFFFFFFFFFFF ; 24
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 2
;,; <- chFFFFFFFFF8F8F8F0 ; 1
;,; <- chFFFFFFFFFFFF7F3F ; 1
;,; <- chF0E0E0E0E0F0E0E0 ; 1
;,; <- ch1F1F0F0F07030003 ; 1
;,; <- chFFFFFFFFFFFF7F83 ; 1
;,; <- chFFFFFFFFFFFFFF7F ; 1
;,; <- chF1F1F1FFF1F1F1FF ; 3
;,; <- chE0E0E8E0E0C0C0A0 ; 1
;,; <- ch0100000000000000 ; 1
;,; <- chFCFE7C611B270F1F ; 1
;,; <- ch0F1F1FBFBF7F7F7F ; 1
;,; <- ch2060000060000020 ; 1
;,; <- ch0E06050503030301 ; 1
;,; <- ch0000000000600000 ; 1
;,; <- ch0000C0F0F8FCF3F1 ; 1
;,; <- ch0000000000000080 ; 1
;,; <- chFFFFFF7F3F3F3F3F ; 1
;,; <- ch0101010101010101 ; 3
;,; <- chFC7F3F0000000000 ; 1
;,; <- chFF88888888FF0000 ; 9
; total unique chars in pic: 42 (worst case req 336 bytes)
!byte $CF,$72 ;addr
!byte $01 ;data8
!byte chF1F1F1FFF1F1F1FF
!byte ch7F3F1F0F07030100
!byte $96 ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $AF ;skip
!byte $0B ;data8
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte $8A ;skip
!byte $0C ;data8
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte $e1,12



;,; *_007
;,; <- deps_beyondimagination
; method 0 ( bytes ) -- 41 bytes (410 cumu)
; method 1 ( ibpc0 bytes ) -- 51 bytes (420 cumu)
; method 2 ( bytes ) -- 41 bytes (410 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 103 bytes (472 cumu)
; method 4 ( clrscr bytes ) -- 240 bytes (609 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 254 bytes (623 cumu)
; method 6 ( clrscr bytes ) -- 240 bytes (609 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 270 bytes (639 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 353
;,; <- ch0000000000000000 ; 29
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 2
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFCFC303030303030 ; 4
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- ch3030303030303030 ; 3
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- ch303030303030FCFC ; 3
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- ch0000000000303030 ; 1
;,; <- chFFFFFFFFFFFF0000 ; 10
;,; <- chFCFCFCFCFCFCFCFC ; 4
;,; <- ch3C7EFFFFFFFF7E3C ; 4
;,; <- ch3F3F3F3F3F3F3F3F ; 4
;,; <- ch0000FFFFFFFFFFFF ; 24
;,; <- chFEFCF8F0E0C08000 ; 5
;,; <- ch7F3F1F0F07030100 ; 2
;,; <- chFFFFFFFFF8F8F8F0 ; 1
;,; <- chFFFFFFFFFFFF7F3F ; 1
;,; <- chF1F1F1FFF1F1F1FF ; 3
;,; <- chF0E0E0E0E0F0E0E0 ; 1
;,; <- ch1F1F0F0F07030003 ; 1
;,; <- chFFFFFFFFFFFF7F83 ; 1
;,; <- chFFFFFFFFFFFFFF7F ; 1
;,; <- chE0E0E8E0E0C0C0A0 ; 1
;,; <- ch0100000000000000 ; 1
;,; <- chFCFE7C611B270F1F ; 1
;,; <- ch0F1F1FBFBF7F7F7F ; 1
;,; <- ch2060000060000020 ; 1
;,; <- ch0E06050503030301 ; 1
;,; <- ch0000000000600000 ; 1
;,; <- ch0000C0F0F8FCF3F1 ; 1
;,; <- ch0000000000000080 ; 1
;,; <- chFFFFFF7F3F3F3F3F ; 1
;,; <- ch0101010101010101 ; 3
;,; <- chFC7F3F0000000000 ; 1
;,; <- chFF88888888FF0000 ; 10
; total unique chars in pic: 42 (worst case req 336 bytes)
!byte $CF,$5A ;addr
!byte $01 ;data8
!byte chF1F1F1FFF1F1F1FF
!byte ch7F3F1F0F07030100
!byte $96 ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $AD ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $97 ;skip
!byte $0C ;data8
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte $8A ;skip
!byte $0C ;data8
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte $e1,12



;,; *_008
;,; <- deps_beyondimagination
; method 0 ( bytes ) -- 42 bytes (452 cumu)
; method 1 ( ibpc0 bytes ) -- 52 bytes (462 cumu)
; method 2 ( bytes ) -- 42 bytes (452 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 106 bytes (516 cumu)
; method 4 ( clrscr bytes ) -- 243 bytes (653 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 257 bytes (667 cumu)
; method 6 ( clrscr bytes ) -- 243 bytes (653 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 276 bytes (686 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 351
;,; <- ch0000000000000000 ; 30
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 2
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFCFC303030303030 ; 4
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- ch3030303030303030 ; 3
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- ch303030303030FCFC ; 3
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- ch0000000000303030 ; 1
;,; <- chFFFFFFFFFFFF0000 ; 10
;,; <- chFCFCFCFCFCFCFCFC ; 4
;,; <- ch3C7EFFFFFFFF7E3C ; 4
;,; <- ch3F3F3F3F3F3F3F3F ; 4
;,; <- ch0000FFFFFFFFFFFF ; 24
;,; <- chF1F1F1FFF1F1F1FF ; 4
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- chFFFFFFFFF8F8F8F0 ; 1
;,; <- chFFFFFFFFFFFF7F3F ; 1
;,; <- chF0E0E0E0E0F0E0E0 ; 1
;,; <- ch1F1F0F0F07030003 ; 1
;,; <- chFFFFFFFFFFFF7F83 ; 1
;,; <- chFFFFFFFFFFFFFF7F ; 1
;,; <- chE0E0E8E0E0C0C0A0 ; 1
;,; <- ch0100000000000000 ; 1
;,; <- chFCFE7C611B270F1F ; 1
;,; <- ch0F1F1FBFBF7F7F7F ; 1
;,; <- ch2060000060000020 ; 1
;,; <- ch0E06050503030301 ; 1
;,; <- ch0000000000600000 ; 1
;,; <- ch0000C0F0F8FCF3F1 ; 1
;,; <- ch0000000000000080 ; 1
;,; <- chFFFFFF7F3F3F3F3F ; 1
;,; <- ch0101010101010101 ; 3
;,; <- chFC7F3F0000000000 ; 1
;,; <- chFF88888888FF0000 ; 10
; total unique chars in pic: 42 (worst case req 336 bytes)
!byte $CF,$42 ;addr
!byte $01 ;data8
!byte chF1F1F1FFF1F1F1FF
!byte ch7F3F1F0F07030100
!byte $96 ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $AD ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $96 ;skip
!byte $01 ;data8
!byte chF1F1F1FFF1F1F1FF
!byte ch7F3F1F0F07030100
!byte $96 ;skip
!byte $0C ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte $8C ;skip
!byte $09 ;data8
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte $e1,12



;,; *_009
;,; <- deps_beyondimagination
; method 0 ( bytes ) -- 50 bytes (502 cumu)
; method 1 ( ibpc0 bytes ) -- 62 bytes (514 cumu)
; method 2 ( bytes ) -- 50 bytes (502 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 116 bytes (568 cumu)
; method 4 ( clrscr bytes ) -- 233 bytes (685 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 247 bytes (699 cumu)
; method 6 ( clrscr bytes ) -- 233 bytes (685 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 266 bytes (718 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 354
;,; <- ch0000000000000000 ; 31
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 2
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- chFCFC303030303030 ; 4
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- ch3030303030303030 ; 3
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 1
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- ch303030303030FCFC ; 3
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- ch0000000000303030 ; 1
;,; <- chFFFFFFFFFFFF0000 ; 9
;,; <- chFCFCFCFCFCFCFCFC ; 3
;,; <- ch3C7EFFFFFFFF7E3C ; 3
;,; <- ch3F3F3F3F3F3F3F3F ; 3
;,; <- ch0000FFFFFFFFFFFF ; 23
;,; <- chF1F1F1FFF1F1F1FF ; 5
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- chFFFFFFFFF8F8F8F0 ; 1
;,; <- chFFFFFFFFFFFF7F3F ; 1
;,; <- chF0E0E0E0E0F0E0E0 ; 1
;,; <- ch1F1F0F0F07030003 ; 1
;,; <- chFFFFFFFFFFFF7F83 ; 1
;,; <- chFFFFFFFFFFFFFF7F ; 1
;,; <- chE0E0E8E0E0C0C0A0 ; 1
;,; <- ch0100000000000000 ; 1
;,; <- chFCFE7C611B270F1F ; 1
;,; <- ch0F1F1FBFBF7F7F7F ; 1
;,; <- ch2060000060000020 ; 1
;,; <- ch0E06050503030301 ; 1
;,; <- ch0000000000600000 ; 1
;,; <- ch0000C0F0F8FCF3F1 ; 1
;,; <- ch0000000000000080 ; 1
;,; <- chFFFFFF7F3F3F3F3F ; 1
;,; <- ch0101010101010101 ; 3
;,; <- chFC7F3F0000000000 ; 1
;,; <- chFF88888888FF0000 ; 10
; total unique chars in pic: 42 (worst case req 336 bytes)
!byte $DB,$13 ;addr
!byte $00,$04 ;fill
!byte $CE,$FB ;addr
!byte $58,chFFFFFFFFFFFFFFFF ;fill
!byte $94 ;skip
!byte $01 ;data8
!byte chF1F1F1FFF1F1F1FF
!byte ch7F3F1F0F07030100

!byte $00 ;data8
!byte ch0000000000000000
!byte $AD ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $96 ;skip
!byte $01 ;data8
!byte chF1F1F1FFF1F1F1FF
!byte ch7F3F1F0F07030100
!byte $96 ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $97 ;skip
!byte $0A ;data8
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0101010101010101
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte $8C ;skip
!byte $09 ;data8
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFF88888888FF0000
!byte chFFFFFFFFFFFF0000
!byte chFF88888888FF0000
!byte $e1,12

; total compressed size 502 bytes
