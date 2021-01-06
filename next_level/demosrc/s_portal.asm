;,; lyrics_portalwillopen .withinpagefrom=lyrics
;,; <- lyrics

	!byte $23			; A
        !byte $29,$2b,$00		; POR
	!byte $29,$1d,$3a,$27		; TAL
	!byte $26,$41,$27		; WILL
	!byte $25,$76,$22		; SOON
	!byte $30,$36			; O
	!byte $19,$1b,$33,$22		; PEN
	!byte $21,$82			; IN
	!byte $19,$1d,$4a		; THE
	!byte $29,$1c,$8a		; GAR
	!byte $19,$1d,$63,$42		; DEN
        !byte $0f

;,; deps_portalwillopen
;,; <- ibpcaablocks
;,; <- lyrics_portalwillopen

;,; SC30_000
;,; <- deps_portalwillopen
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
!byte $00,lyrics_portalwillopen-lyrics

;,; <- deps_portalwillopen
; method 4 ( clrscr bytes ) -- 292 bytes (292 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 308 bytes (308 cumu)
; method 6 ( clrscr bytes ) -- 292 bytes (292 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 314 bytes (314 cumu)
; METHOD 4 CHOSEN
!byte $e4,5,ch0000000000000000 ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 70
;,; <- chFEFEFEFCFEFCFCF8 ; 12
;,; <- chFF7F7F3F7F3F3F1F ; 12
;,; <- chFEFEFCFCF8F8F0E0 ; 10
;,; <- ch7F7F3F3F1F1F0F07 ; 11
;,; <- chF8F8F0F0E0E0C080 ; 9
;,; <- ch1F1F0F0F07070301 ; 9
;,; <- ch0000000000000000 ; 310
;,; <- ch0303010100000000 ; 1
;,; <- chFCFCDCCCCCCCCCCC ; 19
;,; <- chFCFC303030303030 ; 4
;,; <- chC0C0C0C0C0C0C0C0 ; 3
;,; <- chFCFCE0C0C0C0C0C0 ; 7
;,; <- chCCCCCCCCCCECFCFC ; 6
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- ch3030303030303030 ; 2
;,; <- chC0C0C0C0C0E0FCFC ; 3
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- ch303030303030FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 1
;,; <- chCCCCCCCCCCCCCCCC ; 5
;,; <- chFCFCE0C0C0E0FCFC ; 3
; total unique chars in pic: 23 (worst case req 184 bytes)
!byte $DA,$00 ;addr
!byte $5A,$06 ;fill
!byte $4C,$04 ;fill
!byte $47,$06 ;fill
!byte $e2,1;mode4
!byte $01 ;data4
!byte $44
!byte $24
!byte $DA,$36 ;addr
!byte $49,$02 ;fill
!byte $05 ;data4
!byte $44
!byte $44
!byte $64
!byte $66
!byte $46
!byte $44
!byte $4C,$02 ;fill
!byte $1A ;data4
!byte $44
!byte $64
!byte $66
!byte $44
!byte $24
!byte $22
!byte $22
!byte $77
!byte $77
!byte $77
!byte $22
!byte $22
!byte $42
!byte $66
!byte $66
!byte $54
!byte $55
!byte $25
!byte $77
!byte $27
!byte $22
!byte $77
!byte $57
!byte $55
!byte $45
!byte $64
!byte $56
!byte $93 ;skip
!byte $01 ;data4
!byte $6D
!byte $56
!byte $9E ;skip
!byte $46,$01 ;fill
!byte $8F ;skip
!byte $03 ;data4
!byte $31
!byte $11
!byte $11
!byte $11
!byte $8F ;skip
!byte $03 ;data4
!byte $31
!byte $11
!byte $11
!byte $11
!byte $8F ;skip
!byte $03 ;data4
!byte $31
!byte $31
!byte $13
!byte $13
!byte $8C ;skip
!byte $06 ;data4
!byte $11
!byte $11
!byte $13
!byte $11
!byte $31
!byte $11
!byte $11
!byte $89 ;skip
!byte $06 ;data4
!byte $11
!byte $11
!byte $13
!byte $11
!byte $31
!byte $11
!byte $11
!byte $8C ;skip
!byte $03 ;data4
!byte $31
!byte $31
!byte $13
!byte $13
!byte $DB,$CE ;addr
!byte $4B,$01 ;fill
!byte $8A ;skip
!byte $06 ;data4
!byte $11
!byte $19
!byte $11
!byte $17
!byte $11
!byte $11
!byte $51
!byte $CE,$00 ;addr
!byte $71,chFFFFFFFFFFFFFFFF ;fill
!byte $e2,0;mode8
!byte $01 ;data8
!byte chFEFEFEFCFEFCFCF8
!byte chFF7F7F3F7F3F3F1F
!byte $44,chFFFFFFFFFFFFFFFF ;fill
!byte $07 ;data8
!byte chFEFEFEFCFEFCFCF8
!byte chFF7F7F3F7F3F3F1F
!byte chFEFEFEFCFEFCFCF8
!byte chFF7F7F3F7F3F3F1F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFEFEFCFEFCFCF8
!byte chFF7F7F3F7F3F3F1F
!byte $43,chFFFFFFFFFFFFFFFF ;fill
!byte $31 ;data8
!byte chFF7F7F3F7F3F3F1F
!byte chFEFEFEFCFEFCFCF8
!byte chFF7F7F3F7F3F3F1F
!byte chFEFEFCFCF8F8F0E0
!byte ch7F7F3F3F1F1F0F07
!byte chFEFEFEFCFEFCFCF8
!byte chFF7F7F3F7F3F3F1F
!byte chFEFEFEFCFEFCFCF8
!byte chFF7F7F3F7F3F3F1F
!byte chFEFEFEFCFEFCFCF8
!byte chFF7F7F3F7F3F3F1F
!byte chFEFEFCFCF8F8F0E0
!byte ch7F7F3F3F1F1F0F07
!byte chFEFEFCFCF8F8F0E0
!byte ch7F7F3F3F1F1F0F07
!byte chFEFEFEFCFEFCFCF8
!byte chFF7F7F3F7F3F3F1F
!byte chFEFEFCFCF8F8F0E0
!byte ch7F7F3F3F1F1F0F07
!byte chFEFEFEFCFEFCFCF8
!byte chFF7F7F3F7F3F3F1F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch7F7F3F3F1F1F0F07
!byte chFEFEFCFCF8F8F0E0
!byte ch7F7F3F3F1F1F0F07
!byte chF8F8F0F0E0E0C080
!byte ch1F1F0F0F07070301
!byte chFEFEFCFCF8F8F0E0
!byte ch7F7F3F3F1F1F0F07
!byte chFEFEFCFCF8F8F0E0
!byte ch7F7F3F3F1F1F0F07
!byte chFEFEFCFCF8F8F0E0
!byte ch7F7F3F3F1F1F0F07
!byte chF8F8F0F0E0E0C080
!byte ch1F1F0F0F07070301
!byte chF8F8F0F0E0E0C080
!byte ch1F1F0F0F07070301
!byte chFEFEFCFCF8F8F0E0
!byte ch7F7F3F3F1F1F0F07
!byte chF8F8F0F0E0E0C080
!byte ch1F1F0F0F07070301
!byte chFEFEFCFCF8F8F0E0
!byte ch7F7F3F3F1F1F0F07
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch1F1F0F0F07070301
!byte chF8F8F0F0E0E0C080
!byte $83 ;skip
!byte $03 ;data8
!byte ch1F1F0F0F07070301
!byte chF8F8F0F0E0E0C080
!byte ch1F1F0F0F07070301
!byte chF8F8F0F0E0E0C080
!byte $83 ;skip
!byte $01 ;data8
!byte ch0303010100000000
!byte chF8F8F0F0E0E0C080
!byte $83 ;skip
!byte $03 ;data8
!byte ch1F1F0F0F07070301
!byte chFEFEFEFCFEFCFCF8
!byte chFF7F7F3F7F3F3F1F
!byte chFEFEFEFCFEFCFCF8
!byte $95 ;skip
!byte $01 ;data8
!byte ch1F1F0F0F07070301
!byte chF8F8F0F0E0E0C080
!byte $B7 ;skip
!byte $07 ;data8
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chC0C0C0C0C0C0C0C0
!byte $8F ;skip
!byte $07 ;data8
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCE0C0C0C0C0C0
!byte chCCCCCCCCCCECFCFC
!byte chF0F8CCCCCCCCCCCC
!byte ch3030303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chC0C0C0C0C0E0FCFC
!byte $A4 ;skip
!byte $0D ;data8
!byte chC6C6C6C6C6C6C6C6
!byte chFCFC303030303030
!byte chC0C0C0C0C0C0C0C0
!byte chC0C0C0C0C0C0C0C0
!byte ch0000000000000000
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte $89 ;skip
!byte $0D ;data8
!byte chD6D6D6D6D6F6FEFE
!byte ch303030303030FCFC
!byte chC0C0C0C0C0E0FCFC
!byte chC0C0C0C0C0E0FCFC
!byte ch0000000000000000
!byte chFCFC1C0C0C1CFCFC
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCCCCCCC
!byte ch0000000000000000
!byte chCCCCCCCCCCECFCFC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0E0FCFC
!byte chCCCCCCCCCCCCCCCC
!byte $CF,$CE ;addr
!byte $0C ;data8
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chF0F8CCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte $8A ;skip
!byte $0C ;data8
!byte ch303030303030FCFC
!byte chCCCCCCCCCCCCCCCC
!byte ch0000000000000000
!byte ch3030303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000000000
!byte chCCCCCCCCCCECFCFC
!byte chFCFCDCCCCCCCCCCC
!byte chF0F8CCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte chFCFCE0C0C0E0FCFC
!byte chCCCCCCCCCCCCCCCC
!byte $e1,96



;,; *_001
;,; <- deps_portalwillopen
; method 0 ( bytes ) -- 58 bytes (350 cumu)
; method 1 ( ibpc0 bytes ) -- 61 bytes (353 cumu)
; method 2 ( bytes ) -- 58 bytes (350 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 92 bytes (384 cumu)
; method 4 ( clrscr bytes ) -- 247 bytes (539 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 264 bytes (556 cumu)
; method 6 ( clrscr bytes ) -- 247 bytes (539 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 273 bytes (565 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 78
;,; <- chFEFEFEFCFEFCFCF8 ; 12
;,; <- chFF7F7F3F7F3F3F1F ; 12
;,; <- chFEFEFCFCF8F8F0E0 ; 10
;,; <- ch7F7F3F3F1F1F0F07 ; 11
;,; <- chF8F8F0F0E0E0C080 ; 9
;,; <- ch1F1F0F0F07070301 ; 9
;,; <- ch0000000000000000 ; 312
;,; <- ch0303010100000000 ; 1
;,; <- ch4002001000044100 ; 20
;,; <- ch5002148128004210 ; 8
;,; <- chFCFC303030303030 ; 2
;,; <- chFCFCDCCCCCCCCCCC ; 6
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- chFCFCE0C0C0C0C0C0 ; 3
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- ch303030303030FCFC ; 1
;,; <- ch3030303030303030 ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 2
;,; <- chCCCCCCCCCCECFCFC ; 2
; total unique chars in pic: 20 (worst case req 160 bytes)
!byte $DA,$E2 ;addr
!byte $e2,1;mode4
!byte $02 ;data4
!byte $33
!byte $33
!byte $13
!byte $95 ;skip
!byte $00 ;data4
!byte $13
!byte $A4 ;skip
!byte $05 ;data4
!byte $55
!byte $15
!byte $13
!byte $33
!byte $31
!byte $51
!byte $DB,$30 ;addr
!byte $4E,$05 ;fill
!byte $05 ;data4
!byte $31
!byte $31
!byte $13
!byte $13
!byte $55
!byte $55
!byte $8C ;skip
!byte $44,$01 ;fill
!byte $CE,$E0 ;addr
!byte $5E,ch0000000000000000 ;fill
!byte $A4 ;skip
!byte $64,ch0000000000000000 ;fill
!byte $8C ;skip
!byte $46,chFFFFFFFFFFFFFFFF ;fill
!byte $8E ;skip
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch4002001000044100
!byte $46,ch5002148128004210 ;fill
!byte $00 ;data8
!byte ch4002001000044100
!byte $8D ;skip
!byte $48,ch4002001000044100 ;fill
!byte $8E ;skip
!byte $46,ch4002001000044100 ;fill
!byte $e1,12



;,; *_002
;,; <- deps_portalwillopen
; method 0 ( bytes ) -- 30 bytes (380 cumu)
; method 1 ( ibpc0 bytes ) -- 32 bytes (382 cumu)
; method 2 ( bytes ) -- 30 bytes (380 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 67 bytes (417 cumu)
; method 4 ( clrscr bytes ) -- 257 bytes (607 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 274 bytes (624 cumu)
; method 6 ( clrscr bytes ) -- 257 bytes (607 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 286 bytes (636 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 86
;,; <- chFEFEFEFCFEFCFCF8 ; 12
;,; <- chFF7F7F3F7F3F3F1F ; 12
;,; <- chFEFEFCFCF8F8F0E0 ; 10
;,; <- ch7F7F3F3F1F1F0F07 ; 11
;,; <- chF8F8F0F0E0E0C080 ; 9
;,; <- ch1F1F0F0F07070301 ; 9
;,; <- ch0000000000000000 ; 284
;,; <- ch0303010100000000 ; 1
;,; <- ch4002001000044100 ; 30
;,; <- ch5002148128004210 ; 18
;,; <- chFCFC303030303030 ; 2
;,; <- chFCFCDCCCCCCCCCCC ; 6
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- chFCFCE0C0C0C0C0C0 ; 3
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- ch303030303030FCFC ; 1
;,; <- ch3030303030303030 ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 2
;,; <- chCCCCCCCCCCECFCFC ; 2
; total unique chars in pic: 20 (worst case req 160 bytes)
!byte $DB,$41 ;addr
!byte $44,$01 ;fill
!byte $91 ;skip
!byte $e2,1;mode4
!byte $02 ;data4
!byte $33
!byte $33
!byte $33
!byte $CF,$40 ;addr
!byte $46,chFFFFFFFFFFFFFFFF ;fill
!byte $BD ;skip
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch4002001000044100
!byte $48,ch5002148128004210 ;fill
!byte $00 ;data8
!byte ch4002001000044100
!byte $8A ;skip
!byte $4C,ch4002001000044100 ;fill
!byte $8A ;skip
!byte $4A,ch4002001000044100 ;fill
!byte $e1,12



;,; *_003
;,; <- deps_portalwillopen
; method 0 ( bytes ) -- 45 bytes (425 cumu)
; method 1 ( ibpc0 bytes ) -- 47 bytes (427 cumu)
; method 2 ( bytes ) -- 45 bytes (425 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 83 bytes (463 cumu)
; method 4 ( clrscr bytes ) -- 279 bytes (659 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 298 bytes (678 cumu)
; method 6 ( clrscr bytes ) -- 279 bytes (659 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 311 bytes (691 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 94
;,; <- chFEFEFEFCFEFCFCF8 ; 12
;,; <- chFF7F7F3F7F3F3F1F ; 12
;,; <- chFEFEFCFCF8F8F0E0 ; 10
;,; <- ch7F7F3F3F1F1F0F07 ; 11
;,; <- chF8F8F0F0E0E0C080 ; 9
;,; <- ch1F1F0F0F07070301 ; 9
;,; <- ch0000000000000000 ; 272
;,; <- ch0303010100000000 ; 1
;,; <- ch4002001000044100 ; 9
;,; <- ch0000000010000000 ; 2
;,; <- ch5002148128004210 ; 27
;,; <- chF05A2CC52A554ABD ; 14
;,; <- chFCFC303030303030 ; 2
;,; <- chFCFCDCCCCCCCCCCC ; 6
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- chFCFCE0C0C0C0C0C0 ; 3
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- ch303030303030FCFC ; 1
;,; <- ch3030303030303030 ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 2
;,; <- chCCCCCCCCCCECFCFC ; 2
; total unique chars in pic: 22 (worst case req 176 bytes)
!byte $DB,$29 ;addr
!byte $44,$01 ;fill
!byte $91 ;skip
!byte $e2,1;mode4
!byte $02 ;data4
!byte $33
!byte $33
!byte $33
!byte $92 ;skip
!byte $01 ;data4
!byte $11
!byte $11
!byte $CF,$28 ;addr
!byte $46,chFFFFFFFFFFFFFFFF ;fill
!byte $A6 ;skip
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch4002001000044100
!byte $87 ;skip
!byte $00 ;data8
!byte ch4002001000044100
!byte $8C ;skip
!byte $01 ;data8
!byte ch0000000010000000
!byte ch5002148128004210
!byte $46,chF05A2CC52A554ABD ;fill
!byte $01 ;data8
!byte ch5002148128004210
!byte ch0000000010000000
!byte $8E ;skip
!byte $44,chF05A2CC52A554ABD ;fill
!byte $8E ;skip
!byte $49,ch5002148128004210 ;fill
!byte $8D ;skip
!byte $48,ch5002148128004210 ;fill
!byte $e1,12



;,; *_004
;,; <- deps_portalwillopen
; method 0 ( bytes ) -- 78 bytes (503 cumu)
; method 1 ( ibpc0 bytes ) -- 80 bytes (505 cumu)
; method 2 ( bytes ) -- 78 bytes (503 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 122 bytes (547 cumu)
; method 4 ( clrscr bytes ) -- 292 bytes (717 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 311 bytes (736 cumu)
; method 6 ( clrscr bytes ) -- 292 bytes (717 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 330 bytes (755 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 110
;,; <- chFEFEFEFCFEFCFCF8 ; 12
;,; <- chFF7F7F3F7F3F3F1F ; 12
;,; <- chFEFEFCFCF8F8F0E0 ; 10
;,; <- ch7F7F3F3F1F1F0F07 ; 11
;,; <- chF8F8F0F0E0E0C080 ; 9
;,; <- ch1F1F0F0F07070301 ; 9
;,; <- ch0000000000000000 ; 248
;,; <- ch0303010100000000 ; 1
;,; <- ch5002148128004210 ; 17
;,; <- ch0000000010000000 ; 1
;,; <- chF05A2CC52A554ABD ; 36
;,; <- ch4002001000044100 ; 6
;,; <- chFCFC303030303030 ; 2
;,; <- chFCFCDCCCCCCCCCCC ; 6
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- chFCFCE0C0C0C0C0C0 ; 3
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- ch303030303030FCFC ; 1
;,; <- ch3030303030303030 ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 2
;,; <- chCCCCCCCCCCECFCFC ; 2
; total unique chars in pic: 22 (worst case req 176 bytes)
!byte $DA,$F9 ;addr
!byte $44,$01 ;fill
!byte $92 ;skip
!byte $e2,1;mode4
!byte $01 ;data4
!byte $33
!byte $33
!byte $92 ;skip
!byte $02 ;data4
!byte $13
!byte $11
!byte $31
!byte $92 ;skip
!byte $01 ;data4
!byte $31
!byte $13
!byte $94 ;skip
!byte $00 ;data4
!byte $33
!byte $CE,$F8 ;addr
!byte $46,chFFFFFFFFFFFFFFFF ;fill
!byte $8F ;skip
!byte $46,chFFFFFFFFFFFFFFFF ;fill
!byte $BE ;skip
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch5002148128004210
!byte $87 ;skip
!byte $00 ;data8
!byte ch5002148128004210
!byte $8B ;skip
!byte $01 ;data8
!byte ch0000000010000000
!byte ch5002148128004210
!byte $89 ;skip
!byte $00 ;data8
!byte ch5002148128004210
!byte $8A ;skip
!byte $01 ;data8
!byte ch5002148128004210
!byte ch5002148128004210
!byte $48,chF05A2CC52A554ABD ;fill
!byte $01 ;data8
!byte ch5002148128004210
!byte ch4002001000044100
!byte $88 ;skip
!byte $02 ;data8
!byte ch4002001000044100
!byte ch5002148128004210
!byte ch5002148128004210
!byte $48,chF05A2CC52A554ABD ;fill
!byte $01 ;data8
!byte ch5002148128004210
!byte ch5002148128004210
!byte $88 ;skip
!byte $03 ;data8
!byte ch4002001000044100
!byte ch4002001000044100
!byte ch5002148128004210
!byte ch5002148128004210
!byte $46,chF05A2CC52A554ABD ;fill
!byte $02 ;data8
!byte ch5002148128004210
!byte ch5002148128004210
!byte ch4002001000044100
!byte $89 ;skip
!byte $00 ;data8
!byte ch4002001000044100
!byte $e1,12



;,; *_005
;,; <- deps_portalwillopen
; method 0 ( bytes ) -- 74 bytes (577 cumu)
; method 1 ( ibpc0 bytes ) -- 76 bytes (579 cumu)
; method 2 ( bytes ) -- 74 bytes (577 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 125 bytes (628 cumu)
; method 4 ( clrscr bytes ) -- 310 bytes (813 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 338 bytes (841 cumu)
; method 6 ( clrscr bytes ) -- 310 bytes (813 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 363 bytes (866 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 162
;,; <- chFEFEFEFCFEFCFCF8 ; 12
;,; <- chFF7F7F3F7F3F3F1F ; 12
;,; <- chFEFEFCFCF8F8F0E0 ; 10
;,; <- ch7F7F3F3F1F1F0F07 ; 11
;,; <- chF8F8F0F0E0E0C080 ; 9
;,; <- ch1F1F0F0F07070301 ; 9
;,; <- ch0000000000000000 ; 222
;,; <- ch0303010100000000 ; 1
;,; <- ch0000000010000000 ; 1
;,; <- ch5002148128004210 ; 13
;,; <- ch4002001000044100 ; 14
;,; <- chF05A2CC52A554ABD ; 6
;,; <- chFCFC303030303030 ; 2
;,; <- chFCFCDCCCCCCCCCCC ; 6
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- chFCFCE0C0C0C0C0C0 ; 3
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- ch303030303030FCFC ; 1
;,; <- ch3030303030303030 ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 2
;,; <- chCCCCCCCCCCECFCFC ; 2
; total unique chars in pic: 22 (worst case req 176 bytes)
!byte $DA,$F9 ;addr
!byte $e2,1;mode4
!byte $02 ;data4
!byte $13
!byte $11
!byte $31
!byte $92 ;skip
!byte $01 ;data4
!byte $31
!byte $13
!byte $94 ;skip
!byte $00 ;data4
!byte $33
!byte $CE,$C8 ;addr
!byte $46,chFFFFFFFFFFFFFFFF ;fill
!byte $8F ;skip
!byte $46,chFFFFFFFFFFFFFFFF ;fill
!byte $CF,$56 ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch0000000010000000
!byte $95 ;skip
!byte $02 ;data8
!byte ch0000000000000000
!byte ch5002148128004210
!byte ch5002148128004210
!byte $46,chFFFFFFFFFFFFFFFF ;fill
!byte $8E ;skip
!byte $48,chFFFFFFFFFFFFFFFF ;fill
!byte $8C ;skip
!byte $00 ;data8
!byte chF05A2CC52A554ABD
!byte $48,chFFFFFFFFFFFFFFFF ;fill
!byte $00 ;data8
!byte chF05A2CC52A554ABD
!byte $8A ;skip
!byte $02 ;data8
!byte ch5002148128004210
!byte chF05A2CC52A554ABD
!byte chF05A2CC52A554ABD
!byte $46,chFFFFFFFFFFFFFFFF ;fill
!byte $03 ;data8
!byte chF05A2CC52A554ABD
!byte chF05A2CC52A554ABD
!byte ch4002001000044100
!byte ch4002001000044100
!byte $86 ;skip
!byte $01 ;data8
!byte ch4002001000044100
!byte ch4002001000044100
!byte $8D ;skip
!byte $01 ;data8
!byte ch4002001000044100
!byte ch4002001000044100
!byte $85 ;skip
!byte $02 ;data8
!byte ch4002001000044100
!byte ch4002001000044100
!byte ch5002148128004210
!byte $8C ;skip
!byte $01 ;data8
!byte ch4002001000044100
!byte ch4002001000044100
!byte $e1,12



;,; *_006
;,; <- deps_portalwillopen
; method 0 ( bytes ) -- 112 bytes (689 cumu)
; method 1 ( ibpc0 bytes ) -- 114 bytes (691 cumu)
; method 2 ( bytes ) -- 112 bytes (689 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 170 bytes (747 cumu)
; method 4 ( clrscr bytes ) -- 349 bytes (926 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 370 bytes (947 cumu)
; method 6 ( clrscr bytes ) -- 349 bytes (926 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 397 bytes (974 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 185
;,; <- chFEFEFEFCFEFCFCF8 ; 12
;,; <- chFF7F7F3F7F3F3F1F ; 12
;,; <- chFEFEFCFCF8F8F0E0 ; 10
;,; <- ch7F7F3F3F1F1F0F07 ; 11
;,; <- chF8F8F0F0E0E0C080 ; 9
;,; <- ch1F1F0F0F07070301 ; 9
;,; <- ch0000000000000000 ; 182
;,; <- ch0303010100000000 ; 1
;,; <- ch4002001000044100 ; 14
;,; <- ch5002148128004210 ; 22
;,; <- chF05A2CC52A554ABD ; 15
;,; <- chFCFC303030303030 ; 2
;,; <- chFCFCDCCCCCCCCCCC ; 6
;,; <- chCCCCCCCCCCCCCCCC ; 3
;,; <- chFCFCE0C0C0C0C0C0 ; 3
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- ch303030303030FCFC ; 1
;,; <- ch3030303030303030 ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 2
;,; <- chCCCCCCCCCCECFCFC ; 2
; total unique chars in pic: 21 (worst case req 168 bytes)
!byte $DA,$98 ;addr
!byte $46,$01 ;fill
!byte $8F ;skip
!byte $e2,1;mode4
!byte $03 ;data4
!byte $31
!byte $33
!byte $33
!byte $13
!byte $90 ;skip
!byte $02 ;data4
!byte $13
!byte $11
!byte $31
!byte $92 ;skip
!byte $01 ;data4
!byte $31
!byte $13
!byte $94 ;skip
!byte $00 ;data4
!byte $33
!byte $CE,$98 ;addr
!byte $46,chFFFFFFFFFFFFFFFF ;fill
!byte $8F ;skip
!byte $46,chFFFFFFFFFFFFFFFF ;fill
!byte $CF,$3F ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch4002001000044100
!byte $94 ;skip
!byte $01 ;data8
!byte ch4002001000044100
!byte ch4002001000044100
!byte $94 ;skip
!byte $03 ;data8
!byte ch4002001000044100
!byte ch5002148128004210
!byte ch5002148128004210
!byte chF05A2CC52A554ABD
!byte $87 ;skip
!byte $00 ;data8
!byte chF05A2CC52A554ABD
!byte $89 ;skip
!byte $03 ;data8
!byte ch4002001000044100
!byte ch5002148128004210
!byte chF05A2CC52A554ABD
!byte chF05A2CC52A554ABD
!byte $89 ;skip
!byte $01 ;data8
!byte chF05A2CC52A554ABD
!byte chF05A2CC52A554ABD
!byte $85 ;skip
!byte $05 ;data8
!byte ch4002001000044100
!byte ch4002001000044100
!byte ch5002148128004210
!byte chF05A2CC52A554ABD
!byte chF05A2CC52A554ABD
!byte chFFFFFFFFFFFFFFFF
!byte $8A ;skip
!byte $01 ;data8
!byte chF05A2CC52A554ABD
!byte ch5002148128004210
!byte $84 ;skip
!byte $03 ;data8
!byte ch4002001000044100
!byte ch5002148128004210
!byte ch5002148128004210
!byte chF05A2CC52A554ABD
!byte $4B,chFFFFFFFFFFFFFFFF ;fill
!byte $0B ;data8
!byte chF05A2CC52A554ABD
!byte ch5002148128004210
!byte ch5002148128004210
!byte ch4002001000044100
!byte ch4002001000044100
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch4002001000044100
!byte ch5002148128004210
!byte ch5002148128004210
!byte chF05A2CC52A554ABD
!byte chFFFFFFFFFFFFFFFF
!byte $8C ;skip
!byte $0A ;data8
!byte ch5002148128004210
!byte ch5002148128004210
!byte ch4002001000044100
!byte ch4002001000044100
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch5002148128004210
!byte ch5002148128004210
!byte ch5002148128004210
!byte chF05A2CC52A554ABD
!byte chF05A2CC52A554ABD
!byte $8C ;skip
!byte $03 ;data8
!byte ch5002148128004210
!byte ch5002148128004210
!byte ch5002148128004210
!byte ch4002001000044100
!byte $e1,12



;,; *_007
;,; <- deps_portalwillopen
; method 0 ( bytes ) -- 144 bytes (833 cumu)
; method 1 ( ibpc0 bytes ) -- 157 bytes (846 cumu)
; method 2 ( bytes ) -- 144 bytes (833 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 217 bytes (906 cumu)
; method 4 ( clrscr bytes ) -- 323 bytes (1012 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 349 bytes (1038 cumu)
; method 6 ( clrscr bytes ) -- 323 bytes (1012 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 370 bytes (1059 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 244
;,; <- chFEFEFEFCFEFCFCF8 ; 10
;,; <- chFF7F7F3F7F3F3F1F ; 10
;,; <- chFEFEFCFCF8F8F0E0 ; 6
;,; <- ch7F7F3F3F1F1F0F07 ; 7
;,; <- chF8F8F0F0E0E0C080 ; 5
;,; <- ch1F1F0F0F07070301 ; 6
;,; <- ch0000000000000000 ; 147
;,; <- ch0000000010000000 ; 2
;,; <- ch4002001000044100 ; 19
;,; <- ch5002148128004210 ; 26
;,; <- chF05A2CC52A554ABD ; 22
; total unique chars in pic: 12 (worst case req 96 bytes)
!byte $DA,$50 ;addr
!byte $46,$01 ;fill
!byte $8F ;skip
!byte $e2,1;mode4
!byte $03 ;data4
!byte $31
!byte $33
!byte $33
!byte $13
!byte $8F ;skip
!byte $03 ;data4
!byte $31
!byte $11
!byte $11
!byte $13
!byte $90 ;skip
!byte $02 ;data4
!byte $13
!byte $33
!byte $31
!byte $92 ;skip
!byte $01 ;data4
!byte $31
!byte $13
!byte $94 ;skip
!byte $00 ;data4
!byte $33
!byte $DB,$CE ;addr
!byte $63,$05 ;fill
!byte $CE,$50 ;addr
!byte $46,chFFFFFFFFFFFFFFFF ;fill
!byte $8F ;skip
!byte $46,chFFFFFFFFFFFFFFFF ;fill
!byte $8F ;skip
!byte $46,chFFFFFFFFFFFFFFFF ;fill
!byte $CF,$25 ;addr
!byte $e2,0;mode8
!byte $02 ;data8
!byte ch0000000010000000
!byte ch0000000000000000
!byte ch4002001000044100
!byte $87 ;skip
!byte $01 ;data8
!byte ch4002001000044100
!byte ch4002001000044100
!byte $8A ;skip
!byte $02 ;data8
!byte ch4002001000044100
!byte ch4002001000044100
!byte ch5002148128004210
!byte $87 ;skip
!byte $03 ;data8
!byte ch5002148128004210
!byte ch4002001000044100
!byte ch4002001000044100
!byte ch0000000010000000
!byte $87 ;skip
!byte $03 ;data8
!byte ch4002001000044100
!byte ch5002148128004210
!byte ch5002148128004210
!byte chF05A2CC52A554ABD
!byte $87 ;skip
!byte $03 ;data8
!byte chF05A2CC52A554ABD
!byte ch5002148128004210
!byte ch5002148128004210
!byte ch4002001000044100
!byte $85 ;skip
!byte $04 ;data8
!byte ch4002001000044100
!byte ch4002001000044100
!byte ch5002148128004210
!byte ch5002148128004210
!byte chF05A2CC52A554ABD
!byte $89 ;skip
!byte $03 ;data8
!byte chF05A2CC52A554ABD
!byte ch5002148128004210
!byte ch5002148128004210
!byte ch4002001000044100
!byte $83 ;skip
!byte $02 ;data8
!byte ch4002001000044100
!byte ch4002001000044100
!byte ch5002148128004210
!byte $8E ;skip
!byte $02 ;data8
!byte ch5002148128004210
!byte ch5002148128004210
!byte ch4002001000044100
!byte $83 ;skip
!byte $00 ;data8
!byte ch5002148128004210
!byte $8D ;skip
!byte $0A ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chF05A2CC52A554ABD
!byte chF05A2CC52A554ABD
!byte ch5002148128004210
!byte ch5002148128004210
!byte ch4002001000044100
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch5002148128004210
!byte ch5002148128004210
!byte chF05A2CC52A554ABD
!byte $8D ;skip
!byte $09 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chF05A2CC52A554ABD
!byte chF05A2CC52A554ABD
!byte ch5002148128004210
!byte ch5002148128004210
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch5002148128004210
!byte ch5002148128004210
!byte chF05A2CC52A554ABD
!byte $4E,chFFFFFFFFFFFFFFFF ;fill
!byte $06 ;data8
!byte chF05A2CC52A554ABD
!byte ch5002148128004210
!byte ch5002148128004210
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch4002001000044100
!byte chF05A2CC52A554ABD
!byte $50,chFFFFFFFFFFFFFFFF ;fill
!byte $00 ;data8
!byte chF05A2CC52A554ABD
!byte $e1,24

; total compressed size 833 bytes
