;,; lyrics_wewanttotell .withinpagefrom=lyrics
;,; <- lyrics

        !byte $26,$01			; WE
	!byte $26,$20,$22		; WANT
	!byte $29,$1d,$26		; TO
	!byte $29,$1d,$43,$67		; TELL
	!byte $3a,$29			; A
	!byte $2b,$3a,$36,$39,$1d	; BOUT
	!byte $3a,$99			; A
	!byte $2b,$83,$19		; BET
	!byte $29,$1d,$8a		; TER
	!byte $29,$1b,$57,$53,$51,$54	; PLACE
        !byte $0f

;,; deps_wewanttotell
;,; <- ibpcaablocks
;,; <- lyrics_wewanttotell

;,; SC20_000
;,; <- deps_wewanttotell
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
!byte $00,lyrics_wewanttotell-lyrics

;,; <- deps_wewanttotell
;,; <- chFFFFFFFFFFFFFFFF ; 120
;,; <- chFCFCFCFCFCFCFCFC ; 57
;,; <- ch0000000000000000 ; 176
;,; <- ch3F3F3F3F3F3F3F3F ; 58
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 7
;,; <- chFCFCDCCCCCCCCCCC ; 13
;,; <- chFCFC303030303030 ; 6
;,; <- chC0C0C0C0C0C0C0C0 ; 3
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- chCCCCCCCCCCCCCCCC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- ch3030303030303030 ; 6
;,; <- chCCCCCCCCCCECFCFC ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 4
;,; <- chFCFCCCCCCCDCFCFC ; 2
;,; <- chFFFFFFFFFFFF0000 ; 8
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- ch000018183C3C3C3C ; 4
;,; <- ch3C3C3C3C18180000 ; 4
;,; <- ch000103070F1F3F7F ; 4
;,; <- ch0000FFFFFFFFFFFF ; 2
;,; <- ch0080C0E0F0F8FCFE ; 4
; total unique chars in pic: 25 (worst case req 200 bytes)
!byte $DA,$01 ;addr
!byte $54,$00 ;fill
!byte $e2,1;mode4
!byte $00 ;data4
!byte $44
!byte $54,$01 ;fill
!byte $00 ;data4
!byte $44
!byte $54,$01 ;fill
!byte $00 ;data4
!byte $44
!byte $53,$00 ;fill
; method 0 ( bytes ) -- 136 bytes (370 cumu)
; method 5 ( ibpc0 ibcpaa bytes ) -- 185 bytes (419 cumu)
; METHOD 0 CHOSEN
!byte $CE,$19 ;addr
!byte $e2,0;mode8
!byte $2D ;data8
!byte ch0000000000000000
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFC303030303030
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chFCFCE0C0C0C0C0C0
!byte chC0C0C0C0C0C0C0C0
!byte chC0C0C0C0C0C0C0C0
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chF0F8CCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte chFCFC303030303030
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte chD6D6D6D6D6F6FEFE
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000000000
!byte chD6D6D6D6D6F6FEFE
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte ch3030303030303030
!byte ch0000000000000000
!byte ch3030303030303030
!byte chCCCCCCCCCCECFCFC
!byte ch0000000000000000
!byte ch3030303030303030
!byte chFCFCE0C0C0E0FCFC
!byte chC0C0C0C0C0E0FCFC
!byte chC0C0C0C0C0E0FCFC
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCCCCCCCDCFCFC
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCECFCFC
!byte ch3030303030303030
!byte $96 ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $CF,$16 ;addr
!byte $02 ;data8
!byte ch000103070F1F3F7F
!byte ch0000FFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte $8D ;skip
!byte $02 ;data8
!byte ch000103070F1F3F7F
!byte ch0000FFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte $83 ;skip
!byte $02 ;data8
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFF0000
!byte chFEFCF8F0E0C08000
!byte $8D ;skip
!byte $02 ;data8
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFF0000
!byte chFEFCF8F0E0C08000
!byte $CF,$9C ;addr
!byte $4E,ch0000000000000000 ;fill
!byte $87 ;skip
!byte $0F ;data8
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chF0F8CCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFC303030303030
!byte chFCFC303030303030
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chC0C0C0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte $87 ;skip
!byte $0F ;data8
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCCCCCCCDCFCFC
!byte chFCFCE0C0C0E0FCFC
!byte ch3030303030303030
!byte ch3030303030303030
!byte chFCFCE0C0C0E0FCFC
!byte chF0F8CCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCE0C0C0C0C0C0
!byte chC0C0C0C0C0E0FCFC
!byte chFCFCDCCCCCCCCCCC
!byte chC0C0C0C0C0E0FCFC
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000000000
!byte $87 ;skip
!byte $00,ch0000000000000000 ;fill
!byte $e1,12

