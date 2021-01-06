;,; deps_imustcontinue
;,; <- lyrics_imustcontinue
;,; <- ibpcaablocks

;,; SC53_000
;,; <- deps_imustcontinue

!byte $e4,7,chFFFFFFFFFFFFFFFF ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 449
;,; <- chFFFFFFFFFFFF0000 ; 3
;,; <- chFCFCFCFCFCFCFCFC ; 13
;,; <- ch0000000000000000 ; 19
;,; <- ch3F3F3F3F3F3F3F3F ; 13
;,; <- ch0080C0E0F0F8FCFE ; 1
;,; <- ch000103070F1F3F7F ; 1
;,; <- chFEFCF8F0E0C08000 ; 1
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- ch0000FFFFFFFFFFFF ; 3
; total unique chars in pic: 10 (worst case req 80 bytes)
!byte $DA,$00 ;addr
!byte $e2,1;mode4
!byte $07 ;data4
!byte $44
!byte $42
!byte $44
!byte $24
!byte $22
!byte $77
!byte $22
!byte $22
!byte $47,$04 ;fill
!byte $46,$02 ;fill
!byte $07 ;data4
!byte $77
!byte $77
!byte $27
!byte $22
!byte $22
!byte $44
!byte $44
!byte $24
!byte $DA,$30 ;addr
!byte $46,$02 ;fill
!byte $0A ;data4
!byte $77
!byte $77
!byte $77
!byte $22
!byte $72
!byte $22
!byte $44
!byte $44
!byte $22
!byte $27
!byte $22
!byte $8C ;skip
!byte $02 ;data4
!byte $22
!byte $22
!byte $24
!byte $94 ;skip
!byte $01 ;data4
!byte $22
!byte $72
!byte $94 ;skip
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
!byte $94 ;skip
!byte $01 ;data4
!byte $22
!byte $72
!byte $93 ;skip
!byte $01 ;data4
!byte $22
!byte $72
!byte $94 ;skip
!byte $00 ;data4
!byte $22
!byte $94 ;skip
!byte $01 ;data4
!byte $22
!byte $72
!byte $93 ;skip
!byte $01 ;data4
!byte $22
!byte $72
!byte $93 ;skip
!byte $03 ;data4
!byte $22
!byte $22
!byte $77
!byte $22
!byte $8A ;skip
!byte $02 ;data4
!byte $22
!byte $77
!byte $27
!byte $DB,$7E ;addr
!byte $47,$02 ;fill
!byte $86 ;skip
!byte $4F,$02 ;fill
!byte $03 ;data4
!byte $27
!byte $77
!byte $77
!byte $27
!byte $DB,$A6 ;addr
!byte $48,$02 ;fill
!byte $06 ;data4
!byte $24
!byte $22
!byte $44
!byte $22
!byte $72
!byte $77
!byte $27
!byte $DB,$BD ;addr
!byte $48,$02 ;fill
!byte $45,$04 ;fill
!byte $48,$02 ;fill
!byte $02 ;data4
!byte $44
!byte $24
!byte $42
!byte $DB,$DD ;addr
!byte $49,$04 ;fill
!byte $45,$02 ;fill
!byte $47,$04 ;fill
; method 0 ( bytes ) -- 229 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 186 cumulative
; METHOD 5 CHOSEN
!byte $CE,$3A ;addr
!byte $e2,$ff;mode1
!byte $00 ;data1
!byte $E0
!byte $90 ;skip
!byte $27 ;data1
!byte $80
!byte $00
!byte $00
!byte $80
!byte $00
!byte $00
!byte $80
!byte $00
!byte $00
!byte $80
!byte $00
!byte $00
!byte $80
!byte $00
!byte $00
!byte $80
!byte $00
!byte $00
!byte $80
!byte $00
!byte $00
!byte $80
!byte $00
!byte $00
!byte $80
!byte $00
!byte $00
!byte $80
!byte $00
!byte $00
!byte $80
!byte $00
!byte $00
!byte $80
!byte $00
!byte $00
!byte $80
!byte $00
!byte $01
!byte $C0
!byte $e3 ;run ibpcaa
!byte $e1,12

;,; *_001
;,; <- deps_imustcontinue
;,; <- chFFFFFFFFFFFFFFFF ; 298
;,; <- chFFFFFFFFFFFF0000 ; 20
;,; <- chFCFCFCFCFCFCFCFC ; 24
;,; <- ch0000000000000000 ; 80
;,; <- ch3C3C3C3C3C3C3C3C ; 30
;,; <- ch3F3F3F3F3F3F3F3F ; 24
;,; <- ch000018183C3C3C3C ; 2
;,; <- ch000103070F1F3F7F ; 2
;,; <- ch0000FFFFFFFFFFFF ; 18
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- ch7F3F1F0F07030100 ; 2
;,; <- chFEFCF8F0E0C08000 ; 2
; total unique chars in pic: 12 (worst case req 96 bytes)
; method 0 ( bytes ) -- 434 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 233 cumulative
; METHOD 5 CHOSEN
!byte $CE,$3A ;addr
!byte $00 ;data1
!byte $00
!byte $90 ;skip
!byte $27 ;data1
!byte $00
!byte $00
!byte $00
!byte $00
!byte $01
!byte $F4
!byte $BD
!byte $F1
!byte $54
!byte $A0
!byte $41
!byte $54
!byte $A0
!byte $41
!byte $54
!byte $A0
!byte $41
!byte $54
!byte $BC
!byte $41
!byte $54
!byte $84
!byte $41
!byte $54
!byte $84
!byte $41
!byte $54
!byte $84
!byte $41
!byte $57
!byte $BC
!byte $40
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $e3 ;run ibpcaa
!byte $e1,12

