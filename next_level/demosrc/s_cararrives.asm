;,; SC10_000a
;,; <- ibpcaablocks
!byte $e4,6,chFFFFFFFFFFFFFFFF ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 360
;,; <- chFEFCF8F0E0C08000 ; 12
;,; <- ch7F3F1F0F07030100 ; 9
;,; <- ch0000000000000000 ; 61
;,; <- ch000103070F1F3F7F ; 12
;,; <- ch0080C0E0F0F8FCFE ; 8
;,; <- ch3F3F3F3F3F3F3F3F ; 18
;,; <- chFCFCFCFCFCFCFCFC ; 19
;,; <- chFFFFFFFFFFFF0000 ; 3
;,; <- chAAAAABABAFAFBFBF ; 1
;,; <- chAAAAEAEAFAFAFEFE ; 1
; total unique chars in pic: 11 (worst case req 88 bytes)
!byte $DA,$3D ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $33
!byte $94 ;skip
!byte $01 ;data4
!byte $33
!byte $33
!byte $93 ;skip
!byte $02 ;data4
!byte $33
!byte $33
!byte $63
!byte $8F ;skip
!byte $03 ;data4
!byte $22
!byte $36
!byte $33
!byte $33
!byte $8E ;skip
!byte $04 ;data4
!byte $22
!byte $22
!byte $36
!byte $33
!byte $63
!byte $8C ;skip
!byte $04 ;data4
!byte $22
!byte $22
!byte $22
!byte $36
!byte $63
!byte $8C ;skip
!byte $46,$02 ;fill
!byte $01 ;data4
!byte $66
!byte $22
!byte $86 ;skip
!byte $01 ;data4
!byte $65
!byte $66
!byte $4B,$02 ;fill
!byte $05 ;data4
!byte $56
!byte $66
!byte $66
!byte $55
!byte $65
!byte $26
!byte $DA,$F6 ;addr
!byte $4B,$02 ;fill
!byte $07 ;data4
!byte $56
!byte $66
!byte $56
!byte $55
!byte $55
!byte $25
!byte $72
!byte $77
!byte $46,$02 ;fill
!byte $49,$05 ;fill
!byte $06 ;data4
!byte $22
!byte $77
!byte $27
!byte $AA
!byte $22
!byte $22
!byte $52
!byte $DB,$33 ;addr
!byte $49,$05 ;fill
!byte $06 ;data4
!byte $22
!byte $77
!byte $27
!byte $AA
!byte $22
!byte $22
!byte $52
!byte $DB,$4B ;addr
!byte $49,$05 ;fill
!byte $02 ;data4
!byte $22
!byte $77
!byte $27
!byte $DB,$5B ;addr
!byte $46,$02 ;fill
!byte $49,$05 ;fill
!byte $02 ;data4
!byte $22
!byte $77
!byte $27
!byte $DB,$73 ;addr
!byte $45,$02 ;fill
!byte $4B,$05 ;fill
!byte $03 ;data4
!byte $72
!byte $77
!byte $22
!byte $22
!byte $4E,$05 ;fill
!byte $03 ;data4
!byte $72
!byte $77
!byte $22
!byte $22
!byte $4F,$05 ;fill
!byte $01 ;data4
!byte $77
!byte $57
!byte $DB,$BB ;addr
!byte $52,$05 ;fill
!byte $02 ;data4
!byte $1D
!byte $11
!byte $5D
!byte $DB,$D4 ;addr
!byte $4A,$05 ;fill
!byte $56,$01 ;fill
; method 0 ( bytes ) -- 395 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 324 cumulative
; METHOD 5 CHOSEN
!byte $CE,$25 ;addr
!byte $e2,$ff;mode1
!byte $33 ;data1
!byte $C0
!byte $00
!byte $01
!byte $20
!byte $00
!byte $02
!byte $10
!byte $00
!byte $06
!byte $08
!byte $00
!byte $09
!byte $04
!byte $00
!byte $10
!byte $84
!byte $00
!byte $20
!byte $4C
!byte $00
!byte $40
!byte $34
!byte $00
!byte $40
!byte $24
!byte $00
!byte $40
!byte $24
!byte $00
!byte $40
!byte $24
!byte $00
!byte $41
!byte $A4
!byte $00
!byte $41
!byte $A4
!byte $00
!byte $41
!byte $A4
!byte $00
!byte $40
!byte $28
!byte $00
!byte $40
!byte $30
!byte $00
!byte $40
!byte $20
!byte $00
!byte $63
!byte $C0
!byte $e3 ;run ibpcaa
!byte $CE,$0D ;addr
!byte $e2,0;mode8
!byte $01 ;data8
!byte chFEFCF8F0E0C08000
!byte ch7F3F1F0F07030100
!byte $CE,$D1 ;addr
!byte $00 ;data8
!byte ch000103070F1F3F7F
!byte $8C ;skip
!byte $46,chFFFFFFFFFFFFFFFF ;fill
!byte $02 ;data8
!byte ch0000000000000000
!byte ch000103070F1F3F7F
!byte chFFFFFFFFFFFFFFFF
!byte $8C ;skip
!byte $0A ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $8C ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $02 ;data8
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $8C ;skip
!byte $0A ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $8C ;skip
!byte $0A ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $8C ;skip
!byte $09 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte $8D ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $01 ;data8
!byte ch0000000000000000
!byte chFEFCF8F0E0C08000
!byte $8D ;skip
!byte $07 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $8F ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $A6 ;skip
!byte $05 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chAAAAABABAFAFBFBF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chAAAAEAEAFAFAFEFE
!byte $41,chFFFFFFFFFFFFFFFF ;fill
!byte $e1,32

