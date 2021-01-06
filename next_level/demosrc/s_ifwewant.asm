;,; lyrics_ifwewant .withinpagefrom=lyrics
;,; <- lyrics

	!byte $31,$25			; IF
	!byte $26,$01			; WE
	!byte $26,$40,$22		; WAN(T)
	!byte $29,$1d,$2a		; THE
	!byte $29,$1b,$37,$61,$34,$09	; BLISS
	!byte $26,$01			; WE
	!byte $28,$3a,$34,$19,$1d,$09	; MUST
	!byte $1c,$60,$36		; GO
	!byte $2a			; A
	!byte $27,$60,$66,$62		; LONE
	!byte $0f

;,; deps_ifwewant
;,; <- ibpcaablocks
;,; <- lyrics_ifwewant

;,; SC61_000
;,; <- streamvars
;,; <- player_ivars
;,; <- deps_ifwewant
!src "demosrc/smac.inc"

+sAddr nextlyrictosing
!byte $00,lyrics_ifwewant-lyrics

; method 4 ( clrscr0 bytes ) -- 261 bytes (261 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 303 bytes (303 cumu)
; method 6 ( clrscr0 bytes ) -- 261 bytes (261 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 305 bytes (305 cumu)
; method 8 ( clrscr1 bytes ) -- 266 bytes (266 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 308 bytes (308 cumu)
; method 10 ( clrscr1 bytes ) -- 266 bytes (266 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 310 bytes (310 cumu)
; method 12 ( clrscr2 bytes ) -- 272 bytes (272 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 302 bytes (302 cumu)
; method 14 ( clrscr2 bytes ) -- 272 bytes (272 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 304 bytes (304 cumu)
; method 16 ( clrscr3 bytes ) -- 277 bytes (277 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 307 bytes (307 cumu)
; method 18 ( clrscr3 bytes ) -- 277 bytes (277 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 309 bytes (309 cumu)
; METHOD 4 CHOSEN
!byte $e4,5,ch0000000000000000 ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 173
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 218
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- chFCFC303030303030 ; 5
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chC6C6C6C6C6C6C6C6 ; 4
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- ch303030303030FCFC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 3
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- ch3030303030303030 ; 4
;,; <- ch0000000400000000 ; 9
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- ch0000040408080000 ; 7
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 3
;,; <- ch0000000000DBDBDB ; 1
;,; <- chFFFFEBEBEBEBEBEB ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch0F0F1F1F3F3F7F7F ; 4
;,; <- chF0F0F8F8FCFCFEFE ; 4
;,; <- ch0000010103030707 ; 3
;,; <- ch00008080C0C0E0E0 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chFFE7C3C3C3E7E7C3 ; 1
;,; <- chA5A5E5C3DB9BFBF9 ; 1
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 41 (worst case req 328 bytes)
!byte $DA,$00 ;addr
!byte $7F,$06 ;fill
!byte $75,$06 ;fill
!byte $6E,$02 ;fill
!byte $49,$01 ;fill
!byte $8C ;skip
!byte $49,$01 ;fill
!byte $A4 ;skip
!byte $49,$01 ;fill
!byte $8C ;skip
!byte $49,$01 ;fill
!byte $e2,1;mode4
!byte $02 ;data4
!byte $55
!byte $55
!byte $B5
!byte $96 ;skip
!byte $00 ;data4
!byte $5B
!byte $DB,$80 ;addr
!byte $48,$01 ;fill
!byte $8D ;skip
!byte $48,$01 ;fill
!byte $A5 ;skip
!byte $48,$01 ;fill
!byte $8D ;skip
!byte $48,$01 ;fill
!byte $CE,$00 ;addr
!byte $7F,chFFFFFFFFFFFFFFFF ;fill
!byte $78,chFFFFFFFFFFFFFFFF ;fill
!byte $e2,0;mode8
!byte $03 ;data8
!byte chFBF3E1F3E180C100
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFBF3E1F3E180C100
!byte $43,chFFFFFFFFFFFFFFFF ;fill
!byte $00 ;data8
!byte chFBF3E1F3E180C100
!byte $49,chFFFFFFFFFFFFFFFF ;fill
!byte $8C ;skip
!byte $15 ;data8
!byte ch7F3F1F0F07030100
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte chFEFCF8F0E0C08000
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFFFFFF
!byte chFBF3E1F3E180C100
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFC303030303030
!byte $8D ;skip
!byte $09 ;data8
!byte ch303030303030FCFC
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chD6D6D6D6D6F6FEFE
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000000000
!byte chD6D6D6D6D6F6FEFE
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte ch3030303030303030
!byte $83 ;skip
!byte $00 ;data8
!byte ch0000000400000000
!byte $9A ;skip
!byte $00 ;data8
!byte ch0000000400000000
!byte $84 ;skip
!byte $08 ;data8
!byte chFCFC303030303030
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chF0F8CCCCCCCCCCCC
!byte chC0C0C0C0C0C0C0C0
!byte chFCFC303030303030
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte $87 ;skip
!byte $00 ;data8
!byte ch0000040408080000
!byte $85 ;skip
!byte $0F ;data8
!byte ch3030303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000000000
!byte chFCFCCCCCCCDCFCFC
!byte chC0C0C0C0C0E0FCFC
!byte ch303030303030FCFC
!byte chFCFC1C0C0C1CFCFC
!byte chFCFC1C0C0C1CFCFC
!byte ch0000000000DBDBDB
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000400000000
!byte ch0000000000000000
!byte ch0000000400000000
!byte chFFFFEBEBEBEBEBEB
!byte $94 ;skip
!byte $04 ;data8
!byte ch0000000000010004
!byte ch0000000A25174925
!byte chEBEBEBEBEBEBEBEB
!byte ch00000050A4E892A4
!byte ch0000000000800020
!byte $8C ;skip
!byte $00 ;data8
!byte ch0000000400000000
!byte $83 ;skip
!byte $06 ;data8
!byte ch0000000400000000
!byte ch0002000000000000
!byte ch9A0D9B270B030707
!byte chFFFFFFFFFFFFFFFF
!byte ch59B0D9E4D0C0E0E0
!byte ch0040000000000000
!byte ch0000040408080000
!byte $8F ;skip
!byte $09 ;data8
!byte ch0000040408080000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0F0F1F1F3F3F7F7F
!byte chFFFFFFFFFFFFFFFF
!byte chF0F0F8F8FCFCFEFE
!byte ch0000040408080000
!byte ch0000000400000000
!byte ch0000000000000000
!byte ch0000040408080000
!byte $8E ;skip
!byte $05 ;data8
!byte ch0000040408080000
!byte ch0000010103030707
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch00008080C0C0E0E0
!byte $86 ;skip
!byte $12 ;data8
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chFEFEDED6D6D6D6D6
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFC303030303030
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000400000000
!byte ch0000000000000000
!byte ch0F0F1F1F3F3F7F7F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chF0F0F8F8FCFCFEFE
!byte ch0000000000000000
!byte ch0000040408080000
!byte $84 ;skip
!byte $06 ;data8
!byte chD6D6D6D6D6F6FEFE
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000000000
!byte chC6C6C6C6C6C6C6C6
!byte chCCCCCCCCCCECFCFC
!byte chFCFC1C0C0C1CFCFC
!byte ch3030303030303030
!byte $83 ;skip
!byte $00 ;data8
!byte ch0000010103030707
!byte $43,chFFFFFFFFFFFFFFFF ;fill
!byte $00 ;data8
!byte ch00008080C0C0E0E0
!byte $90 ;skip
!byte $06 ;data8
!byte ch0F0F1F1F3F3F7F7F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFE7C3C3C3E7E7C3
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chF0F0F8F8FCFCFEFE
!byte $84 ;skip
!byte $23 ;data8
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chC0C0C0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte ch3030303030303030
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000010103030707
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chA5A5E5C3DB9BFBF9
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch00008080C0C0E0E0
!byte ch0000000400000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCECFCFC
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chC0C0C0C0C0E0FCFC
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000303030
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0F0F1F1F3F3F7F7F
!byte $45,chFFFFFFFFFFFFFFFF ;fill
!byte $00 ;data8
!byte chF0F0F8F8FCFCFEFE
!byte $e1,13



;,; *_001
;,; <- deps_ifwewant
; method 0 ( bytes ) -- 7 bytes (268 cumu)
; method 1 ( ibpc0 bytes ) -- 7 bytes (268 cumu)
; method 2 ( bytes ) -- 7 bytes (268 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 59 bytes (320 cumu)
; method 4 ( clrscr0 bytes ) -- 261 bytes (522 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 303 bytes (564 cumu)
; method 6 ( clrscr0 bytes ) -- 261 bytes (522 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 305 bytes (566 cumu)
; method 8 ( clrscr1 bytes ) -- 266 bytes (527 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 308 bytes (569 cumu)
; method 10 ( clrscr1 bytes ) -- 266 bytes (527 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 310 bytes (571 cumu)
; method 12 ( clrscr2 bytes ) -- 272 bytes (533 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 302 bytes (563 cumu)
; method 14 ( clrscr2 bytes ) -- 272 bytes (533 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 304 bytes (565 cumu)
; method 16 ( clrscr3 bytes ) -- 277 bytes (538 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 307 bytes (568 cumu)
; method 18 ( clrscr3 bytes ) -- 277 bytes (538 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 309 bytes (570 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 173
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 218
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- chFCFC303030303030 ; 5
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chC6C6C6C6C6C6C6C6 ; 4
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- ch303030303030FCFC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 3
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- ch3030303030303030 ; 4
;,; <- ch0000000400000000 ; 9
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- ch0000040408080000 ; 7
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 3
;,; <- ch0000000000DBDBDB ; 1
;,; <- chFFFFEBEBEBEBEBEB ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch0F0F1F1F3F3F7F7F ; 4
;,; <- chF0F0F8F8FCFCFEFE ; 4
;,; <- ch0000010103030707 ; 3
;,; <- ch00008080C0C0E0E0 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chE7C3C3C3E7E7C3A5 ; 1
;,; <- chA5E7C3DBDB99FFFF ; 1
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 41 (worst case req 328 bytes)
!byte $CF,$C0 ;addr
!byte $00 ;data8
!byte chE7C3C3C3E7E7C3A5
!byte $96 ;skip
!byte $00 ;data8
!byte chA5E7C3DBDB99FFFF
!byte $e1,13



;,; *_002
;,; <- deps_ifwewant
; method 0 ( bytes ) -- 10 bytes (278 cumu)
; method 1 ( ibpc0 bytes ) -- 10 bytes (278 cumu)
; method 2 ( bytes ) -- 10 bytes (278 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 63 bytes (331 cumu)
; method 4 ( clrscr0 bytes ) -- 263 bytes (531 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 306 bytes (574 cumu)
; method 6 ( clrscr0 bytes ) -- 263 bytes (531 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 308 bytes (576 cumu)
; method 8 ( clrscr1 bytes ) -- 268 bytes (536 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 311 bytes (579 cumu)
; method 10 ( clrscr1 bytes ) -- 268 bytes (536 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 313 bytes (581 cumu)
; method 12 ( clrscr2 bytes ) -- 275 bytes (543 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 305 bytes (573 cumu)
; method 14 ( clrscr2 bytes ) -- 275 bytes (543 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 307 bytes (575 cumu)
; method 16 ( clrscr3 bytes ) -- 280 bytes (548 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 310 bytes (578 cumu)
; method 18 ( clrscr3 bytes ) -- 280 bytes (548 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 312 bytes (580 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 172
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 218
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- chFCFC303030303030 ; 5
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chC6C6C6C6C6C6C6C6 ; 4
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- ch303030303030FCFC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 3
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- ch3030303030303030 ; 4
;,; <- ch0000000400000000 ; 9
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- ch0000040408080000 ; 7
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 3
;,; <- ch0000000000DBDBDB ; 1
;,; <- chFFFFEBEBEBEBEBEB ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch0F0F1F1F3F3F7F7F ; 4
;,; <- chF0F0F8F8FCFCFEFE ; 4
;,; <- ch0000010103030707 ; 3
;,; <- ch00008080C0C0E0E0 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chFFFFFFFFFFFFFFE7 ; 1
;,; <- chC3C3C3E7E7C3A5A5 ; 1
;,; <- chE5C3DBD9DF9FFFFF ; 1
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 42 (worst case req 336 bytes)
!byte $CF,$A8 ;addr
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFE7
!byte $96 ;skip
!byte $00 ;data8
!byte chC3C3C3E7E7C3A5A5
!byte $96 ;skip
!byte $00 ;data8
!byte chE5C3DBD9DF9FFFFF
!byte $e1,13



;,; *_003
;,; <- deps_ifwewant
; method 0 ( bytes ) -- 10 bytes (288 cumu)
; method 1 ( ibpc0 bytes ) -- 10 bytes (288 cumu)
; method 2 ( bytes ) -- 10 bytes (288 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 63 bytes (341 cumu)
; method 4 ( clrscr0 bytes ) -- 263 bytes (541 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 306 bytes (584 cumu)
; method 6 ( clrscr0 bytes ) -- 263 bytes (541 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 308 bytes (586 cumu)
; method 8 ( clrscr1 bytes ) -- 268 bytes (546 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 311 bytes (589 cumu)
; method 10 ( clrscr1 bytes ) -- 268 bytes (546 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 313 bytes (591 cumu)
; method 12 ( clrscr2 bytes ) -- 275 bytes (553 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 305 bytes (583 cumu)
; method 14 ( clrscr2 bytes ) -- 275 bytes (553 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 307 bytes (585 cumu)
; method 16 ( clrscr3 bytes ) -- 280 bytes (558 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 310 bytes (588 cumu)
; method 18 ( clrscr3 bytes ) -- 280 bytes (558 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 312 bytes (590 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 172
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 218
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- chFCFC303030303030 ; 5
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chC6C6C6C6C6C6C6C6 ; 4
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- ch303030303030FCFC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 3
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- ch3030303030303030 ; 4
;,; <- ch0000000400000000 ; 9
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- ch0000040408080000 ; 7
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 3
;,; <- ch0000000000DBDBDB ; 1
;,; <- chFFFFEBEBEBEBEBEB ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch0F0F1F1F3F3F7F7F ; 4
;,; <- chF0F0F8F8FCFCFEFE ; 4
;,; <- ch0000010103030707 ; 3
;,; <- ch00008080C0C0E0E0 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chFFFFFFFFFFFFE7C3 ; 1
;,; <- chC3C3E7E7C3A5A5E7 ; 1
;,; <- chC3DBDB99FFFFFFFF ; 1
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 42 (worst case req 336 bytes)
!byte $CF,$A8 ;addr
!byte $00 ;data8
!byte chFFFFFFFFFFFFE7C3
!byte $96 ;skip
!byte $00 ;data8
!byte chC3C3E7E7C3A5A5E7
!byte $96 ;skip
!byte $00 ;data8
!byte chC3DBDB99FFFFFFFF
!byte $e1,13



;,; *_004
;,; <- deps_ifwewant
; method 0 ( bytes ) -- 10 bytes (298 cumu)
; method 1 ( ibpc0 bytes ) -- 10 bytes (298 cumu)
; method 2 ( bytes ) -- 10 bytes (298 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 63 bytes (351 cumu)
; method 4 ( clrscr0 bytes ) -- 263 bytes (551 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 306 bytes (594 cumu)
; method 6 ( clrscr0 bytes ) -- 263 bytes (551 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 308 bytes (596 cumu)
; method 8 ( clrscr1 bytes ) -- 268 bytes (556 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 311 bytes (599 cumu)
; method 10 ( clrscr1 bytes ) -- 268 bytes (556 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 313 bytes (601 cumu)
; method 12 ( clrscr2 bytes ) -- 275 bytes (563 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 305 bytes (593 cumu)
; method 14 ( clrscr2 bytes ) -- 275 bytes (563 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 307 bytes (595 cumu)
; method 16 ( clrscr3 bytes ) -- 280 bytes (568 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 310 bytes (598 cumu)
; method 18 ( clrscr3 bytes ) -- 280 bytes (568 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 312 bytes (600 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 172
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 218
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- chFCFC303030303030 ; 5
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chC6C6C6C6C6C6C6C6 ; 4
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- ch303030303030FCFC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 3
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- ch3030303030303030 ; 4
;,; <- ch0000000400000000 ; 9
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- ch0000040408080000 ; 7
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 3
;,; <- ch0000000000DBDBDB ; 1
;,; <- chFFFFEBEBEBEBEBEB ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch0F0F1F1F3F3F7F7F ; 4
;,; <- chF0F0F8F8FCFCFEFE ; 4
;,; <- ch0000010103030707 ; 3
;,; <- ch00008080C0C0E0E0 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chFFFFFFFFFFE7C3C3 ; 1
;,; <- chC3E7E7C3A5A5A7C3 ; 1
;,; <- chDB9BFBF9FFFFFFFF ; 1
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 42 (worst case req 336 bytes)
!byte $CF,$A8 ;addr
!byte $00 ;data8
!byte chFFFFFFFFFFE7C3C3
!byte $96 ;skip
!byte $00 ;data8
!byte chC3E7E7C3A5A5A7C3
!byte $96 ;skip
!byte $00 ;data8
!byte chDB9BFBF9FFFFFFFF
!byte $e1,13



;,; *_005
;,; <- deps_ifwewant
; method 0 ( bytes ) -- 10 bytes (308 cumu)
; method 1 ( ibpc0 bytes ) -- 10 bytes (308 cumu)
; method 2 ( bytes ) -- 10 bytes (308 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 63 bytes (361 cumu)
; method 4 ( clrscr0 bytes ) -- 263 bytes (561 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 306 bytes (604 cumu)
; method 6 ( clrscr0 bytes ) -- 263 bytes (561 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 308 bytes (606 cumu)
; method 8 ( clrscr1 bytes ) -- 268 bytes (566 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 311 bytes (609 cumu)
; method 10 ( clrscr1 bytes ) -- 268 bytes (566 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 313 bytes (611 cumu)
; method 12 ( clrscr2 bytes ) -- 275 bytes (573 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 305 bytes (603 cumu)
; method 14 ( clrscr2 bytes ) -- 275 bytes (573 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 307 bytes (605 cumu)
; method 16 ( clrscr3 bytes ) -- 280 bytes (578 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 310 bytes (608 cumu)
; method 18 ( clrscr3 bytes ) -- 280 bytes (578 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 312 bytes (610 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 172
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 218
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- chFCFC303030303030 ; 5
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chC6C6C6C6C6C6C6C6 ; 4
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- ch303030303030FCFC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 3
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- ch3030303030303030 ; 4
;,; <- ch0000000400000000 ; 9
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- ch0000040408080000 ; 7
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 3
;,; <- ch0000000000DBDBDB ; 1
;,; <- chFFFFEBEBEBEBEBEB ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch0F0F1F1F3F3F7F7F ; 4
;,; <- chF0F0F8F8FCFCFEFE ; 4
;,; <- ch0000010103030707 ; 3
;,; <- ch00008080C0C0E0E0 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chFFFFFFFFE7C3C3C3 ; 1
;,; <- chE7E7C3A5A5E7C3DB ; 1
;,; <- chDB99FFFFFFFFFFFF ; 1
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 42 (worst case req 336 bytes)
!byte $CF,$A8 ;addr
!byte $00 ;data8
!byte chFFFFFFFFE7C3C3C3
!byte $96 ;skip
!byte $00 ;data8
!byte chE7E7C3A5A5E7C3DB
!byte $96 ;skip
!byte $00 ;data8
!byte chDB99FFFFFFFFFFFF
!byte $e1,13



;,; *_006
;,; <- deps_ifwewant
; method 0 ( bytes ) -- 10 bytes (318 cumu)
; method 1 ( ibpc0 bytes ) -- 10 bytes (318 cumu)
; method 2 ( bytes ) -- 10 bytes (318 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 63 bytes (371 cumu)
; method 4 ( clrscr0 bytes ) -- 263 bytes (571 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 306 bytes (614 cumu)
; method 6 ( clrscr0 bytes ) -- 263 bytes (571 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 308 bytes (616 cumu)
; method 8 ( clrscr1 bytes ) -- 268 bytes (576 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 311 bytes (619 cumu)
; method 10 ( clrscr1 bytes ) -- 268 bytes (576 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 313 bytes (621 cumu)
; method 12 ( clrscr2 bytes ) -- 275 bytes (583 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 305 bytes (613 cumu)
; method 14 ( clrscr2 bytes ) -- 275 bytes (583 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 307 bytes (615 cumu)
; method 16 ( clrscr3 bytes ) -- 280 bytes (588 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 310 bytes (618 cumu)
; method 18 ( clrscr3 bytes ) -- 280 bytes (588 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 312 bytes (620 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 172
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 218
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- chFCFC303030303030 ; 5
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chC6C6C6C6C6C6C6C6 ; 4
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- ch303030303030FCFC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 3
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- ch3030303030303030 ; 4
;,; <- ch0000000400000000 ; 9
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- ch0000040408080000 ; 7
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 3
;,; <- ch0000000000DBDBDB ; 1
;,; <- chFFFFEBEBEBEBEBEB ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch0F0F1F1F3F3F7F7F ; 4
;,; <- chF0F0F8F8FCFCFEFE ; 4
;,; <- ch0000010103030707 ; 3
;,; <- ch00008080C0C0E0E0 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chFFFFFFE7C3C3C3E7 ; 1
;,; <- chE7C3A5A5E5C3DBD9 ; 1
;,; <- chDF9FFFFFFFFFFFFF ; 1
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 42 (worst case req 336 bytes)
!byte $CF,$A8 ;addr
!byte $00 ;data8
!byte chFFFFFFE7C3C3C3E7
!byte $96 ;skip
!byte $00 ;data8
!byte chE7C3A5A5E5C3DBD9
!byte $96 ;skip
!byte $00 ;data8
!byte chDF9FFFFFFFFFFFFF
!byte $e1,13



;,; *_007
;,; <- deps_ifwewant
; method 0 ( bytes ) -- 10 bytes (328 cumu)
; method 1 ( ibpc0 bytes ) -- 10 bytes (328 cumu)
; method 2 ( bytes ) -- 10 bytes (328 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 57 bytes (375 cumu)
; method 4 ( clrscr0 bytes ) -- 259 bytes (577 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 301 bytes (619 cumu)
; method 6 ( clrscr0 bytes ) -- 259 bytes (577 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 303 bytes (621 cumu)
; method 8 ( clrscr1 bytes ) -- 264 bytes (582 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 306 bytes (624 cumu)
; method 10 ( clrscr1 bytes ) -- 264 bytes (582 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 308 bytes (626 cumu)
; method 12 ( clrscr2 bytes ) -- 270 bytes (588 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 300 bytes (618 cumu)
; method 14 ( clrscr2 bytes ) -- 270 bytes (588 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 302 bytes (620 cumu)
; method 16 ( clrscr3 bytes ) -- 275 bytes (593 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 305 bytes (623 cumu)
; method 18 ( clrscr3 bytes ) -- 275 bytes (593 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 307 bytes (625 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 173
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 218
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- chFCFC303030303030 ; 5
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chC6C6C6C6C6C6C6C6 ; 4
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- ch303030303030FCFC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 3
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- ch3030303030303030 ; 4
;,; <- ch0000000400000000 ; 9
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- ch0000040408080000 ; 7
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 3
;,; <- ch0000000000DBDBDB ; 1
;,; <- chFFFFEBEBEBEBEBEB ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch0F0F1F1F3F3F7F7F ; 4
;,; <- chF0F0F8F8FCFCFEFE ; 4
;,; <- ch0000010103030707 ; 3
;,; <- ch00008080C0C0E0E0 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chFFFFE7C3C3C3E7E7 ; 1
;,; <- chC3A5A5E7C3DBDB99 ; 1
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 41 (worst case req 328 bytes)
!byte $CF,$A8 ;addr
!byte $00 ;data8
!byte chFFFFE7C3C3C3E7E7
!byte $96 ;skip
!byte $00 ;data8
!byte chC3A5A5E7C3DBDB99
!byte $96 ;skip
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $e1,13



;,; *_008
;,; <- deps_ifwewant
; method 0 ( bytes ) -- 7 bytes (335 cumu)
; method 1 ( ibpc0 bytes ) -- 7 bytes (335 cumu)
; method 2 ( bytes ) -- 7 bytes (335 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 57 bytes (385 cumu)
; method 4 ( clrscr0 bytes ) -- 259 bytes (587 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 301 bytes (629 cumu)
; method 6 ( clrscr0 bytes ) -- 259 bytes (587 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 303 bytes (631 cumu)
; method 8 ( clrscr1 bytes ) -- 264 bytes (592 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 306 bytes (634 cumu)
; method 10 ( clrscr1 bytes ) -- 264 bytes (592 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 308 bytes (636 cumu)
; method 12 ( clrscr2 bytes ) -- 270 bytes (598 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 300 bytes (628 cumu)
; method 14 ( clrscr2 bytes ) -- 270 bytes (598 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 302 bytes (630 cumu)
; method 16 ( clrscr3 bytes ) -- 275 bytes (603 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 305 bytes (633 cumu)
; method 18 ( clrscr3 bytes ) -- 275 bytes (603 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 307 bytes (635 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 173
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 218
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- chFCFC303030303030 ; 5
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chC6C6C6C6C6C6C6C6 ; 4
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- ch303030303030FCFC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 3
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- ch3030303030303030 ; 4
;,; <- ch0000000400000000 ; 9
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- ch0000040408080000 ; 7
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 3
;,; <- ch0000000000DBDBDB ; 1
;,; <- chFFFFEBEBEBEBEBEB ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch0F0F1F1F3F3F7F7F ; 4
;,; <- chF0F0F8F8FCFCFEFE ; 4
;,; <- ch0000010103030707 ; 3
;,; <- ch00008080C0C0E0E0 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chFFE7C3C3C3E7E7C3 ; 1
;,; <- chA5A5A7C3DB9BFBF9 ; 1
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 41 (worst case req 328 bytes)
!byte $CF,$A8 ;addr
!byte $00 ;data8
!byte chFFE7C3C3C3E7E7C3
!byte $96 ;skip
!byte $00 ;data8
!byte chA5A5A7C3DB9BFBF9
!byte $e1,13



;,; *_009
;,; <- deps_ifwewant
; method 0 ( bytes ) -- 7 bytes (342 cumu)
; method 1 ( ibpc0 bytes ) -- 7 bytes (342 cumu)
; method 2 ( bytes ) -- 7 bytes (342 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 57 bytes (392 cumu)
; method 4 ( clrscr0 bytes ) -- 259 bytes (594 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 301 bytes (636 cumu)
; method 6 ( clrscr0 bytes ) -- 259 bytes (594 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 303 bytes (638 cumu)
; method 8 ( clrscr1 bytes ) -- 264 bytes (599 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 306 bytes (641 cumu)
; method 10 ( clrscr1 bytes ) -- 264 bytes (599 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 308 bytes (643 cumu)
; method 12 ( clrscr2 bytes ) -- 270 bytes (605 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 300 bytes (635 cumu)
; method 14 ( clrscr2 bytes ) -- 270 bytes (605 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 302 bytes (637 cumu)
; method 16 ( clrscr3 bytes ) -- 275 bytes (610 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 305 bytes (640 cumu)
; method 18 ( clrscr3 bytes ) -- 275 bytes (610 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 307 bytes (642 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 173
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 218
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- chFCFC303030303030 ; 5
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chC6C6C6C6C6C6C6C6 ; 4
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- ch303030303030FCFC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 3
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- ch3030303030303030 ; 4
;,; <- ch0000000400000000 ; 9
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- ch0000040408080000 ; 7
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 3
;,; <- ch0000000000DBDBDB ; 1
;,; <- chFFFFEBEBEBEBEBEB ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch0F0F1F1F3F3F7F7F ; 4
;,; <- chF0F0F8F8FCFCFEFE ; 4
;,; <- ch0000010103030707 ; 3
;,; <- ch00008080C0C0E0E0 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chE7C3C3C3E7E7C3A5 ; 1
;,; <- chA5E7C3DBDB99FFFF ; 1
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 41 (worst case req 328 bytes)
!byte $CF,$A8 ;addr
!byte $00 ;data8
!byte chE7C3C3C3E7E7C3A5
!byte $96 ;skip
!byte $00 ;data8
!byte chA5E7C3DBDB99FFFF
!byte $e1,13



;,; *_010
;,; <- deps_ifwewant
; method 0 ( bytes ) -- 10 bytes (352 cumu)
; method 1 ( ibpc0 bytes ) -- 10 bytes (352 cumu)
; method 2 ( bytes ) -- 10 bytes (352 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 57 bytes (399 cumu)
; method 4 ( clrscr0 bytes ) -- 259 bytes (601 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 301 bytes (643 cumu)
; method 6 ( clrscr0 bytes ) -- 259 bytes (601 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 303 bytes (645 cumu)
; method 8 ( clrscr1 bytes ) -- 264 bytes (606 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 306 bytes (648 cumu)
; method 10 ( clrscr1 bytes ) -- 264 bytes (606 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 308 bytes (650 cumu)
; method 12 ( clrscr2 bytes ) -- 270 bytes (612 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 300 bytes (642 cumu)
; method 14 ( clrscr2 bytes ) -- 270 bytes (612 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 302 bytes (644 cumu)
; method 16 ( clrscr3 bytes ) -- 275 bytes (617 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 305 bytes (647 cumu)
; method 18 ( clrscr3 bytes ) -- 275 bytes (617 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 307 bytes (649 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 172
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 218
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- chFCFC303030303030 ; 5
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chC6C6C6C6C6C6C6C6 ; 4
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- ch303030303030FCFC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 3
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- ch3030303030303030 ; 4
;,; <- ch0000000400000000 ; 9
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- ch0000040408080000 ; 7
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 3
;,; <- ch0000000000DBDBDB ; 1
;,; <- chFFFFEBEBEBEBEBEB ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch0F0F1F1F3F3F7F7F ; 4
;,; <- chF0F0F8F8FCFCFEFE ; 4
;,; <- ch0000010103030707 ; 3
;,; <- ch00008080C0C0E0E0 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chFFFFFFFFFFFFFFE7 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chC3C3C3E7E7C3A5A5 ; 1
;,; <- chE5C3DBD9DF9FFFFF ; 1
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 42 (worst case req 336 bytes)
!byte $CF,$90 ;addr
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFE7
!byte $96 ;skip
!byte $00 ;data8
!byte chC3C3C3E7E7C3A5A5
!byte $96 ;skip
!byte $00 ;data8
!byte chE5C3DBD9DF9FFFFF
!byte $e1,13



;,; *_011
;,; <- deps_ifwewant
; method 0 ( bytes ) -- 10 bytes (362 cumu)
; method 1 ( ibpc0 bytes ) -- 10 bytes (362 cumu)
; method 2 ( bytes ) -- 10 bytes (362 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 57 bytes (409 cumu)
; method 4 ( clrscr0 bytes ) -- 259 bytes (611 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 301 bytes (653 cumu)
; method 6 ( clrscr0 bytes ) -- 259 bytes (611 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 303 bytes (655 cumu)
; method 8 ( clrscr1 bytes ) -- 264 bytes (616 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 306 bytes (658 cumu)
; method 10 ( clrscr1 bytes ) -- 264 bytes (616 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 308 bytes (660 cumu)
; method 12 ( clrscr2 bytes ) -- 270 bytes (622 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 300 bytes (652 cumu)
; method 14 ( clrscr2 bytes ) -- 270 bytes (622 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 302 bytes (654 cumu)
; method 16 ( clrscr3 bytes ) -- 275 bytes (627 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 305 bytes (657 cumu)
; method 18 ( clrscr3 bytes ) -- 275 bytes (627 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 307 bytes (659 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 172
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 218
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- chFCFC303030303030 ; 5
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chC6C6C6C6C6C6C6C6 ; 4
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- ch303030303030FCFC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 3
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- ch3030303030303030 ; 4
;,; <- ch0000000400000000 ; 9
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- ch0000040408080000 ; 7
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 3
;,; <- ch0000000000DBDBDB ; 1
;,; <- chFFFFEBEBEBEBEBEB ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch0F0F1F1F3F3F7F7F ; 4
;,; <- chF0F0F8F8FCFCFEFE ; 4
;,; <- ch0000010103030707 ; 3
;,; <- ch00008080C0C0E0E0 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chFFFFFFFFFFFFE7C3 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chC3C3E7E7C3A5A5E7 ; 1
;,; <- chC3DBDB99FFFFFFFF ; 1
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 42 (worst case req 336 bytes)
!byte $CF,$90 ;addr
!byte $00 ;data8
!byte chFFFFFFFFFFFFE7C3
!byte $96 ;skip
!byte $00 ;data8
!byte chC3C3E7E7C3A5A5E7
!byte $96 ;skip
!byte $00 ;data8
!byte chC3DBDB99FFFFFFFF
!byte $e1,13



;,; *_012
;,; <- deps_ifwewant
; method 0 ( bytes ) -- 10 bytes (372 cumu)
; method 1 ( ibpc0 bytes ) -- 10 bytes (372 cumu)
; method 2 ( bytes ) -- 10 bytes (372 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 57 bytes (419 cumu)
; method 4 ( clrscr0 bytes ) -- 259 bytes (621 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 301 bytes (663 cumu)
; method 6 ( clrscr0 bytes ) -- 259 bytes (621 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 303 bytes (665 cumu)
; method 8 ( clrscr1 bytes ) -- 264 bytes (626 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 306 bytes (668 cumu)
; method 10 ( clrscr1 bytes ) -- 264 bytes (626 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 308 bytes (670 cumu)
; method 12 ( clrscr2 bytes ) -- 270 bytes (632 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 300 bytes (662 cumu)
; method 14 ( clrscr2 bytes ) -- 270 bytes (632 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 302 bytes (664 cumu)
; method 16 ( clrscr3 bytes ) -- 275 bytes (637 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 305 bytes (667 cumu)
; method 18 ( clrscr3 bytes ) -- 275 bytes (637 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 307 bytes (669 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 172
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 218
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- chFCFC303030303030 ; 5
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chC6C6C6C6C6C6C6C6 ; 4
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- ch303030303030FCFC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 3
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- ch3030303030303030 ; 4
;,; <- ch0000000400000000 ; 9
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- ch0000040408080000 ; 7
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 3
;,; <- ch0000000000DBDBDB ; 1
;,; <- chFFFFEBEBEBEBEBEB ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch0F0F1F1F3F3F7F7F ; 4
;,; <- chF0F0F8F8FCFCFEFE ; 4
;,; <- ch0000010103030707 ; 3
;,; <- ch00008080C0C0E0E0 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chFFFFFFFFFFE7C3C3 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chC3E7E7C3A5A5A7C3 ; 1
;,; <- chDB9BFBF9FFFFFFFF ; 1
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 42 (worst case req 336 bytes)
!byte $CF,$90 ;addr
!byte $00 ;data8
!byte chFFFFFFFFFFE7C3C3
!byte $96 ;skip
!byte $00 ;data8
!byte chC3E7E7C3A5A5A7C3
!byte $96 ;skip
!byte $00 ;data8
!byte chDB9BFBF9FFFFFFFF
!byte $e1,13



;,; *_013
;,; <- deps_ifwewant
; method 0 ( bytes ) -- 10 bytes (382 cumu)
; method 1 ( ibpc0 bytes ) -- 10 bytes (382 cumu)
; method 2 ( bytes ) -- 10 bytes (382 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 57 bytes (429 cumu)
; method 4 ( clrscr0 bytes ) -- 259 bytes (631 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 301 bytes (673 cumu)
; method 6 ( clrscr0 bytes ) -- 259 bytes (631 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 303 bytes (675 cumu)
; method 8 ( clrscr1 bytes ) -- 264 bytes (636 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 306 bytes (678 cumu)
; method 10 ( clrscr1 bytes ) -- 264 bytes (636 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 308 bytes (680 cumu)
; method 12 ( clrscr2 bytes ) -- 270 bytes (642 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 300 bytes (672 cumu)
; method 14 ( clrscr2 bytes ) -- 270 bytes (642 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 302 bytes (674 cumu)
; method 16 ( clrscr3 bytes ) -- 275 bytes (647 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 305 bytes (677 cumu)
; method 18 ( clrscr3 bytes ) -- 275 bytes (647 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 307 bytes (679 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 172
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 218
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- chFCFC303030303030 ; 5
;,; <- chFCFCE0C0C0C0C0C0 ; 10
;,; <- chC6C6C6C6C6C6C6C6 ; 4
;,; <- chFCFCDCCCCCCCCCCC ; 9
;,; <- ch303030303030FCFC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 3
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- chCCCCCCCCCCCCCCCC ; 4
;,; <- ch3030303030303030 ; 4
;,; <- ch0000000400000000 ; 9
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- ch0000040408080000 ; 7
;,; <- chFCFCCCCCCCDCFCFC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 3
;,; <- ch0000000000DBDBDB ; 1
;,; <- chFFFFEBEBEBEBEBEB ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch0F0F1F1F3F3F7F7F ; 4
;,; <- chF0F0F8F8FCFCFEFE ; 4
;,; <- ch0000010103030707 ; 3
;,; <- ch00008080C0C0E0E0 ; 3
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chFFFFFFFFE7C3C3C3 ; 1
;,; <- chCCCCCCCCCCECFCFC ; 4
;,; <- chE7E7C3A5A5E7C3DB ; 1
;,; <- chDB99FFFFFFFFFFFF ; 1
;,; <- ch0000000000303030 ; 1
; total unique chars in pic: 42 (worst case req 336 bytes)
!byte $CF,$90 ;addr
!byte $00 ;data8
!byte chFFFFFFFFE7C3C3C3
!byte $96 ;skip
!byte $00 ;data8
!byte chE7E7C3A5A5E7C3DB
!byte $96 ;skip
!byte $00 ;data8
!byte chDB99FFFFFFFFFFFF
!byte $e1,13



;,; *_014
;,; <- deps_ifwewant
; method 0 ( bytes ) -- 32 bytes (414 cumu)
; method 1 ( ibpc0 bytes ) -- 86 bytes (468 cumu)
; method 2 ( bytes ) -- 32 bytes (414 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 91 bytes (473 cumu)
; method 4 ( clrscr0 bytes ) -- 0 bytes (382 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 0 bytes (382 cumu)
; method 6 ( clrscr0 bytes ) -- 0 bytes (382 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 1 bytes (383 cumu)
; method 8 ( clrscr1 bytes ) -- 18 bytes (400 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 18 bytes (400 cumu)
; method 10 ( clrscr1 bytes ) -- 18 bytes (400 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 19 bytes (401 cumu)
; method 12 ( clrscr2 bytes ) -- 18 bytes (400 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 68 bytes (450 cumu)
; method 14 ( clrscr2 bytes ) -- 18 bytes (400 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 69 bytes (451 cumu)
; method 16 ( clrscr3 bytes ) -- 36 bytes (418 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 86 bytes (468 cumu)
; method 18 ( clrscr3 bytes ) -- 36 bytes (418 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 87 bytes (469 cumu)
; METHOD 4 CHOSEN
!byte $e4,7,chFFFFFFFFFFFFFFFF ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 504
; total unique chars in pic: 1 (worst case req 8 bytes)
!byte $e1,10

; total compressed size 382 bytes