;,; *_002
;,; <- deps_imustcontinue
;,; <- chFFFFFFFFFFFFFFFF ; 348
;,; <- chFFFFFFFFFFFF0000 ; 14
;,; <- chFCFCFCFCFCFCFCFC ; 28
;,; <- ch0000000000000000 ; 57
;,; <- ch3C3C3C3C3C3C3C3C ; 11
;,; <- ch3F3F3F3F3F3F3F3F ; 26
;,; <- ch000103070F1F3F7F ; 3
;,; <- ch0000FFFFFFFFFFFF ; 12
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- ch7F3F1F0F07030100 ; 2
;,; <- chFEFCF8F0E0C08000 ; 1
; total unique chars in pic: 11 (worst case req 88 bytes)
; method 0 ( bytes ) -- 441 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 264 cumulative
; METHOD 5 CHOSEN
!byte $CE,$7A ;addr
!byte $1A ;data1
!byte $3D
!byte $EF
!byte $00
!byte $21
!byte $29
!byte $00
!byte $21
!byte $29
!byte $00
!byte $21
!byte $29
!byte $00
!byte $21
!byte $29
!byte $00
!byte $21
!byte $29
!byte $00
!byte $21
!byte $29
!byte $00
!byte $21
!byte $29
!byte $00
!byte $3D
!byte $E9
!byte $00
!byte $e3 ;run ibpcaa
!byte $e1,12

;,; *_003
;,; <- deps_imustcontinue
;,; <- chFFFFFFFFFFFFFFFF ; 437
;,; <- chFFFFFFFFFFFF0000 ; 6
;,; <- chFCFCFCFCFCFCFCFC ; 16
;,; <- ch0000000000000000 ; 22
;,; <- ch3C3C3C3C3C3C3C3C ; 1
;,; <- ch3F3F3F3F3F3F3F3F ; 16
;,; <- ch0000FFFFFFFFFFFF ; 4
;,; <- ch0080C0E0F0F8FCFE ; 1
;,; <- ch000103070F1F3F7F ; 1
; total unique chars in pic: 9 (worst case req 72 bytes)
; method 0 ( bytes ) -- 373 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 294 cumulative
; METHOD 5 CHOSEN
!byte $CE,$7C ;addr
!byte $19 ;data1
!byte $1F
!byte $40
!byte $00
!byte $04
!byte $40
!byte $00
!byte $04
!byte $40
!byte $00
!byte $04
!byte $40
!byte $00
!byte $04
!byte $40
!byte $00
!byte $04
!byte $40
!byte $00
!byte $04
!byte $40
!byte $00
!byte $04
!byte $40
!byte $00
!byte $04
!byte $40
!byte $e3 ;run ibpcaa
!byte $e1,12

;,; *_004
;,; <- deps_imustcontinue
;,; <- chFFFFFFFFFFFFFFFF ; 347
;,; <- chFFFFFFFFFFFF0000 ; 15
;,; <- chFCFCFCFCFCFCFCFC ; 23
;,; <- ch0000000000000000 ; 59
;,; <- ch3C3C3C3C3C3C3C3C ; 18
;,; <- ch3F3F3F3F3F3F3F3F ; 19
;,; <- ch000103070F1F3F7F ; 3
;,; <- ch0000FFFFFFFFFFFF ; 15
;,; <- ch0080C0E0F0F8FCFE ; 1
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- chFEFCF8F0E0C08000 ; 1
; total unique chars in pic: 11 (worst case req 88 bytes)
; method 0 ( bytes ) -- 489 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 324 cumulative
; METHOD 5 CHOSEN
!byte $CE,$7C ;addr
!byte $19 ;data1
!byte $FA
!byte $2F
!byte $00
!byte $8A
!byte $28
!byte $00
!byte $8A
!byte $28
!byte $00
!byte $8A
!byte $28
!byte $00
!byte $8A
!byte $2E
!byte $00
!byte $8A
!byte $28
!byte $00
!byte $8A
!byte $28
!byte $00
!byte $8A
!byte $28
!byte $00
!byte $8B
!byte $EF
!byte $e3 ;run ibpcaa
; total compressed size 324 bytes

!byte $e1,12
