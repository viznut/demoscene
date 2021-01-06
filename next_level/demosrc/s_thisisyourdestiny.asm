;,; lyrics_thisisyourdestiny .withinpagefrom=lyrics
;,; <- lyrics

	!byte $1d,$31,$24		; THIS
	!byte $31,$24			; IS
	!byte $31,$00			; YOUR
	!byte $29,$1d,$33,$24		; DES
	!byte $19,$1d,$31		; TI
	!byte $22,$31,$09		; NY
	!byte $23,$24			; AS
	!byte $26,$61			; WO
	!byte $28,$61,$42		; MEN	; was ,22
	!byte $33,$22			; AN(D)	; was ,63,52 or sumthng
	!byte $28,$63,$62		; MEN
	!byte $0f

;,; deps_thisisyourdestiny
;,; <- ibpcaablocks
;,; <- lyrics_thisisyourdestiny

;,; SC32_000
;,; <- deps_thisisyourdestiny
;,; <- streamvars
;,; <- player_ivars
!src "demosrc/smac.inc"

+sAddr nextlyrictosing
!byte $00,lyrics_thisisyourdestiny-lyrics

; method 4 ( clrscr bytes ) -- 355 bytes (355 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 381 bytes (381 cumu)
; method 6 ( clrscr bytes ) -- 355 bytes (355 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 369 bytes (369 cumu)
; METHOD 4 CHOSEN
!byte $e4,1,ch0000000000000000 ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 61
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 4
;,; <- ch0000000000000000 ; 303
;,; <- chFCFC303030303030 ; 5
;,; <- chCCCCCCCCCCCCCCCC ; 6
;,; <- chFCFCE0C0C0C0C0C0 ; 7
;,; <- chCCCCCCCCCCECFCFC ; 7
;,; <- chFCFCDCCCCCCCCCCC ; 12
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch3030303030303030 ; 4
;,; <- ch303030303030FCFC ; 3
;,; <- chFCFC1C0C0C1CFCFC ; 4
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- ch00030C12262C4040 ; 1
;,; <- ch082A1C7F1C2A0800 ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 3
;,; <- ch4040402020100C03 ; 1
;,; <- ch0202040408106080 ; 1
;,; <- ch0F0F0F0F00030303 ; 2
;,; <- ch9F9F9F9F00CFCFCF ; 2
;,; <- chFFFFFFFF00FFFFFF ; 4
;,; <- chF0F0F0F000C0C0C0 ; 2
;,; <- chC6C6C6C6C6C6C6C6 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 2
;,; <- ch00BEBEFE5C5C5C5C ; 4
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- ch5C5C5C5C5C5C5C5C ; 20
;,; <- ch0000101038387CFE ; 3
;,; <- ch0001071F3F0F0300 ; 6
;,; <- chF0E0C08000000000 ; 1
;,; <- ch0080E0F8FCF0C000 ; 7
;,; <- chFFFFFFFFFEFEFEFE ; 1
;,; <- ch0008080800000000 ; 1
;,; <- ch000000000103070F ; 1
;,; <- chFEFEFEFEFFFFFFFF ; 1
;,; <- ch00000000C0E0F0F0 ; 1
;,; <- ch1F1F1F1F1F1F1F1F ; 1
;,; <- ch101038387C7C7438 ; 1
;,; <- chC0C0C0E0E1E0E0E0 ; 1
;,; <- ch1F3F7FFFFFFF7F3F ; 1
;,; <- chE0C0800000000000 ; 1
;,; <- ch3F3F3F3F3F3F3F3F ; 2
;,; <- ch80C0E0F0F8F8F8F8 ; 1
;,; <- chF8F8F8F8C0C0C0C0 ; 1
;,; <- ch7F7F7F7F7F7F7F7F ; 1
; total unique chars in pic: 46 (worst case req 368 bytes)
!byte $DA,$00 ;addr
!byte $47,$07 ;fill
!byte $8E ;skip
!byte $47,$07 ;fill
!byte $e2,1;mode4
!byte $02 ;data4
!byte $11
!byte $11
!byte $71
!byte $88 ;skip
!byte $47,$07 ;fill
!byte $02 ;data4
!byte $11
!byte $11
!byte $71
!byte $BC ;skip
!byte $00 ;data4
!byte $14
!byte $A9 ;skip
!byte $02 ;data4
!byte $77
!byte $77
!byte $77
!byte $87 ;skip
!byte $00 ;data4
!byte $17
!byte $87 ;skip
!byte $02 ;data4
!byte $33
!byte $73
!byte $33
!byte $87 ;skip
!byte $00 ;data4
!byte $17
!byte $87 ;skip
!byte $02 ;data4
!byte $33
!byte $73
!byte $33
!byte $91 ;skip
!byte $02 ;data4
!byte $33
!byte $73
!byte $33
!byte $91 ;skip
!byte $02 ;data4
!byte $33
!byte $73
!byte $33
!byte $91 ;skip
!byte $02 ;data4
!byte $33
!byte $73
!byte $33
!byte $91 ;skip
!byte $02 ;data4
!byte $33
!byte $73
!byte $33
!byte $91 ;skip
!byte $02 ;data4
!byte $33
!byte $73
!byte $33
!byte $91 ;skip
!byte $02 ;data4
!byte $33
!byte $73
!byte $33
!byte $91 ;skip
!byte $02 ;data4
!byte $33
!byte $73
!byte $33
!byte $91 ;skip
!byte $03 ;data4
!byte $33
!byte $33
!byte $33
!byte $71
!byte $DB,$9F ;addr
!byte $48,$07 ;fill
!byte $86 ;skip
!byte $03 ;data4
!byte $33
!byte $33
!byte $33
!byte $31
!byte $DB,$B7 ;addr
!byte $47,$03 ;fill
!byte $87 ;skip
!byte $6E,$05 ;fill
!byte $CE,$00 ;addr
!byte $e2,0;mode8
!byte $08 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte $8E ;skip
!byte $19 ;data8
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chCCCCCCCCCCCCCCCC
!byte chFCFC303030303030
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chCCCCCCCCCCECFCFC
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3C3C3C3C18180000
!byte $83 ;skip
!byte $0F ;data8
!byte ch3C3C3C3C18180000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3030303030303030
!byte chFCFCDCCCCCCCCCCC
!byte ch303030303030FCFC
!byte chFCFC1C0C0C1CFCFC
!byte ch0000000000000000
!byte ch303030303030FCFC
!byte chFCFC1C0C0C1CFCFC
!byte ch0000000000000000
!byte ch3030303030303030
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCECFCFC
!byte chF0F8CCCCCCCCCCCC
!byte $A5 ;skip
!byte $09 ;data8
!byte chF0F8CCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte chFCFC303030303030
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte $84 ;skip
!byte $01 ;data8
!byte ch00030C12262C4040
!byte ch082A1C7F1C2A0800
!byte $86 ;skip
!byte $09 ;data8
!byte chCCCCCCCCCCECFCFC
!byte chFCFCE0C0C0E0FCFC
!byte chFCFC1C0C0C1CFCFC
!byte ch3030303030303030
!byte ch303030303030FCFC
!byte chCCCCCCCCCCCCCCCC
!byte ch3030303030303030
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chFCFC1C0C0C1CFCFC
!byte $84 ;skip
!byte $01 ;data8
!byte ch4040402020100C03
!byte ch0202040408106080
!byte $93 ;skip
!byte $14 ;data8
!byte ch0F0F0F0F00030303
!byte ch9F9F9F9F00CFCFCF
!byte chFFFFFFFF00FFFFFF
!byte chFFFFFFFF00FFFFFF
!byte chF0F0F0F000C0C0C0
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCDCCCCCCCCCCC
!byte chFEFEDED6D6D6D6D6
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chF0F8CCCCCCCCCCCC
!byte ch0000000000000000
!byte chFEFEDED6D6D6D6D6
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte $83 ;skip
!byte $02 ;data8
!byte ch00BEBEFE5C5C5C5C
!byte ch0000000000000000
!byte ch00BEBEFE5C5C5C5C
!byte $83 ;skip
!byte $0C ;data8
!byte chD6D6D6D6D6F6FEFE
!byte chCCCCCCCCCCECFCFC
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCE0C0C0E0FCFC
!byte chCCCCCCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte ch0000000000000000
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCE0C0C0E0FCFC
!byte chCCCCCCCCCCCCCCCC
!byte $83 ;skip
!byte $02 ;data8
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte $94 ;skip
!byte $02 ;data8
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte $94 ;skip
!byte $02 ;data8
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte $8B ;skip
!byte $02 ;data8
!byte ch0000101038387CFE
!byte ch0000101038387CFE
!byte ch0000101038387CFE
!byte $85 ;skip
!byte $02 ;data8
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte $8A ;skip
!byte $04 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chF0E0C08000000000
!byte ch7F3F1F0F07030100
!byte ch0080E0F8FCF0C000
!byte $84 ;skip
!byte $02 ;data8
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte $8A ;skip
!byte $04 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFEFEFEFE
!byte ch0008080800000000
!byte ch000000000103070F
!byte ch0080E0F8FCF0C000
!byte $84 ;skip
!byte $02 ;data8
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte $8A ;skip
!byte $04 ;data8
!byte ch0001071F3F0F0300
!byte chFEFEFEFEFFFFFFFF
!byte ch00000000C0E0F0F0
!byte ch1F1F1F1F1F1F1F1F
!byte ch0080E0F8FCF0C000
!byte $84 ;skip
!byte $04 ;data8
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch101038387C7C7438
!byte $88 ;skip
!byte $04 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chC0C0C0E0E1E0E0E0
!byte ch1F3F7FFFFFFF7F3F
!byte ch0080E0F8FCF0C000
!byte $84 ;skip
!byte $02 ;data8
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte $8A ;skip
!byte $04 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chE0C0800000000000
!byte ch3F3F3F3F3F3F3F3F
!byte ch0080E0F8FCF0C000
!byte $84 ;skip
!byte $02 ;data8
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte $86 ;skip
!byte $08 ;data8
!byte ch0F0F0F0F00030303
!byte ch9F9F9F9F00CFCFCF
!byte chFFFFFFFF00FFFFFF
!byte chFFFFFFFF00FFFFFF
!byte chF0F0F0F000C0C0C0
!byte chFFFFFFFFFFFFFFFF
!byte ch80C0E0F0F8F8F8F8
!byte ch3F3F3F3F3F3F3F3F
!byte ch0080E0F8FCF0C000
!byte $84 ;skip
!byte $02 ;data8
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte $87 ;skip
!byte $0A ;data8
!byte ch00BEBEFE5C5C5C5C
!byte ch0000000000000000
!byte ch00BEBEFE5C5C5C5C
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chF8F8F8F8C0C0C0C0
!byte ch7F7F7F7F7F7F7F7F
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte $6E,chFFFFFFFFFFFFFFFF ;fill
!byte $e1,12



;,; *_001
;,; <- deps_thisisyourdestiny
; method 0 ( bytes ) -- 71 bytes (426 cumu)
; method 1 ( ibpc0 bytes ) -- 71 bytes (426 cumu)
; method 2 ( bytes ) -- 71 bytes (426 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 77 bytes (432 cumu)
; method 4 ( clrscr bytes ) -- 351 bytes (706 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 379 bytes (734 cumu)
; method 6 ( clrscr bytes ) -- 351 bytes (706 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 365 bytes (720 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 61
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 4
;,; <- ch0000000000000000 ; 305
;,; <- chFCFC303030303030 ; 5
;,; <- chCCCCCCCCCCCCCCCC ; 6
;,; <- chFCFCE0C0C0C0C0C0 ; 7
;,; <- chCCCCCCCCCCECFCFC ; 7
;,; <- chFCFCDCCCCCCCCCCC ; 12
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch3030303030303030 ; 4
;,; <- ch303030303030FCFC ; 3
;,; <- chFCFC1C0C0C1CFCFC ; 4
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- ch00030C12262C4040 ; 1
;,; <- ch082A1C7F1C2A0800 ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 3
;,; <- ch4040402020100C03 ; 1
;,; <- ch0202040408106080 ; 1
;,; <- ch0F0F0F0F00030303 ; 2
;,; <- ch9F9F9F9F00CFCFCF ; 2
;,; <- chFFFFFFFF00FFFFFF ; 4
;,; <- chF0F0F0F000C0C0C0 ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 2
;,; <- ch00BEBEFE5C5C5C5C ; 4
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- ch5C5C5C5C5C5C5C5C ; 20
;,; <- ch0000101038387CFE ; 3
;,; <- ch0001071F3F0F0300 ; 5
;,; <- chF0E0C08000000000 ; 1
;,; <- ch0080E0F8FCF0C000 ; 7
;,; <- chFFFFFFFFFEFEFEFE ; 1
;,; <- ch0008080800000000 ; 1
;,; <- ch000000000103070F ; 1
;,; <- chFEFEFEFEFFFFFFFF ; 1
;,; <- ch00000000C0E0F0F0 ; 1
;,; <- ch1F1F1F1F1F1F1F1F ; 1
;,; <- chC0C0C0E0E1E0E0E0 ; 1
;,; <- ch1F3F7FFFFFFF7F3F ; 1
;,; <- ch101038387C7C7438 ; 1
;,; <- chE0C0800000000000 ; 1
;,; <- ch3F3F3F3F3F3F3F3F ; 1
;,; <- ch80C0E0F0F8F8F8F8 ; 1
;,; <- ch3F3F3F1F1F0F0F07 ; 1
;,; <- chC0C0C0C0FFFFFFFF ; 1
;,; <- ch47436361C1C0C0C0 ; 1
; total unique chars in pic: 47 (worst case req 376 bytes)
!byte $DB,$A8 ;addr
!byte $00,$01 ;fill
!byte $CF,$18 ;addr
!byte $03 ;data8
!byte ch0000101038387CFE
!byte ch0000101038387CFE
!byte ch0000101038387CFE
!byte ch0000000000000000
!byte $92 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chF0E0C08000000000
!byte ch7F3F1F0F07030100
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $91 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFEFEFEFE
!byte ch0008080800000000
!byte ch000000000103070F
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $91 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFEFEFEFEFFFFFFFF
!byte ch00000000C0E0F0F0
!byte ch1F1F1F1F1F1F1F1F
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $88 ;skip
!byte $00,ch0000000000000000 ;fill
!byte $87 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chC0C0C0E0E1E0E0E0
!byte ch1F3F7FFFFFFF7F3F
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $88 ;skip
!byte $00 ;data8
!byte ch101038387C7C7438
!byte $87 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chE0C0800000000000
!byte ch3F3F3F3F3F3F3F3F
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $92 ;skip
!byte $04 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch80C0E0F0F8F8F8F8
!byte ch3F3F3F1F1F0F0F07
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $92 ;skip
!byte $04 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chC0C0C0C0FFFFFFFF
!byte ch47436361C1C0C0C0
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $e1,12



;,; *_002
;,; <- deps_thisisyourdestiny
; method 0 ( bytes ) -- 71 bytes (497 cumu)
; method 1 ( ibpc0 bytes ) -- 79 bytes (505 cumu)
; method 2 ( bytes ) -- 71 bytes (497 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 83 bytes (509 cumu)
; method 4 ( clrscr bytes ) -- 355 bytes (781 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 382 bytes (808 cumu)
; method 6 ( clrscr bytes ) -- 355 bytes (781 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 368 bytes (794 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 60
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 4
;,; <- ch0000000000000000 ; 303
;,; <- chFCFC303030303030 ; 5
;,; <- chCCCCCCCCCCCCCCCC ; 6
;,; <- chFCFCE0C0C0C0C0C0 ; 7
;,; <- chCCCCCCCCCCECFCFC ; 7
;,; <- chFCFCDCCCCCCCCCCC ; 12
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch3030303030303030 ; 4
;,; <- ch303030303030FCFC ; 3
;,; <- chFCFC1C0C0C1CFCFC ; 4
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- ch00030C12262C4040 ; 1
;,; <- ch082A1C7F1C2A0800 ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 3
;,; <- ch4040402020100C03 ; 1
;,; <- ch0202040408106080 ; 1
;,; <- ch0F0F0F0F00030303 ; 2
;,; <- ch9F9F9F9F00CFCFCF ; 2
;,; <- chFFFFFFFF00FFFFFF ; 4
;,; <- chF0F0F0F000C0C0C0 ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 2
;,; <- ch00BEBEFE5C5C5C5C ; 4
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- ch5C5C5C5C5C5C5C5C ; 20
;,; <- ch0000101038387CFE ; 3
;,; <- ch0001071F3F0F0300 ; 6
;,; <- chF0E0C08000000000 ; 1
;,; <- ch0080E0F8FCF0C000 ; 7
;,; <- chFFFFFFFFFEFEFEFE ; 1
;,; <- ch0008080800000000 ; 1
;,; <- ch000000000103070F ; 1
;,; <- chFEFEFEFEFFFFFFFF ; 1
;,; <- ch00000000C0E0F0F0 ; 1
;,; <- ch1F1F1F1F1F1F1F1F ; 1
;,; <- chC0C0C0E0E1E0E0E0 ; 1
;,; <- ch1F3F7FFFFFFF7F3F ; 1
;,; <- chE0C0800000000000 ; 1
;,; <- ch3F3F3F3F3F3F3F3F ; 1
;,; <- ch80C0E0F0F8F8F8F8 ; 1
;,; <- ch3F3F030303030323 ; 1
;,; <- ch101038387C7C7438 ; 1
;,; <- ch7F7F7F7FFFFFFFFF ; 2
;,; <- chFE7C383810100000 ; 2
; total unique chars in pic: 47 (worst case req 376 bytes)
!byte $CE,$FF ;addr
!byte $02 ;data8
!byte ch0000101038387CFE
!byte ch0000101038387CFE
!byte ch0000101038387CFE
!byte $93 ;skip
!byte $04 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chF0E0C08000000000
!byte ch7F3F1F0F07030100
!byte ch0080E0F8FCF0C000
!byte $92 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFEFEFEFE
!byte ch0008080800000000
!byte ch000000000103070F
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $91 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFEFEFEFEFFFFFFFF
!byte ch00000000C0E0F0F0
!byte ch1F1F1F1F1F1F1F1F
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $91 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chC0C0C0E0E1E0E0E0
!byte ch1F3F7FFFFFFF7F3F
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $91 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chE0C0800000000000
!byte ch3F3F3F3F3F3F3F3F
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $89 ;skip
!byte $00,ch0000000000000000 ;fill
!byte $86 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte ch80C0E0F0F8F8F8F8
!byte ch3F3F030303030323
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $89 ;skip
!byte $00 ;data8
!byte ch101038387C7C7438
!byte $88 ;skip
!byte $03 ;data8
!byte ch7F7F7F7FFFFFFFFF
!byte ch7F7F7F7FFFFFFFFF
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $93 ;skip
!byte $03 ;data8
!byte chFE7C383810100000
!byte chFE7C383810100000
!byte ch0000000000000000
!byte ch0000000000000000
!byte $e1,12



;,; *_003
;,; <- deps_thisisyourdestiny
; method 0 ( bytes ) -- 83 bytes (580 cumu)
; method 1 ( ibpc0 bytes ) -- 89 bytes (586 cumu)
; method 2 ( bytes ) -- 83 bytes (580 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 93 bytes (590 cumu)
; method 4 ( clrscr bytes ) -- 358 bytes (855 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 388 bytes (885 cumu)
; method 6 ( clrscr bytes ) -- 358 bytes (855 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 374 bytes (871 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 61
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 4
;,; <- ch0000000000000000 ; 302
;,; <- chFCFC303030303030 ; 5
;,; <- chCCCCCCCCCCCCCCCC ; 6
;,; <- chFCFCE0C0C0C0C0C0 ; 7
;,; <- chCCCCCCCCCCECFCFC ; 7
;,; <- chFCFCDCCCCCCCCCCC ; 12
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch3030303030303030 ; 4
;,; <- ch303030303030FCFC ; 3
;,; <- chFCFC1C0C0C1CFCFC ; 4
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- ch00030C12262C4040 ; 1
;,; <- ch082A1C7F1C2A0800 ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 3
;,; <- ch4040402020100C03 ; 1
;,; <- ch0202040408106080 ; 1
;,; <- ch0F0F0F0F00030303 ; 2
;,; <- ch9F9F9F9F00CFCFCF ; 2
;,; <- chFFFFFFFF00FFFFFF ; 4
;,; <- chF0F0F0F000C0C0C0 ; 2
;,; <- chC6C6C6C6C6C6C6C6 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 2
;,; <- ch00BEBEFE5C5C5C5C ; 4
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- ch5C5C5C5C5C5C5C5C ; 20
;,; <- ch0000101038387CFE ; 3
;,; <- ch0001071F3F0F0300 ; 7
;,; <- chF0E0C08000000000 ; 1
;,; <- ch0080E0F8FCF0C000 ; 7
;,; <- chFFFFFFFFFEFEFEFE ; 1
;,; <- ch0008080800000000 ; 1
;,; <- ch000000000103070F ; 1
;,; <- chFEFEFEFEFFFFFFFF ; 1
;,; <- ch00000000C0E0F0F0 ; 1
;,; <- ch1F1F1F1F1F1F1F1F ; 1
;,; <- chC0C0C0E0E1E0E0E0 ; 1
;,; <- ch1F3F7FFFFFFF7F3F ; 1
;,; <- chE0C0800000000000 ; 1
;,; <- ch3F3F3F3F3F3F3F3F ; 1
;,; <- ch80C0E0F0F8F8F8F8 ; 1
;,; <- ch3F3F030303030323 ; 1
;,; <- chC0C0C0C0FFFFFFFF ; 1
;,; <- ch7F7F7F7FFFFFFFFF ; 1
;,; <- ch101038387C7C7438 ; 1
; total unique chars in pic: 47 (worst case req 376 bytes)
!byte $DB,$A8 ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $17
!byte $CE,$E6 ;addr
!byte $e2,0;mode8
!byte $02 ;data8
!byte ch0000101038387CFE
!byte ch0000101038387CFE
!byte ch0000101038387CFE
!byte $93 ;skip
!byte $04 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chF0E0C08000000000
!byte ch7F3F1F0F07030100
!byte ch0080E0F8FCF0C000
!byte $92 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFEFEFEFE
!byte ch0008080800000000
!byte ch000000000103070F
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $91 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFEFEFEFEFFFFFFFF
!byte ch00000000C0E0F0F0
!byte ch1F1F1F1F1F1F1F1F
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $91 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chC0C0C0E0E1E0E0E0
!byte ch1F3F7FFFFFFF7F3F
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $91 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chE0C0800000000000
!byte ch3F3F3F3F3F3F3F3F
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $91 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte ch80C0E0F0F8F8F8F8
!byte ch3F3F030303030323
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $91 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chC0C0C0C0FFFFFFFF
!byte ch7F7F7F7FFFFFFFFF
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $8A ;skip
!byte $00,ch0000000000000000 ;fill
!byte $88 ;skip
!byte $02 ;data8
!byte chF0F0F0F000C0C0C0
!byte ch0000000000000000
!byte ch0000000000000000
!byte $8A ;skip
!byte $00 ;data8
!byte ch101038387C7C7438
!byte $88 ;skip
!byte $40,ch0000000000000000 ;fill
!byte $e1,12



;,; *_004
;,; <- deps_thisisyourdestiny
; method 0 ( bytes ) -- 66 bytes (646 cumu)
; method 1 ( ibpc0 bytes ) -- 66 bytes (646 cumu)
; method 2 ( bytes ) -- 66 bytes (646 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 70 bytes (650 cumu)
; method 4 ( clrscr bytes ) -- 356 bytes (936 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 386 bytes (966 cumu)
; method 6 ( clrscr bytes ) -- 356 bytes (936 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 372 bytes (952 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 61
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 4
;,; <- ch0000000000000000 ; 303
;,; <- chFCFC303030303030 ; 5
;,; <- chCCCCCCCCCCCCCCCC ; 6
;,; <- chFCFCE0C0C0C0C0C0 ; 7
;,; <- chCCCCCCCCCCECFCFC ; 7
;,; <- chFCFCDCCCCCCCCCCC ; 12
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch3030303030303030 ; 4
;,; <- ch303030303030FCFC ; 3
;,; <- chFCFC1C0C0C1CFCFC ; 4
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- ch00030C12262C4040 ; 1
;,; <- ch082A1C7F1C2A0800 ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 3
;,; <- ch4040402020100C03 ; 1
;,; <- ch0202040408106080 ; 1
;,; <- ch0F0F0F0F00030303 ; 2
;,; <- ch9F9F9F9F00CFCFCF ; 2
;,; <- chFFFFFFFF00FFFFFF ; 4
;,; <- chF0F0F0F000C0C0C0 ; 2
;,; <- chC6C6C6C6C6C6C6C6 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 2
;,; <- ch00BEBEFE5C5C5C5C ; 4
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- ch5C5C5C5C5C5C5C5C ; 20
;,; <- ch0000101038387CFE ; 3
;,; <- ch0001071F3F0F0300 ; 7
;,; <- chF0E0C08000000000 ; 1
;,; <- ch0080E0F8FCF0C000 ; 7
;,; <- chFFFFFFFFFEFEFEFE ; 1
;,; <- ch0008080800000000 ; 1
;,; <- ch000000000103070F ; 1
;,; <- chFEFEFEFEFFFFFFFF ; 1
;,; <- ch00000000C0E0F0F0 ; 1
;,; <- ch1F1F1F1F1F1F1F1F ; 1
;,; <- chC0C0C0E0E1E0E0E0 ; 1
;,; <- ch1F3F7FFFFFFF7F3F ; 1
;,; <- chE0C0800000000000 ; 1
;,; <- ch3F3F3F3F3F3F3F3F ; 2
;,; <- ch80C0E0F0F8F8F8F8 ; 1
;,; <- chF8F8F8F8C0C0C0C0 ; 1
;,; <- ch7F7F7F7F7F7F7F7F ; 1
; total unique chars in pic: 45 (worst case req 360 bytes)
!byte $CE,$E5 ;addr
!byte $03 ;data8
!byte ch0000101038387CFE
!byte ch0000101038387CFE
!byte ch0000101038387CFE
!byte ch0000000000000000
!byte $92 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chF0E0C08000000000
!byte ch7F3F1F0F07030100
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $91 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFEFEFEFE
!byte ch0008080800000000
!byte ch000000000103070F
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $91 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFEFEFEFEFFFFFFFF
!byte ch00000000C0E0F0F0
!byte ch1F1F1F1F1F1F1F1F
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $91 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chC0C0C0E0E1E0E0E0
!byte ch1F3F7FFFFFFF7F3F
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $91 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chE0C0800000000000
!byte ch3F3F3F3F3F3F3F3F
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $91 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte ch80C0E0F0F8F8F8F8
!byte ch3F3F3F3F3F3F3F3F
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $91 ;skip
!byte $05 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chF8F8F8F8C0C0C0C0
!byte ch7F7F7F7F7F7F7F7F
!byte ch0080E0F8FCF0C000
!byte ch0000000000000000
!byte $A3 ;skip
!byte $00,ch0000000000000000 ;fill
!byte $e1,12+60



;,; *_005
;,; <- deps_thisisyourdestiny
; method 0 ( bytes ) -- 126 bytes (772 cumu)
; method 1 ( ibpc0 bytes ) -- 126 bytes (772 cumu)
; method 2 ( bytes ) -- 126 bytes (772 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 132 bytes (778 cumu)
; method 4 ( clrscr bytes ) -- 280 bytes (926 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 311 bytes (957 cumu)
; method 6 ( clrscr bytes ) -- 280 bytes (926 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 299 bytes (945 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 61
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 4
;,; <- ch0000000000000000 ; 359
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch00030C12262C4040 ; 1
;,; <- ch082A1C7F1C2A0800 ; 1
;,; <- ch4040402020100C03 ; 1
;,; <- ch0202040408106080 ; 1
;,; <- ch0F0F0F0F00030303 ; 2
;,; <- ch9F9F9F9F00CFCFCF ; 2
;,; <- chFFFFFFFF00FFFFFF ; 4
;,; <- chF0F0F0F000C0C0C0 ; 2
;,; <- ch0000101038387CFE ; 3
;,; <- ch00BEBEFE5C5C5C5C ; 4
;,; <- ch0001071F3F0F0300 ; 7
;,; <- chF0E0C08000000000 ; 1
;,; <- ch0080E0F8FCF0C000 ; 7
;,; <- ch5C5C5C5C5C5C5C5C ; 24
;,; <- chFFFFFFFFFEFEFEFE ; 1
;,; <- ch0008080800000000 ; 1
;,; <- ch000000000103070F ; 1
;,; <- chFEFEFEFEFFFFFFFF ; 1
;,; <- ch00000000C0E0F0F0 ; 1
;,; <- ch1F1F1F1F1F1F1F1F ; 1
;,; <- chC0C0C0E0E1E0E0E0 ; 1
;,; <- ch1F3F7FFFFFFF7F3F ; 1
;,; <- chE0C0800000000000 ; 1
;,; <- ch3F3F3F3F3F3F3F3F ; 2
;,; <- ch80C0E0F0F8F8F8F8 ; 1
;,; <- chF8F8F8F8C0C0C0C0 ; 1
;,; <- ch7F7F7F7F7F7F7F7F ; 1
; total unique chars in pic: 32 (worst case req 256 bytes)
!byte $DA,$16 ;addr
!byte $40,$07 ;fill
!byte $8D ;skip
!byte $00,$01 ;fill
!byte $96 ;skip
!byte $00,$01 ;fill
!byte $DA,$B6 ;addr
!byte $00,$01 ;fill
!byte $96 ;skip
!byte $00,$01 ;fill
!byte $DB,$74 ;addr
!byte $e2,1;mode4
!byte $02 ;data4
!byte $77
!byte $77
!byte $17
!byte $92 ;skip
!byte $01 ;data4
!byte $13
!byte $13
!byte $92 ;skip
!byte $02 ;data4
!byte $33
!byte $33
!byte $13
!byte $95 ;skip
!byte $00 ;data4
!byte $13
!byte $CE,$22 ;addr
!byte $4A,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $7A,ch0000000000000000 ;fill
!byte $8D ;skip
!byte $48,ch0000000000000000 ;fill
!byte $A2 ;skip
!byte $42,ch0000000000000000 ;fill
!byte $e2,0;mode8
!byte $02 ;data8
!byte ch0000101038387CFE
!byte ch0000101038387CFE
!byte ch0000101038387CFE
!byte $44,ch0000000000000000 ;fill
!byte $8A ;skip
!byte $07 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chF0E0C08000000000
!byte ch7F3F1F0F07030100
!byte ch0080E0F8FCF0C000
!byte $43,ch0000000000000000 ;fill
!byte $8D ;skip
!byte $04 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFEFEFEFE
!byte ch0008080800000000
!byte ch000000000103070F
!byte ch0080E0F8FCF0C000
!byte $93 ;skip
!byte $02 ;data8
!byte chFEFEFEFEFFFFFFFF
!byte ch00000000C0E0F0F0
!byte ch1F1F1F1F1F1F1F1F
!byte $94 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chC0C0C0E0E1E0E0E0
!byte ch1F3F7FFFFFFF7F3F
!byte $94 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chE0C0800000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $95 ;skip
!byte $01 ;data8
!byte ch80C0E0F0F8F8F8F8
!byte ch3F3F3F3F3F3F3F3F
!byte $95 ;skip
!byte $01 ;data8
!byte chF8F8F8F8C0C0C0C0
!byte ch7F7F7F7F7F7F7F7F
!byte $93 ;skip
!byte $04 ;data8
!byte ch0F0F0F0F00030303
!byte ch9F9F9F9F00CFCFCF
!byte chFFFFFFFF00FFFFFF
!byte chFFFFFFFF00FFFFFF
!byte chF0F0F0F000C0C0C0
!byte $92 ;skip
!byte $04 ;data8
!byte ch0000000000000000
!byte ch00BEBEFE5C5C5C5C
!byte ch0000000000000000
!byte ch00BEBEFE5C5C5C5C
!byte ch0000000000000000
!byte $92 ;skip
!byte $04 ;data8
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte $93 ;skip
!byte $02 ;data8
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte $e1,12



;,; *_006
;,; <- deps_thisisyourdestiny
; method 0 ( bytes ) -- 97 bytes (869 cumu)
; method 1 ( ibpc0 bytes ) -- 105 bytes (877 cumu)
; method 2 ( bytes ) -- 97 bytes (869 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 111 bytes (883 cumu)
; method 4 ( clrscr bytes ) -- 299 bytes (1071 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 330 bytes (1102 cumu)
; method 6 ( clrscr bytes ) -- 299 bytes (1071 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 318 bytes (1090 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 61
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 4
;,; <- ch0000000000000000 ; 355
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch00030C12262C4040 ; 1
;,; <- ch082A1C7F1C2A0800 ; 1
;,; <- ch0000101038387CFE ; 3
;,; <- ch4040402020100C03 ; 1
;,; <- ch0202040408106080 ; 1
;,; <- ch0001071F3F0F0300 ; 7
;,; <- chF0E0C08000000000 ; 1
;,; <- ch0080E0F8FCF0C000 ; 7
;,; <- ch0F0F0F0F00030303 ; 2
;,; <- ch9F9F9F9F00CFCFCF ; 2
;,; <- chFFFFFFFF00FFFFFF ; 4
;,; <- chF0F0F0F000C0C0C0 ; 2
;,; <- chFFFFFFFFFEFEFEFE ; 1
;,; <- ch0008080800000000 ; 1
;,; <- ch000000000103070F ; 1
;,; <- ch00BEBEFE5C5C5C5C ; 4
;,; <- chFEFEFEFEFFFFFFFF ; 1
;,; <- ch00000000C0E0F0F0 ; 1
;,; <- ch1F1F1F1F1F1F1F1F ; 1
;,; <- ch5C5C5C5C5C5C5C5C ; 28
;,; <- chC0C0C0E0E1E0E0E0 ; 1
;,; <- ch1F3F7FFFFFFF7F3F ; 1
;,; <- chE0C0800000000000 ; 1
;,; <- ch3F3F3F3F3F3F3F3F ; 2
;,; <- ch80C0E0F0F8F8F8F8 ; 1
;,; <- chF8F8F8F8C0C0C0C0 ; 1
;,; <- ch7F7F7F7F7F7F7F7F ; 1
; total unique chars in pic: 32 (worst case req 256 bytes)
!byte $DB,$44 ;addr
!byte $e2,1;mode4
!byte $02 ;data4
!byte $77
!byte $77
!byte $17
!byte $91 ;skip
!byte $01 ;data4
!byte $37
!byte $33
!byte $93 ;skip
!byte $02 ;data4
!byte $31
!byte $33
!byte $11
!byte $93 ;skip
!byte $00 ;data4
!byte $33
!byte $97 ;skip
!byte $00 ;data4
!byte $17
!byte $95 ;skip
!byte $e2,0;mode8
!byte $00,$01 ;fill
!byte $CE,$85 ;addr
!byte $02 ;data8
!byte ch0000101038387CFE
!byte ch0000101038387CFE
!byte ch0000101038387CFE
!byte $93 ;skip
!byte $04 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chF0E0C08000000000
!byte ch7F3F1F0F07030100
!byte ch0080E0F8FCF0C000
!byte $92 ;skip
!byte $04 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFEFEFEFE
!byte ch0008080800000000
!byte ch000000000103070F
!byte ch0080E0F8FCF0C000
!byte $93 ;skip
!byte $02 ;data8
!byte chFEFEFEFEFFFFFFFF
!byte ch00000000C0E0F0F0
!byte ch1F1F1F1F1F1F1F1F
!byte $94 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chC0C0C0E0E1E0E0E0
!byte ch1F3F7FFFFFFF7F3F
!byte $94 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chE0C0800000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $95 ;skip
!byte $01 ;data8
!byte ch80C0E0F0F8F8F8F8
!byte ch3F3F3F3F3F3F3F3F
!byte $95 ;skip
!byte $01 ;data8
!byte chF8F8F8F8C0C0C0C0
!byte ch7F7F7F7F7F7F7F7F
!byte $93 ;skip
!byte $04 ;data8
!byte ch0F0F0F0F00030303
!byte ch9F9F9F9F00CFCFCF
!byte chFFFFFFFF00FFFFFF
!byte chFFFFFFFF00FFFFFF
!byte chF0F0F0F000C0C0C0
!byte $92 ;skip
!byte $04 ;data8
!byte ch0000000000000000
!byte ch00BEBEFE5C5C5C5C
!byte ch0000000000000000
!byte ch00BEBEFE5C5C5C5C
!byte ch0000000000000000
!byte $92 ;skip
!byte $04 ;data8
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte $93 ;skip
!byte $02 ;data8
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte $e1,12



;,; *_007
;,; <- deps_thisisyourdestiny
; method 0 ( bytes ) -- 91 bytes (960 cumu)
; method 1 ( ibpc0 bytes ) -- 97 bytes (966 cumu)
; method 2 ( bytes ) -- 91 bytes (960 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 104 bytes (973 cumu)
; method 4 ( clrscr bytes ) -- 316 bytes (1185 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 346 bytes (1215 cumu)
; method 6 ( clrscr bytes ) -- 316 bytes (1185 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 335 bytes (1204 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 61
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 4
;,; <- ch0000000000000000 ; 351
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch0000101038387CFE ; 3
;,; <- ch0001071F3F0F0300 ; 7
;,; <- chF0E0C08000000000 ; 1
;,; <- ch0080E0F8FCF0C000 ; 7
;,; <- ch00030C12262C4040 ; 1
;,; <- ch082A1C7F1C2A0800 ; 1
;,; <- chFFFFFFFFFEFEFEFE ; 1
;,; <- ch0008080800000000 ; 1
;,; <- ch000000000103070F ; 1
;,; <- ch4040402020100C03 ; 1
;,; <- ch0202040408106080 ; 1
;,; <- chFEFEFEFEFFFFFFFF ; 1
;,; <- ch00000000C0E0F0F0 ; 1
;,; <- ch1F1F1F1F1F1F1F1F ; 1
;,; <- ch0F0F0F0F00030303 ; 2
;,; <- ch9F9F9F9F00CFCFCF ; 2
;,; <- chFFFFFFFF00FFFFFF ; 4
;,; <- chF0F0F0F000C0C0C0 ; 2
;,; <- chC0C0C0E0E1E0E0E0 ; 1
;,; <- ch1F3F7FFFFFFF7F3F ; 1
;,; <- ch00BEBEFE5C5C5C5C ; 4
;,; <- chE0C0800000000000 ; 1
;,; <- ch3F3F3F3F3F3F3F3F ; 2
;,; <- ch5C5C5C5C5C5C5C5C ; 32
;,; <- ch80C0E0F0F8F8F8F8 ; 1
;,; <- chF8F8F8F8C0C0C0C0 ; 1
;,; <- ch7F7F7F7F7F7F7F7F ; 1
; total unique chars in pic: 32 (worst case req 256 bytes)
!byte $DB,$14 ;addr
!byte $e2,1;mode4
!byte $02 ;data4
!byte $77
!byte $77
!byte $17
!byte $91 ;skip
!byte $01 ;data4
!byte $37
!byte $33
!byte $93 ;skip
!byte $02 ;data4
!byte $31
!byte $33
!byte $11
!byte $91 ;skip
!byte $00 ;data4
!byte $31
!byte $CE,$55 ;addr
!byte $e2,0;mode8
!byte $02 ;data8
!byte ch0000101038387CFE
!byte ch0000101038387CFE
!byte ch0000101038387CFE
!byte $93 ;skip
!byte $04 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chF0E0C08000000000
!byte ch7F3F1F0F07030100
!byte ch0080E0F8FCF0C000
!byte $92 ;skip
!byte $04 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFEFEFEFE
!byte ch0008080800000000
!byte ch000000000103070F
!byte ch0080E0F8FCF0C000
!byte $93 ;skip
!byte $02 ;data8
!byte chFEFEFEFEFFFFFFFF
!byte ch00000000C0E0F0F0
!byte ch1F1F1F1F1F1F1F1F
!byte $94 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chC0C0C0E0E1E0E0E0
!byte ch1F3F7FFFFFFF7F3F
!byte $94 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chE0C0800000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $95 ;skip
!byte $01 ;data8
!byte ch80C0E0F0F8F8F8F8
!byte ch3F3F3F3F3F3F3F3F
!byte $95 ;skip
!byte $01 ;data8
!byte chF8F8F8F8C0C0C0C0
!byte ch7F7F7F7F7F7F7F7F
!byte $93 ;skip
!byte $04 ;data8
!byte ch0F0F0F0F00030303
!byte ch9F9F9F9F00CFCFCF
!byte chFFFFFFFF00FFFFFF
!byte chFFFFFFFF00FFFFFF
!byte chF0F0F0F000C0C0C0
!byte $92 ;skip
!byte $04 ;data8
!byte ch0000000000000000
!byte ch00BEBEFE5C5C5C5C
!byte ch0000000000000000
!byte ch00BEBEFE5C5C5C5C
!byte ch0000000000000000
!byte $92 ;skip
!byte $04 ;data8
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte $93 ;skip
!byte $02 ;data8
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte $e1,12



;,; *_008
;,; <- deps_thisisyourdestiny
; method 0 ( bytes ) -- 91 bytes (1051 cumu)
; method 1 ( ibpc0 bytes ) -- 97 bytes (1057 cumu)
; method 2 ( bytes ) -- 91 bytes (1051 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 104 bytes (1064 cumu)
; method 4 ( clrscr bytes ) -- 334 bytes (1294 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 363 bytes (1323 cumu)
; method 6 ( clrscr bytes ) -- 334 bytes (1294 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 351 bytes (1311 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 61
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 4
;,; <- ch0000000000000000 ; 347
;,; <- ch0000101038387CFE ; 3
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- ch0001071F3F0F0300 ; 7
;,; <- chF0E0C08000000000 ; 1
;,; <- ch0080E0F8FCF0C000 ; 7
;,; <- chFFFFFFFFFEFEFEFE ; 1
;,; <- ch0008080800000000 ; 1
;,; <- ch000000000103070F ; 1
;,; <- chFEFEFEFEFFFFFFFF ; 1
;,; <- ch00000000C0E0F0F0 ; 1
;,; <- ch1F1F1F1F1F1F1F1F ; 1
;,; <- ch00030C12262C4040 ; 1
;,; <- ch082A1C7F1C2A0800 ; 1
;,; <- chC0C0C0E0E1E0E0E0 ; 1
;,; <- ch1F3F7FFFFFFF7F3F ; 1
;,; <- ch4040402020100C03 ; 1
;,; <- ch0202040408106080 ; 1
;,; <- chE0C0800000000000 ; 1
;,; <- ch3F3F3F3F3F3F3F3F ; 2
;,; <- ch0F0F0F0F00030303 ; 2
;,; <- ch9F9F9F9F00CFCFCF ; 2
;,; <- chFFFFFFFF00FFFFFF ; 4
;,; <- chF0F0F0F000C0C0C0 ; 2
;,; <- ch80C0E0F0F8F8F8F8 ; 1
;,; <- ch00BEBEFE5C5C5C5C ; 4
;,; <- chF8F8F8F8C0C0C0C0 ; 1
;,; <- ch7F7F7F7F7F7F7F7F ; 1
;,; <- ch5C5C5C5C5C5C5C5C ; 36
; total unique chars in pic: 32 (worst case req 256 bytes)
!byte $DA,$E4 ;addr
!byte $e2,1;mode4
!byte $02 ;data4
!byte $77
!byte $77
!byte $17
!byte $91 ;skip
!byte $01 ;data4
!byte $37
!byte $33
!byte $93 ;skip
!byte $02 ;data4
!byte $31
!byte $33
!byte $11
!byte $91 ;skip
!byte $00 ;data4
!byte $31
!byte $CE,$25 ;addr
!byte $e2,0;mode8
!byte $02 ;data8
!byte ch0000101038387CFE
!byte ch0000101038387CFE
!byte ch0000101038387CFE
!byte $93 ;skip
!byte $04 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chF0E0C08000000000
!byte ch7F3F1F0F07030100
!byte ch0080E0F8FCF0C000
!byte $92 ;skip
!byte $04 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFEFEFEFE
!byte ch0008080800000000
!byte ch000000000103070F
!byte ch0080E0F8FCF0C000
!byte $93 ;skip
!byte $02 ;data8
!byte chFEFEFEFEFFFFFFFF
!byte ch00000000C0E0F0F0
!byte ch1F1F1F1F1F1F1F1F
!byte $94 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chC0C0C0E0E1E0E0E0
!byte ch1F3F7FFFFFFF7F3F
!byte $94 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chE0C0800000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $95 ;skip
!byte $01 ;data8
!byte ch80C0E0F0F8F8F8F8
!byte ch3F3F3F3F3F3F3F3F
!byte $95 ;skip
!byte $01 ;data8
!byte chF8F8F8F8C0C0C0C0
!byte ch7F7F7F7F7F7F7F7F
!byte $93 ;skip
!byte $04 ;data8
!byte ch0F0F0F0F00030303
!byte ch9F9F9F9F00CFCFCF
!byte chFFFFFFFF00FFFFFF
!byte chFFFFFFFF00FFFFFF
!byte chF0F0F0F000C0C0C0
!byte $92 ;skip
!byte $04 ;data8
!byte ch0000000000000000
!byte ch00BEBEFE5C5C5C5C
!byte ch0000000000000000
!byte ch00BEBEFE5C5C5C5C
!byte ch0000000000000000
!byte $92 ;skip
!byte $04 ;data8
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte $93 ;skip
!byte $02 ;data8
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte $e1,12



;,; *_009
;,; <- deps_thisisyourdestiny
; method 0 ( bytes ) -- 86 bytes (1137 cumu)
; method 1 ( ibpc0 bytes ) -- 92 bytes (1143 cumu)
; method 2 ( bytes ) -- 86 bytes (1137 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 99 bytes (1150 cumu)
; method 4 ( clrscr bytes ) -- 348 bytes (1399 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 375 bytes (1426 cumu)
; method 6 ( clrscr bytes ) -- 348 bytes (1399 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 363 bytes (1414 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 61
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 4
;,; <- ch0000000000000000 ; 346
;,; <- ch0001071F3F0F0300 ; 7
;,; <- chF0E0C08000000000 ; 1
;,; <- ch0080E0F8FCF0C000 ; 7
;,; <- chFFFFFFFFFEFEFEFE ; 1
;,; <- ch0008080800000000 ; 1
;,; <- ch000000000103070F ; 1
;,; <- ch3C3C3C3C18180000 ; 2
;,; <- chFEFEFEFEFFFFFFFF ; 1
;,; <- ch00000000C0E0F0F0 ; 1
;,; <- ch1F1F1F1F1F1F1F1F ; 1
;,; <- chC0C0C0E0E1E0E0E0 ; 1
;,; <- ch1F3F7FFFFFFF7F3F ; 1
;,; <- chE0C0800000000000 ; 1
;,; <- ch3F3F3F3F3F3F3F3F ; 2
;,; <- ch00030C12262C4040 ; 1
;,; <- ch082A1C7F1C2A0800 ; 1
;,; <- ch80C0E0F0F8F8F8F8 ; 1
;,; <- ch4040402020100C03 ; 1
;,; <- ch0202040408106080 ; 1
;,; <- chF8F8F8F8C0C0C0C0 ; 1
;,; <- ch7F7F7F7F7F7F7F7F ; 1
;,; <- ch0F0F0F0F00030303 ; 2
;,; <- ch9F9F9F9F00CFCFCF ; 2
;,; <- chFFFFFFFF00FFFFFF ; 4
;,; <- chF0F0F0F000C0C0C0 ; 2
;,; <- ch00BEBEFE5C5C5C5C ; 4
;,; <- ch5C5C5C5C5C5C5C5C ; 40
; total unique chars in pic: 31 (worst case req 248 bytes)
!byte $DA,$B4 ;addr
!byte $e2,1;mode4
!byte $02 ;data4
!byte $77
!byte $77
!byte $17
!byte $91 ;skip
!byte $01 ;data4
!byte $37
!byte $33
!byte $93 ;skip
!byte $02 ;data4
!byte $31
!byte $33
!byte $11
!byte $91 ;skip
!byte $00 ;data4
!byte $31
!byte $CE,$0C ;addr
!byte $e2,0;mode8
!byte $04 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFFFFFFFF
!byte chF0E0C08000000000
!byte ch7F3F1F0F07030100
!byte ch0080E0F8FCF0C000
!byte $92 ;skip
!byte $04 ;data8
!byte ch0001071F3F0F0300
!byte chFFFFFFFFFEFEFEFE
!byte ch0008080800000000
!byte ch000000000103070F
!byte ch0080E0F8FCF0C000
!byte $93 ;skip
!byte $02 ;data8
!byte chFEFEFEFEFFFFFFFF
!byte ch00000000C0E0F0F0
!byte ch1F1F1F1F1F1F1F1F
!byte $94 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chC0C0C0E0E1E0E0E0
!byte ch1F3F7FFFFFFF7F3F
!byte $94 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chE0C0800000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $95 ;skip
!byte $01 ;data8
!byte ch80C0E0F0F8F8F8F8
!byte ch3F3F3F3F3F3F3F3F
!byte $95 ;skip
!byte $01 ;data8
!byte chF8F8F8F8C0C0C0C0
!byte ch7F7F7F7F7F7F7F7F
!byte $93 ;skip
!byte $04 ;data8
!byte ch0F0F0F0F00030303
!byte ch9F9F9F9F00CFCFCF
!byte chFFFFFFFF00FFFFFF
!byte chFFFFFFFF00FFFFFF
!byte chF0F0F0F000C0C0C0
!byte $92 ;skip
!byte $04 ;data8
!byte ch0000000000000000
!byte ch00BEBEFE5C5C5C5C
!byte ch0000000000000000
!byte ch00BEBEFE5C5C5C5C
!byte ch0000000000000000
!byte $92 ;skip
!byte $04 ;data8
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte $93 ;skip
!byte $02 ;data8
!byte ch5C5C5C5C5C5C5C5C
!byte ch0000000000000000
!byte ch5C5C5C5C5C5C5C5C
!byte $e1,12



;,; *_010
;,; <- deps_thisisyourdestiny
; method 0 ( bytes ) -- 74 bytes (1211 cumu)
; method 1 ( ibpc0 bytes ) -- 141 bytes (1278 cumu)
; method 2 ( bytes ) -- 74 bytes (1211 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 141 bytes (1278 cumu)
; method 4 ( clrscr bytes ) -- 55 bytes (1192 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 55 bytes (1192 cumu)
; method 6 ( clrscr bytes ) -- 55 bytes (1192 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 56 bytes (1193 cumu)
; METHOD 4 CHOSEN
!byte $e4,7,chFFFFFFFFFFFFFFFF ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 504
; total unique chars in pic: 1 (worst case req 8 bytes)
!byte $DA,$29 ;addr
!byte $45,$01 ;fill
!byte $90 ;skip
!byte $45,$01 ;fill
!byte $90 ;skip
!byte $45,$01 ;fill
!byte $90 ;skip
!byte $45,$01 ;fill
!byte $90 ;skip
!byte $45,$01 ;fill
!byte $90 ;skip
!byte $45,$01 ;fill
!byte $90 ;skip
!byte $45,$01 ;fill
!byte $90 ;skip
!byte $45,$01 ;fill
!byte $90 ;skip
!byte $45,$01 ;fill
!byte $90 ;skip
!byte $45,$01 ;fill
!byte $90 ;skip
!byte $45,$01 ;fill
!byte $90 ;skip
!byte $45,$01 ;fill
!byte $90 ;skip
!byte $45,$01 ;fill
!byte $90 ;skip
!byte $45,$01 ;fill
!byte $90 ;skip
!byte $45,$01 ;fill
!byte $90 ;skip
!byte $45,$01 ;fill
!byte $90 ;skip
!byte $45,$01 ;fill
!byte $90 ;skip
!byte $45,$01 ;fill
!byte $e1,12