;,; *_000b
!byte $e1,100

;,; *_001
;,; <- ibpcaablocks
;,; <- chFFFFFFFFFFFFFFFF ; 348
;,; <- chFEFCF8F0E0C08000 ; 12
;,; <- ch7F3F1F0F07030100 ; 12
;,; <- ch0000000000000000 ; 65
;,; <- ch000103070F1F3F7F ; 12
;,; <- ch0080C0E0F0F8FCFE ; 8
;,; <- ch3F3F3F3F3F3F3F3F ; 19
;,; <- chFCFCFCFCFCFCFCFC ; 20
;,; <- chFFFFFFFFFFFF0000 ; 3
;,; <- ch0000000001030303 ; 1
;,; <- ch000000FFFFFF0000 ; 1
;,; <- ch0000000080C0C0C0 ; 1
;,; <- chAAAAABABAFAFBFBF ; 1
;,; <- chAAAAEAEAFAFAFEFE ; 1
; total unique chars in pic: 14 (worst case req 112 bytes)
!byte $DB,$2C ;addr
!byte $40,$02 ;fill
!byte $95 ;skip
!byte $40,$02 ;fill
!byte $DB,$C8 ;addr
!byte $e2,1;mode4
!byte $01 ;data4
!byte $11
!byte $51
; method 0 ( bytes ) -- 363 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 489 cumulative
; METHOD 0 CHOSEN
!byte $CF,$80 ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch7F3F1F0F07030100
!byte $96 ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte $95 ;skip
!byte $02 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte $94 ;skip
!byte $02 ;data8
!byte ch0000000001030303
!byte ch000000FFFFFF0000
!byte ch0000000080C0C0C0
!byte $94 ;skip
!byte $02 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $e1,12

;,; *_002
;,; <- ibpcaablocks
;,; <- chFFFFFFFFFFFFFFFF ; 330
;,; <- chFEFCF8F0E0C08000 ; 13
;,; <- ch7F3F1F0F07030100 ; 10
;,; <- ch0000000000000000 ; 74
;,; <- ch000103070F1F3F7F ; 12
;,; <- ch0080C0E0F0F8FCFE ; 8
;,; <- ch3F3F3F3F3F3F3F3F ; 20
;,; <- chFCFCFCFCFCFCFCFC ; 21
;,; <- chFFFFFFFFFFFF0000 ; 6
;,; <- ch7C3C1C0C04000000 ; 1
;,; <- ch5555555555555555 ; 2
;,; <- ch0000000001030303 ; 2
;,; <- ch000000FFFFFF0000 ; 2
;,; <- ch0000000080C0C0C0 ; 2
;,; <- chAAAAEAEAFAFAFEFE ; 1
; total unique chars in pic: 15 (worst case req 120 bytes)
!byte $DB,$2D ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $20
!byte $94 ;skip
!byte $00 ;data4
!byte $44
!byte $95 ;skip
!byte $00 ;data4
!byte $44
!byte $A7 ;skip
!byte $00 ;data4
!byte $2A
!byte $95 ;skip
!byte $00 ;data4
!byte $2D
!byte $96 ;skip
!byte $00 ;data4
!byte $72
!byte $8E ;skip
!byte $03 ;data4
!byte $15
!byte $11
!byte $15
!byte $11
; method 0 ( bytes ) -- 442 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 548 cumulative
; METHOD 0 CHOSEN
!byte $CF,$6A ;addr
!byte $e2,0;mode8
!byte $02 ;data8
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFF0000
!byte $92 ;skip
!byte $06 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch7C3C1C0C04000000
!byte ch5555555555555555
!byte $90 ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $43,ch0000000000000000 ;fill
!byte $00 ;data8
!byte ch5555555555555555
!byte $90 ;skip
!byte $00 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte $43,ch0000000000000000 ;fill
!byte $01 ;data8
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte $8F ;skip
!byte $07 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000001030303
!byte ch000000FFFFFF0000
!byte ch0000000080C0C0C0
!byte ch0000000000000000
!byte ch0000000001030303
!byte ch000000FFFFFF0000
!byte ch0000000080C0C0C0
!byte $8F ;skip
!byte $07 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $e1,48

