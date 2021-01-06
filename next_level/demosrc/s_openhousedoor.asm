
;,; SC11_000
;,; <- ibpcaablocks
!byte $e4,3,chFFFFFFFFFFFFFFFF ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 272
;,; <- chFFFFFFFFFFFF0000 ; 5
;,; <- chFCFCFCFCFCFCFCFC ; 42
;,; <- ch0000000000000000 ; 111
;,; <- ch7F3F1F0F07030100 ; 9
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- ch0080C0E0F0F8FCFE ; 8
;,; <- ch0000207070707020 ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 34
;,; <- ch000F1F3F7F7F3F0F ; 2
;,; <- ch0F0F0F0F0F0F0F0F ; 2
;,; <- chFFFFFFFFFFFF0707 ; 1
;,; <- ch0101010101010101 ; 1
;,; <- chBC3C3C3C3C3CBCFC ; 1
;,; <- ch000103070F1F3F7F ; 3
;,; <- ch0000FFFFFFFFFFFF ; 3
;,; <- chAAAAEAEAFAFAFEFE ; 2
; total unique chars in pic: 17 (worst case req 136 bytes)
!byte $DA,$0F ;addr
!byte $47,$02 ;fill
!byte $8E ;skip
!byte $47,$02 ;fill
!byte $8E ;skip
!byte $47,$02 ;fill
!byte $8E ;skip
!byte $e2,1;mode4
!byte $04 ;data4
!byte $22
!byte $22
!byte $27
!byte $22
!byte $32
!byte $8B ;skip
!byte $05 ;data4
!byte $31
!byte $22
!byte $22
!byte $77
!byte $22
!byte $32
!byte $8D ;skip
!byte $04 ;data4
!byte $22
!byte $22
!byte $77
!byte $22
!byte $32
!byte $86 ;skip
!byte $07 ;data4
!byte $31
!byte $33
!byte $33
!byte $23
!byte $22
!byte $72
!byte $27
!byte $22
!byte $8E ;skip
!byte $04 ;data4
!byte $22
!byte $22
!byte $77
!byte $22
!byte $32
!byte $8D ;skip
!byte $08 ;data4
!byte $22
!byte $22
!byte $77
!byte $22
!byte $32
!byte $33
!byte $33
!byte $63
!byte $36
!byte $85 ;skip
!byte $04 ;data4
!byte $22
!byte $22
!byte $77
!byte $22
!byte $32
!byte $8D ;skip
!byte $05 ;data4
!byte $22
!byte $22
!byte $77
!byte $22
!byte $32
!byte $53
!byte $8B ;skip
!byte $08 ;data4
!byte $22
!byte $22
!byte $77
!byte $22
!byte $32
!byte $55
!byte $35
!byte $33
!byte $36
!byte $85 ;skip
!byte $04 ;data4
!byte $22
!byte $22
!byte $77
!byte $22
!byte $52
!byte $DB,$38 ;addr
!byte $4A,$05 ;fill
!byte $05 ;data4
!byte $33
!byte $25
!byte $22
!byte $72
!byte $27
!byte $22
!byte $4D,$05 ;fill
!byte $04 ;data4
!byte $22
!byte $22
!byte $77
!byte $22
!byte $12
!byte $DB,$68 ;addr
!byte $4A,$01 ;fill
!byte $05 ;data4
!byte $15
!byte $21
!byte $22
!byte $72
!byte $27
!byte $22
!byte $4D,$01 ;fill
!byte $04 ;data4
!byte $22
!byte $72
!byte $77
!byte $22
!byte $12
!byte $DB,$98 ;addr
!byte $4D,$01 ;fill
!byte $04 ;data4
!byte $22
!byte $72
!byte $77
!byte $22
!byte $12
!byte $DB,$B0 ;addr
!byte $4D,$01 ;fill
!byte $04 ;data4
!byte $22
!byte $72
!byte $77
!byte $27
!byte $12
!byte $DB,$C8 ;addr
!byte $4D,$01 ;fill
!byte $04 ;data4
!byte $2A
!byte $72
!byte $77
!byte $27
!byte $12
!byte $DB,$E0 ;addr
!byte $4E,$01 ;fill
!byte $03 ;data4
!byte $2A
!byte $77
!byte $77
!byte $22
; method 0 ( bytes ) -- 547 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 360 cumulative
; METHOD 5 CHOSEN
!byte $CE,$2A ;addr
!byte $e2,$ff;mode1
!byte $39 ;data1
!byte $80
!byte $00
!byte $20
!byte $C0
!byte $00
!byte $70
!byte $A0
!byte $04
!byte $E0
!byte $90
!byte $0E
!byte $70
!byte $90
!byte $1C
!byte $70
!byte $90
!byte $0E
!byte $60
!byte $90
!byte $0E
!byte $20
!byte $90
!byte $0C
!byte $20
!byte $90
!byte $04
!byte $60
!byte $90
!byte $04
!byte $7C
!byte $90
!byte $0C
!byte $70
!byte $90
!byte $0E
!byte $70
!byte $90
!byte $0E
!byte $60
!byte $90
!byte $0E
!byte $20
!byte $90
!byte $0C
!byte $20
!byte $90
!byte $04
!byte $20
!byte $90
!byte $04
!byte $20
!byte $90
!byte $04
!byte $30
!byte $90
!byte $04
!byte $00
!byte $92
!byte $e3 ;run ibpcaa
!byte $CE,$12 ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte chFFFFFFFFFFFF0000
!byte $CE,$56 ;addr
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $83 ;skip
!byte $00 ;data8
!byte ch0080C0E0F0F8FCFE
!byte $90 ;skip
!byte $00 ;data8
!byte ch0000207070707020
!byte $84 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $8C ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $88 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $8A ;skip
!byte $00 ;data8
!byte ch0000207070707020
!byte $89 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $8F ;skip
!byte $00 ;data8
!byte ch000F1F3F7F7F3F0F
!byte $84 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $8F ;skip
!byte $00 ;data8
!byte ch0F0F0F0F0F0F0F0F
!byte $84 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $8A ;skip
!byte $00 ;data8
!byte ch000F1F3F7F7F3F0F
!byte $89 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $8A ;skip
!byte $00 ;data8
!byte ch0F0F0F0F0F0F0F0F
!byte $86 ;skip
!byte $04 ;data8
!byte chFFFFFFFFFFFF0707
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $92 ;skip
!byte $04 ;data8
!byte ch0101010101010101
!byte chBC3C3C3C3C3CBCFC
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $91 ;skip
!byte $05 ;data8
!byte chAAAAEAEAFAFAFEFE
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $88 ;skip
!byte $0B ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte ch0000FFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chAAAAEAEAFAFAFEFE
!byte chFCFCFCFCFCFCFCFC
!byte $83 ;skip
!byte $00 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte $e1,48