;,; *_001
;,; <- deps_wewanttotell
;,; <- chFFFFFFFFFFFFFFFF ; 120
;,; <- chFCFCFCFCFCFCFCFC ; 57
;,; <- ch0000000000000000 ; 176
;,; <- ch3F3F3F3F3F3F3F3F ; 58
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 7
;,; <- chFCFCDCCCCCCCCCCC ; 13
;,; <- chFCFC303030303030 ; 6
;,; <- chC0C0C0C0C0C0C0C0 ; 3
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- chCCCCCCCCCCCCCCCC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- ch3030303030303030 ; 6
;,; <- chCCCCCCCCCCECFCFC ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 4
;,; <- chFCFCCCCCCCDCFCFC ; 2
;,; <- chFFFFFFFFFFFF0000 ; 8
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- ch000018183C3C3C3C ; 4
;,; <- ch3C3C3C3C18180000 ; 4
;,; <- ch000103070F1F3F7F ; 4
;,; <- ch0000FFFFFFFFFFFF ; 2
;,; <- ch0080C0E0F0F8FCFE ; 4
; total unique chars in pic: 25 (worst case req 200 bytes)

!byte $DA,$01 ;addr
!byte $54,$00 ;fill
!byte $e2,1;mode4
!byte $00 ;data4
!byte $44
!byte $54,$01 ;fill
!byte $00 ;data4
!byte $44
!byte $54,$01 ;fill
!byte $00 ;data4
!byte $44
!byte $53,$00 ;fill
; method 0 ( bytes ) -- 136 bytes (370 cumu)
; method 5 ( ibpc0 ibcpaa bytes ) -- 185 bytes (419 cumu)
; METHOD 0 CHOSEN
!byte $CE,$19 ;addr
!byte $e2,0;mode8
!byte $2D ;data8
!byte ch0000000000000000
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFC303030303030
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chFCFCE0C0C0C0C0C0
!byte chC0C0C0C0C0C0C0C0
!byte chC0C0C0C0C0C0C0C0
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chF0F8CCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte chFCFC303030303030
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte chD6D6D6D6D6F6FEFE
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000000000
!byte chD6D6D6D6D6F6FEFE
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte ch3030303030303030
!byte ch0000000000000000
!byte ch3030303030303030
!byte chCCCCCCCCCCECFCFC
!byte ch0000000000000000
!byte ch3030303030303030
!byte chFCFCE0C0C0E0FCFC
!byte chC0C0C0C0C0E0FCFC
!byte chC0C0C0C0C0E0FCFC
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCCCCCCCDCFCFC
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCECFCFC
!byte ch3030303030303030
!byte $96 ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $CF,$16 ;addr
!byte $02 ;data8
!byte ch000103070F1F3F7F
!byte ch0000FFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte $8D ;skip
!byte $02 ;data8
!byte ch000103070F1F3F7F
!byte ch0000FFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte $83 ;skip
!byte $02 ;data8
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFF0000
!byte chFEFCF8F0E0C08000
!byte $8D ;skip
!byte $02 ;data8
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFF0000
!byte chFEFCF8F0E0C08000
!byte $CF,$9C ;addr
!byte $4E,ch0000000000000000 ;fill
!byte $87 ;skip
!byte $0F ;data8
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chF0F8CCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFC303030303030
!byte chFCFC303030303030
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chC0C0C0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte $87 ;skip
!byte $0F ;data8
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCCCCCCCDCFCFC
!byte chFCFCE0C0C0E0FCFC
!byte ch3030303030303030
!byte ch3030303030303030
!byte chFCFCE0C0C0E0FCFC
!byte chF0F8CCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCE0C0C0C0C0C0
!byte chC0C0C0C0C0E0FCFC
!byte chFCFCDCCCCCCCCCCC
!byte chC0C0C0C0C0E0FCFC
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000000000
!byte $87 ;skip
!byte $00,ch0000000000000000 ;fill
!byte $e1,12

