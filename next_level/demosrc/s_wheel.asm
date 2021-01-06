;,; lyrics_wetrytosave .withinpagefrom=lyrics
;,; <- lyrics

        !byte $26,$01			; WE
	!byte $19,$1d,$20,$2a,$21	; TRY
	!byte $19,$1d,$26		; TO
	!byte $24,$23,$21,$26		; SAVE
	!byte $19,$1b,$61		; PEO
	!byte $19,$1b,$20,$47		; PLE
	!byte $24,$26,$30,$78		; FROM
	!byte $b1			; (M)I
	!byte $34,$a3			; SE
	!byte $30,$f1			; RY
        !byte $0f

;,; SC50_000 .dur=8
;,; <- ibpcaablocks
;,; <- streamvars
;,; <- lyrics
;,; <- player_ivars
;,; <- lyrics_wetrytosave
!src "demosrc/smac.inc"

+s8bpc
+sAddr chptr+2
!byte $02
!byte shap_misery-songdata
!byte melo_misery-songdata;muteseq-songdata
!byte voic_misery-songdata;muteseq-songdata
+sAddr nextlyrictosing
!byte $00,lyrics_wetrytosave-lyrics

!byte $e4,7,chFFFFFFFFFFFFFFFF ; clrscr

;,; <- ch0000000000000000 ; 125
;,; <- chFFFFFFFFFFFFFFFF ; 190
;,; <- chE7FFE7FFE7FFE7FF ; 15
;,; <- chC6C6C6C6C6C6C6C6 ; 3
;,; <- chFCFCE0C0C0C0C0C0 ; 11
;,; <- chFCFC303030303030 ; 3
;,; <- chFCFCDCCCCCCCCCCC ; 10
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- chCCCCCCCCCCCCCCCC ; 1
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- ch3030303030303030 ; 4
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- chCCCCCCCC78783030 ; 1
;,; <- ch3F1F0F0707030100 ; 2
;,; <- chC0C0C0C0C0C0C0C0 ; 3
;,; <- ch00000103070F1F7F ; 1
;,; <- chFEFEFEFEFEFEFEFE ; 6
;,; <- ch7F7F7F7F7F7F7F7F ; 5
;,; <- ch000080C0E0F0F8FE ; 4
;,; <- chFFD7811783D103D7 ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 1
;,; <- ch0000000101030307 ; 1
;,; <- ch0000008080C0C0E0 ; 2
;,; <- chFF7F3F3F1F0F0F07 ; 1
;,; <- ch1F3F3F3F3F7F7F7F ; 2
;,; <- ch7F3F1F0F07030100 ; 7
;,; <- chF8FCFCFCFCFEFEFE ; 4
;,; <- ch0F07030301000000 ; 2
;,; <- ch0000000018180000 ; 1
;,; <- ch7F7F7F7F7F3F3F3F ; 3
;,; <- chE0E0E0E0E0E0E0E0 ; 4
;,; <- ch070F0F0F1F1F3F3F ; 1
;,; <- ch0303031F3F3F7F03 ; 1
;,; <- chE0F0F0F0F8F8FCFC ; 1
;,; <- ch0707070707070707 ; 4
;,; <- chFFFFFFFFFFFF0000 ; 11
;,; <- chF8F8F8F8F8F8F8F8 ; 1
;,; <- ch03037F7F7F7F7F7F ; 1
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- chFCF8F0E0E0C08000 ; 1
;,; <- ch0303030303030303 ; 2
;,; <- ch0000FFFFFFFFFFFF ; 10
;,; <- chFCFCFCFCFCFCFCFC ; 6
;,; <- ch0000207070707020 ; 1
;,; <- ch0080C0E0F0F8FCFE ; 3
;,; <- ch3F3F3F3F3F3F3F3F ; 5
;,; <- ch3F3F1F1F0F0F0F07 ; 1
;,; <- chFCFCF8F8F0F0F0E0 ; 1
;,; <- ch000103070F1F3F7F ; 1
;,; <- ch000F1F3F7F7F3F0F ; 1
;,; <- chFEFEDED6D6D6D6D6 ; 2
;,; <- ch5555555555555555 ; 4
;,; <- ch0F0F0F0F0F0F0F0F ; 1
;,; <- chF0E0C0C080000000 ; 1
;,; <- ch3F1F0F0703010000 ; 1
;,; <- ch0F03000000000000 ; 1
;,; <- chFFFFFF3F07000000 ; 1
;,; <- chFFFFFFFCE0000000 ; 1
;,; <- chF800000000000000 ; 1
;,; <- ch80C0F0FCFFFFFFFF ; 1
;,; <- ch0000000000073FFF ; 1
;,; <- ch00030F3FFFFFFFFF ; 1
;,; <- ch303030303030FCFC ; 1
; total unique chars in pic: 65 (worst case req 520 bytes)
!byte $DA,$18 ;addr
!byte $e2,1;mode4
!byte $01 ;data4
!byte $11
!byte $01
!byte $4A,$01 ;fill
!byte $05 ;data4
!byte $22
!byte $72
!byte $22
!byte $72
!byte $11
!byte $01
!byte $4A,$01 ;fill
!byte $03 ;data4
!byte $22
!byte $72
!byte $22
!byte $72
!byte $97 ;skip
!byte $46,$01 ;fill
!byte $07 ;data4
!byte $70
!byte $22
!byte $72
!byte $22
!byte $72
!byte $22
!byte $72
!byte $22
!byte $46,$01 ;fill
!byte $07 ;data4
!byte $72
!byte $22
!byte $72
!byte $22
!byte $72
!byte $22
!byte $72
!byte $22
!byte $97 ;skip
!byte $01 ;data4
!byte $22
!byte $72
!byte $45,$02 ;fill
!byte $11 ;data4
!byte $27
!byte $21
!byte $27
!byte $22
!byte $27
!byte $22
!byte $27
!byte $22
!byte $27
!byte $22
!byte $27
!byte $22
!byte $27
!byte $22
!byte $27
!byte $22
!byte $27
!byte $22
!byte $98 ;skip
!byte $1A ;data4
!byte $72
!byte $22
!byte $72
!byte $22
!byte $72
!byte $22
!byte $72
!byte $22
!byte $72
!byte $22
!byte $72
!byte $22
!byte $72
!byte $77
!byte $77
!byte $22
!byte $72
!byte $22
!byte $62
!byte $22
!byte $72
!byte $22
!byte $72
!byte $22
!byte $77
!byte $77
!byte $71
!byte $85 ;skip
!byte $00 ;data4
!byte $FF
!byte $89 ;skip
!byte $50,$04 ;fill
!byte $03 ;data4
!byte $33
!byte $44
!byte $44
!byte $34
!byte $DB,$51 ;addr
!byte $46,$03 ;fill
!byte $03 ;data4
!byte $34
!byte $33
!byte $33
!byte $34
!byte $DB,$60 ;addr
!byte $59,$03 ;fill
!byte $02 ;data4
!byte $11
!byte $11
!byte $39
!byte $DB,$80 ;addr
!byte $51,$03 ;fill
!byte $02 ;data4
!byte $11
!byte $11
!byte $39
!byte $DB,$98 ;addr
!byte $66,$03 ;fill
!byte $03 ;data4
!byte $10
!byte $11
!byte $11
!byte $91
!byte $4E,$03 ;fill
!byte $03 ;data4
!byte $10
!byte $11
!byte $11
!byte $91
!byte $56,$03 ;fill
; method 0 ( bytes ) -- 548 cumulative
; method 1 ( ibpc0 bytes ) -- 571 cumulative
; method 2 ( ibpc1 bytes ) -- 571 cumulative
; method 3 ( ibpc2 bytes ) -- 571 cumulative
; method 4 ( ibpc3 bytes ) -- 571 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 562 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 562 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 562 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 562 cumulative
; METHOD 0 WAS THE BEST
!byte $CE,$00 ;addr
!byte $4E,ch0000000000000000 ;fill
!byte $e2,0;mode8
!byte $37 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chE7FFE7FFE7FFE7FF
!byte chFFFFFFFFFFFFFFFF
!byte chE7FFE7FFE7FFE7FF
!byte chE7FFE7FFE7FFE7FF
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chE7FFE7FFE7FFE7FF
!byte chFFFFFFFFFFFFFFFF
!byte chE7FFE7FFE7FFE7FF
!byte chE7FFE7FFE7FFE7FF
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte chD6D6D6D6D6F6FEFE
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000000000
!byte ch3030303030303030
!byte chF0F8CCCCCCCCCCCC
!byte ch3030303030303030
!byte ch0000000000000000
!byte ch3030303030303030
!byte chCCCCCCCCCCECFCFC
!byte ch0000000000000000
!byte chFCFC1C0C0C1CFCFC
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCC78783030
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chE7FFE7FFE7FFE7FF
!byte chFFFFFFFFFFFFFFFF
!byte chE7FFE7FFE7FFE7FF
!byte chE7FFE7FFE7FFE7FF
!byte chFFFFFFFFFFFFFFFF
!byte $4E,ch0000000000000000 ;fill
!byte $37 ;data8
!byte ch3F1F0F0707030100
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chE7FFE7FFE7FFE7FF
!byte chFFFFFFFFFFFFFFFF
!byte chE7FFE7FFE7FFE7FF
!byte chE7FFE7FFE7FFE7FF
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chC0C0C0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch00000103070F1F7F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFEFEFEFEFEFEFE
!byte ch7F7F7F7F7F7F7F7F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch000080C0E0F0F8FE
!byte ch3F1F0F0707030100
!byte chFFFFFFFFFFFFFFFF
!byte chFFD7811783D103D7
!byte chFFFFFFFFFFFFFFFF
!byte chE7FFE7FFE7FFE7FF
!byte chFFD7811783D103D7
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0E0FCFC
!byte chCCCCCCCCCCECFCFC
!byte chFCFCE0C0C0C0C0C0
!byte chC0C0C0C0C0E0FCFC
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000000000
!byte ch0000000101030307
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFEFEFEFEFEFEFE
!byte ch7F7F7F7F7F7F7F7F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0000008080C0C0E0
!byte chFF7F3F3F1F0F0F07
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chE7FFE7FFE7FFE7FF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $46,ch0000000000000000 ;fill
!byte $0D ;data8
!byte ch1F3F3F3F3F7F7F7F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chF8FCFCFCFCFEFEFE
!byte ch0F07030301000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chE7FFE7FFE7FFE7FF
!byte $87 ;skip
!byte $01 ;data8
!byte chFEFEFEFEFEFEFEFE
!byte ch0000000000000000
!byte $83 ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte ch0000000018180000
!byte $83 ;skip
!byte $03 ;data8
!byte ch0000000000000000
!byte ch7F7F7F7F7F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte chFFD7811783D103D7
!byte $87 ;skip
!byte $01 ;data8
!byte chE0E0E0E0E0E0E0E0
!byte ch070F0F0F1F1F3F3F
!byte $83 ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte ch0303031F3F3F7F03
!byte $83 ;skip
!byte $01 ;data8
!byte chE0F0F0F0F8F8FCFC
!byte ch0707070707070707
!byte $86 ;skip
!byte $04 ;data8
!byte chFFFFFFFFFFFF0000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chE0E0E0E0E0E0E0E0
!byte ch1F3F3F3F3F7F7F7F
!byte $83 ;skip
!byte $01 ;data8
!byte chF8F8F8F8F8F8F8F8
!byte ch03037F7F7F7F7F7F
!byte $83 ;skip
!byte $01 ;data8
!byte chF8FCFCFCFCFEFEFE
!byte ch0707070707070707
!byte $85 ;skip
!byte $04 ;data8
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFFFFFF
!byte chC0C0C0C0C0C0C0C0
!byte $43,chFFFFFFFFFFFF0000 ;fill
!byte $01 ;data8
!byte chFCF8F0E0E0C08000
!byte ch7F3F1F0F07030100
!byte $43,chFFFFFFFFFFFF0000 ;fill
!byte $00 ;data8
!byte ch0303030303030303
!byte $84 ;skip
!byte $05 ;data8
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chC0C0C0C0C0C0C0C0
!byte $43,ch0000FFFFFFFFFFFF ;fill
!byte $01 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte $43,ch0000FFFFFFFFFFFF ;fill
!byte $00 ;data8
!byte ch0303030303030303
!byte $83 ;skip
!byte $07 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000207070707020
!byte chFFFFFFFFFFFFFFFF
!byte chE0E0E0E0E0E0E0E0
!byte ch7F7F7F7F7F3F3F3F
!byte $83 ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte $83 ;skip
!byte $01 ;data8
!byte chFEFEFEFEFEFEFEFE
!byte ch0707070707070707
!byte $84 ;skip
!byte $12 ;data8
!byte ch0080C0E0F0F8FCFE
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte chE0E0E0E0E0E0E0E0
!byte ch3F3F1F1F0F0F0F07
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCF8F8F0F0F0E0
!byte ch0707070707070707
!byte $84 ;skip
!byte $10 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte chF8FCFCFCFCFEFEFE
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch000103070F1F3F7F
!byte ch0080C0E0F0F8FCFE
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $44,ch0000000000000000 ;fill
!byte $3F ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch000F1F3F7F7F3F0F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0000008080C0C0E0
!byte ch7F7F7F7F7F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte chFEFEFEFEFEFEFEFE
!byte ch7F7F7F7F7F7F7F7F
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFEFEDED6D6D6D6D6
!byte ch5555555555555555
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0080C0E0F0F8FCFE
!byte ch0000000000000000
!byte ch0F0F0F0F0F0F0F0F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chF8FCFCFCFCFEFEFE
!byte ch0F07030301000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte ch7F7F7F7F7F7F7F7F
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chF0E0C0C080000000
!byte ch0000000000000000
!byte chFCFCE0C0C0C0C0C0
!byte chF0F8CCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte chC6C6C6C6C6C6C6C6
!byte ch5555555555555555
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch000080C0E0F0F8FE
!byte ch3F1F0F0703010000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFEFEFEFEFEFEFE
!byte ch7F7F7F7F7F7F7F7F
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte $46,ch0000000000000000 ;fill
!byte $04 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte $83 ;skip
!byte $14 ;data8
!byte ch000080C0E0F0F8FE
!byte ch0F03000000000000
!byte chFFFFFF3F07000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFCE0000000
!byte chF800000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFEFEDED6D6D6D6D6
!byte chFCFC303030303030
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte ch5555555555555555
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $83 ;skip
!byte $13 ;data8
!byte ch80C0F0FCFFFFFFFF
!byte ch000080C0E0F0F8FE
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000073FFF
!byte ch00030F3FFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chC6C6C6C6C6C6C6C6
!byte ch303030303030FCFC
!byte chFCFC1C0C0C1CFCFC
!byte chFCFCE0C0C0E0FCFC
!byte chF0F8CCCCCCCCCCCC
!byte ch3030303030303030
!byte ch5555555555555555
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F3F3F3F3F3F3F
!byte $89 ;skip
!byte $47,ch0000000000000000 ;fill