;,; *_001
;,; <- ibpcaablocks
;,; <- chFFFFFFFFFFFFFFFF ; 276
;,; <- chFFFFFFFFFFFF0000 ; 3
;,; <- chFCFCFCFCFCFCFCFC ; 42
;,; <- ch0000000000000000 ; 111
;,; <- ch7F3F1F0F07030100 ; 10
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- ch0080C0E0F0F8FCFE ; 8
;,; <- ch0000207070707020 ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 34
;,; <- ch000F1F3F7F7F3F0F ; 2
;,; <- ch0F0F0F0F0F0F0F0F ; 2
;,; <- chBC3C3C3C3C3CBCFC ; 1
;,; <- ch000103070F1F3F7F ; 3
;,; <- chAAAAEAEAFAFAFEFE ; 2
;,; <- ch0000FFFFFFFFFFFF ; 2
; total unique chars in pic: 15 (worst case req 120 bytes)
!byte $DA,$A2 ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $77
!byte $95 ;skip
!byte $00 ;data4
!byte $77
!byte $95 ;skip
!byte $00 ;data4
!byte $77
!byte $95 ;skip
!byte $00 ;data4
!byte $77
!byte $95 ;skip
!byte $00 ;data4
!byte $77
!byte $95 ;skip
!byte $00 ;data4
!byte $77
!byte $95 ;skip
!byte $00 ;data4
!byte $77
!byte $95 ;skip
!byte $00 ;data4
!byte $77
!byte $95 ;skip
!byte $00 ;data4
!byte $77
!byte $8F ;skip
!byte $03 ;data4
!byte $11
!byte $21
!byte $22
!byte $77
; method 0 ( bytes ) -- 415 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 529 cumulative
; METHOD 0 CHOSEN
!byte $CE,$E5 ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch7F3F1F0F07030100
!byte $96 ;skip
!byte $03 ;data8
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $e1,48