;,; *_002 .waits=10

;,; <- streamvars
!byte 0xD0,loopctr,0,5	; set loopctr
.loop:

;,; <- deps_wewanttotell
;,; <- chFFFFFFFFFFFFFFFF ; 120
;,; <- chFCFCFCFCFCFCFCFC ; 57
;,; <- ch0000000000000000 ; 182
;,; <- ch3F3F3F3F3F3F3F3F ; 58
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 7
;,; <- chFCFCDCCCCCCCCCCC ; 13
;,; <- chFCFC303030303030 ; 6
;,; <- chC0C0C0C0C0C0C0C0 ; 3
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- chCCCCCCCCCCCCCCCC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- ch3030303030303030 ; 6
;,; <- chCCCCCCCCCCECFCFC ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 4
;,; <- chFCFCCCCCCCDCFCFC ; 2
;,; <- chFFFFFFFFFFFF0000 ; 6
;,; <- chFEFCF8F0E0C08000 ; 2
;,; <- ch7F3F1F0F07030100 ; 3
;,; <- ch000018183C3C3C3C ; 4
;,; <- ch3C3C3C3C18180000 ; 4
;,; <- ch00000F3F3F0F0000 ; 2
;,; <- ch0000FFFFFFFF0000 ; 2
;,; <- ch0000F0FCFCF00000 ; 2
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- ch000103070F1F3F7F ; 2
; total unique chars in pic: 27 (worst case req 216 bytes)
; method 0 ( bytes ) -- 17 bytes (387 cumu)
; method 5 ( ibpc0 ibcpaa bytes ) -- 79 bytes (449 cumu)
; METHOD 0 CHOSEN
!byte $CF,$16 ;addr
!byte $02 ;data8
!byte ch00000F3F3F0F0000
!byte ch0000FFFFFFFF0000
!byte ch0000F0FCFCF00000
!byte $8D ;skip
!byte $02 ;data8
!byte ch00000F3F3F0F0000
!byte ch0000FFFFFFFF0000
!byte ch0000F0FCFCF00000
!byte $83 ;skip
!byte $41,ch0000000000000000 ;fill
!byte $8D ;skip
!byte $41,ch0000000000000000 ;fill
!byte $e1,12

;,; <- deps_wewanttotell
;,; <- chFFFFFFFFFFFFFFFF ; 120
;,; <- chFCFCFCFCFCFCFCFC ; 57
;,; <- ch0000000000000000 ; 176
;,; <- ch3F3F3F3F3F3F3F3F ; 58
;,; <- chC6C6C6C6C6C6C6C6 ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 7
;,; <- chFCFCDCCCCCCCCCCC ; 13
;,; <- chFCFC303030303030 ; 6
;,; <- chC0C0C0C0C0C0C0C0 ; 3
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- chCCCCCCCCCCCCCCCC ; 2
;,; <- chD6D6D6D6D6F6FEFE ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- ch3030303030303030 ; 6
;,; <- chCCCCCCCCCCECFCFC ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 4
;,; <- chFCFCCCCCCCDCFCFC ; 2
;,; <- chFFFFFFFFFFFF0000 ; 8
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- ch7F3F1F0F07030100 ; 5
;,; <- ch000018183C3C3C3C ; 4
;,; <- ch3C3C3C3C18180000 ; 4
;,; <- ch000103070F1F3F7F ; 4
;,; <- ch0000FFFFFFFFFFFF ; 2
;,; <- ch0080C0E0F0F8FCFE ; 4
; total unique chars in pic: 25 (worst case req 200 bytes)
; method 0 ( bytes ) -- 21 bytes (408 cumu)
; method 5 ( ibpc0 ibcpaa bytes ) -- 79 bytes (466 cumu)
; METHOD 0 CHOSEN
!byte $CF,$16 ;addr
!byte $02 ;data8
!byte ch000103070F1F3F7F
!byte ch0000FFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte $8D ;skip
!byte $02 ;data8
!byte ch000103070F1F3F7F
!byte ch0000FFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte $83 ;skip
!byte $02 ;data8
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFF0000
!byte chFEFCF8F0E0C08000
!byte $8D ;skip
!byte $02 ;data8
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFF0000
!byte chFEFCF8F0E0C08000
!byte $e1,12

