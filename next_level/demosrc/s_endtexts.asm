;,; SC80_000
;,; <- ibpcaablocks
;,; <- player_ivars
;;,; <- player_songdata
!src "demosrc/smac.inc"

+s8bpc
+sAddr $900e
!byte $01,$18,$10
+sAddr chptr
!byte $04
!byte bass_misery-songdata
!byte drum_misery-songdata
!byte shap_start-songdata
!byte melo_start-songdata;muteseq-songdata
!byte muteseq-songdata;muteseq-songdata

; method 4 ( clrscr0 bytes ) -- 37 bytes (37 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 37 bytes (37 cumu)
; method 6 ( clrscr0 bytes ) -- 37 bytes (37 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 38 bytes (38 cumu)
; method 8 ( clrscr1 bytes ) -- 55 bytes (55 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 55 bytes (55 cumu)
; method 10 ( clrscr1 bytes ) -- 55 bytes (55 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 56 bytes (56 cumu)
; method 12 ( clrscr2 bytes ) -- 54 bytes (54 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 105 bytes (105 cumu)
; method 14 ( clrscr2 bytes ) -- 54 bytes (54 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 106 bytes (106 cumu)
; method 16 ( clrscr3 bytes ) -- 72 bytes (72 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 123 bytes (123 cumu)
; method 18 ( clrscr3 bytes ) -- 72 bytes (72 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 124 bytes (124 cumu)
; METHOD 4 CHOSEN
!byte $e4,0,ch0000000000000000 ; clrscr
;,; <- ch0000000000000000 ; 478
;,; <- chCCCCCCCCCCCCCCCC ; 5
;,; <- chFCFC303030303030 ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 4
;,; <- chFCFCDCCCCCCCCCCC ; 2
;,; <- chCCCCCCCC78783030 ; 2
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- ch3030303030303030 ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- ch30307878CCCCCCCC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 2
; total unique chars in pic: 11 (worst case req 88 bytes)
!byte $CE,$AC ;addr
!byte $e2,0;mode8
!byte $0F ;data8
!byte chCCCCCCCCCCCCCCCC
!byte chFCFC303030303030
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chCCCCCCCC78783030
!byte chFCFC303030303030
!byte ch0000000000000000
!byte chC0C0C0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chC0C0C0C0C0C0C0C0
!byte chCCCCCCCCCCCCCCCC
!byte $88 ;skip
!byte $0D ;data8
!byte ch3030303030303030
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000000000
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte ch30307878CCCCCCCC
!byte ch3030303030303030
!byte ch0000000000000000
!byte chC0C0C0C0C0E0FCFC
!byte chFCFCE0C0C0E0FCFC
!byte chCCCCCCCC78783030
!byte chFCFCE0C0C0E0FCFC
!byte chC0C0C0C0C0E0FCFC
!byte $e1,192



;,; *_001
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 20 bytes (57 cumu)
; method 1 ( ibpc0 bytes ) -- 20 bytes (57 cumu)
; method 2 ( bytes ) -- 20 bytes (57 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 21 bytes (58 cumu)
; method 4 ( clrscr0 bytes ) -- 55 bytes (92 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 55 bytes (92 cumu)
; method 6 ( clrscr0 bytes ) -- 55 bytes (92 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 56 bytes (93 cumu)
; method 8 ( clrscr1 bytes ) -- 73 bytes (110 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 73 bytes (110 cumu)
; method 10 ( clrscr1 bytes ) -- 73 bytes (110 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 74 bytes (111 cumu)
; method 12 ( clrscr2 bytes ) -- 72 bytes (109 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 125 bytes (162 cumu)
; method 14 ( clrscr2 bytes ) -- 72 bytes (109 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 126 bytes (163 cumu)
; method 16 ( clrscr3 bytes ) -- 90 bytes (127 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 143 bytes (180 cumu)
; method 18 ( clrscr3 bytes ) -- 90 bytes (127 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 144 bytes (181 cumu)
; METHOD 0 CHOSEN
;,; <- ch0000000000000000 ; 464
;,; <- chCCCCCCCCCCCCCCCC ; 5
;,; <- chFCFC303030303030 ; 2
;,; <- chFCFCE0C0C0C0C0C0 ; 6
;,; <- chFCFCDCCCCCCCCCCC ; 7
;,; <- chCCCCCCCC78783030 ; 2
;,; <- chC0C0C0C0C0C0C0C0 ; 2
;,; <- ch3030303030303030 ; 2
;,; <- chFCFCE0C0C0E0FCFC ; 5
;,; <- ch30307878CCCCCCCC ; 1
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- chFCFC0C0C0C0C0C0C ; 1
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- chCCCCCCCCCCECFCFC ; 2
;,; <- chFCFCCCCCCCDCFCFC ; 1
; total unique chars in pic: 16 (worst case req 128 bytes)
!byte $BC ;skip
!byte $07 ;data8
!byte chFCFCDCCCCCCCCCCC
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFC0C0C0C0C0C0C
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte $8F ;skip
!byte $07 ;data8
!byte chFCFCE0C0C0C0C0C0
!byte chD6D6D6D6D6F6FEFE
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chFCFCE0C0C0E0FCFC
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCECFCFC
!byte chFCFCCCCCCCDCFCFC
!byte $e1,192



;,; *_002
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 100 bytes (157 cumu)
; method 1 ( ibpc0 bytes ) -- 100 bytes (157 cumu)
; method 2 ( bytes ) -- 100 bytes (157 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 101 bytes (158 cumu)
; method 4 ( clrscr0 bytes ) -- 93 bytes (150 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 93 bytes (150 cumu)
; method 6 ( clrscr0 bytes ) -- 93 bytes (150 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 94 bytes (151 cumu)
; method 8 ( clrscr1 bytes ) -- 111 bytes (168 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 111 bytes (168 cumu)
; method 10 ( clrscr1 bytes ) -- 111 bytes (168 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 112 bytes (169 cumu)
; method 12 ( clrscr2 bytes ) -- 112 bytes (169 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 163 bytes (220 cumu)
; method 14 ( clrscr2 bytes ) -- 112 bytes (169 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 164 bytes (221 cumu)
; method 16 ( clrscr3 bytes ) -- 130 bytes (187 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 181 bytes (238 cumu)
; method 18 ( clrscr3 bytes ) -- 130 bytes (187 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 182 bytes (239 cumu)
; METHOD 4 CHOSEN
!byte $e4,0,ch0000000000000000 ; clrscr
;,; <- ch0000000000000000 ; 438
;,; <- chFCFCE0C0C0C0C0C0 ; 4
;,; <- chFCFCDCCCCCCCCCCC ; 7
;,; <- chF0F8CCCCCCCCCCCC ; 2
;,; <- ch3030303000000000 ; 3
;,; <- chCCCCCCCCCCCCCCCC ; 10
;,; <- chFCFC303030303030 ; 8
;,; <- chFCFC0C0C0C0C0C0C ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chCCCCCCCCCCECFCFC ; 6
;,; <- chFCFCE0C0C0E0FCFC ; 4
;,; <- ch0000000000303030 ; 3
;,; <- chCCCCCCCC78783030 ; 3
;,; <- ch303030303030FCFC ; 4
;,; <- ch3030303030303030 ; 4
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- chFCFC1C0C0C1CFCFC ; 1
; total unique chars in pic: 18 (worst case req 144 bytes)
!byte $CE,$95 ;addr
!byte $0D ;data8
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chF0F8CCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte ch3030303000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte chCCCCCCCCCCCCCCCC
!byte chFCFC303030303030
!byte chFCFC0C0C0C0C0C0C
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte chFCFC303030303030
!byte $89 ;skip
!byte $0D ;data8
!byte chC0C0C0C0C0E0FCFC
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCECFCFC
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000303030
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte chCCCCCCCC78783030
!byte ch303030303030FCFC
!byte chFCFCE0C0C0E0FCFC
!byte chCCCCCCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte ch3030303030303030
!byte $A1 ;skip
!byte $0D ;data8
!byte chFEFEDED6D6D6D6D6
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFC303030303030
!byte chFCFCE0C0C0C0C0C0
!byte ch3030303000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte chCCCCCCCCCCCCCCCC
!byte chFCFC303030303030
!byte chFCFC0C0C0C0C0C0C
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte chFCFC303030303030
!byte $89 ;skip
!byte $0D ;data8
!byte chC6C6C6C6C6C6C6C6
!byte chCCCCCCCCCCECFCFC
!byte chFCFC1C0C0C1CFCFC
!byte ch303030303030FCFC
!byte chC0C0C0C0C0E0FCFC
!byte ch0000000000303030
!byte ch0000000000000000
!byte ch0000000000000000
!byte chCCCCCCCC78783030
!byte ch303030303030FCFC
!byte chFCFCE0C0C0E0FCFC
!byte chCCCCCCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte ch3030303030303030
!byte $A1 ;skip
!byte $03 ;data8
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFC303030303030
!byte ch3030303000000000
!byte $83 ;skip
!byte $05 ;data8
!byte chCCCCCCCCCCCCCCCC
!byte chFCFC303030303030
!byte chFCFC0C0C0C0C0C0C
!byte chFCFCDCCCCCCCCCCC
!byte chCCCCCCCCCCCCCCCC
!byte chFCFC303030303030
!byte $89 ;skip
!byte $03 ;data8
!byte chFCFCDCCCCCCCCCCC
!byte chF0F8CCCCCCCCCCCC
!byte ch3030303030303030
!byte ch0000000000303030
!byte $83 ;skip
!byte $05 ;data8
!byte chCCCCCCCC78783030
!byte ch303030303030FCFC
!byte chFCFCE0C0C0E0FCFC
!byte chCCCCCCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte ch3030303030303030
!byte $e1,192



;,; *_003
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 55 bytes (205 cumu)
; method 1 ( ibpc0 bytes ) -- 55 bytes (205 cumu)
; method 2 ( bytes ) -- 55 bytes (205 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 56 bytes (206 cumu)
; method 4 ( clrscr0 bytes ) -- 147 bytes (297 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 147 bytes (297 cumu)
; method 6 ( clrscr0 bytes ) -- 147 bytes (297 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 148 bytes (298 cumu)
; method 8 ( clrscr1 bytes ) -- 167 bytes (317 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 167 bytes (317 cumu)
; method 10 ( clrscr1 bytes ) -- 167 bytes (317 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 168 bytes (318 cumu)
; method 12 ( clrscr2 bytes ) -- 166 bytes (316 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 215 bytes (365 cumu)
; method 14 ( clrscr2 bytes ) -- 166 bytes (316 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 216 bytes (366 cumu)
; method 16 ( clrscr3 bytes ) -- 186 bytes (336 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 235 bytes (385 cumu)
; method 18 ( clrscr3 bytes ) -- 186 bytes (336 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 236 bytes (386 cumu)
; METHOD 0 CHOSEN
;,; <- ch0000000000000000 ; 410
;,; <- chFCFCE0C0C0C0C0C0 ; 9
;,; <- chFCFCDCCCCCCCCCCC ; 13
;,; <- chF0F8CCCCCCCCCCCC ; 3
;,; <- ch3030303000000000 ; 3
;,; <- chCCCCCCCCCCCCCCCC ; 12
;,; <- chFCFC303030303030 ; 10
;,; <- chFCFC0C0C0C0C0C0C ; 3
;,; <- chC0C0C0C0C0E0FCFC ; 2
;,; <- chCCCCCCCCCCECFCFC ; 10
;,; <- chFCFCE0C0C0E0FCFC ; 7
;,; <- ch0000000000303030 ; 4
;,; <- chCCCCCCCC78783030 ; 3
;,; <- ch303030303030FCFC ; 4
;,; <- ch3030303030303030 ; 7
;,; <- chFEFEDED6D6D6D6D6 ; 1
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- chFCFC1C0C0C1CFCFC ; 2
; total unique chars in pic: 18 (worst case req 144 bytes)
;!byte $DB,$89 ;addr
;!byte $e2,1;mode4
;;byte $03 ;data4
;!byte $17
;!byte $71
;!byte $11
;!byte $17
;!byte $92 ;skip
;!byte $00 ;data4
;!byte $17
!byte $CF,$83 ;addr
;!byte $e2,0;mode8
!byte $11 ;data8
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte chFCFC303030303030
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chFCFC303030303030
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte ch3030303030303030
!byte $85 ;skip
!byte $11 ;data8
!byte chCCCCCCCCCCECFCFC
!byte chF0F8CCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte chFCFCE0C0C0E0FCFC
!byte ch3030303030303030
!byte chFCFC1C0C0C1CFCFC
!byte ch0000000000000000
!byte ch3030303030303030
!byte chCCCCCCCCCCECFCFC
!byte ch0000000000000000
!byte chCCCCCCCCCCCCCCCC
!byte chCCCCCCCCCCECFCFC
!byte ch0000000000000000
!byte chCCCCCCCCCCECFCFC
!byte chCCCCCCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte ch0000000000000000
!byte ch0000000000303030
!byte $e1,96

;,; *_004
!src "demosrc/smac.inc"
+sAddr $900e
!byte $01,$07,$f0
!byte $e1,6

;,; *_004b
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$b0
!byte $e1,6

;,; *_004c
!src "demosrc/smac.inc"
+sAddr $900e
!byte $01,$06,$d0
!byte $e1,6

;,; *_005
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$70
!byte $e1,6

;,; *_005b
!src "demosrc/smac.inc"
+sAddr $900e
!byte $01,$05,$90
!byte $e1,6

;,; *_006
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$30
!byte $e1,6

;,; *_005b
!src "demosrc/smac.inc"
+sAddr $900e
!byte $01,$04,$c0
!byte $e1,6

;,; *_005c
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$a0
!byte $e1,6

;,; *_007
!src "demosrc/smac.inc"
+sAddr $900e
!byte $01,$03,$50
!byte $e1,6

;,; *_007b
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$e0
!byte $e1,6

;,; *_007b
!src "demosrc/smac.inc"
+sAddr $900e
!byte $01,$02,$80
!byte $e1,6

;,; *_008
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$40
!byte $e1,6

;,; *_009
!src "demosrc/smac.inc"
+sAddr $900e
!byte $01,$01,$20
!byte $e1,6

;,; *_010
!src "demosrc/smac.inc"
+sAddr $900f
!byte $00,$60
!byte $e1,6

;,; *_011
!src "demosrc/smac.inc"
+sAddr $900e
!byte $01,$00,$00
!byte $e1,6
!byte $ff
