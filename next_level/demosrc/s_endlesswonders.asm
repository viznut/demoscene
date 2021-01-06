;,; lyrics_endlesswonders .withinpagefrom=lyrics
;,; <- lyrics

	; endless wonders that never cease to amaze

	!byte $33,$32,$29		; END
	!byte $27,$33,$34		; LESS
	!byte $26,$30,$32		; WON
	!byte $19,$1d,$4a,$24		; DERS
	!byte $09,$19,$1d,$23,$29	; THAT
	!byte $22,$53			; NE
	!byte $26,$5a			; VER
	!byte $45,$a1,$45		; CEASE
	!byte $49,$1d,$36		; TO
	!byte $53			; A
	!byte $26,$43,$41,$44		; MAZE
        !byte $0f

;,; deps_endlesswonders
;,; <- ibpcaablocks
;,; <- player_ivars
;,; <- lyrics_endlesswonders

;,; SC22_000
;,; <- deps_endlesswonders
;,; <- player_ivars
!src "demosrc/smac.inc"
+s8bpc
+sAddr nextlyrictosing
!byte $00,lyrics_endlesswonders-lyrics

;!byte $e1,192

; method 4 ( clrscr bytes ) -- 461 bytes (461 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 482 bytes (482 cumu)
; method 6 ( clrscr bytes ) -- 461 bytes (461 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 449 bytes (449 cumu)
; METHOD 7 CHOSEN
!byte $e4,4,chFFFFFFFFFFFFFFFF ; clrscr
;,; <- ch0000000000000000 ; 166
;,; <- chFCFCE0C0C0C0C0C0 ; 13
;,; <- chFCFCDCCCCCCCCCCC ; 16
;,; <- chF0F8CCCCCCCCCCCC ; 4
;,; <- chC0C0C0C0C0C0C0C0 ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFC303030303030 ; 3
;,; <- chCCCCCCCCCCCCCCCC ; 5
;,; <- chFCFCE0C0C0E0FCFC ; 9
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 4
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- ch3030303030303030 ; 3
;,; <- chFFFFFFFFFFFFFFFF ; 182
;,; <- chFFFFFFFFFFFF0000 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 12
;,; <- ch3C3C3C3C18180000 ; 4
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- ch0000183C3C180000 ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 16
;,; <- ch0000000000707CF8 ; 3
;,; <- ch0000000000069FCF ; 3
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- chF8787C3E1F030000 ; 3
;,; <- ch0F0F1E3EFCE00000 ; 3
;,; <- chE058340700000000 ; 1
;,; <- ch010E14F000000000 ; 1
;,; <- ch00030F1F3F7E7CF8 ; 7
;,; <- chC0F0F8FCFE3E9FCF ; 7
;,; <- chF8787C3E1F0F0300 ; 5
;,; <- ch0F0F1E3EFCF8F0C0 ; 5
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chFCFC0C0C0C0C0C0C ; 1
;,; <- chCCCCCCCC78783030 ; 1
; total unique chars in pic: 35 (worst case req 280 bytes)
!byte $DA,$00 ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $7C
!byte $45,$01 ;fill
!byte $00 ;data4
!byte $17
!byte $DA,$0A ;addr
!byte $45,$01 ;fill
!byte $04 ;data4
!byte $17
!byte $11
!byte $71
!byte $47
!byte $17
!byte $DA,$1A ;addr
!byte $45,$01 ;fill
!byte $00 ;data4
!byte $17
!byte $DA,$22 ;addr
!byte $45,$01 ;fill
!byte $03 ;data4
!byte $17
!byte $11
!byte $71
!byte $27
!byte $96 ;skip
!byte $6E,$02 ;fill
!byte $02 ;data4
!byte $24
!byte $22
!byte $42
!byte $88 ;skip
!byte $04 ;data4
!byte $22
!byte $42
!byte $44
!byte $22
!byte $42
!byte $DA,$E5 ;addr
!byte $04 ;data4
!byte $33
!byte $44
!byte $44
!byte $44
!byte $55
!byte $8D ;skip
!byte $04 ;data4
!byte $33
!byte $44
!byte $24
!byte $42
!byte $55
!byte $AB ;skip
!byte $02 ;data4
!byte $55
!byte $44
!byte $14
!byte $DB,$38 ;addr
!byte $47,$01 ;fill
!byte $06 ;data4
!byte $44
!byte $44
!byte $44
!byte $11
!byte $44
!byte $55
!byte $44
!byte $48,$01 ;fill
!byte $06 ;data4
!byte $22
!byte $14
!byte $41
!byte $11
!byte $44
!byte $44
!byte $33
!byte $48,$01 ;fill
!byte $06 ;data4
!byte $22
!byte $14
!byte $41
!byte $11
!byte $77
!byte $44
!byte $33
!byte $48,$01 ;fill
!byte $06 ;data4
!byte $44
!byte $44
!byte $44
!byte $11
!byte $77
!byte $44
!byte $44
!byte $48,$01 ;fill
!byte $06 ;data4
!byte $44
!byte $44
!byte $66
!byte $11
!byte $44
!byte $22
!byte $44
!byte $46,$01 ;fill
!byte $00 ;data4
!byte $14
!byte $DB,$B8 ;addr
!byte $4D,$01 ;fill
!byte $18 ;data4
!byte $44
!byte $17
!byte $11
!byte $11
!byte $17
!byte $11
!byte $11
!byte $17
!byte $71
!byte $11
!byte $11
!byte $71
!byte $47
!byte $17
!byte $11
!byte $11
!byte $17
!byte $11
!byte $11
!byte $17
!byte $71
!byte $11
!byte $11
!byte $71
!byte $07
!byte $CE,$00 ;addr
!byte $e2,$ff;mode1
!byte $08 ;data1
!byte $C0
!byte $40
!byte $43
!byte $C0
!byte $40
!byte $43
!byte $FF
!byte $FF
!byte $FF
!byte $CE,$B1 ;addr
!byte $28 ;data1
!byte $A8
!byte $A8
!byte $00
!byte $DC
!byte $EC
!byte $00
!byte $F0
!byte $F0
!byte $00
!byte $F0
!byte $90
!byte $30
!byte $9C
!byte $FC
!byte $78
!byte $9C
!byte $CC
!byte $00
!byte $FC
!byte $CC
!byte $00
!byte $24
!byte $F0
!byte $00
!byte $24
!byte $30
!byte $00
!byte $FC
!byte $3C
!byte $00
!byte $F0
!byte $CD
!byte $FF
!byte $FF
!byte $FF
!byte $82
!byte $09
!byte $07
!byte $82
!byte $09
!byte $06
!byte $e3 ;run ibpcaa
!byte $CE,$02 ;addr
!byte $e2,0;mode8
!byte $13 ;data8
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chF0F8CCCCCCCCCCCC
!byte chC0C0C0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chF0F8CCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFC303030303030
!byte $83 ;skip
!byte $13 ;data8
!byte chFCFCE0C0C0E0FCFC
!byte chCCCCCCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte chC0C0C0C0C0E0FCFC
!byte chFCFCE0C0C0E0FCFC
!byte chFCFC1C0C0C1CFCFC
!byte chFCFC1C0C0C1CFCFC
!byte ch0000000000000000
!byte chD6D6D6D6D6F6FEFE
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte chFCFCE0C0C0E0FCFC
!byte chF0F8CCCCCCCCCCCC
!byte chFCFC1C0C0C1CFCFC
!byte ch0000000000000000
!byte ch3030303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte ch3030303030303030
!byte $99 ;skip
!byte $56,chFFFFFFFFFFFFFFFF ;fill
!byte $CE,$BC ;addr
!byte $00 ;data8
!byte ch3C3C3C3C18180000
!byte $8A ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $05 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000183C3C180000
!byte $8A ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $83 ;skip
!byte $03 ;data8
!byte ch0000000000707CF8
!byte ch0000000000069FCF
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte $83 ;skip
!byte $0B ;data8
!byte ch0000000000707CF8
!byte ch0000000000069FCF
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $83 ;skip
!byte $0A ;data8
!byte chF8787C3E1F030000
!byte ch0F0F1E3EFCE00000
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte chE058340700000000
!byte ch010E14F000000000
!byte ch0000000000000000
!byte chF8787C3E1F030000
!byte ch0F0F1E3EFCE00000
!byte ch3F3F3F3F3F3F3F3F
!byte $87 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch00030F1F3F7E7CF8
!byte chC0F0F8FCFE3E9FCF
!byte $83 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $87 ;skip
!byte $00 ;data8
!byte chFEFCF8F0E0C08000
!byte $83 ;skip
!byte $05 ;data8
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte chF8787C3E1F0F0300
!byte ch0F0F1E3EFCF8F0C0
!byte $86 ;skip
!byte $03 ;data8
!byte ch00030F1F3F7E7CF8
!byte chC0F0F8FCFE3E9FCF
!byte ch0000000000000000
!byte ch0000000000000000
!byte $45,chFFFFFFFFFFFFFFFF ;fill
!byte $88 ;skip
!byte $05 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch0000000000000000
!byte chF8787C3E1F0F0300
!byte ch0F0F1E3EFCF8F0C0
!byte $8A ;skip
!byte $07 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch00030F1F3F7E7CF8
!byte chC0F0F8FCFE3E9FCF
!byte ch0000000000000000
!byte ch00030F1F3F7E7CF8
!byte chC0F0F8FCFE3E9FCF
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte $84 ;skip
!byte $02 ;data8
!byte ch00030F1F3F7E7CF8
!byte chC0F0F8FCFE3E9FCF
!byte ch3F3F3F3F3F3F3F3F
!byte $87 ;skip
!byte $0F ;data8
!byte chFCFCFCFCFCFCFCFC
!byte chF8787C3E1F0F0300
!byte ch0F0F1E3EFCF8F0C0
!byte ch0000000000000000
!byte chF8787C3E1F0F0300
!byte ch0F0F1E3EFCF8F0C0
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000707CF8
!byte ch0000000000069FCF
!byte ch0000000000000000
!byte ch0000000000000000
!byte chF8787C3E1F0F0300
!byte ch0F0F1E3EFCF8F0C0
!byte ch3F3F3F3F3F3F3F3F
!byte $8F ;skip
!byte $02 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte chF8787C3E1F030000
!byte ch0F0F1E3EFCE00000
!byte $84 ;skip
!byte $47,chFFFFFFFFFFFFFFFF ;fill
!byte $83 ;skip
!byte $0A ;data8
!byte ch00030F1F3F7E7CF8
!byte chC0F0F8FCFE3E9FCF
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch00030F1F3F7E7CF8
!byte chC0F0F8FCFE3E9FCF
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $99 ;skip
!byte $13 ;data8
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chFEFEDED6D6D6D6D6
!byte chFCFCDCCCCCCCCCCC
!byte chFCFC0C0C0C0C0C0C
!byte chFCFCE0C0C0C0C0C0
!byte $83 ;skip
!byte $13 ;data8
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte chCCCCCCCC78783030
!byte chFCFCE0C0C0E0FCFC
!byte chF0F8CCCCCCCCCCCC
!byte ch0000000000000000
!byte chC0C0C0C0C0E0FCFC
!byte chFCFCE0C0C0E0FCFC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFC1C0C0C1CFCFC
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000000000
!byte ch3030303030303030
!byte chCCCCCCCCCCECFCFC
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte chFCFCE0C0C0E0FCFC
!byte $e1,12



;,; *_001 .waits=15
;,; <- deps_endlesswonders
;,; <- streamvars

!byte 0xD0,loopctr,0,3	; set loopctr

.loop:

; method 0 ( bytes ) -- 71 bytes (520 cumu)
; method 1 ( ibpc0 bytes ) -- 79 bytes (528 cumu)
; method 2 ( bytes ) -- 71 bytes (520 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 120 bytes (569 cumu)
; method 4 ( clrscr bytes ) -- 462 bytes (911 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 488 bytes (937 cumu)
; method 6 ( clrscr bytes ) -- 462 bytes (911 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 445 bytes (894 cumu)
; METHOD 0 CHOSEN
;,; <- ch0000000000000000 ; 169
;,; <- chFCFCE0C0C0C0C0C0 ; 13
;,; <- chFCFCDCCCCCCCCCCC ; 16
;,; <- chF0F8CCCCCCCCCCCC ; 4
;,; <- chC0C0C0C0C0C0C0C0 ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFC303030303030 ; 3
;,; <- chCCCCCCCCCCCCCCCC ; 5
;,; <- chFCFCE0C0C0E0FCFC ; 9
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 4
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- ch3030303030303030 ; 3
;,; <- chFFFFFFFFFFFFFFFF ; 179
;,; <- chFFFFFFFFFFFF0000 ; 6
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 12
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch3C3C3C3C3C3C3C3C ; 1
;,; <- ch0000183C3C180000 ; 3
;,; <- ch3F3F3F3F3F3F3F3F ; 16
;,; <- ch00030F1F3F7E7CF8 ; 6
;,; <- chC0F0F8FCFE3E9FCF ; 6
;,; <- chE058340700000000 ; 2
;,; <- ch010E14F000000000 ; 2
;,; <- chF8787C3E1F0F0300 ; 5
;,; <- ch0F0F1E3EFCF8F0C0 ; 5
;,; <- ch0000000000707CF8 ; 3
;,; <- ch0000000000069FCF ; 3
;,; <- chF8787C3E1F030000 ; 2
;,; <- ch0F0F1E3EFCE00000 ; 2
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chFCFC0C0C0C0C0C0C ; 1
;,; <- chCCCCCCCC78783030 ; 1
; total unique chars in pic: 36 (worst case req 288 bytes)
!byte $CE,$8C ;addr
!byte $00 ;data8
!byte chFFFFFFFFFFFF0000
!byte $8C ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFF0000
!byte $87 ;skip
!byte $02 ;data8
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte $8B ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $86 ;skip
!byte $02 ;data8
!byte ch3C3C3C3C3C3C3C3C
!byte ch0000000000000000
!byte ch0000000000000000
!byte $8C ;skip
!byte $00 ;data8
!byte ch0000183C3C180000
!byte $86 ;skip
!byte $00 ;data8
!byte ch3C3C3C3C18180000
!byte $91 ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte $85 ;skip
!byte $01 ;data8
!byte ch00030F1F3F7E7CF8
!byte chC0F0F8FCFE3E9FCF
!byte $8D ;skip
!byte $01 ;data8
!byte chE058340700000000
!byte ch010E14F000000000
!byte $85 ;skip
!byte $01 ;data8
!byte chF8787C3E1F0F0300
!byte ch0F0F1E3EFCF8F0C0
!byte $CF,$59 ;addr
!byte $01 ;data8
!byte ch0000000000707CF8
!byte ch0000000000069FCF
!byte $89 ;skip
!byte $01 ;data8
!byte ch0000000000707CF8
!byte ch0000000000069FCF
!byte $89 ;skip
!byte $01 ;data8
!byte chF8787C3E1F030000
!byte ch0F0F1E3EFCE00000
!byte $85 ;skip
!byte $05 ;data8
!byte ch00030F1F3F7E7CF8
!byte chC0F0F8FCFE3E9FCF
!byte ch0000000000000000
!byte ch0000000000000000
!byte chF8787C3E1F030000
!byte ch0F0F1E3EFCE00000
!byte $91 ;skip
!byte $01 ;data8
!byte chF8787C3E1F0F0300
!byte ch0F0F1E3EFCF8F0C0
!byte $97 ;skip
!byte $01 ;data8
!byte ch0000000000707CF8
!byte ch0000000000069FCF
!byte $e1,12



; method 0 ( bytes ) -- 53 bytes (573 cumu)
; method 1 ( ibpc0 bytes ) -- 60 bytes (580 cumu)
; method 2 ( bytes ) -- 53 bytes (573 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 106 bytes (626 cumu)
; method 4 ( clrscr bytes ) -- 459 bytes (979 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 480 bytes (1000 cumu)
; method 6 ( clrscr bytes ) -- 459 bytes (979 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 442 bytes (962 cumu)
; METHOD 0 CHOSEN
;,; <- ch0000000000000000 ; 170
;,; <- chFCFCE0C0C0C0C0C0 ; 13
;,; <- chFCFCDCCCCCCCCCCC ; 16
;,; <- chF0F8CCCCCCCCCCCC ; 4
;,; <- chC0C0C0C0C0C0C0C0 ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFC303030303030 ; 3
;,; <- chCCCCCCCCCCCCCCCC ; 5
;,; <- chFCFCE0C0C0E0FCFC ; 9
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 4
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- ch3030303030303030 ; 3
;,; <- chFFFFFFFFFFFFFFFF ; 182
;,; <- chFFFFFFFFFFFF0000 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 12
;,; <- ch3C3C3C3C18180000 ; 4
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- ch0000183C3C180000 ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 16
;,; <- ch0000000000707CF8 ; 3
;,; <- ch0000000000069FCF ; 3
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- chE058340700000000 ; 3
;,; <- ch010E14F000000000 ; 3
;,; <- chF8787C3E1F030000 ; 3
;,; <- ch0F0F1E3EFCE00000 ; 3
;,; <- ch00030F1F3F7E7CF8 ; 5
;,; <- chC0F0F8FCFE3E9FCF ; 5
;,; <- chF8787C3E1F0F0300 ; 3
;,; <- ch0F0F1E3EFCF8F0C0 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chFCFC0C0C0C0C0C0C ; 1
;,; <- chCCCCCCCC78783030 ; 1
; total unique chars in pic: 35 (worst case req 280 bytes)
!byte $CE,$8C ;addr
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $8C ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $87 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFF0000
!byte $8B ;skip
!byte $00 ;data8
!byte ch3C3C3C3C18180000
!byte $86 ;skip
!byte $02 ;data8
!byte ch3C3C3C3C18180000
!byte ch0000000000000000
!byte ch3C3C3C3C18180000
!byte $8C ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $86 ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $99 ;skip
!byte $01 ;data8
!byte ch0000000000707CF8
!byte ch0000000000069FCF
!byte $95 ;skip
!byte $01 ;data8
!byte chF8787C3E1F030000
!byte ch0F0F1E3EFCE00000
!byte $CF,$59 ;addr
!byte $04 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000707CF8
!byte ch0000000000069FCF
!byte $92 ;skip
!byte $04 ;data8
!byte chE058340700000000
!byte ch010E14F000000000
!byte ch0000000000000000
!byte chF8787C3E1F030000
!byte ch0F0F1E3EFCE00000
!byte $B4 ;skip
!byte $01 ;data8
!byte ch00030F1F3F7E7CF8
!byte chC0F0F8FCFE3E9FCF
!byte $e1,12



; method 0 ( bytes ) -- 83 bytes (656 cumu)
; method 1 ( ibpc0 bytes ) -- 90 bytes (663 cumu)
; method 2 ( bytes ) -- 83 bytes (656 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 126 bytes (699 cumu)
; method 4 ( clrscr bytes ) -- 454 bytes (1027 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 479 bytes (1052 cumu)
; method 6 ( clrscr bytes ) -- 454 bytes (1027 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 427 bytes (1000 cumu)
; METHOD 0 CHOSEN
;,; <- ch0000000000000000 ; 175
;,; <- chFCFCE0C0C0C0C0C0 ; 13
;,; <- chFCFCDCCCCCCCCCCC ; 16
;,; <- chF0F8CCCCCCCCCCCC ; 4
;,; <- chC0C0C0C0C0C0C0C0 ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFC303030303030 ; 3
;,; <- chCCCCCCCCCCCCCCCC ; 5
;,; <- chFCFCE0C0C0E0FCFC ; 9
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 4
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- ch3030303030303030 ; 3
;,; <- chFFFFFFFFFFFFFFFF ; 178
;,; <- chFFFFFFFFFFFF0000 ; 6
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 13
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch0000183C3C180000 ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 16
;,; <- ch0000000000707CF8 ; 4
;,; <- ch0000000000069FCF ; 4
;,; <- chF8787C3E1F030000 ; 3
;,; <- ch0F0F1E3EFCE00000 ; 3
;,; <- chE058340700000000 ; 4
;,; <- ch010E14F000000000 ; 4
;,; <- ch00030F1F3F7E7CF8 ; 3
;,; <- chC0F0F8FCFE3E9FCF ; 3
;,; <- chF8787C3E1F0F0300 ; 2
;,; <- ch0F0F1E3EFCF8F0C0 ; 2
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chFCFC0C0C0C0C0C0C ; 1
;,; <- chCCCCCCCC78783030 ; 1
; total unique chars in pic: 35 (worst case req 280 bytes)
!byte $CE,$8C ;addr
!byte $00 ;data8
!byte chFFFFFFFFFFFF0000
!byte $8E ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFF0000
!byte $85 ;skip
!byte $02 ;data8
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte $8D ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $86 ;skip
!byte $00 ;data8
!byte ch0000183C3C180000
!byte $91 ;skip
!byte $02 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte $41,ch0000000000000000 ;fill
!byte $8F ;skip
!byte $02 ;data8
!byte ch0000000000707CF8
!byte ch0000000000069FCF
!byte chFFFFFFFFFFFFFFFF
!byte $84 ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte $8D ;skip
!byte $01 ;data8
!byte chF8787C3E1F030000
!byte ch0F0F1E3EFCE00000
!byte $85 ;skip
!byte $01 ;data8
!byte chE058340700000000
!byte ch010E14F000000000
!byte $AB ;skip
!byte $40,ch0000000000000000 ;fill
!byte $95 ;skip
!byte $01 ;data8
!byte chE058340700000000
!byte ch010E14F000000000
!byte $8B ;skip
!byte $01 ;data8
!byte ch0000000000707CF8
!byte ch0000000000069FCF
!byte $41,ch0000000000000000 ;fill
!byte $86 ;skip
!byte $01 ;data8
!byte ch00030F1F3F7E7CF8
!byte chC0F0F8FCFE3E9FCF
!byte $89 ;skip
!byte $0D ;data8
!byte chF8787C3E1F030000
!byte ch0F0F1E3EFCE00000
!byte ch0000000000000000
!byte chE058340700000000
!byte ch010E14F000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000707CF8
!byte ch0000000000069FCF
!byte ch0000000000000000
!byte ch0000000000000000
!byte chF8787C3E1F0F0300
!byte ch0F0F1E3EFCF8F0C0
!byte $91 ;skip
!byte $01 ;data8
!byte chF8787C3E1F030000
!byte ch0F0F1E3EFCE00000
!byte $91 ;skip
!byte $01 ;data8
!byte ch0000000000707CF8
!byte ch0000000000069FCF
!byte $e1,12



; method 0 ( bytes ) -- 75 bytes (731 cumu)
; method 1 ( ibpc0 bytes ) -- 88 bytes (744 cumu)
; method 2 ( bytes ) -- 75 bytes (731 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 128 bytes (784 cumu)
; method 4 ( clrscr bytes ) -- 457 bytes (1113 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 475 bytes (1131 cumu)
; method 6 ( clrscr bytes ) -- 457 bytes (1113 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 441 bytes (1097 cumu)
; METHOD 0 CHOSEN
;,; <- ch0000000000000000 ; 170
;,; <- chFCFCE0C0C0C0C0C0 ; 13
;,; <- chFCFCDCCCCCCCCCCC ; 16
;,; <- chF0F8CCCCCCCCCCCC ; 4
;,; <- chC0C0C0C0C0C0C0C0 ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFC303030303030 ; 3
;,; <- chCCCCCCCCCCCCCCCC ; 5
;,; <- chFCFCE0C0C0E0FCFC ; 9
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 4
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- ch3030303030303030 ; 3
;,; <- chFFFFFFFFFFFFFFFF ; 182
;,; <- chFFFFFFFFFFFF0000 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 12
;,; <- ch3C3C3C3C18180000 ; 4
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- ch0000183C3C180000 ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 16
;,; <- ch0000000000707CF8 ; 4
;,; <- ch0000000000069FCF ; 4
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- chF8787C3E1F030000 ; 3
;,; <- ch0F0F1E3EFCE00000 ; 3
;,; <- chE058340700000000 ; 3
;,; <- ch010E14F000000000 ; 3
;,; <- ch00030F1F3F7E7CF8 ; 4
;,; <- chC0F0F8FCFE3E9FCF ; 4
;,; <- chF8787C3E1F0F0300 ; 3
;,; <- ch0F0F1E3EFCF8F0C0 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chFCFC0C0C0C0C0C0C ; 1
;,; <- chCCCCCCCC78783030 ; 1
; total unique chars in pic: 35 (worst case req 280 bytes)
!byte $CE,$8C ;addr
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $8E ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFF0000
!byte $8D ;skip
!byte $00 ;data8
!byte ch3C3C3C3C18180000
!byte $86 ;skip
!byte $00 ;data8
!byte ch3C3C3C3C18180000
!byte $91 ;skip
!byte $05 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000183C3C180000
!byte $91 ;skip
!byte $00 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte $84 ;skip
!byte $01 ;data8
!byte ch0000000000707CF8
!byte ch0000000000069FCF
!byte $95 ;skip
!byte $01 ;data8
!byte chF8787C3E1F030000
!byte ch0F0F1E3EFCE00000
!byte $8A ;skip
!byte $40,ch0000000000000000 ;fill
!byte $95 ;skip
!byte $01 ;data8
!byte chE058340700000000
!byte ch010E14F000000000
!byte $86 ;skip
!byte $01 ;data8
!byte ch00030F1F3F7E7CF8
!byte chC0F0F8FCFE3E9FCF
!byte $95 ;skip
!byte $01 ;data8
!byte chF8787C3E1F0F0300
!byte ch0F0F1E3EFCF8F0C0
!byte $8B ;skip
!byte $04 ;data8
!byte ch00030F1F3F7E7CF8
!byte chC0F0F8FCFE3E9FCF
!byte ch0000000000000000
!byte ch0000000000707CF8
!byte ch0000000000069FCF
!byte $92 ;skip
!byte $09 ;data8
!byte chF8787C3E1F0F0300
!byte ch0F0F1E3EFCF8F0C0
!byte ch0000000000000000
!byte chF8787C3E1F030000
!byte ch0F0F1E3EFCE00000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch0000000000000000
!byte $95 ;skip
!byte $01 ;data8
!byte chE058340700000000
!byte ch010E14F000000000
!byte $e1,12



; method 0 ( bytes ) -- 30 bytes (761 cumu)
; method 1 ( ibpc0 bytes ) -- 30 bytes (761 cumu)
; method 2 ( bytes ) -- 30 bytes (761 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 94 bytes (825 cumu)
; method 4 ( clrscr bytes ) -- 461 bytes (1192 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 482 bytes (1213 cumu)
; method 6 ( clrscr bytes ) -- 461 bytes (1192 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 449 bytes (1180 cumu)
; METHOD 0 CHOSEN
;,; <- ch0000000000000000 ; 166
;,; <- chFCFCE0C0C0C0C0C0 ; 13
;,; <- chFCFCDCCCCCCCCCCC ; 16
;,; <- chF0F8CCCCCCCCCCCC ; 4
;,; <- chC0C0C0C0C0C0C0C0 ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFC303030303030 ; 3
;,; <- chCCCCCCCCCCCCCCCC ; 5
;,; <- chFCFCE0C0C0E0FCFC ; 9
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 4
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- ch3030303030303030 ; 3
;,; <- chFFFFFFFFFFFFFFFF ; 182
;,; <- chFFFFFFFFFFFF0000 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 12
;,; <- ch3C3C3C3C18180000 ; 4
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- ch0000183C3C180000 ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 16
;,; <- ch0000000000707CF8 ; 3
;,; <- ch0000000000069FCF ; 3
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- chF8787C3E1F030000 ; 3
;,; <- ch0F0F1E3EFCE00000 ; 3
;,; <- chE058340700000000 ; 1
;,; <- ch010E14F000000000 ; 1
;,; <- ch00030F1F3F7E7CF8 ; 7
;,; <- chC0F0F8FCFE3E9FCF ; 7
;,; <- chF8787C3E1F0F0300 ; 5
;,; <- ch0F0F1E3EFCF8F0C0 ; 5
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chFCFC0C0C0C0C0C0C ; 1
;,; <- chCCCCCCCC78783030 ; 1
; total unique chars in pic: 35 (worst case req 280 bytes)
!byte $CF,$12 ;addr
!byte $01 ;data8
!byte ch00030F1F3F7E7CF8
!byte chC0F0F8FCFE3E9FCF
!byte $95 ;skip
!byte $01 ;data8
!byte chF8787C3E1F0F0300
!byte ch0F0F1E3EFCF8F0C0
!byte $AF ;skip
!byte $01 ;data8
!byte ch00030F1F3F7E7CF8
!byte chC0F0F8FCFE3E9FCF
!byte $95 ;skip
!byte $06 ;data8
!byte chF8787C3E1F0F0300
!byte ch0F0F1E3EFCF8F0C0
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000707CF8
!byte ch0000000000069FCF
!byte $95 ;skip
!byte $01 ;data8
!byte chF8787C3E1F030000
!byte ch0F0F1E3EFCE00000
!byte $91 ;skip
!byte $01 ;data8
!byte ch00030F1F3F7E7CF8
!byte chC0F0F8FCFE3E9FCF
!byte $e1,12

; total compressed size 761 bytes

!byte $e0,<.loop,>.loop