;,; *_002
;,; <- ibpcaablocks
;,; <- chFFFFFFFFFFFFFFFF ; 294
;,; <- chFFFFFFFFFFFF0000 ; 3
;,; <- chFCFCFCFCFCFCFCFC ; 24
;,; <- ch0000000000000000 ; 100
;,; <- ch7F3F1F0F07030100 ; 10
;,; <- chFEFCF8F0E0C08000 ; 6
;,; <- ch0080C0E0F0F8FCFE ; 9
;,; <- ch0000207070707020 ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 34
;,; <- ch000F1F3F7F7F3F0F ; 2
;,; <- ch0F0F0F0F0F0F0F0F ; 2
;,; <- ch5555555555555555 ; 11
;,; <- ch000103070F1F3F7F ; 3
;,; <- chAAAAEAEAFAFAFEFE ; 2
;,; <- ch0000FFFFFFFFFFFF ; 2
; total unique chars in pic: 15 (worst case req 120 bytes)
!byte $DA,$2A ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $24
!byte $95 ;skip
!byte $00 ;data4
!byte $44
!byte $95 ;skip
!byte $01 ;data4
!byte $44
!byte $24
!byte $93 ;skip
!byte $01 ;data4
!byte $44
!byte $44
!byte $92 ;skip
!byte $02 ;data4
!byte $44
!byte $42
!byte $24
!byte $91 ;skip
!byte $02 ;data4
!byte $74
!byte $77
!byte $24
!byte $91 ;skip
!byte $00 ;data4
!byte $74
!byte $95 ;skip
!byte $00 ;data4
!byte $74
!byte $95 ;skip
!byte $00 ;data4
!byte $74
!byte $95 ;skip
!byte $00 ;data4
!byte $7A
!byte $95 ;skip
!byte $00 ;data4
!byte $7A
!byte $95 ;skip
!byte $00 ;data4
!byte $7A
!byte $95 ;skip
!byte $00 ;data4
!byte $7A
!byte $95 ;skip
!byte $00 ;data4
!byte $7A
!byte $95 ;skip
!byte $00 ;data4
!byte $7A
!byte $95 ;skip
!byte $00 ;data4
!byte $7A
!byte $95 ;skip
!byte $00 ;data4
!byte $7A
!byte $95 ;skip
!byte $00 ;data4
!byte $7A
!byte $95 ;skip
!byte $00 ;data4
!byte $7A
!byte $95 ;skip
!byte $00 ;data4
!byte $7A
; method 0 ( bytes ) -- 562 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 679 cumulative
; METHOD 0 CHOSEN
!byte $CE,$41 ;addr
!byte $e2,0;mode8
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte $95 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $42,ch0000000000000000 ;fill
!byte $93 ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch5555555555555555
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch5555555555555555
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch5555555555555555
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch5555555555555555
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch5555555555555555
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch5555555555555555
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch5555555555555555
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch5555555555555555
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch5555555555555555
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch5555555555555555
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $01 ;data8
!byte ch5555555555555555
!byte chFFFFFFFFFFFFFFFF
!byte $e1,24

