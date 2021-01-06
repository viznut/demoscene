;,; SC00_000
;,; <- ibpcaablocks
;,; <- player_ivars
;,; <- player_songdata
;,; <- lyrics
;,; &- init
!src "demosrc/smac.inc"

; method 4 ( clrscr0 bytes ) -- 31 bytes (31 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 31 bytes (31 cumu)
; method 6 ( clrscr0 bytes ) -- 31 bytes (31 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 32 bytes (32 cumu)
; method 8 ( clrscr1 bytes ) -- 49 bytes (49 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 49 bytes (49 cumu)
; method 10 ( clrscr1 bytes ) -- 49 bytes (49 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 50 bytes (50 cumu)
; method 12 ( clrscr2 bytes ) -- 48 bytes (48 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 99 bytes (99 cumu)
; method 14 ( clrscr2 bytes ) -- 48 bytes (48 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 100 bytes (100 cumu)
; method 16 ( clrscr3 bytes ) -- 66 bytes (66 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 117 bytes (117 cumu)
; method 18 ( clrscr3 bytes ) -- 66 bytes (66 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 118 bytes (118 cumu)
; METHOD 4 CHOSEN
!byte $e4,1,ch0000000000000000 ; clrscr
;,; <- ch0000000000000000 ; 482
;,; <- chFCFCDCCCCCCCCCCC ; 5
;,; <- chC6C6C6C6C6C6C6C6 ; 1
;,; <- chFCFCE0C0C0C0C0C0 ; 7
;,; <- chFCFC303030303030 ; 1
;,; <- chD6D6D6D6D6F6FEFE ; 1
;,; <- chF0F8CCCCCCCCCCCC ; 1
;,; <- chFCFCE0C0C0E0FCFC ; 2
;,; <- chFCFC1C0C0C1CFCFC ; 2
;,; <- chCCCCCCCCCCCCCCCC ; 1
;,; <- ch3030303030303030 ; 1
; total unique chars in pic: 11 (worst case req 88 bytes)
!byte $CE,$DE ;addr
!byte $e2,0;mode8
!byte $0B ;data8
!byte chFCFCDCCCCCCCCCCC
!byte chC6C6C6C6C6C6C6C6
!byte chFCFCDCCCCCCCCCCC
!byte ch0000000000000000
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCDCCCCCCCCCCC
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCE0C0C0C0C0C0
!byte chFCFCDCCCCCCCCCCC
!byte chFCFC303030303030
!byte chFCFCE0C0C0C0C0C0
!byte $8B ;skip
!byte $0B ;data8
!byte chFCFCE0C0C0C0C0C0
!byte chD6D6D6D6D6F6FEFE
!byte chFCFCE0C0C0C0C0C0
!byte ch0000000000000000
!byte chFCFCE0C0C0C0C0C0
!byte chF0F8CCCCCCCCCCCC
!byte chFCFCE0C0C0E0FCFC
!byte chFCFC1C0C0C1CFCFC
!byte chFCFCE0C0C0E0FCFC
!byte chCCCCCCCCCCCCCCCC
!byte ch3030303030303030
!byte chFCFC1C0C0C1CFCFC

!byte $e1,144

;,; *_001
;,; <- ibpcaablocks
!byte $e4,1,ch0000000000000000 ; clrscr
!byte $e1,48

;,; *_100
;,; <- ibpcaablocks
; method 4 ( clrscr0 bytes ) -- 167 bytes (167 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 167 bytes (167 cumu)
; method 6 ( clrscr0 bytes ) -- 167 bytes (167 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 168 bytes (168 cumu)
; method 8 ( clrscr1 bytes ) -- 185 bytes (185 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 185 bytes (185 cumu)
; method 10 ( clrscr1 bytes ) -- 185 bytes (185 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 186 bytes (186 cumu)
; method 12 ( clrscr2 bytes ) -- 183 bytes (183 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 235 bytes (235 cumu)
; method 14 ( clrscr2 bytes ) -- 183 bytes (183 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 236 bytes (236 cumu)
; method 16 ( clrscr3 bytes ) -- 201 bytes (201 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 253 bytes (253 cumu)
; method 18 ( clrscr3 bytes ) -- 201 bytes (201 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 254 bytes (254 cumu)
; METHOD 4 CHOSEN
!byte $e4,1,chFFFFFFFFFFFFFFFF ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 390
;,; <- chFFFFFFE0F0F0F0FC ; 5
;,; <- chFFFFFFFFFBE0C0C0 ; 2
;,; <- chFFFFFFFF81000000 ; 6
;,; <- chFFFFFFFFFB703010 ; 1
;,; <- chFFFFFFFFFFFF1F1F ; 3
;,; <- chC0C0C0C7C7C7C7C7 ; 1
;,; <- ch0000008686868686 ; 1
;,; <- ch181E1E1E1E1C1C1C ; 1
;,; <- ch1F1F1F1F0F090000 ; 1
;,; <- chFFFFFCF0C0C0830F ; 4
;,; <- chFFFF3F1F0F07C3C3 ; 4
;,; <- chC7C7CFCFCFEFFFFF ; 1
;,; <- ch8F8F8F8787878787 ; 6
;,; <- ch1C1C1E3E3E3EFEFE ; 1
;,; <- ch0301010101010303 ; 2
;,; <- ch0F1F1F3F30000000 ; 4
;,; <- chC3E3E1C101010307 ; 4
;,; <- chFCFCFCFEFEFEFEFE ; 2
;,; <- ch073F1F1F1F1F0F07 ; 5
;,; <- ch0F0F0F0F07070303 ; 2
;,; <- chFFFFFFFBF3E3C383 ; 4
;,; <- ch0F070000000000FF ; 1
;,; <- chFEFE787070707FFF ; 1
;,; <- ch01010101010101FF ; 2
;,; <- ch80C0F0F8F8FFFFFF ; 7
;,; <- ch0F0F0F0F3FFFFFFF ; 7
;,; <- chFFFFFFF830180C0F ; 1
;,; <- chFFFFFF070303070F ; 1
;,; <- chFFFFFF9F9F0F0F0F ; 1
;,; <- chFCFCFCFCFCFCFCFC ; 3
;,; <- ch3F3F1F0F0F0F0F0F ; 2
;,; <- chFFFFFFFFC0606060 ; 2
;,; <- ch0F0F070303030100 ; 2
;,; <- chF8F8F8F8F8F8F8F8 ; 4
;,; <- ch2323233330787878 ; 1
;,; <- ch0E0E0E0E0E0E0F0F ; 2
;,; <- ch0001030707070F0F ; 1
;,; <- ch008787878707070F ; 1
;,; <- ch7070F8F8F0602021 ; 1
;,; <- ch78787C7C7C7E3E3E ; 1
;,; <- chFCFCFCFCF8F0E0C0 ; 1
;,; <- ch0E00008080808080 ; 1
;,; <- chE2E2E2E2E2E3C383 ; 1
;,; <- chF8F0F0F0F0FFFFFF ; 1
;,; <- ch1E0E06060FFFFFFF ; 1
;,; <- ch0000000000FFFFFF ; 5
;,; <- ch1F1F1FBFFFFFFFFF ; 3
; total unique chars in pic: 48 (worst case req 384 bytes)
!byte $CE,$32 ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte chFFFFFFE0F0F0F0FC
!byte $9C ;skip
!byte $03 ;data8
!byte chFFFFFFFFFBE0C0C0
!byte chFFFFFFFF81000000
!byte chFFFFFFFFFB703010
!byte chFFFFFFFFFFFF1F1F
!byte $93 ;skip
!byte $06 ;data8
!byte chC0C0C0C7C7C7C7C7
!byte ch0000008686868686
!byte ch181E1E1E1E1C1C1C
!byte ch1F1F1F1F0F090000
!byte chFFFFFFFFFFFF1F1F
!byte chFFFFFCF0C0C0830F
!byte chFFFF3F1F0F07C3C3
!byte $83 ;skip
!byte $00 ;data8
!byte chFFFFFFE0F0F0F0FC
!byte $8B ;skip
!byte $06 ;data8
!byte chC7C7CFCFCFEFFFFF
!byte ch8F8F8F8787878787
!byte ch1C1C1E3E3E3EFEFE
!byte ch0301010101010303
!byte ch8F8F8F8787878787
!byte ch0F1F1F3F30000000
!byte chC3E3E1C101010307
!byte $91 ;skip
!byte $05 ;data8
!byte ch8F8F8F8787878787
!byte chFCFCFCFEFEFEFEFE
!byte ch073F1F1F1F1F0F07
!byte ch0F0F0F0F07070303
!byte ch073F1F1F1F1F0F07
!byte chFFFFFFFBF3E3C383
!byte $90 ;skip
!byte $06 ;data8
!byte chFFFFFFE0F0F0F0FC
!byte ch0F070000000000FF
!byte chFEFE787070707FFF
!byte ch01010101010101FF
!byte ch01010101010101FF
!byte ch80C0F0F8F8FFFFFF
!byte ch0F0F0F0F3FFFFFFF
!byte $A1 ;skip
!byte $02 ;data8
!byte chFFFFFFE0F0F0F0FC
!byte chFFFFFFF830180C0F
!byte chFFFFFF070303070F
!byte $84 ;skip
!byte $04 ;data8
!byte chFFFFFF9F9F0F0F0F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFE0F0F0F0FC
!byte chFFFFFFFF81000000
!byte $86 ;skip
!byte $3F ;data8
!byte chFFFFFFFF81000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch0F0F0F0F07070303
!byte ch3F3F1F0F0F0F0F0F
!byte chFFFFFCF0C0C0830F
!byte chFFFF3F1F0F07C3C3
!byte chFFFFFFFF81000000
!byte chFFFFFFFF81000000
!byte chFFFFFFFFC0606060
!byte ch0F0F070303030100
!byte chFFFFFFFFFFFF1F1F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch8F8F8F8787878787
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFCF0C0C0830F
!byte chFFFF3F1F0F07C3C3
!byte chFFFFFFFF81000000
!byte chFFFFFFFFC0606060
!byte chFFFFFCF0C0C0830F
!byte chFFFF3F1F0F07C3C3
!byte chF8F8F8F8F8F8F8F8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch2323233330787878
!byte ch0E0E0E0E0E0E0F0F
!byte ch0F1F1F3F30000000
!byte chC3E3E1C101010307
!byte ch80C0F0F8F8FFFFFF
!byte ch0001030707070F0F
!byte chFFFFFFFFFFFFFFFF
!byte ch008787878707070F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch8F8F8F8787878787
!byte chFFFFFFFFFBE0C0C0
!byte ch0F1F1F3F30000000
!byte chC3E3E1C101010307
!byte chF8F8F8F8F8F8F8F8
!byte ch7070F8F8F0602021
!byte ch0F1F1F3F30000000
!byte chC3E3E1C101010307
!byte chF8F8F8F8F8F8F8F8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFCFCFCFCFCFCFCFC
!byte ch78787C7C7C7E3E3E
!byte ch0E0E0E0E0E0E0F0F
!byte ch073F1F1F1F1F0F07
!byte chFFFFFFFBF3E3C383
!byte chFCFCFCFCF8F0E0C0
!byte ch0F0F070303030100
!byte chFFFFFFFFFFFFFFFF
!byte ch0E00008080808080
!byte ch3F3F1F0F0F0F0F0F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $21 ;data8
!byte ch8F8F8F8787878787
!byte chE2E2E2E2E2E3C383
!byte ch073F1F1F1F1F0F07
!byte chFFFFFFFBF3E3C383
!byte chFCFCFCFEFEFEFEFE
!byte ch0301010101010303
!byte ch073F1F1F1F1F0F07
!byte chFFFFFFFBF3E3C383
!byte chF8F8F8F8F8F8F8F8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chF8F0F0F0F0FFFFFF
!byte ch1E0E06060FFFFFFF
!byte ch0F0F0F0F3FFFFFFF
!byte ch80C0F0F8F8FFFFFF
!byte ch0F0F0F0F3FFFFFFF
!byte ch0000000000FFFFFF
!byte ch0000000000FFFFFF
!byte ch1F1F1FBFFFFFFFFF
!byte ch80C0F0F8F8FFFFFF
!byte ch1F1F1FBFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch80C0F0F8F8FFFFFF
!byte ch0000000000FFFFFF
!byte ch0F0F0F0F3FFFFFFF
!byte ch80C0F0F8F8FFFFFF
!byte ch0F0F0F0F3FFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0F0F0F0F3FFFFFFF
!byte ch80C0F0F8F8FFFFFF
!byte ch0F0F0F0F3FFFFFFF
!byte ch0000000000FFFFFF
!byte ch0000000000FFFFFF
!byte $CF,$D2 ;addr
!byte $00 ;data8
!byte ch1F1F1FBFFFFFFFFF
!byte $e1,144



;,; *_101
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 20 bytes (187 cumu)
; method 1 ( ibpc0 bytes ) -- 20 bytes (187 cumu)
; method 2 ( bytes ) -- 20 bytes (187 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 106 bytes (273 cumu)
; method 4 ( clrscr0 bytes ) -- 144 bytes (311 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 144 bytes (311 cumu)
; method 6 ( clrscr0 bytes ) -- 144 bytes (311 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 145 bytes (312 cumu)
; method 8 ( clrscr1 bytes ) -- 162 bytes (329 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 162 bytes (329 cumu)
; method 10 ( clrscr1 bytes ) -- 162 bytes (329 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 163 bytes (330 cumu)
; method 12 ( clrscr2 bytes ) -- 161 bytes (328 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 214 bytes (381 cumu)
; method 14 ( clrscr2 bytes ) -- 161 bytes (328 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 215 bytes (382 cumu)
; method 16 ( clrscr3 bytes ) -- 179 bytes (346 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 232 bytes (399 cumu)
; method 18 ( clrscr3 bytes ) -- 179 bytes (346 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 233 bytes (400 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 409
;,; <- chFFFFFFE0F0F0F0FC ; 4
;,; <- chFFFFFFFFFFFF1F1F ; 2
;,; <- chFFFFFCF0C0C0830F ; 4
;,; <- chFFFF3F1F0F07C3C3 ; 4
;,; <- ch8F8F8F8787878787 ; 4
;,; <- ch0F1F1F3F30000000 ; 4
;,; <- chC3E3E1C101010307 ; 4
;,; <- ch0F0F0F0F07070303 ; 2
;,; <- ch073F1F1F1F1F0F07 ; 4
;,; <- chFFFFFFFBF3E3C383 ; 4
;,; <- chFEFE787070707FFF ; 1
;,; <- ch01010101010101FF ; 2
;,; <- ch80C0F0F8F8FFFFFF ; 7
;,; <- ch0F0F0F0F3FFFFFFF ; 7
;,; <- chFFFFFFF830180C0F ; 1
;,; <- chFFFFFF070303070F ; 1
;,; <- chFFFFFF9F9F0F0F0F ; 1
;,; <- chFFFFFFFF81000000 ; 5
;,; <- chFCFCFCFCFCFCFCFC ; 3
;,; <- ch3F3F1F0F0F0F0F0F ; 2
;,; <- chFFFFFFFFC0606060 ; 2
;,; <- ch0F0F070303030100 ; 2
;,; <- chF8F8F8F8F8F8F8F8 ; 4
;,; <- ch2323233330787878 ; 1
;,; <- ch0E0E0E0E0E0E0F0F ; 2
;,; <- ch0001030707070F0F ; 1
;,; <- ch008787878707070F ; 1
;,; <- chFFFFFFFFFBE0C0C0 ; 1
;,; <- ch7070F8F8F0602021 ; 1
;,; <- ch78787C7C7C7E3E3E ; 1
;,; <- chFCFCFCFCF8F0E0C0 ; 1
;,; <- ch0E00008080808080 ; 1
;,; <- chE2E2E2E2E2E3C383 ; 1
;,; <- chFCFCFCFEFEFEFEFE ; 1
;,; <- ch0301010101010303 ; 1
;,; <- chF8F0F0F0F0FFFFFF ; 1
;,; <- ch1E0E06060FFFFFFF ; 1
;,; <- ch0000000000FFFFFF ; 3
;,; <- ch1F1F1FBFFFFFFFFF ; 3
; total unique chars in pic: 40 (worst case req 320 bytes)
!byte $CE,$50 ;addr
!byte $5A,chFFFFFFFFFFFFFFFF ;fill
!byte $93 ;skip
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $94 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $93 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $CF,$4D ;addr
!byte $40,chFFFFFFFFFFFFFFFF ;fill
!byte $e1,6



;,; *_102
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 32 bytes (219 cumu)
; method 1 ( ibpc0 bytes ) -- 32 bytes (219 cumu)
; method 2 ( bytes ) -- 32 bytes (219 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 89 bytes (276 cumu)
; method 4 ( clrscr0 bytes ) -- 114 bytes (301 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 114 bytes (301 cumu)
; method 6 ( clrscr0 bytes ) -- 114 bytes (301 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 115 bytes (302 cumu)
; method 8 ( clrscr1 bytes ) -- 132 bytes (319 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 132 bytes (319 cumu)
; method 10 ( clrscr1 bytes ) -- 132 bytes (319 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 133 bytes (320 cumu)
; method 12 ( clrscr2 bytes ) -- 134 bytes (321 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 184 bytes (371 cumu)
; method 14 ( clrscr2 bytes ) -- 134 bytes (321 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 185 bytes (372 cumu)
; method 16 ( clrscr3 bytes ) -- 152 bytes (339 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 202 bytes (389 cumu)
; method 18 ( clrscr3 bytes ) -- 152 bytes (339 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 203 bytes (390 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 432
;,; <- chFFFFFFE0F0F0F0FC ; 3
;,; <- chFFFFFFFFFFFF1F1F ; 2
;,; <- ch8F8F8F8787878787 ; 4
;,; <- ch0F0F0F0F07070303 ; 1
;,; <- chFEFE787070707FFF ; 1
;,; <- ch01010101010101FF ; 1
;,; <- chFFFFFF9F9F0F0F0F ; 1
;,; <- chFFFFFFFF81000000 ; 5
;,; <- chFFFFFCF0C0C0830F ; 3
;,; <- chFFFF3F1F0F07C3C3 ; 3
;,; <- chFFFFFFFFC0606060 ; 2
;,; <- ch0F0F070303030100 ; 2
;,; <- chF8F8F8F8F8F8F8F8 ; 4
;,; <- ch0F1F1F3F30000000 ; 3
;,; <- chC3E3E1C101010307 ; 3
;,; <- ch80C0F0F8F8FFFFFF ; 6
;,; <- ch0001030707070F0F ; 1
;,; <- ch008787878707070F ; 1
;,; <- chFFFFFFFFFBE0C0C0 ; 1
;,; <- ch7070F8F8F0602021 ; 1
;,; <- ch073F1F1F1F1F0F07 ; 3
;,; <- chFFFFFFFBF3E3C383 ; 3
;,; <- chFCFCFCFCF8F0E0C0 ; 1
;,; <- ch0E00008080808080 ; 1
;,; <- ch3F3F1F0F0F0F0F0F ; 1
;,; <- chE2E2E2E2E2E3C383 ; 1
;,; <- chFCFCFCFEFEFEFEFE ; 1
;,; <- ch0301010101010303 ; 1
;,; <- ch0F0F0F0F3FFFFFFF ; 6
;,; <- ch0000000000FFFFFF ; 3
;,; <- ch1F1F1FBFFFFFFFFF ; 3
; total unique chars in pic: 32 (worst case req 256 bytes)
!byte $CE,$6D ;addr
!byte $40,chFFFFFFFFFFFFFFFF ;fill
!byte $95 ;skip
!byte $40,chFFFFFFFFFFFFFFFF ;fill
!byte $95 ;skip
!byte $40,chFFFFFFFFFFFFFFFF ;fill
!byte $94 ;skip
!byte $66,chFFFFFFFFFFFFFFFF ;fill
!byte $94 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $94 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $94 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $94 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $e1,6



;,; *_103
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 7 bytes (226 cumu)
; method 1 ( ibpc0 bytes ) -- 7 bytes (226 cumu)
; method 2 ( bytes ) -- 7 bytes (226 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 74 bytes (293 cumu)
; method 4 ( clrscr0 bytes ) -- 99 bytes (318 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 99 bytes (318 cumu)
; method 6 ( clrscr0 bytes ) -- 99 bytes (318 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 100 bytes (319 cumu)
; method 8 ( clrscr1 bytes ) -- 117 bytes (336 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 117 bytes (336 cumu)
; method 10 ( clrscr1 bytes ) -- 117 bytes (336 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 118 bytes (337 cumu)
; method 12 ( clrscr2 bytes ) -- 117 bytes (336 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 169 bytes (388 cumu)
; method 14 ( clrscr2 bytes ) -- 117 bytes (336 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 170 bytes (389 cumu)
; method 16 ( clrscr3 bytes ) -- 135 bytes (354 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 187 bytes (406 cumu)
; method 18 ( clrscr3 bytes ) -- 135 bytes (354 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 188 bytes (407 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 438
;,; <- chFFFFFFE0F0F0F0FC ; 2
;,; <- chFFFFFF9F9F0F0F0F ; 1
;,; <- chFFFFFFFF81000000 ; 5
;,; <- chFFFFFCF0C0C0830F ; 3
;,; <- chFFFF3F1F0F07C3C3 ; 3
;,; <- chFFFFFFFFC0606060 ; 2
;,; <- ch0F0F070303030100 ; 2
;,; <- chFFFFFFFFFFFF1F1F ; 1
;,; <- ch8F8F8F8787878787 ; 3
;,; <- chF8F8F8F8F8F8F8F8 ; 4
;,; <- ch0F1F1F3F30000000 ; 3
;,; <- chC3E3E1C101010307 ; 3
;,; <- ch80C0F0F8F8FFFFFF ; 6
;,; <- ch0001030707070F0F ; 1
;,; <- ch008787878707070F ; 1
;,; <- chFFFFFFFFFBE0C0C0 ; 1
;,; <- ch7070F8F8F0602021 ; 1
;,; <- ch073F1F1F1F1F0F07 ; 3
;,; <- chFFFFFFFBF3E3C383 ; 3
;,; <- chFCFCFCFCF8F0E0C0 ; 1
;,; <- ch0E00008080808080 ; 1
;,; <- ch3F3F1F0F0F0F0F0F ; 1
;,; <- chE2E2E2E2E2E3C383 ; 1
;,; <- chFCFCFCFEFEFEFEFE ; 1
;,; <- ch0301010101010303 ; 1
;,; <- ch0F0F0F0F3FFFFFFF ; 6
;,; <- ch0000000000FFFFFF ; 3
;,; <- ch1F1F1FBFFFFFFFFF ; 3
; total unique chars in pic: 29 (worst case req 232 bytes)
!byte $CE,$32 ;addr
!byte $79,chFFFFFFFFFFFFFFFF ;fill
!byte $96 ;skip
!byte $6E,chFFFFFFFFFFFFFFFF ;fill
!byte $e1,6



;,; *_104
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 15 bytes (241 cumu)
; method 1 ( ibpc0 bytes ) -- 15 bytes (241 cumu)
; method 2 ( bytes ) -- 15 bytes (241 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 48 bytes (274 cumu)
; method 4 ( clrscr0 bytes ) -- 60 bytes (286 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 60 bytes (286 cumu)
; method 6 ( clrscr0 bytes ) -- 60 bytes (286 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 61 bytes (287 cumu)
; method 8 ( clrscr1 bytes ) -- 78 bytes (304 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 78 bytes (304 cumu)
; method 10 ( clrscr1 bytes ) -- 78 bytes (304 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 79 bytes (305 cumu)
; method 12 ( clrscr2 bytes ) -- 78 bytes (304 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 130 bytes (356 cumu)
; method 14 ( clrscr2 bytes ) -- 78 bytes (304 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 131 bytes (357 cumu)
; method 16 ( clrscr3 bytes ) -- 96 bytes (322 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 148 bytes (374 cumu)
; method 18 ( clrscr3 bytes ) -- 96 bytes (322 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 149 bytes (375 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 465
;,; <- chFFFFFFE0F0F0F0FC ; 2
;,; <- chFFFFFFFF81000000 ; 3
;,; <- ch8F8F8F8787878787 ; 3
;,; <- chFFFFFCF0C0C0830F ; 2
;,; <- chFFFF3F1F0F07C3C3 ; 2
;,; <- chFFFFFFFFC0606060 ; 1
;,; <- chF8F8F8F8F8F8F8F8 ; 4
;,; <- chFFFFFFFFFBE0C0C0 ; 1
;,; <- ch0F1F1F3F30000000 ; 2
;,; <- chC3E3E1C101010307 ; 2
;,; <- ch7070F8F8F0602021 ; 1
;,; <- chE2E2E2E2E2E3C383 ; 1
;,; <- ch073F1F1F1F1F0F07 ; 2
;,; <- chFFFFFFFBF3E3C383 ; 2
;,; <- chFCFCFCFEFEFEFEFE ; 1
;,; <- ch0301010101010303 ; 1
;,; <- ch80C0F0F8F8FFFFFF ; 3
;,; <- ch0000000000FFFFFF ; 1
;,; <- ch0F0F0F0F3FFFFFFF ; 4
;,; <- ch1F1F1FBFFFFFFFFF ; 1
; total unique chars in pic: 21 (worst case req 168 bytes)
!byte $AC ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $91 ;skip
!byte $45,chFFFFFFFFFFFFFFFF ;fill
!byte $90 ;skip
!byte $44,chFFFFFFFFFFFFFFFF ;fill
!byte $91 ;skip
!byte $45,chFFFFFFFFFFFFFFFF ;fill
!byte $8F ;skip
!byte $46,chFFFFFFFFFFFFFFFF ;fill
!byte $e1,6



;,; *_105
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 24 bytes (265 cumu)
; method 1 ( ibpc0 bytes ) -- 24 bytes (265 cumu)
; method 2 ( bytes ) -- 24 bytes (265 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 38 bytes (279 cumu)
; method 4 ( clrscr0 bytes ) -- 38 bytes (279 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 38 bytes (279 cumu)
; method 6 ( clrscr0 bytes ) -- 38 bytes (279 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 39 bytes (280 cumu)
; method 8 ( clrscr1 bytes ) -- 56 bytes (297 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 56 bytes (297 cumu)
; method 10 ( clrscr1 bytes ) -- 56 bytes (297 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 57 bytes (298 cumu)
; method 12 ( clrscr2 bytes ) -- 54 bytes (295 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 108 bytes (349 cumu)
; method 14 ( clrscr2 bytes ) -- 54 bytes (295 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 109 bytes (350 cumu)
; method 16 ( clrscr3 bytes ) -- 72 bytes (313 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 126 bytes (367 cumu)
; method 18 ( clrscr3 bytes ) -- 72 bytes (313 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 127 bytes (368 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 481
;,; <- chFFFFFFE0F0F0F0FC ; 1
;,; <- chFFFFFFFF81000000 ; 2
;,; <- chFFFFFFFFC0606060 ; 1
;,; <- chFFFFFCF0C0C0830F ; 1
;,; <- chFFFF3F1F0F07C3C3 ; 1
;,; <- chF8F8F8F8F8F8F8F8 ; 4
;,; <- ch7070F8F8F0602021 ; 1
;,; <- ch0F1F1F3F30000000 ; 1
;,; <- chC3E3E1C101010307 ; 1
;,; <- chFFFFFFFBF3E3C383 ; 2
;,; <- chFCFCFCFEFEFEFEFE ; 1
;,; <- ch0301010101010303 ; 1
;,; <- ch073F1F1F1F1F0F07 ; 1
;,; <- ch80C0F0F8F8FFFFFF ; 2
;,; <- ch0F0F0F0F3FFFFFFF ; 3
; total unique chars in pic: 16 (worst case req 128 bytes)
!byte $CE,$E4 ;addr
!byte $40,chFFFFFFFFFFFFFFFF ;fill
!byte $96 ;skip
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $93 ;skip
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $93 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $93 ;skip
!byte $02 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $CF,$D2 ;addr
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $e1,6



;,; *_106
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 13 bytes (278 cumu)
; method 1 ( ibpc0 bytes ) -- 13 bytes (278 cumu)
; method 2 ( bytes ) -- 13 bytes (278 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 29 bytes (294 cumu)
; method 4 ( clrscr0 bytes ) -- 17 bytes (282 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 17 bytes (282 cumu)
; method 6 ( clrscr0 bytes ) -- 17 bytes (282 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 18 bytes (283 cumu)
; method 8 ( clrscr1 bytes ) -- 35 bytes (300 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 35 bytes (300 cumu)
; method 10 ( clrscr1 bytes ) -- 35 bytes (300 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 36 bytes (301 cumu)
; method 12 ( clrscr2 bytes ) -- 32 bytes (297 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 87 bytes (352 cumu)
; method 14 ( clrscr2 bytes ) -- 32 bytes (297 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 88 bytes (353 cumu)
; method 16 ( clrscr3 bytes ) -- 50 bytes (315 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 105 bytes (370 cumu)
; method 18 ( clrscr3 bytes ) -- 50 bytes (315 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 106 bytes (371 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 499
;,; <- chFFFFFFE0F0F0F0FC ; 1
;,; <- chFFFFFFFF81000000 ; 1
;,; <- chF8F8F8F8F8F8F8F8 ; 3
; total unique chars in pic: 4 (worst case req 32 bytes)
!byte $CF,$01 ;addr
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $93 ;skip
!byte $42,chFFFFFFFFFFFFFFFF ;fill
!byte $92 ;skip
!byte $43,chFFFFFFFFFFFFFFFF ;fill
!byte $91 ;skip
!byte $44,chFFFFFFFFFFFFFFFF ;fill
!byte $e1,6



;,; *_107
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 4 bytes (282 cumu)
; method 1 ( ibpc0 bytes ) -- 4 bytes (282 cumu)
; method 2 ( bytes ) -- 4 bytes (282 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 25 bytes (303 cumu)
; method 4 ( clrscr0 bytes ) -- 13 bytes (291 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 13 bytes (291 cumu)
; method 6 ( clrscr0 bytes ) -- 13 bytes (291 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 14 bytes (292 cumu)
; method 8 ( clrscr1 bytes ) -- 31 bytes (309 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 31 bytes (309 cumu)
; method 10 ( clrscr1 bytes ) -- 31 bytes (309 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 32 bytes (310 cumu)
; method 12 ( clrscr2 bytes ) -- 30 bytes (308 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 83 bytes (361 cumu)
; method 14 ( clrscr2 bytes ) -- 30 bytes (308 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 84 bytes (362 cumu)
; method 16 ( clrscr3 bytes ) -- 48 bytes (326 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 101 bytes (379 cumu)
; method 18 ( clrscr3 bytes ) -- 48 bytes (326 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 102 bytes (380 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 500
;,; <- chFFFFFFFF81000000 ; 1
;,; <- chF8F8F8F8F8F8F8F8 ; 3
; total unique chars in pic: 3 (worst case req 24 bytes)
!byte $CE,$73 ;addr
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $e1,6



;,; *_108
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 7 bytes (289 cumu)
; method 1 ( ibpc0 bytes ) -- 7 bytes (289 cumu)
; method 2 ( bytes ) -- 7 bytes (289 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 8 bytes (290 cumu)
; method 4 ( clrscr0 bytes ) -- 0 bytes (282 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 0 bytes (282 cumu)
; method 6 ( clrscr0 bytes ) -- 0 bytes (282 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 1 bytes (283 cumu)
; method 8 ( clrscr1 bytes ) -- 18 bytes (300 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 18 bytes (300 cumu)
; method 10 ( clrscr1 bytes ) -- 18 bytes (300 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 19 bytes (301 cumu)
; method 12 ( clrscr2 bytes ) -- 18 bytes (300 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 68 bytes (350 cumu)
; method 14 ( clrscr2 bytes ) -- 18 bytes (300 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 69 bytes (351 cumu)
; method 16 ( clrscr3 bytes ) -- 36 bytes (318 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 86 bytes (368 cumu)
; method 18 ( clrscr3 bytes ) -- 36 bytes (318 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 87 bytes (369 cumu)
; METHOD 4 CHOSEN
!byte $e4,1,chFFFFFFFFFFFFFFFF ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 504
; total unique chars in pic: 1 (worst case req 8 bytes)
!byte $e1,6

; total compressed size 282 bytes