!byte $e1,12

;,; *_001 .dur=192 .waits=24
;,; <- ibpcaablocks
;,; <- streamvars
;,; <- lyrics
;,; <- player_ivars
;,; <- lyrics_wetrytosave
!src "demosrc/smac.inc"


!byte 0xD0,loopctr,0,6	; set loopctr

streamdata_wheel_loop:
;,; <- ch0000000000000000 ; 129
;,; <- chFFFFFFFFFFFFFFFF ; 202
;,; <- chE7FFE7FFE7FFE7FF ; 15
;,; <- chC6C6C6C6C6C6C6C6 ; 3
;,; <- chFCFCE0C0C0C0C0C0 ; 11
;,; <- chFCFC303030303030 ; 3
;,; <- chFCFCDCCCCCCCCCCC ; 10
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- chCCCCCCCCCCCCCCCC ; 1
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- ch3030303030303030 ; 4
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- chCCCCCCCC78783030 ; 1
;,; <- ch3F1F0F0707030100 ; 2
;,; <- chC0C0C0C0C0C0C0C0 ; 3
;,; <- ch00000103070F1F7F ; 1
;,; <- ch000080C0E0F0F8FE ; 4
;,; <- chFFD7811783D103D7 ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 1
;,; <- ch0000000101030307 ; 1
;,; <- chFCFCF8F8F1F1E3E3 ; 4
;,; <- ch0000008080C0C0E0 ; 2
;,; <- chFF7F3F3F1F0F0F07 ; 1
;,; <- ch1F3F3F3F3F7F7F7F ; 2
;,; <- ch7F3F1F0F07030100 ; 6
;,; <- chC7C78F8F1F1F3F3F ; 4
;,; <- chF8FCFCFCFCFEFEFE ; 4
;,; <- ch0F07030301000000 ; 2
;,; <- chFEFEFEFEFEFEFEFE ; 2
;,; <- ch0000000018180000 ; 1
;,; <- ch7F7F7F7F7F3F3F3F ; 3
;,; <- chE0E0E0E0E0E0E0E0 ; 4
;,; <- ch070F0F0F1F1F3F3F ; 1
;,; <- chFFFF3F0F03C0F0FC ; 2
;,; <- chFFFFFFFFFFFF3F0F ; 2
;,; <- ch0303031F3F3F7F03 ; 1
;,; <- chE0F0F0F0F8F8FCFC ; 1
;,; <- ch0707070707070707 ; 4
;,; <- chFFFFFFFFFFFF0000 ; 1
;,; <- ch80C0F0FCFFFFFFFF ; 2
;,; <- chF8F8F8F8F8F8F8F8 ; 1
;,; <- ch03037F7F7F7F7F7F ; 1
;,; <- chFEFCF8F0E0C08000 ; 3
;,; <- ch03C0F0FCFFFFFFFF ; 1
;,; <- chFCF8F0E0E0C08000 ; 1
;,; <- ch0303030303030303 ; 2
;,; <- chFFFFFFFF3F0F0300 ; 2
;,; <- chFCFCFCFCFCFCFCFC ; 6
;,; <- ch0000207070707020 ; 1
;,; <- chF0FCFFFFFFFFFFFF ; 2
;,; <- ch3F0F03C0F0FCFFFF ; 2
;,; <- ch0080C0E0F0F8FCFE ; 2
;,; <- ch3F3F3F3F3F3F3F3F ; 5
;,; <- ch3F3F1F1F0F0F0F07 ; 1
;,; <- chFCFCF8F8F0F0F0E0 ; 1
;,; <- ch000F1F3F7F7F3F0F ; 1
;,; <- chF0F0F0F0F0F0F0F0 ; 1
;,; <- chFEFEDED6D6D6D6D6 ; 2
;,; <- ch0F0F0F0F0F0F0F0F ; 1
;,; <- chF0E0C0C080000000 ; 1
;,; <- ch3F1F0F0703010000 ; 1
;,; <- ch0F03000000000000 ; 1
;,; <- chFFFFFF3F07000000 ; 1
;,; <- chFFFFFFFCE0000000 ; 1
;,; <- chF800000000000000 ; 1
;,; <- ch0000000000073FFF ; 1
;,; <- ch00030F3FFFFFFFFF ; 1
;,; <- ch303030303030FCFC ; 1
; total unique chars in pic: 70 (worst case req 560 bytes)
; method 0 ( bytes ) -- 652 cumulative
; method 1 ( ibpc0 bytes ) -- 665 cumulative
; method 2 ( ibpc1 bytes ) -- 684 cumulative
; method 3 ( ibpc2 bytes ) -- 665 cumulative
; method 4 ( ibpc3 bytes ) -- 684 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 851 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 861 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 851 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 861 cumulative
; METHOD 0 WAS THE BEST
!byte $CE,$6C ;addr
!byte $40,chFFFFFFFFFFFFFFFF ;fill
!byte $95 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCF8F8F1F1E3E3
!byte $96 ;skip
!byte $00 ;data8
!byte chC7C78F8F1F1F3F3F
!byte $95 ;skip
!byte $00 ;data8
!byte chFCFCF8F8F1F1E3E3
!byte $90 ;skip
!byte $01 ;data8
!byte chFFFF3F0F03C0F0FC
!byte chFFFFFFFFFFFF3F0F
!byte $83 ;skip
!byte $00 ;data8
!byte chC7C78F8F1F1F3F3F
!byte $91 ;skip
!byte $02 ;data8
!byte ch80C0F0FCFFFFFFFF
!byte chFFFF3F0F03C0F0FC
!byte chFFFFFFFFFFFF3F0F
!byte $92 ;skip
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $02 ;data8
!byte ch03C0F0FCFFFFFFFF
!byte chFCF8F0E0E0C08000
!byte ch7F3F1F0F07030100
!byte $43,chFFFFFFFFFFFFFFFF ;fill
!byte $8B ;skip
!byte $43,chFFFFFFFFFFFFFFFF ;fill
!byte $02 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFFFFFFFF3F0F0300
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $92 ;skip
!byte $02 ;data8
!byte chF0FCFFFFFFFFFFFF
!byte ch3F0F03C0F0FCFFFF
!byte chFFFFFFFF3F0F0300
!byte $91 ;skip
!byte $06 ;data8
!byte chFCFCF8F8F1F1E3E3
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chF0FCFFFFFFFFFFFF
!byte ch3F0F03C0F0FCFFFF
!byte $90 ;skip
!byte $03 ;data8
!byte chC7C78F8F1F1F3F3F
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte $92 ;skip
!byte $04 ;data8
!byte chFCFCF8F8F1F1E3E3
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte chF0F0F0F0F0F0F0F0
!byte ch7F3F1F0F07030100
!byte $87 ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $89 ;skip
!byte $04 ;data8
!byte chC7C78F8F1F1F3F3F
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $87 ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $8B ;skip
!byte $03 ;data8
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $97 ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $85 ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $8F ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $85 ;skip
!byte $00 ;data8
!byte ch0000000000000000
; NEW FRAME
!byte $e1,10
;,; <- ch0000000000000000 ; 129
;,; <- chFFFFFFFFFFFFFFFF ; 201
;,; <- chE7FFE7FFE7FFE7FF ; 15
;,; <- chC6C6C6C6C6C6C6C6 ; 3
;,; <- chFCFCE0C0C0C0C0C0 ; 11
;,; <- chFCFC303030303030 ; 3
;,; <- chFCFCDCCCCCCCCCCC ; 10
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- chCCCCCCCCCCCCCCCC ; 1
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- ch3030303030303030 ; 4
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- chCCCCCCCC78783030 ; 1
;,; <- ch3F1F0F0707030100 ; 2
;,; <- chC0C0C0C0C0C0C0C0 ; 3
;,; <- ch00000103070F1F7F ; 1
;,; <- ch000080C0E0F0F8FE ; 4
;,; <- chD7811783D103D7FF ; 2
;,; <- chC0C0C0C0C0E0FCFC ; 1
;,; <- ch0000000101030307 ; 1
;,; <- ch3F3F1F1F8F8FC7C7 ; 3
;,; <- ch0000008080C0C0E0 ; 2
;,; <- chFF7F3F3F1F0F0F07 ; 1
;,; <- ch1F3F3F3F3F7F7F7F ; 2
;,; <- chE3E3F1F1F8F8FCFC ; 3
;,; <- ch7F3F1F0F07030100 ; 7
;,; <- chF8FCFCFCFCFEFEFE ; 4
;,; <- ch0F07030301000000 ; 2
;,; <- chFEFEFEFEFEFEFEFE ; 2
;,; <- ch0000000018180000 ; 1
;,; <- ch7F7F7F7F7F3F3F3F ; 3
;,; <- chFFD7811783D103D7 ; 1
;,; <- chE0E0E0E0E0E0E0E0 ; 4
;,; <- ch070F0F0F1F1F3F3F ; 1
;,; <- ch0303031F3F3F7F03 ; 1
;,; <- chFFFFFFFFFFFFFCF0 ; 2
;,; <- chFFFFFCF0C0030F3F ; 2
;,; <- chE0F0F0F0F8F8FCFC ; 1
;,; <- ch0707070707070707 ; 4
;,; <- chFFFFFFFFFFFF0000 ; 1
;,; <- chF8F8F8F8F8F8F8F8 ; 1
;,; <- ch03037F7F7F7F7F7F ; 1
;,; <- ch00030F3FFFFFFFFF ; 3
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- chFCF8F0E0E0C08000 ; 1
;,; <- ch0303030303030303 ; 2
;,; <- chFFFFFFFFFCF0C000 ; 2
;,; <- chFCFCFCFCFCFCFCFC ; 6
;,; <- ch0000207070707020 ; 1
;,; <- chFCF0C0030F3FFFFF ; 2
;,; <- ch0F3FFFFFFFFFFFFF ; 2
;,; <- ch0080C0E0F0F8FCFE ; 3
;,; <- ch3F3F3F3F3F3F3F3F ; 5
;,; <- ch3F3F1F1F0F0F0F07 ; 1
;,; <- chFCFCF8F8F0F0F0E0 ; 1
;,; <- ch000F1F3F7F7F3F0F ; 1
;,; <- ch000103070F1F3F7F ; 1
;,; <- chFEFEDED6D6D6D6D6 ; 2
;,; <- ch0F0F0F0F0F0F0F0F ; 1
;,; <- chF0E0C0C080000000 ; 1
;,; <- ch3F1F0F0703010000 ; 1
;,; <- ch0F03000000000000 ; 1
;,; <- chFFFFFF3F07000000 ; 1
;,; <- chFFFFFFFCE0000000 ; 1
;,; <- chF800000000000000 ; 1
;,; <- ch80C0F0FCFFFFFFFF ; 1
;,; <- ch0000000000073FFF ; 1
;,; <- ch303030303030FCFC ; 1
; total unique chars in pic: 70 (worst case req 560 bytes)
; method 0 ( bytes ) -- 759 cumulative
; method 1 ( ibpc0 bytes ) -- 772 cumulative
; method 2 ( ibpc1 bytes ) -- 790 cumulative
; method 3 ( ibpc2 bytes ) -- 772 cumulative
; method 4 ( ibpc3 bytes ) -- 790 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 947 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 950 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 947 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 950 cumulative
; METHOD 0 WAS THE BEST
!byte $CE,$73 ;addr
!byte $03 ;data8
!byte chD7811783D103D7FF
!byte chFFFFFFFFFFFFFFFF
!byte chE7FFE7FFE7FFE7FF
!byte chD7811783D103D7FF
!byte $8A ;skip
!byte $00 ;data8
!byte ch3F3F1F1F8F8FC7C7
!byte $83 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $91 ;skip
!byte $00 ;data8
!byte chE3E3F1F1F8F8FCFC
!byte $83 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $92 ;skip
!byte $03 ;data8
!byte ch3F3F1F1F8F8FC7C7
!byte ch0000000000000000
!byte ch0000000018180000
!byte chFFFFFFFFFFFFFFFF
!byte $90 ;skip
!byte $09 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chE3E3F1F1F8F8FCFC
!byte ch0000000000000000
!byte ch0303031F3F3F7F03
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFCF0
!byte chFFFFFCF0C0030F3F
!byte $8E ;skip
!byte $07 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chF8F8F8F8F8F8F8F8
!byte ch03037F7F7F7F7F7F
!byte chFFFFFFFFFFFFFCF0
!byte chFFFFFCF0C0030F3F
!byte ch00030F3FFFFFFFFF
!byte $91 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFCF8F0E0E0C08000
!byte ch7F3F1F0F07030100
!byte ch00030F3FFFFFFFFF
!byte $93 ;skip
!byte $03 ;data8
!byte chFFFFFFFFFCF0C000
!byte ch0000000000000000
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte $91 ;skip
!byte $04 ;data8
!byte chFFFFFFFFFCF0C000
!byte chFCF0C0030F3FFFFF
!byte ch0F3FFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch0000000000000000
!byte $41,chFFFFFFFFFFFFFFFF ;fill
!byte $8E ;skip
!byte $09 ;data8
!byte chFCF0C0030F3FFFFF
!byte ch0F3FFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch3F3F1F1F8F8FC7C7
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $90 ;skip
!byte $03 ;data8
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0080C0E0F0F8FCFE
!byte ch7F3F1F0F07030100
!byte $92 ;skip
!byte $05 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch000103070F1F3F7F
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte $91 ;skip
!byte $05 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chE3E3F1F1F8F8FCFC
!byte $92 ;skip
!byte $02 ;data8
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFFFFFF
; NEW FRAME
!byte $e1,10
;,; <- ch0000000000000000 ; 131
;,; <- chFFFFFFFFFFFFFFFF ; 188
;,; <- chE7FFE7FFE7FFE7FF ; 15
;,; <- chC6C6C6C6C6C6C6C6 ; 3
;,; <- chFCFCE0C0C0C0C0C0 ; 11
;,; <- chFCFC303030303030 ; 3
;,; <- chFCFCDCCCCCCCCCCC ; 10
;,; <- chCCCCCCCCCCECFCFC ; 5
;,; <- chCCCCCCCCCCCCCCCC ; 1
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- ch3030303030303030 ; 4
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- chCCCCCCCC78783030 ; 1
;,; <- ch3F1F0F0707030100 ; 2
;,; <- chC0C0C0C0C0C0C0C0 ; 3
;,; <- ch00000103070F1F7F ; 1
;,; <- chFEFEFEFEFEFEFEFE ; 6
;,; <- ch7F7F7F7F7F7F7F7F ; 5
;,; <- ch000080C0E0F0F8FE ; 4
;,; <- chFFD7811783D103D7 ; 2
;,; <- chC0C0C0C0C0E0FCFC ; 1
;,; <- ch0000000101030307 ; 1
;,; <- ch0000008080C0C0E0 ; 2
;,; <- chFF7F3F3F1F0F0F07 ; 1
;,; <- ch1F3F3F3F3F7F7F7F ; 2
;,; <- ch7F3F1F0F07030100 ; 7
;,; <- chF8FCFCFCFCFEFEFE ; 4
;,; <- ch0F07030301000000 ; 2
;,; <- ch0000000018180000 ; 1
;,; <- ch7F7F7F7F7F3F3F3F ; 3
;,; <- chD7811783D103D7FF ; 1
;,; <- chE0E0E0E0E0E0E0E0 ; 4
;,; <- ch070F0F0F1F1F3F3F ; 1
;,; <- ch0303031F3F3F7F03 ; 1
;,; <- chE0F0F0F0F8F8FCFC ; 1
;,; <- ch0707070707070707 ; 4
;,; <- chFFFFFFFFFFFF0000 ; 11
;,; <- chF8F8F8F8F8F8F8F8 ; 1
;,; <- ch03037F7F7F7F7F7F ; 1
;,; <- chFEFCF8F0E0C08000 ; 4
;,; <- chFCF8F0E0E0C08000 ; 1
;,; <- ch0303030303030303 ; 2
;,; <- ch0000FFFFFFFFFFFF ; 10
;,; <- chFCFCFCFCFCFCFCFC ; 6
;,; <- ch0000207070707020 ; 1
;,; <- ch0080C0E0F0F8FCFE ; 3
;,; <- ch3F3F3F3F3F3F3F3F ; 5
;,; <- ch3F3F1F1F0F0F0F07 ; 1
;,; <- chFCFCF8F8F0F0F0E0 ; 1
;,; <- ch000103070F1F3F7F ; 1
;,; <- ch000F1F3F7F7F3F0F ; 1
;,; <- chFEFEDED6D6D6D6D6 ; 2
;,; <- ch0F0F0F0F0F0F0F0F ; 1
;,; <- chF0E0C0C080000000 ; 1
;,; <- ch3F1F0F0703010000 ; 1
;,; <- ch0F03000000000000 ; 1
;,; <- chFFFFFF3F07000000 ; 1
;,; <- chFFFFFFFCE0000000 ; 1
;,; <- chF800000000000000 ; 1
;,; <- ch80C0F0FCFFFFFFFF ; 1
;,; <- ch0000000000073FFF ; 1
;,; <- ch00030F3FFFFFFFFF ; 1
;,; <- ch303030303030FCFC ; 1
; total unique chars in pic: 65 (worst case req 520 bytes)
; method 0 ( bytes ) -- 850 cumulative
; method 1 ( ibpc0 bytes ) -- 860 cumulative
; method 2 ( ibpc1 bytes ) -- 871 cumulative
; method 3 ( ibpc2 bytes ) -- 861 cumulative
; method 4 ( ibpc3 bytes ) -- 871 cumulative
; method 5 ( ibpc0 ibcpaa bytes ) -- 1046 cumulative
; method 6 ( ibpc1 ibcpaa bytes ) -- 1050 cumulative
; method 7 ( ibpc2 ibcpaa bytes ) -- 1048 cumulative
; method 8 ( ibpc3 ibcpaa bytes ) -- 1050 cumulative
; METHOD 0 WAS THE BEST
!byte $CE,$6C ;addr
!byte $01 ;data8
!byte chFEFEFEFEFEFEFEFE
!byte ch7F7F7F7F7F7F7F7F
!byte $84 ;skip
!byte $03 ;data8
!byte chFFD7811783D103D7
!byte chFFFFFFFFFFFFFFFF
!byte chE7FFE7FFE7FFE7FF
!byte chFFD7811783D103D7
!byte $8A ;skip
!byte $03 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFEFEFEFEFEFEFE
!byte ch7F7F7F7F7F7F7F7F
!byte $93 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $97 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $88 ;skip
!byte $00 ;data8
!byte chD7811783D103D7FF
!byte $8C ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $83 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $93 ;skip
!byte $41,chFFFFFFFFFFFFFFFF ;fill
!byte $8D ;skip
!byte $43,chFFFFFFFFFFFF0000 ;fill
!byte $01 ;data8
!byte chFCF8F0E0E0C08000
!byte ch7F3F1F0F07030100
!byte $43,chFFFFFFFFFFFF0000 ;fill
!byte $8B ;skip
!byte $43,ch0000FFFFFFFFFFFF ;fill
!byte $01 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte $43,ch0000FFFFFFFFFFFF ;fill
!byte $8D ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $93 ;skip
!byte $06 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFEFCF8F0E0C08000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
!byte $93 ;skip
!byte $03 ;data8
!byte ch0000000000000000
!byte ch000103070F1F3F7F
!byte ch0080C0E0F0F8FCFE
!byte ch0000000000000000
!byte $94 ;skip
!byte $03 ;data8
!byte chFEFEFEFEFEFEFEFE
!byte ch7F7F7F7F7F7F7F7F
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte $93 ;skip
!byte $03 ;data8
!byte ch7F3F1F0F07030100
!byte ch7F7F7F7F7F7F7F7F
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte $92 ;skip
!byte $04 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFEFEFEFEFEFEFEFE
!byte ch7F7F7F7F7F7F7F7F
!byte ch0000000000000000
!byte ch7F3F1F0F07030100
; total compressed size 850 bytes

!byte $e1,10
!byte $e0,<streamdata_wheel_loop,>streamdata_wheel_loop