;,; *_003
;,; <- ibpcaablocks
;,; <- chFFFFFFFFFFFFFFFF ; 280
;,; <- chFFFFFFFFFFFF0000 ; 3
;,; <- chFCFCFCFCFCFCFCFC ; 36
;,; <- ch0000000000000000 ; 107
;,; <- ch7F3F1F0F07030100 ; 10
;,; <- chFEFCF8F0E0C08000 ; 9
;,; <- ch0080C0E0F0F8FCFE ; 9
;,; <- ch0000207070707020 ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 34
;,; <- ch000F1F3F7F7F3F0F ; 2
;,; <- ch000103070F1F3F7F ; 5
;,; <- ch0F0F0F0F0F0F0F0F ; 2
;,; <- chBC3C3C3C3C3CBCFC ; 1
;,; <- chAAAAEAEAFAFAFEFE ; 2
;,; <- ch0000FFFFFFFFFFFF ; 2
; total unique chars in pic: 15 (worst case req 120 bytes)
!byte $DA,$2A ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $22
!byte $AF ;skip
!byte $00 ;data4
!byte $27
!byte $96 ;skip
!byte $00 ;data4
!byte $27
!byte $91 ;skip
!byte $02 ;data4
!byte $42
!byte $44
!byte $27
!byte $91 ;skip
!byte $02 ;data4
!byte $42
!byte $74
!byte $27
!byte $91 ;skip
!byte $02 ;data4
!byte $42
!byte $77
!byte $27
!byte $91 ;skip
!byte $02 ;data4
!byte $72
!byte $77
!byte $27
!byte $91 ;skip
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
!byte $95 ;skip
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
!byte $72
!byte $95 ;skip
!byte $00 ;data4
!byte $72
!byte $95 ;skip
!byte $00 ;data4
!byte $72
!byte $95 ;skip
!byte $00 ;data4
!byte $72
!byte $95 ;skip
!byte $00 ;data4
!byte $72
; method 0 ( bytes ) -- 704 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 805 cumulative
; METHOD 0 CHOSEN
!byte $CE,$89 ;addr
!byte $e2,0;mode8
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte $93 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte $93 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch000103070F1F3F7F
!byte $93 ;skip
!byte $02 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch000103070F1F3F7F
!byte $94 ;skip
!byte $01 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte $95 ;skip
!byte $01 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte $95 ;skip
!byte $01 ;data8
!byte chBC3C3C3C3C3CBCFC
!byte ch0000000000000000
!byte $95 ;skip
!byte $01 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte $95 ;skip
!byte $01 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte $95 ;skip
!byte $01 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte $95 ;skip
!byte $01 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte $95 ;skip
!byte $01 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte $95 ;skip
!byte $01 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte $95 ;skip
!byte $01 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte $95 ;skip
!byte $01 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte $95 ;skip
!byte $01 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte $e1,48