!byte $e0,<.loop,>.loop

;,; *_003
;,; <- deps_wewanttotell
; method 4 ( clrscr bytes ) -- 145 bytes (145 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 119 bytes (119 cumu)
; method 6 ( clrscr bytes ) -- 145 bytes (145 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 184 bytes (184 cumu)
; METHOD 5 CHOSEN
!byte $e4,3,ch0000000000000000 ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 172
;,; <- ch0000000000000000 ; 316
;,; <- ch000103070F1F3F7F ; 2
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- chFEFEFEFEFEFEFEFE ; 4
;,; <- ch7F7F7F7F7F7F7F7F ; 4
;,; <- ch7F3F1F0F07030100 ; 2
;,; <- chFEFCF8F0E0C08000 ; 2
; total unique chars in pic: 8 (worst case req 64 bytes)
!byte $DA,$AF ;addr
!byte $48,$01 ;fill
!byte $8D ;skip
!byte $48,$01 ;fill
!byte $8D ;skip
!byte $48,$01 ;fill
!byte $8D ;skip
!byte $48,$01 ;fill
!byte $8D ;skip
!byte $48,$01 ;fill
!byte $CE,$00 ;addr
!byte $e2,$ff;mode1
!byte $3E ;data1
!byte $0F
!byte $FF
!byte $F0
!byte $0F
!byte $FF
!byte $F0
!byte $0F
!byte $FF
!byte $F0
!byte $0F
!byte $FF
!byte $F0
!byte $0F
!byte $FF
!byte $F0
!byte $0F
!byte $FF
!byte $F0
!byte $0F
!byte $FF
!byte $F0
!byte $0E
!byte $7E
!byte $70
!byte $0E
!byte $7E
!byte $70
!byte $0E
!byte $7E
!byte $70
!byte $0E
!byte $7E
!byte $70
!byte $0E
!byte $7E
!byte $70
!byte $0F
!byte $FF
!byte $F0
!byte $0F
!byte $FF
!byte $F0
!byte $0F
!byte $FF
!byte $F0
!byte $0F
!byte $FF
!byte $F0
!byte $0F
!byte $FF
!byte $F0
!byte $0F
!byte $FF
!byte $F0
!byte $0F
!byte $FF
!byte $F0
!byte $0F
!byte $FF
!byte $F0
!byte $0F
!byte $FF
!byte $F0
!byte $CE,$AF ;addr
!byte $e2,0;mode8
!byte $01 ;data8
!byte ch000103070F1F3F7F
!byte ch0080C0E0F0F8FCFE
!byte $85 ;skip
!byte $01 ;data8
!byte ch000103070F1F3F7F
!byte ch0080C0E0F0F8FCFE
!byte $A5 ;skip
!byte $01 ;data8
!byte chFEFEFEFEFEFEFEFE
!byte ch7F7F7F7F7F7F7F7F
!byte $85 ;skip
!byte $01 ;data8
!byte chFEFEFEFEFEFEFEFE
!byte ch7F7F7F7F7F7F7F7F
!byte $8D ;skip
!byte $01 ;data8
!byte chFEFEFEFEFEFEFEFE
!byte ch7F7F7F7F7F7F7F7F
!byte $85 ;skip
!byte $01 ;data8
!byte chFEFEFEFEFEFEFEFE
!byte ch7F7F7F7F7F7F7F7F
!byte $8D ;skip
!byte $01 ;data8
!byte ch7F3F1F0F07030100
!byte chFEFCF8F0E0C08000
!byte $85 ;skip
!byte $01 ;data8
!byte ch7F3F1F0F07030100
!byte chFEFCF8F0E0C08000
!byte $e1,12

;,; *_004
;,; <- deps_wewanttotell
; method 0 ( bytes ) -- 290 bytes (409 cumu)
; method 1 ( ibpc0 bytes ) -- 283 bytes (402 cumu)
; method 2 ( bytes ) -- 290 bytes (409 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 280 bytes (399 cumu)
; method 4 ( clrscr bytes ) -- 230 bytes (349 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 231 bytes (350 cumu)
; method 6 ( clrscr bytes ) -- 230 bytes (349 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 234 bytes (353 cumu)
; METHOD 4 CHOSEN
!byte $e4,1,ch0000000000000000 ; clrscr
;,; <- ch0000000000000000 ; 408
;,; <- ch000103070F1F3F7F ; 4
;,; <- ch0080C0E0F0F8FCFE ; 4
;,; <- chFFFFFFFFFFFFFFFF ; 56
;,; <- chF0F0F0F0F0F0F0F0 ; 12
;,; <- ch0F0F0F0F0F0F0F0F ; 12
;,; <- ch7F3F1F0F07030100 ; 4
;,; <- chFEFCF8F0E0C08000 ; 4
; total unique chars in pic: 8 (worst case req 64 bytes)
!byte $DA,$00 ;addr
!byte $e2,1;mode4
!byte $02 ;data4
!byte $77
!byte $77
!byte $F7
!byte $DA,$05 ;addr
!byte $4B,$0F ;fill
!byte $47,$07 ;fill
!byte $93 ;skip
!byte $01 ;data4
!byte $77
!byte $77
!byte $93 ;skip
!byte $01 ;data4
!byte $77
!byte $77
!byte $93 ;skip
!byte $01 ;data4
!byte $77
!byte $77
!byte $93 ;skip
!byte $01 ;data4
!byte $77
!byte $77
!byte $93 ;skip
!byte $01 ;data4
!byte $77
!byte $77
!byte $93 ;skip
!byte $01 ;data4
!byte $77
!byte $77
!byte $93 ;skip
!byte $01 ;data4
!byte $77
!byte $77
!byte $93 ;skip
!byte $01 ;data4
!byte $77
!byte $77
!byte $93 ;skip
!byte $01 ;data4
!byte $77
!byte $77
!byte $93 ;skip
!byte $01 ;data4
!byte $77
!byte $77
!byte $93 ;skip
!byte $01 ;data4
!byte $77
!byte $77
!byte $93 ;skip
!byte $01 ;data4
!byte $77
!byte $77
!byte $93 ;skip
!byte $01 ;data4
!byte $77
!byte $77
!byte $93 ;skip
!byte $01 ;data4
!byte $77
!byte $77
!byte $93 ;skip
!byte $01 ;data4
!byte $77
!byte $77
!byte $93 ;skip
!byte $01 ;data4
!byte $77
!byte $77
!byte $93 ;skip
!byte $50,$07 ;fill
!byte $00 ;data4
!byte $7F
!byte $DB,$C2 ;addr
!byte $46,$07 ;fill
!byte $4E,$0F ;fill
!byte $46,$07 ;fill
!byte $4E,$0F ;fill
!byte $02 ;data4
!byte $77
!byte $77
!byte $77
!byte $CE,$4D ;addr
!byte $e2,0;mode8
!byte $01 ;data8
!byte ch000103070F1F3F7F
!byte ch0080C0E0F0F8FCFE
!byte $8B ;skip
!byte $01 ;data8
!byte ch000103070F1F3F7F
!byte ch0080C0E0F0F8FCFE
!byte $86 ;skip
!byte $03 ;data8
!byte ch000103070F1F3F7F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte $89 ;skip
!byte $03 ;data8
!byte ch000103070F1F3F7F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte $85 ;skip
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $89 ;skip
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $85 ;skip
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $89 ;skip
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $85 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chF0F0F0F0F0F0F0F0
!byte ch0F0F0F0F0F0F0F0F
!byte chFFFFFFFFFFFFFFFF
!byte $89 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chF0F0F0F0F0F0F0F0
!byte ch0F0F0F0F0F0F0F0F
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chF0F0F0F0F0F0F0F0
!byte ch0F0F0F0F0F0F0F0F
!byte chFFFFFFFFFFFFFFFF
!byte $89 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chF0F0F0F0F0F0F0F0
!byte ch0F0F0F0F0F0F0F0F
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chF0F0F0F0F0F0F0F0
!byte ch0F0F0F0F0F0F0F0F
!byte chFFFFFFFFFFFFFFFF
!byte $89 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chF0F0F0F0F0F0F0F0
!byte ch0F0F0F0F0F0F0F0F
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chF0F0F0F0F0F0F0F0
!byte ch0F0F0F0F0F0F0F0F
!byte chFFFFFFFFFFFFFFFF
!byte $89 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chF0F0F0F0F0F0F0F0
!byte ch0F0F0F0F0F0F0F0F
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chF0F0F0F0F0F0F0F0
!byte ch0F0F0F0F0F0F0F0F
!byte chFFFFFFFFFFFFFFFF
!byte $89 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chF0F0F0F0F0F0F0F0
!byte ch0F0F0F0F0F0F0F0F
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chF0F0F0F0F0F0F0F0
!byte ch0F0F0F0F0F0F0F0F
!byte chFFFFFFFFFFFFFFFF
!byte $89 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chF0F0F0F0F0F0F0F0
!byte ch0F0F0F0F0F0F0F0F
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $89 ;skip
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $85 ;skip
!byte $03 ;data8
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte $89 ;skip
!byte $03 ;data8
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte $86 ;skip
!byte $01 ;data8
!byte ch7F3F1F0F07030100
!byte chFEFCF8F0E0C08000
!byte $8B ;skip
!byte $01 ;data8
!byte ch7F3F1F0F07030100
!byte chFEFCF8F0E0C08000
!byte $e1,12



;,; *_005
;,; <- deps_wewanttotell
; method 0 ( bytes ) -- 288 bytes (637 cumu)
; method 1 ( ibpc0 bytes ) -- 298 bytes (647 cumu)
; method 2 ( bytes ) -- 288 bytes (637 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 254 bytes (603 cumu)
; method 4 ( clrscr bytes ) -- 248 bytes (597 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 260 bytes (609 cumu)
; method 6 ( clrscr bytes ) -- 248 bytes (597 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 230 bytes (579 cumu)
; METHOD 7 CHOSEN
!byte $e4,1,ch0000000000000000 ; clrscr
;,; <- ch0000000000000000 ; 390
;,; <- ch000103070F1F3F7F ; 4
;,; <- ch0080C0E0F0F8FCFE ; 4
;,; <- chFFFFFFFFFFFFFFFF ; 72
;,; <- chFFFFFFFFFFFF0000 ; 2
;,; <- chFCFCFCFCFCFCFCFC ; 9
;,; <- ch3F3F3F3F3F3F3F3F ; 9
;,; <- ch00101000D6001010 ; 2
;,; <- ch000000000000FFFF ; 2
;,; <- ch7F3F1F0F07030100 ; 4
;,; <- ch0000FFFFFFFFFFFF ; 2
;,; <- chFEFCF8F0E0C08000 ; 4
; total unique chars in pic: 12 (worst case req 96 bytes)
!byte $DA,$00 ;addr
!byte $e2,1;mode4
!byte $01 ;data4
!byte $FF
!byte $FF
!byte $8D ;skip
!byte $48,$07 ;fill
!byte $8D ;skip
!byte $48,$07 ;fill
!byte $8D ;skip
!byte $48,$07 ;fill
!byte $8D ;skip
!byte $48,$07 ;fill
!byte $8D ;skip
!byte $48,$07 ;fill
!byte $8D ;skip
!byte $48,$07 ;fill
!byte $8D ;skip
!byte $48,$07 ;fill
!byte $8D ;skip
!byte $48,$07 ;fill
!byte $8D ;skip
!byte $48,$07 ;fill
!byte $86 ;skip
!byte $03 ;data4
!byte $17
!byte $11
!byte $11
!byte $71
!byte $DA,$EA ;addr
!byte $48,$07 ;fill
!byte $8D ;skip
!byte $48,$07 ;fill
!byte $06 ;data4
!byte $11
!byte $11
!byte $11
!byte $44
!byte $11
!byte $11
!byte $11
!byte $48,$07 ;fill
!byte $8D ;skip
!byte $48,$07 ;fill
!byte $03 ;data4
!byte $11
!byte $11
!byte $11
!byte $13
!byte $85 ;skip
!byte $48,$07 ;fill
!byte $8D ;skip
!byte $48,$07 ;fill
!byte $8D ;skip
!byte $48,$07 ;fill
!byte $8D ;skip
!byte $48,$07 ;fill
!byte $8D ;skip
!byte $48,$07 ;fill
!byte $8D ;skip
!byte $48,$07 ;fill
!byte $8D ;skip
!byte $48,$07 ;fill
!byte $8D ;skip
!byte $02 ;data4
!byte $77
!byte $77
!byte $77
!byte $CE,$22 ;addr
!byte $e2,$ff;mode1
!byte $36 ;data1
!byte $3F
!byte $FF
!byte $FE
!byte $1F
!byte $FF
!byte $FC
!byte $0F
!byte $FF
!byte $F8
!byte $07
!byte $FF
!byte $F8
!byte $07
!byte $FF
!byte $F8
!byte $07
!byte $FF
!byte $F8
!byte $C7
!byte $FF
!byte $F8
!byte $C7
!byte $FF
!byte $F8
!byte $87
!byte $FF
!byte $F8
!byte $C7
!byte $FF
!byte $F8
!byte $07
!byte $FF
!byte $F8
!byte $C7
!byte $FF
!byte $F8
!byte $47
!byte $FF
!byte $F8
!byte $C7
!byte $FF
!byte $F8
!byte $C7
!byte $FF
!byte $F8
!byte $07
!byte $FF
!byte $FC
!byte $0F
!byte $FF
!byte $FE
!byte $1F
!byte $FF
!byte $FF
!byte $3F
!byte $e3 ;run ibpcaa
!byte $CE,$7F ;addr
!byte $46,chFFFFFFFFFFFFFFFF ;fill
!byte $8F ;skip
!byte $e2,0;mode8
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $8F ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $8F ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $8F ;skip
!byte $07 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch00101000D6001010
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $8F ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $8F ;skip
!byte $07 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch000000000000FFFF
!byte ch000000000000FFFF
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $8F ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $8F ;skip
!byte $07 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch00101000D6001010
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $8F ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $8F ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $e1,12



;,; *_006
;,; <- deps_wewanttotell
; method 0 ( bytes ) -- 305 bytes (884 cumu)
; method 1 ( ibpc0 bytes ) -- 271 bytes (850 cumu)
; method 2 ( bytes ) -- 305 bytes (884 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 294 bytes (873 cumu)
; method 4 ( clrscr bytes ) -- 201 bytes (780 cumu)
; method 5 ( clrscr ibpc0 bytes ) -- 193 bytes (772 cumu)
; method 6 ( clrscr bytes ) -- 201 bytes (780 cumu)
; method 7 ( clrscr ibpc0 ibpcaa bytes ) -- 220 bytes (799 cumu)
; METHOD 5 CHOSEN
!byte $e4,1,chFFFFFFFFFFFFFFFF ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 312
;,; <- ch0000000000000000 ; 176
;,; <- ch3C3C3C3C3C3C3C3C ; 3
;,; <- ch3C3C3C3C18180000 ; 3
;,; <- ch00000F3F3F0F0000 ; 2
;,; <- ch0000F0FCFCF00000 ; 2
;,; <- ch000018183C3C3C3C ; 2
;,; <- ch5555555555555555 ; 2
;,; <- ch00101000D6001010 ; 2
; total unique chars in pic: 9 (worst case req 72 bytes)
!byte $DA,$06 ;addr
!byte $e2,1;mode4
!byte $05 ;data4
!byte $77
!byte $77
!byte $11
!byte $77
!byte $77
!byte $77
!byte $8B ;skip
!byte $05 ;data4
!byte $77
!byte $17
!byte $11
!byte $71
!byte $77
!byte $77
!byte $8B ;skip
!byte $02 ;data4
!byte $77
!byte $77
!byte $71
!byte $DA,$3B ;addr
!byte $45,$07 ;fill
!byte $8B ;skip
!byte $05 ;data4
!byte $77
!byte $77
!byte $77
!byte $71
!byte $71
!byte $77
!byte $8B ;skip
!byte $05 ;data4
!byte $77
!byte $77
!byte $77
!byte $71
!byte $91
!byte $77
!byte $8B ;skip
!byte $05 ;data4
!byte $77
!byte $77
!byte $77
!byte $71
!byte $91
!byte $77
!byte $A3 ;skip
!byte $4A,$02 ;fill
!byte $8B ;skip
!byte $4A,$02 ;fill
!byte $8B ;skip
!byte $4A,$04 ;fill
!byte $8B ;skip
!byte $4A,$04 ;fill
!byte $8B ;skip
!byte $4A,$04 ;fill
!byte $8B ;skip
!byte $4A,$04 ;fill
!byte $8B ;skip
!byte $4A,$04 ;fill
!byte $8B ;skip
!byte $4A,$05 ;fill
!byte $8B ;skip
!byte $4A,$05 ;fill
!byte $8B ;skip
!byte $4A,$05 ;fill
!byte $8B ;skip
!byte $4A,$03 ;fill
!byte $8B ;skip
!byte $4A,$03 ;fill
!byte $8B ;skip
!byte $4A,$03 ;fill
!byte $8B ;skip
!byte $4A,$03 ;fill
!byte $CE,$06 ;addr
!byte $e2,$ff;mode1
!byte $19 ;data1
!byte $FE
!byte $F0
!byte $00
!byte $FE
!byte $F0
!byte $00
!byte $F9
!byte $30
!byte $00
!byte $FE
!byte $F0
!byte $00
!byte $FE
!byte $B0
!byte $00
!byte $FE
!byte $B0
!byte $00
!byte $FF
!byte $F0
!byte $00
!byte $DF
!byte $F0
!byte $00
!byte $FF
!byte $F0
!byte $CF,$56 ;addr
!byte $13 ;data1
!byte $FF
!byte $F0
!byte $00
!byte $FF
!byte $B0
!byte $00
!byte $FF
!byte $F0
!byte $00
!byte $EF
!byte $F0
!byte $00
!byte $EF
!byte $F0
!byte $00
!byte $EF
!byte $F0
!byte $00
!byte $FF
!byte $F0
!byte $CE,$0D ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch3C3C3C3C3C3C3C3C
!byte $96 ;skip
!byte $00 ;data8
!byte ch3C3C3C3C18180000
!byte $94 ;skip
!byte $04 ;data8
!byte ch00000F3F3F0F0000
!byte ch0000F0FCFCF00000
!byte ch0000000000000000
!byte ch00000F3F3F0F0000
!byte ch0000F0FCFCF00000
!byte $94 ;skip
!byte $00 ;data8
!byte ch000018183C3C3C3C
!byte $96 ;skip
!byte $02 ;data8
!byte ch3C3C3C3C3C3C3C3C
!byte ch0000000000000000
!byte ch5555555555555555
!byte $94 ;skip
!byte $02 ;data8
!byte ch3C3C3C3C18180000
!byte ch0000000000000000
!byte ch5555555555555555
!byte $A7 ;skip
!byte $00 ;data8
!byte ch00101000D6001010
!byte $CF,$77 ;addr
!byte $00 ;data8
!byte ch00101000D6001010
!byte $A8 ;skip
!byte $00 ;data8
!byte ch000018183C3C3C3C
!byte $96 ;skip
!byte $00 ;data8
!byte ch3C3C3C3C3C3C3C3C
!byte $96 ;skip
!byte $00 ;data8
!byte ch3C3C3C3C18180000
!byte $e1,12