;,; *_004
;,; <- ibpcaablocks
!byte $e4,3,ch0000000000000000 ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 163
;,; <- chFCFCFCFCFCFCFCFC ; 62
;,; <- ch0000000000000000 ; 177
;,; <- ch3F3F3F3F3F3F3F3F ; 64
;,; <- chFFFFFFFFFFFF0000 ; 6
;,; <- chFEFCF8F0E0C08000 ; 7
;,; <- ch7F3F1F0F07030100 ; 7
;,; <- ch000018183C3C3C3C ; 4
;,; <- ch3C3C3C3C18180000 ; 4
;,; <- ch00000F3F3F0F0000 ; 2
;,; <- ch0000FFFFFFFF0000 ; 2
;,; <- ch0000F0FCFCF00000 ; 2
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- ch000103070F1F3F7F ; 2
; total unique chars in pic: 14 (worst case req 112 bytes)
!byte $DA,$00 ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $44
!byte $93 ;skip
!byte $01 ;data4
!byte $44
!byte $44
!byte $93 ;skip
!byte $01 ;data4
!byte $44
!byte $44
!byte $93 ;skip
!byte $01 ;data4
!byte $44
!byte $44
!byte $93 ;skip
!byte $01 ;data4
!byte $44
!byte $44
!byte $93 ;skip
!byte $01 ;data4
!byte $44
!byte $44
!byte $93 ;skip
!byte $01 ;data4
!byte $44
!byte $44
!byte $93 ;skip
!byte $01 ;data4
!byte $44
!byte $44
!byte $8B ;skip
!byte $15 ;data4
!byte $11
!byte $31
!byte $33
!byte $33
!byte $44
!byte $44
!byte $33
!byte $33
!byte $13
!byte $11
!byte $33
!byte $33
!byte $11
!byte $31
!byte $33
!byte $33
!byte $44
!byte $44
!byte $33
!byte $33
!byte $13
!byte $11
!byte $8B ;skip
!byte $01 ;data4
!byte $44
!byte $44
!byte $93 ;skip
!byte $01 ;data4
!byte $44
!byte $44
!byte $8A ;skip
!byte $16 ;data4
!byte $11
!byte $11
!byte $31
!byte $33
!byte $43
!byte $44
!byte $34
!byte $33
!byte $13
!byte $11
!byte $11
!byte $33
!byte $13
!byte $11
!byte $33
!byte $33
!byte $43
!byte $44
!byte $34
!byte $53
!byte $33
!byte $11
!byte $31
!byte $8A ;skip
!byte $06 ;data4
!byte $44
!byte $44
!byte $55
!byte $55
!byte $33
!byte $33
!byte $33
!byte $48,$05 ;fill
!byte $01 ;data4
!byte $44
!byte $44
!byte $52,$05 ;fill
!byte $01 ;data4
!byte $44
!byte $44
!byte $52,$05 ;fill
!byte $01 ;data4
!byte $44
!byte $44
!byte $52,$01 ;fill
!byte $01 ;data4
!byte $44
!byte $44
!byte $52,$01 ;fill
!byte $01 ;data4
!byte $44
!byte $44
!byte $52,$01 ;fill
!byte $01 ;data4
!byte $44
!byte $44
!byte $52,$01 ;fill
!byte $00 ;data4
!byte $44
; method 0 ( bytes ) -- 541 bytes (541 cumu)
; method 5 ( ibpc0 ibcpaa bytes ) -- 234 bytes (234 cumu)
; METHOD 5 CHOSEN
!byte $CE,$00 ;addr
!byte $e2,$ff;mode1
!byte $3E ;data1
!byte $20
!byte $00
!byte $04
!byte $20
!byte $00
!byte $04
!byte $20
!byte $00
!byte $04
!byte $20
!byte $00
!byte $04
!byte $20
!byte $03
!byte $84
!byte $21
!byte $C7
!byte $C4
!byte $23
!byte $E7
!byte $C4
!byte $23
!byte $E5
!byte $44
!byte $22
!byte $A5
!byte $44
!byte $22
!byte $A7
!byte $C4
!byte $23
!byte $E7
!byte $C4
!byte $23
!byte $E4
!byte $44
!byte $22
!byte $27
!byte $C4
!byte $23
!byte $E3
!byte $84
!byte $21
!byte $C3
!byte $84
!byte $21
!byte $C3
!byte $84
!byte $21
!byte $C3
!byte $84
!byte $21
!byte $C3
!byte $84
!byte $21
!byte $C7
!byte $C4
!byte $23
!byte $FF
!byte $E4
!byte $27
!byte $FF
!byte $F4
!byte $e3 ;run ibpcaa
!byte $CE,$01 ;addr
!byte $e2,0;mode8
!byte $02 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $8F ;skip
!byte $02 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $CF,$8D ;addr
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $AC ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $A4 ;skip
!byte $03 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte chFEFCF8F0E0C08000
!byte $8E ;skip
!byte $02 ;data8
!byte ch7F3F1F0F07030100
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F

!byte $e1,24


