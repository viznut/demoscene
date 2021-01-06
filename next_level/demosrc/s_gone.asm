
;,; SC70_000
;,; <- ibpcaablocks
!src "demosrc/smac.inc"
+s8bpc
+sAddr $900e
!byte $00,$10

; method 4 ( clrscr0 bytes ) -- 196 bytes (196 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 234 bytes (234 cumu)
; method 6 ( clrscr0 bytes ) -- 196 bytes (196 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 242 bytes (242 cumu)
; method 8 ( clrscr1 bytes ) -- 211 bytes (211 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 249 bytes (249 cumu)
; method 10 ( clrscr1 bytes ) -- 211 bytes (211 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 257 bytes (257 cumu)
; method 12 ( clrscr2 bytes ) -- 202 bytes (202 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 231 bytes (231 cumu)
; method 14 ( clrscr2 bytes ) -- 202 bytes (202 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 239 bytes (239 cumu)
; method 16 ( clrscr3 bytes ) -- 217 bytes (217 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 246 bytes (246 cumu)
; method 18 ( clrscr3 bytes ) -- 217 bytes (217 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 254 bytes (254 cumu)
; METHOD 4 CHOSEN
!byte $e4,5,ch0000000000000000 ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 176
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 210
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- ch0000040408080000 ; 9
;,; <- ch0000000400000000 ; 11
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
;,; <- ch5555555555555555 ; 69
;,; <- ch0F0F1F1F3F3F7F7F ; 4
;,; <- chF0F0F8F8FCFCFEFE ; 4
;,; <- ch0000010103030707 ; 3
;,; <- ch00008080C0C0E0E0 ; 3
; total unique chars in pic: 21 (worst case req 168 bytes)
!byte $DA,$00 ;addr
!byte $7F,$06 ;fill
!byte $75,$06 ;fill
!byte $6E,$02 ;fill
!byte $DA,$F0 ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $5D
!byte $A0 ;skip
!byte $00 ;data4
!byte $0B
!byte $95 ;skip
!byte $00 ;data4
!byte $5B
!byte $99 ;skip
!byte $47,$0D ;fill
!byte $8E ;skip
!byte $00 ;data4
!byte $5D
!byte $45,$0D ;fill
!byte $8D ;skip
!byte $48,$0D ;fill
!byte $8D ;skip
!byte $00 ;data4
!byte $5D
!byte $46,$0D ;fill
!byte $8E ;skip
!byte $47,$0D ;fill
!byte $8E ;skip
!byte $47,$0D ;fill
!byte $90 ;skip
!byte $45,$0D ;fill
!byte $8F ;skip
!byte $46,$0D ;fill
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
!byte $92 ;skip
!byte $04 ;data8
!byte ch7F3F1F0F07030100
!byte chFFFFFFFFFFFFFFFF
!byte chFBF3E1F3E180C100
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $86 ;skip
!byte $00 ;data8
!byte ch0000040408080000
!byte $9E ;skip
!byte $00 ;data8
!byte ch0000000400000000
!byte $9A ;skip
!byte $00 ;data8
!byte ch0000000400000000
!byte $90 ;skip
!byte $00 ;data8
!byte ch0000040408080000
!byte $91 ;skip
!byte $03 ;data8
!byte ch0000000400000000
!byte ch0000000000000000
!byte ch0000000400000000
!byte chFFFFEBEBEBEBEBEB
!byte $8F ;skip
!byte $00 ;data8
!byte ch0000000400000000
!byte $83 ;skip
!byte $04 ;data8
!byte ch0000000000010004
!byte ch0000000A25174925
!byte chEBEBEBEBEBEBEBEB
!byte ch00000050A4E892A4
!byte ch0000000000800020
!byte $91 ;skip
!byte $06 ;data8
!byte ch0000000400000000
!byte ch0002000000000000
!byte ch9A0D9B270B030707
!byte chFFFFFFFFFFFFFFFF
!byte ch59B0D9E4D0C0E0E0
!byte ch0040000000000000
!byte ch0000040408080000
!byte $47,ch5555555555555555 ;fill
!byte $86 ;skip
!byte $09 ;data8
!byte ch0000040408080000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0F0F1F1F3F3F7F7F
!byte chFFFFFFFFFFFFFFFF
!byte chF0F0F8F8FCFCFEFE
!byte ch0000040408080000
!byte ch0000000400000000
!byte ch5555555555555555
!byte ch0000040408080000
!byte $45,ch5555555555555555 ;fill
!byte $01 ;data8
!byte ch0000000000000000
!byte ch0000000400000000
!byte $85 ;skip
!byte $05 ;data8
!byte ch0000040408080000
!byte ch0000010103030707
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch00008080C0C0E0E0
!byte $48,ch5555555555555555 ;fill
!byte $86 ;skip
!byte $08 ;data8
!byte ch0000000400000000
!byte ch0000000000000000
!byte ch0F0F1F1F3F3F7F7F
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chF0F0F8F8FCFCFEFE
!byte ch5555555555555555
!byte ch0000040408080000
!byte $46,ch5555555555555555 ;fill
!byte $84 ;skip
!byte $03 ;data8
!byte ch0000040408080000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000010103030707
!byte $43,chFFFFFFFFFFFFFFFF ;fill
!byte $00 ;data8
!byte ch00008080C0C0E0E0
!byte $47,ch5555555555555555 ;fill
!byte $87 ;skip
!byte $00 ;data8
!byte ch0F0F1F1F3F3F7F7F
!byte $43,chFFFFFFFFFFFFFFFF ;fill
!byte $00 ;data8
!byte chF0F0F8F8FCFCFEFE
!byte $47,ch5555555555555555 ;fill
!byte $83 ;skip
!byte $03 ;data8
!byte ch0000000400000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000010103030707
!byte $45,chFFFFFFFFFFFFFFFF ;fill
!byte $01 ;data8
!byte ch00008080C0C0E0E0
!byte ch0000000400000000
!byte $45,ch5555555555555555 ;fill
!byte $86 ;skip
!byte $00 ;data8
!byte ch0F0F1F1F3F3F7F7F
!byte $45,chFFFFFFFFFFFFFFFF ;fill
!byte $00 ;data8
!byte chF0F0F8F8FCFCFEFE
!byte $46,ch5555555555555555 ;fill
!byte $e1,6



;,; *_001
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 22 bytes (218 cumu)
; method 1 ( ibpc0 bytes ) -- 22 bytes (218 cumu)
; method 2 ( bytes ) -- 22 bytes (218 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 68 bytes (264 cumu)
; method 4 ( clrscr0 bytes ) -- 197 bytes (393 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 235 bytes (431 cumu)
; method 6 ( clrscr0 bytes ) -- 197 bytes (393 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 243 bytes (439 cumu)
; method 8 ( clrscr1 bytes ) -- 215 bytes (411 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 253 bytes (449 cumu)
; method 10 ( clrscr1 bytes ) -- 215 bytes (411 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 261 bytes (457 cumu)
; method 12 ( clrscr2 bytes ) -- 203 bytes (399 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 232 bytes (428 cumu)
; method 14 ( clrscr2 bytes ) -- 203 bytes (399 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 240 bytes (436 cumu)
; method 16 ( clrscr3 bytes ) -- 221 bytes (417 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 250 bytes (446 cumu)
; method 18 ( clrscr3 bytes ) -- 221 bytes (417 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 258 bytes (454 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 176
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 210
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- ch0000040408080000 ; 9
;,; <- ch0000000400000000 ; 11
;,; <- ch00FFFFEBEBEBEBEB ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch5555555555555555 ; 71
;,; <- ch0F0F1F1F3F3F7F7F ; 3
;,; <- chF0F0F8F8FCFCFEFE ; 3
;,; <- ch0000010103030707 ; 3
;,; <- ch00008080C0C0E0E0 ; 3
; total unique chars in pic: 21 (worst case req 168 bytes)
!byte $DB,$E7 ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $5D
!byte $85 ;skip
!byte $e2,0;mode8
!byte $00,$0D ;fill
!byte $CF,$13 ;addr
!byte $00 ;data8
!byte ch00FFFFEBEBEBEBEB
!byte $CF,$E7 ;addr
!byte $00 ;data8
!byte ch5555555555555555
!byte $86 ;skip
!byte $00,ch5555555555555555 ;fill
!byte $e1,6



;,; *_002
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 27 bytes (245 cumu)
; method 1 ( ibpc0 bytes ) -- 27 bytes (245 cumu)
; method 2 ( bytes ) -- 27 bytes (245 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 70 bytes (288 cumu)
; method 4 ( clrscr0 bytes ) -- 197 bytes (415 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 231 bytes (449 cumu)
; method 6 ( clrscr0 bytes ) -- 197 bytes (415 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 244 bytes (462 cumu)
; method 8 ( clrscr1 bytes ) -- 212 bytes (430 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 246 bytes (464 cumu)
; method 10 ( clrscr1 bytes ) -- 212 bytes (430 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 259 bytes (477 cumu)
; method 12 ( clrscr2 bytes ) -- 203 bytes (421 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 229 bytes (447 cumu)
; method 14 ( clrscr2 bytes ) -- 203 bytes (421 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 242 bytes (460 cumu)
; method 16 ( clrscr3 bytes ) -- 218 bytes (436 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 244 bytes (462 cumu)
; method 18 ( clrscr3 bytes ) -- 218 bytes (436 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 257 bytes (475 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 174
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 214
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- ch0000000400000000 ; 12
;,; <- ch0000040408080000 ; 8
;,; <- ch0000FFFFEBEBEBEB ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch5555555555555555 ; 69
;,; <- ch0F0F1F1F3F3F7F7F ; 3
;,; <- chF0F0F8F8FCFCFEFE ; 3
;,; <- ch0000010103030707 ; 2
;,; <- ch00008080C0C0E0E0 ; 2
;,; <- chAA55AA55AA55AA55 ; 2
; total unique chars in pic: 22 (worst case req 176 bytes)
!byte $DB,$E7 ;addr
!byte $47,$05 ;fill
!byte $CE,$AF ;addr
!byte $00 ;data8
!byte ch0000000400000000
!byte $CF,$13 ;addr
!byte $00 ;data8
!byte ch0000FFFFEBEBEBEB
!byte $CF,$CF ;addr
!byte $00 ;data8
!byte ch0000000000000000
!byte $86 ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $8E ;skip
!byte $01 ;data8
!byte ch0000000000000000
!byte chAA55AA55AA55AA55
!byte $84 ;skip
!byte $01 ;data8
!byte chAA55AA55AA55AA55
!byte ch0000000000000000
!byte $e1,6



;,; *_003
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 23 bytes (268 cumu)
; method 1 ( ibpc0 bytes ) -- 23 bytes (268 cumu)
; method 2 ( bytes ) -- 23 bytes (268 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 65 bytes (310 cumu)
; method 4 ( clrscr0 bytes ) -- 197 bytes (442 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 236 bytes (481 cumu)
; method 6 ( clrscr0 bytes ) -- 197 bytes (442 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 244 bytes (489 cumu)
; method 8 ( clrscr1 bytes ) -- 212 bytes (457 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 251 bytes (496 cumu)
; method 10 ( clrscr1 bytes ) -- 212 bytes (457 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 259 bytes (504 cumu)
; method 12 ( clrscr2 bytes ) -- 203 bytes (448 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 234 bytes (479 cumu)
; method 14 ( clrscr2 bytes ) -- 203 bytes (448 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 242 bytes (487 cumu)
; method 16 ( clrscr3 bytes ) -- 218 bytes (463 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 249 bytes (494 cumu)
; method 18 ( clrscr3 bytes ) -- 218 bytes (463 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 257 bytes (502 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 170
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 216
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- ch0000000400000000 ; 11
;,; <- ch0000040408080000 ; 8
;,; <- ch000000FFFFEBEBEB ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch5555555555555555 ; 69
;,; <- ch0F0F1F1F3F3F7F7F ; 3
;,; <- chF0F0F8F8FCFCFEFE ; 3
;,; <- ch0000010103030707 ; 2
;,; <- ch00008080C0C0E0E0 ; 2
;,; <- chAA55AA55AA55AA55 ; 5
; total unique chars in pic: 22 (worst case req 176 bytes)
!byte $CE,$AF ;addr
!byte $00,ch0000000000000000 ;fill
!byte $CF,$13 ;addr
!byte $00 ;data8
!byte ch000000FFFFEBEBEB
!byte $CF,$D0 ;addr
!byte $00 ;data8
!byte chAA55AA55AA55AA55
!byte $84 ;skip
!byte $00 ;data8
!byte chAA55AA55AA55AA55
!byte $90 ;skip
!byte $05 ;data8
!byte ch0000000000000000
!byte chAA55AA55AA55AA55
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chAA55AA55AA55AA55
!byte $e1,6



;,; *_004
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 31 bytes (299 cumu)
; method 1 ( ibpc0 bytes ) -- 31 bytes (299 cumu)
; method 2 ( bytes ) -- 31 bytes (299 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 71 bytes (339 cumu)
; method 4 ( clrscr0 bytes ) -- 189 bytes (457 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 226 bytes (494 cumu)
; method 6 ( clrscr0 bytes ) -- 189 bytes (457 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 238 bytes (506 cumu)
; method 8 ( clrscr1 bytes ) -- 204 bytes (472 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 241 bytes (509 cumu)
; method 10 ( clrscr1 bytes ) -- 204 bytes (472 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 253 bytes (521 cumu)
; method 12 ( clrscr2 bytes ) -- 196 bytes (464 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 224 bytes (492 cumu)
; method 14 ( clrscr2 bytes ) -- 196 bytes (464 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 236 bytes (504 cumu)
; method 16 ( clrscr3 bytes ) -- 211 bytes (479 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 239 bytes (507 cumu)
; method 18 ( clrscr3 bytes ) -- 211 bytes (479 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 251 bytes (519 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 166
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 225
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- ch0000040408080000 ; 8
;,; <- ch0000000400000000 ; 9
;,; <- ch00000000FFFFEBEB ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch5555555555555555 ; 69
;,; <- ch0F0F1F1F3F3F7F7F ; 2
;,; <- chF0F0F8F8FCFCFEFE ; 2
;,; <- ch0000010103030707 ; 2
;,; <- ch00008080C0C0E0E0 ; 2
;,; <- chAA55AA55AA55AA55 ; 4
; total unique chars in pic: 22 (worst case req 176 bytes)
!byte $CE,$CF ;addr
!byte $5B,ch0000000000000000 ;fill
!byte $A6 ;skip
!byte $00 ;data8
!byte ch00000000FFFFEBEB
!byte $CF,$B8 ;addr
!byte $00 ;data8
!byte ch0000000000000000
!byte $84 ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $90 ;skip
!byte $06 ;data8
!byte ch0000000000000000
!byte chAA55AA55AA55AA55
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chAA55AA55AA55AA55
!byte ch0000000000000000
!byte $91 ;skip
!byte $05 ;data8
!byte ch0000000000000000
!byte chAA55AA55AA55AA55
!byte chFFFFFFFFFFFFFFFF
!byte chAA55AA55AA55AA55
!byte ch0000000000000000
!byte ch0000000000000000
!byte $e1,6



;,; *_005
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 35 bytes (334 cumu)
; method 1 ( ibpc0 bytes ) -- 43 bytes (342 cumu)
; method 2 ( bytes ) -- 35 bytes (334 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 81 bytes (380 cumu)
; method 4 ( clrscr0 bytes ) -- 181 bytes (480 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 211 bytes (510 cumu)
; method 6 ( clrscr0 bytes ) -- 181 bytes (480 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 225 bytes (524 cumu)
; method 8 ( clrscr1 bytes ) -- 196 bytes (495 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 226 bytes (525 cumu)
; method 10 ( clrscr1 bytes ) -- 196 bytes (495 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 240 bytes (539 cumu)
; method 12 ( clrscr2 bytes ) -- 190 bytes (489 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 215 bytes (514 cumu)
; method 14 ( clrscr2 bytes ) -- 190 bytes (489 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 229 bytes (528 cumu)
; method 16 ( clrscr3 bytes ) -- 205 bytes (504 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 230 bytes (529 cumu)
; method 18 ( clrscr3 bytes ) -- 205 bytes (504 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 244 bytes (543 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 159
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 233
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- ch0000000400000000 ; 10
;,; <- ch0000000000FFFFEB ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch0000040408080000 ; 6
;,; <- ch5555555555555555 ; 69
;,; <- ch0F0F1F1F3F3F7F7F ; 2
;,; <- chF0F0F8F8FCFCFEFE ; 2
;,; <- ch0000010103030707 ; 1
;,; <- ch00008080C0C0E0E0 ; 1
;,; <- chAA55AA55AA55AA55 ; 6
; total unique chars in pic: 22 (worst case req 176 bytes)
!byte $CE,$FD ;addr
!byte $00 ;data8
!byte ch0000000400000000
!byte $94 ;skip
!byte $00 ;data8
!byte ch0000000000FFFFEB
!byte $CF,$60 ;addr
!byte $00 ;data8
!byte ch0000000400000000
!byte $BE ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $84 ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $91 ;skip
!byte $04 ;data8
!byte chAA55AA55AA55AA55
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chAA55AA55AA55AA55
!byte chAA55AA55AA55AA55
!byte $92 ;skip
!byte $03 ;data8
!byte ch0000000000000000
!byte chAA55AA55AA55AA55
!byte chAA55AA55AA55AA55
!byte chAA55AA55AA55AA55
!byte $42,ch0000000000000000 ;fill
!byte $90 ;skip
!byte $41,ch0000000000000000 ;fill
!byte $e1,6



;,; *_006
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 35 bytes (369 cumu)
; method 1 ( ibpc0 bytes ) -- 43 bytes (377 cumu)
; method 2 ( bytes ) -- 35 bytes (369 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 80 bytes (414 cumu)
; method 4 ( clrscr0 bytes ) -- 163 bytes (497 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 193 bytes (527 cumu)
; method 6 ( clrscr0 bytes ) -- 163 bytes (497 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 201 bytes (535 cumu)
; method 8 ( clrscr1 bytes ) -- 178 bytes (512 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 208 bytes (542 cumu)
; method 10 ( clrscr1 bytes ) -- 178 bytes (512 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 216 bytes (550 cumu)
; method 12 ( clrscr2 bytes ) -- 171 bytes (505 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 203 bytes (537 cumu)
; method 14 ( clrscr2 bytes ) -- 171 bytes (505 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 211 bytes (545 cumu)
; method 16 ( clrscr3 bytes ) -- 186 bytes (520 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 218 bytes (552 cumu)
; method 18 ( clrscr3 bytes ) -- 186 bytes (520 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 226 bytes (560 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 152
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 245
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- ch0000000400000000 ; 8
;,; <- ch000000000000FFFF ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chEBEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch0000040408080000 ; 4
;,; <- ch5555555555555555 ; 68
;,; <- ch0F0F1F1F3F3F7F7F ; 2
;,; <- chF0F0F8F8FCFCFEFE ; 2
;,; <- ch0000010103030707 ; 1
;,; <- ch00008080C0C0E0E0 ; 1
;,; <- chAA55AA55AA55AA55 ; 6
; total unique chars in pic: 22 (worst case req 176 bytes)
!byte $CE,$FD ;addr
!byte $00,ch0000000000000000 ;fill
!byte $94 ;skip
!byte $00 ;data8
!byte ch000000000000FFFF
!byte $CF,$60 ;addr
!byte $00 ;data8
!byte ch0000000000000000
!byte $87 ;skip
!byte $00,ch0000000000000000 ;fill
!byte $A4 ;skip
!byte $00 ;data8
!byte ch0000000400000000
!byte $8C ;skip
!byte $03 ;data8
!byte ch0000000400000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte $43,chAA55AA55AA55AA55 ;fill
!byte $92 ;skip
!byte $02 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte chAA55AA55AA55AA55
!byte $42,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $47,ch0000000000000000 ;fill
!byte $e1,6



;,; *_007
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 40 bytes (409 cumu)
; method 1 ( ibpc0 bytes ) -- 40 bytes (409 cumu)
; method 2 ( bytes ) -- 40 bytes (409 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 70 bytes (439 cumu)
; method 4 ( clrscr0 bytes ) -- 157 bytes (526 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 183 bytes (552 cumu)
; method 6 ( clrscr0 bytes ) -- 157 bytes (526 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 195 bytes (564 cumu)
; method 8 ( clrscr1 bytes ) -- 172 bytes (541 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 198 bytes (567 cumu)
; method 10 ( clrscr1 bytes ) -- 172 bytes (541 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 210 bytes (579 cumu)
; method 12 ( clrscr2 bytes ) -- 164 bytes (533 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 193 bytes (562 cumu)
; method 14 ( clrscr2 bytes ) -- 164 bytes (533 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 205 bytes (574 cumu)
; method 16 ( clrscr3 bytes ) -- 179 bytes (548 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 208 bytes (577 cumu)
; method 18 ( clrscr3 bytes ) -- 179 bytes (548 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 220 bytes (589 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 150
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 250
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- ch0000000400000000 ; 7
;,; <- ch00000000000000FF ; 1
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000A25174925 ; 1
;,; <- chFFEBEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch0000040408080000 ; 4
;,; <- ch5555555555555555 ; 69
;,; <- ch0F0F1F1F3F3F7F7F ; 1
;,; <- chF0F0F8F8FCFCFEFE ; 1
;,; <- chAA55AA55AA55AA55 ; 7
; total unique chars in pic: 20 (worst case req 160 bytes)
!byte $CF,$13 ;addr
!byte $00 ;data8
!byte ch00000000000000FF
!byte $8F ;skip
!byte $00,ch0000000000000000 ;fill
!byte $85 ;skip
!byte $00 ;data8
!byte chFFEBEBEBEBEBEBEB
!byte $CF,$71 ;addr
!byte $04 ;data8
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte ch0000000000000000
!byte $92 ;skip
!byte $04 ;data8
!byte chAA55AA55AA55AA55
!byte chAA55AA55AA55AA55
!byte chFFFFFFFFFFFFFFFF
!byte chAA55AA55AA55AA55
!byte chAA55AA55AA55AA55
!byte $92 ;skip
!byte $04 ;data8
!byte ch0000000000000000
!byte chAA55AA55AA55AA55
!byte chAA55AA55AA55AA55
!byte chAA55AA55AA55AA55
!byte ch0000000000000000
!byte $94 ;skip
!byte $00,ch0000000000000000 ;fill
!byte $03 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch5555555555555555
!byte $e1,6



;,; *_008
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 40 bytes (449 cumu)
; method 1 ( ibpc0 bytes ) -- 40 bytes (449 cumu)
; method 2 ( bytes ) -- 40 bytes (449 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 66 bytes (475 cumu)
; method 4 ( clrscr0 bytes ) -- 139 bytes (548 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 166 bytes (575 cumu)
; method 6 ( clrscr0 bytes ) -- 139 bytes (548 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 174 bytes (583 cumu)
; method 8 ( clrscr1 bytes ) -- 154 bytes (563 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 181 bytes (590 cumu)
; method 10 ( clrscr1 bytes ) -- 154 bytes (563 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 189 bytes (598 cumu)
; method 12 ( clrscr2 bytes ) -- 145 bytes (554 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 179 bytes (588 cumu)
; method 14 ( clrscr2 bytes ) -- 145 bytes (554 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 187 bytes (596 cumu)
; method 16 ( clrscr3 bytes ) -- 160 bytes (569 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 194 bytes (603 cumu)
; method 18 ( clrscr3 bytes ) -- 160 bytes (569 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 202 bytes (611 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 147
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 266
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- ch0000000400000000 ; 4
;,; <- ch0000000A25174925 ; 1
;,; <- chFFFFEBEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch9A0D9B270B030707 ; 1
;,; <- ch59B0D9E4D0C0E0E0 ; 1
;,; <- ch0000040408080000 ; 3
;,; <- ch5555555555555555 ; 69
;,; <- ch0F0F1F1F3F3F7F7F ; 1
;,; <- chF0F0F8F8FCFCFEFE ; 1
;,; <- chAA55AA55AA55AA55 ; 3
; total unique chars in pic: 15 (worst case req 120 bytes)
!byte $CF,$10 ;addr
!byte $02 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000400000000
!byte $55,ch0000000000000000 ;fill
!byte $03 ;data8
!byte ch0000000A25174925
!byte chFFFFEBEBEBEBEBEB
!byte ch00000050A4E892A4
!byte ch0000000000000000
!byte $92 ;skip
!byte $04 ;data8
!byte ch0000000000000000
!byte ch9A0D9B270B030707
!byte chFFFFFFFFFFFFFFFF
!byte ch59B0D9E4D0C0E0E0
!byte ch0000000000000000
!byte $90 ;skip
!byte $00 ;data8
!byte ch0000000400000000
!byte $99 ;skip
!byte $02 ;data8
!byte chAA55AA55AA55AA55
!byte chFFFFFFFFFFFFFFFF
!byte chAA55AA55AA55AA55
!byte $91 ;skip
!byte $42,ch0000000000000000 ;fill
!byte $04 ;data8
!byte chAA55AA55AA55AA55
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch5555555555555555
!byte ch0000000000000000
!byte $8C ;skip
!byte $46,ch0000000000000000 ;fill
!byte $e1,6



;,; *_009
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 25 bytes (474 cumu)
; method 1 ( ibpc0 bytes ) -- 33 bytes (482 cumu)
; method 2 ( bytes ) -- 25 bytes (474 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 55 bytes (504 cumu)
; method 4 ( clrscr0 bytes ) -- 132 bytes (581 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 149 bytes (598 cumu)
; method 6 ( clrscr0 bytes ) -- 132 bytes (581 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 157 bytes (606 cumu)
; method 8 ( clrscr1 bytes ) -- 147 bytes (596 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 164 bytes (613 cumu)
; method 10 ( clrscr1 bytes ) -- 147 bytes (596 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 172 bytes (621 cumu)
; method 12 ( clrscr2 bytes ) -- 139 bytes (588 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 172 bytes (621 cumu)
; method 14 ( clrscr2 bytes ) -- 139 bytes (588 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 180 bytes (629 cumu)
; method 16 ( clrscr3 bytes ) -- 154 bytes (603 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 187 bytes (636 cumu)
; method 18 ( clrscr3 bytes ) -- 154 bytes (603 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 195 bytes (644 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 144
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 272
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- ch0000000400000000 ; 7
;,; <- ch0000000A25174925 ; 1
;,; <- ch00FFFFEBEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch9A0C982608000000 ; 2
;,; <- chAA55AA55AA55AA55 ; 1
;,; <- ch5555555555555555 ; 69
;,; <- ch2956AA55AA000000 ; 1
; total unique chars in pic: 12 (worst case req 96 bytes)
!byte $CF,$2B ;addr
!byte $00 ;data8
!byte ch00FFFFEBEBEBEBEB
!byte $95 ;skip
!byte $04 ;data8
!byte ch9A0C982608000000
!byte chAA55AA55AA55AA55
!byte ch9A0C982608000000
!byte ch0000000000000000
!byte ch0000000400000000
!byte $92 ;skip
!byte $03 ;data8
!byte ch0000000000000000
!byte ch2956AA55AA000000
!byte ch0000000000000000
!byte ch0000000400000000
!byte $91 ;skip
!byte $00 ;data8
!byte ch0000000400000000
!byte $42,ch0000000000000000 ;fill
!byte $95 ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $e1,6



;,; *_010
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 22 bytes (496 cumu)
; method 1 ( ibpc0 bytes ) -- 22 bytes (496 cumu)
; method 2 ( bytes ) -- 22 bytes (496 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 44 bytes (518 cumu)
; method 4 ( clrscr0 bytes ) -- 130 bytes (604 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 147 bytes (621 cumu)
; method 6 ( clrscr0 bytes ) -- 130 bytes (604 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 155 bytes (629 cumu)
; method 8 ( clrscr1 bytes ) -- 145 bytes (619 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 162 bytes (636 cumu)
; method 10 ( clrscr1 bytes ) -- 145 bytes (619 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 170 bytes (644 cumu)
; method 12 ( clrscr2 bytes ) -- 137 bytes (611 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 170 bytes (644 cumu)
; method 14 ( clrscr2 bytes ) -- 137 bytes (611 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 178 bytes (652 cumu)
; method 16 ( clrscr3 bytes ) -- 152 bytes (626 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 185 bytes (659 cumu)
; method 18 ( clrscr3 bytes ) -- 152 bytes (626 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 193 bytes (667 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 144
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 275
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- ch0000000400000000 ; 5
;,; <- ch0000000A25174925 ; 1
;,; <- ch0000FFFFEBEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch9A0C982608000000 ; 2
;,; <- ch2956AA55AA000000 ; 1
;,; <- ch5555555555555555 ; 69
; total unique chars in pic: 11 (worst case req 88 bytes)
!byte $DB,$5C ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $50
!byte $CF,$2B ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch0000FFFFEBEBEBEB
!byte $96 ;skip
!byte $00 ;data8
!byte ch2956AA55AA000000
!byte $92 ;skip
!byte $43,ch0000000000000000 ;fill
!byte $02 ;data8
!byte ch0000000000000000
!byte ch0000000400000000
!byte ch0000000000000000
!byte $e1,6



;,; *_011
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 25 bytes (521 cumu)
; method 1 ( ibpc0 bytes ) -- 25 bytes (521 cumu)
; method 2 ( bytes ) -- 25 bytes (521 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 47 bytes (543 cumu)
; method 4 ( clrscr0 bytes ) -- 120 bytes (616 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 137 bytes (633 cumu)
; method 6 ( clrscr0 bytes ) -- 120 bytes (616 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 145 bytes (641 cumu)
; method 8 ( clrscr1 bytes ) -- 135 bytes (631 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 152 bytes (648 cumu)
; method 10 ( clrscr1 bytes ) -- 135 bytes (631 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 160 bytes (656 cumu)
; method 12 ( clrscr2 bytes ) -- 126 bytes (622 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 160 bytes (656 cumu)
; method 14 ( clrscr2 bytes ) -- 126 bytes (622 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 168 bytes (664 cumu)
; method 16 ( clrscr3 bytes ) -- 141 bytes (637 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 175 bytes (671 cumu)
; method 18 ( clrscr3 bytes ) -- 141 bytes (637 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 183 bytes (679 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 144
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 280
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- ch0000000400000000 ; 3
;,; <- ch0000000A25174925 ; 1
;,; <- ch000000FFFFEBEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch2956AA55AA000000 ; 1
;,; <- ch5555555555555555 ; 68
; total unique chars in pic: 10 (worst case req 80 bytes)
!byte $DB,$5C ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $55
!byte $CF,$2B ;addr
!byte $e2,0;mode8
!byte $00 ;data8
!byte ch000000FFFFEBEBEB
!byte $95 ;skip
!byte $04 ;data8
!byte ch0000000000000000
!byte ch2956AA55AA000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0000000000000000
!byte $A8 ;skip
!byte $00,ch0000000000000000 ;fill
!byte $9C ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $e1,6



;,; *_012
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 8 bytes (529 cumu)
; method 1 ( ibpc0 bytes ) -- 8 bytes (529 cumu)
; method 2 ( bytes ) -- 8 bytes (529 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 30 bytes (551 cumu)
; method 4 ( clrscr0 bytes ) -- 123 bytes (644 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 140 bytes (661 cumu)
; method 6 ( clrscr0 bytes ) -- 123 bytes (644 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 148 bytes (669 cumu)
; method 8 ( clrscr1 bytes ) -- 138 bytes (659 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 155 bytes (676 cumu)
; method 10 ( clrscr1 bytes ) -- 138 bytes (659 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 163 bytes (684 cumu)
; method 12 ( clrscr2 bytes ) -- 129 bytes (650 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 163 bytes (684 cumu)
; method 14 ( clrscr2 bytes ) -- 129 bytes (650 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 171 bytes (692 cumu)
; method 16 ( clrscr3 bytes ) -- 144 bytes (665 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 178 bytes (699 cumu)
; method 18 ( clrscr3 bytes ) -- 144 bytes (665 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 186 bytes (707 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 144
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 279
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- ch0000000400000000 ; 3
;,; <- ch0000000A25174925 ; 1
;,; <- ch00000000FFFFEBEB ; 1
;,; <- ch00000050A4E892A4 ; 1
;,; <- ch2956AA55AA000000 ; 1
;,; <- ch5555555555555555 ; 69
; total unique chars in pic: 10 (worst case req 80 bytes)
!byte $CF,$2B ;addr
!byte $00 ;data8
!byte ch00000000FFFFEBEB
!byte $CF,$8E ;addr
!byte $00 ;data8
!byte ch5555555555555555
!byte $e1,6



;,; *_013
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 11 bytes (540 cumu)
; method 1 ( ibpc0 bytes ) -- 11 bytes (540 cumu)
; method 2 ( bytes ) -- 11 bytes (540 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 33 bytes (562 cumu)
; method 4 ( clrscr0 bytes ) -- 121 bytes (650 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 138 bytes (667 cumu)
; method 6 ( clrscr0 bytes ) -- 121 bytes (650 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 146 bytes (675 cumu)
; method 8 ( clrscr1 bytes ) -- 136 bytes (665 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 153 bytes (682 cumu)
; method 10 ( clrscr1 bytes ) -- 136 bytes (665 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 161 bytes (690 cumu)
; method 12 ( clrscr2 bytes ) -- 127 bytes (656 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 161 bytes (690 cumu)
; method 14 ( clrscr2 bytes ) -- 127 bytes (656 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 169 bytes (698 cumu)
; method 16 ( clrscr3 bytes ) -- 142 bytes (671 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 176 bytes (705 cumu)
; method 18 ( clrscr3 bytes ) -- 142 bytes (671 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 184 bytes (713 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 144
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 279
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- ch0000000400000000 ; 2
;,; <- ch0000000000010004 ; 1
;,; <- ch0000000000FFFFEB ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch2956AA55AA000000 ; 1
;,; <- ch5555555555555555 ; 69
; total unique chars in pic: 11 (worst case req 88 bytes)
!byte $CF,$2A ;addr
!byte $02 ;data8
!byte ch0000000000010004
!byte ch0000000000FFFFEB
!byte ch0000000000800020
!byte $92 ;skip
!byte $02 ;data8
!byte ch0000000000000000
!byte ch0000000000000000
!byte ch0002000000000000
!byte $e1,6



;,; *_014
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 7 bytes (547 cumu)
; method 1 ( ibpc0 bytes ) -- 7 bytes (547 cumu)
; method 2 ( bytes ) -- 7 bytes (547 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 29 bytes (569 cumu)
; method 4 ( clrscr0 bytes ) -- 121 bytes (661 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 138 bytes (678 cumu)
; method 6 ( clrscr0 bytes ) -- 121 bytes (661 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 146 bytes (686 cumu)
; method 8 ( clrscr1 bytes ) -- 136 bytes (676 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 153 bytes (693 cumu)
; method 10 ( clrscr1 bytes ) -- 136 bytes (676 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 161 bytes (701 cumu)
; method 12 ( clrscr2 bytes ) -- 127 bytes (667 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 161 bytes (701 cumu)
; method 14 ( clrscr2 bytes ) -- 127 bytes (667 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 169 bytes (709 cumu)
; method 16 ( clrscr3 bytes ) -- 142 bytes (682 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 176 bytes (716 cumu)
; method 18 ( clrscr3 bytes ) -- 142 bytes (682 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 184 bytes (724 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 144
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 278
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- ch0000000400000000 ; 2
;,; <- ch0000000000010004 ; 1
;,; <- ch000000000000FFFF ; 1
;,; <- ch0000000000800020 ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch2956AA55AA000000 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch5555555555555555 ; 69
; total unique chars in pic: 12 (worst case req 96 bytes)
!byte $CF,$2B ;addr
!byte $00 ;data8
!byte ch000000000000FFFF
!byte $97 ;skip
!byte $00 ;data8
!byte ch0040000000000000
!byte $e1,6



;,; *_015
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 13 bytes (560 cumu)
; method 1 ( ibpc0 bytes ) -- 13 bytes (560 cumu)
; method 2 ( bytes ) -- 13 bytes (560 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 35 bytes (582 cumu)
; method 4 ( clrscr0 bytes ) -- 113 bytes (660 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 130 bytes (677 cumu)
; method 6 ( clrscr0 bytes ) -- 113 bytes (660 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 138 bytes (685 cumu)
; method 8 ( clrscr1 bytes ) -- 128 bytes (675 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 145 bytes (692 cumu)
; method 10 ( clrscr1 bytes ) -- 128 bytes (675 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 153 bytes (700 cumu)
; method 12 ( clrscr2 bytes ) -- 119 bytes (666 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 153 bytes (700 cumu)
; method 14 ( clrscr2 bytes ) -- 119 bytes (666 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 161 bytes (708 cumu)
; method 16 ( clrscr3 bytes ) -- 134 bytes (681 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 168 bytes (715 cumu)
; method 18 ( clrscr3 bytes ) -- 134 bytes (681 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 176 bytes (723 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 144
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 283
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- ch00000000000000FF ; 1
;,; <- ch0002000000000000 ; 1
;,; <- ch0040000000000000 ; 1
;,; <- ch5555555555555555 ; 69
; total unique chars in pic: 8 (worst case req 64 bytes)
!byte $CF,$12 ;addr
!byte $57,ch0000000000000000 ;fill
!byte $00 ;data8
!byte ch00000000000000FF
!byte $55,ch0000000000000000 ;fill
!byte $00 ;data8
!byte ch0002000000000000
!byte $98 ;skip
!byte $00 ;data8
!byte ch0000000000000000
!byte $e1,6



;,; *_016
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 10 bytes (570 cumu)
; method 1 ( ibpc0 bytes ) -- 10 bytes (570 cumu)
; method 2 ( bytes ) -- 10 bytes (570 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 34 bytes (594 cumu)
; method 4 ( clrscr0 bytes ) -- 105 bytes (665 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 122 bytes (682 cumu)
; method 6 ( clrscr0 bytes ) -- 105 bytes (665 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 130 bytes (690 cumu)
; method 8 ( clrscr1 bytes ) -- 120 bytes (680 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 137 bytes (697 cumu)
; method 10 ( clrscr1 bytes ) -- 120 bytes (680 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 145 bytes (705 cumu)
; method 12 ( clrscr2 bytes ) -- 111 bytes (671 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 145 bytes (705 cumu)
; method 14 ( clrscr2 bytes ) -- 111 bytes (671 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 153 bytes (713 cumu)
; method 16 ( clrscr3 bytes ) -- 126 bytes (686 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 160 bytes (720 cumu)
; method 18 ( clrscr3 bytes ) -- 126 bytes (686 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 168 bytes (728 cumu)
; METHOD 0 CHOSEN
;,; <- chFFFFFFFFFFFFFFFF ; 144
;,; <- chFBF3E1F3E180C100 ; 4
;,; <- ch0000000000000000 ; 286
;,; <- ch7F3F1F0F07030100 ; 1
;,; <- ch5555555555555555 ; 69
; total unique chars in pic: 5 (worst case req 40 bytes)
!byte $DB,$2B ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $53
!byte $CF,$2B ;addr
!byte $58,ch0000000000000000 ;fill
!byte $e1,48


;,; *_100
;,; <- ibpcaablocks
; method 4 ( clrscr0 bytes ) -- 146 bytes (146 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 150 bytes (150 cumu)
; method 6 ( clrscr0 bytes ) -- 146 bytes (146 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 211 bytes (211 cumu)
; method 8 ( clrscr1 bytes ) -- 170 bytes (170 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 174 bytes (174 cumu)
; method 10 ( clrscr1 bytes ) -- 170 bytes (170 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 235 bytes (235 cumu)
; method 12 ( clrscr2 bytes ) -- 149 bytes (149 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 153 bytes (153 cumu)
; method 14 ( clrscr2 bytes ) -- 149 bytes (149 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 214 bytes (214 cumu)
; method 16 ( clrscr3 bytes ) -- 173 bytes (173 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 177 bytes (177 cumu)
; method 18 ( clrscr3 bytes ) -- 173 bytes (173 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 238 bytes (238 cumu)
; METHOD 4 CHOSEN
!byte $e4,1,chFFFFFFFFFFFFFFFF ; clrscr
;,; <- chFFFFFFFFFFFFFFFF ; 264
;,; <- ch0000000000000000 ; 240
; total unique chars in pic: 2 (worst case req 16 bytes)
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
!byte $01 ;data4
!byte $66
!byte $26
!byte $DA,$E1 ;addr
!byte $47,$02 ;fill
!byte $DB,$6E ;addr
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
!byte $4A,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $4A,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $4A,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $4A,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $4A,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $4A,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $4A,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $4A,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $4A,ch0000000000000000 ;fill
!byte $A3 ;skip
!byte $4A,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $4A,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $4A,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $4A,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $4A,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $4A,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $4A,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $4A,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $4A,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $4A,ch0000000000000000 ;fill
!byte $8B ;skip
!byte $4A,ch0000000000000000 ;fill
!byte $e1,24



;,; *_101
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 334 bytes (480 cumu)
; method 1 ( ibpc0 bytes ) -- 288 bytes (434 cumu)
; method 2 ( bytes ) -- 334 bytes (480 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 250 bytes (396 cumu)
; method 4 ( clrscr0 bytes ) -- 253 bytes (399 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 265 bytes (411 cumu)
; method 6 ( clrscr0 bytes ) -- 253 bytes (399 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 227 bytes (373 cumu)
; method 8 ( clrscr1 bytes ) -- 274 bytes (420 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 286 bytes (432 cumu)
; method 10 ( clrscr1 bytes ) -- 274 bytes (420 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 248 bytes (394 cumu)
; method 12 ( clrscr2 bytes ) -- 271 bytes (417 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 273 bytes (419 cumu)
; method 14 ( clrscr2 bytes ) -- 271 bytes (417 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 235 bytes (381 cumu)
; method 16 ( clrscr3 bytes ) -- 292 bytes (438 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 294 bytes (440 cumu)
; method 18 ( clrscr3 bytes ) -- 292 bytes (438 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 256 bytes (402 cumu)
; METHOD 7 CHOSEN
!byte $e4,1,ch0000000000000000 ; clrscr
;,; <- ch0000000000000000 ; 392
;,; <- ch000103070F1F3F7F ; 4
;,; <- ch0080C0E0F0F8FCFE ; 4
;,; <- chFFFFFFFFFFFFFFFF ; 72
;,; <- chFFFFFFFFFFFF0000 ; 2
;,; <- chFCFCFCFCFCFCFCFC ; 9
;,; <- ch3F3F3F3F3F3F3F3F ; 9
;,; <- ch000000000000FFFF ; 2
;,; <- ch7F3F1F0F07030100 ; 4
;,; <- ch0000FFFFFFFFFFFF ; 2
;,; <- chFEFCF8F0E0C08000 ; 4
; total unique chars in pic: 11 (worst case req 88 bytes)
!byte $DA,$00 ;addr
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
!byte $06 ;data4
!byte $11
!byte $11
!byte $11
!byte $22
!byte $11
!byte $11
!byte $11
!byte $48,$07 ;fill
!byte $06 ;data4
!byte $11
!byte $11
!byte $11
!byte $22
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
!byte $C7
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
!byte $C7
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
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $85 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $e1,24



;,; *_102
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 304 bytes (677 cumu)
; method 1 ( ibpc0 bytes ) -- 259 bytes (632 cumu)
; method 2 ( bytes ) -- 304 bytes (677 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 261 bytes (634 cumu)
; method 4 ( clrscr0 bytes ) -- 230 bytes (603 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 231 bytes (604 cumu)
; method 6 ( clrscr0 bytes ) -- 230 bytes (603 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 234 bytes (607 cumu)
; method 8 ( clrscr1 bytes ) -- 247 bytes (620 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 248 bytes (621 cumu)
; method 10 ( clrscr1 bytes ) -- 247 bytes (620 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 251 bytes (624 cumu)
; method 12 ( clrscr2 bytes ) -- 257 bytes (630 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 256 bytes (629 cumu)
; method 14 ( clrscr2 bytes ) -- 257 bytes (630 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 259 bytes (632 cumu)
; method 16 ( clrscr3 bytes ) -- 274 bytes (647 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 273 bytes (646 cumu)
; method 18 ( clrscr3 bytes ) -- 274 bytes (647 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 276 bytes (649 cumu)
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
!byte $e1,24



;,; *_103
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 164 bytes (767 cumu)
; method 1 ( ibpc0 bytes ) -- 181 bytes (784 cumu)
; method 2 ( bytes ) -- 164 bytes (767 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 210 bytes (813 cumu)
; method 4 ( clrscr0 bytes ) -- 143 bytes (746 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 119 bytes (722 cumu)
; method 6 ( clrscr0 bytes ) -- 143 bytes (746 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 184 bytes (787 cumu)
; method 8 ( clrscr1 bytes ) -- 156 bytes (759 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 132 bytes (735 cumu)
; method 10 ( clrscr1 bytes ) -- 156 bytes (759 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 197 bytes (800 cumu)
; method 12 ( clrscr2 bytes ) -- 140 bytes (743 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 118 bytes (721 cumu)
; method 14 ( clrscr2 bytes ) -- 140 bytes (743 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 183 bytes (786 cumu)
; method 16 ( clrscr3 bytes ) -- 153 bytes (756 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 131 bytes (734 cumu)
; method 18 ( clrscr3 bytes ) -- 153 bytes (756 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 196 bytes (799 cumu)
; METHOD 13 CHOSEN
!byte $e4,3,chFFFFFFFFFFFFFFFF ; clrscr
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
!byte $CE,$04 ;addr
!byte $e2,$ff;mode1
!byte $3D ;data1
!byte $FF
!byte $FF
!byte $00
!byte $FF
!byte $FF
!byte $00
!byte $FF
!byte $FF
!byte $00
!byte $FF
!byte $FF
!byte $00
!byte $FF
!byte $FF
!byte $00
!byte $FF
!byte $FF
!byte $00
!byte $FF
!byte $FF
!byte $00
!byte $E7
!byte $E7
!byte $00
!byte $E7
!byte $E7
!byte $00
!byte $E7
!byte $E7
!byte $00
!byte $E7
!byte $E7
!byte $00
!byte $E7
!byte $E7
!byte $00
!byte $FF
!byte $FF
!byte $00
!byte $FF
!byte $FF
!byte $00
!byte $FF
!byte $FF
!byte $00
!byte $FF
!byte $FF
!byte $00
!byte $FF
!byte $FF
!byte $00
!byte $FF
!byte $FF
!byte $00
!byte $FF
!byte $FF
!byte $00
!byte $FF
!byte $FF
!byte $00
!byte $FF
!byte $FF
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
!byte $e1,24



;,; *_104
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 556 bytes (1277 cumu)
; method 1 ( ibpc0 bytes ) -- 610 bytes (1331 cumu)
; method 2 ( bytes ) -- 556 bytes (1277 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 257 bytes (978 cumu)
; method 4 ( clrscr0 bytes ) -- 541 bytes (1262 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 599 bytes (1320 cumu)
; method 6 ( clrscr0 bytes ) -- 541 bytes (1262 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 234 bytes (955 cumu)
; method 8 ( clrscr1 bytes ) -- 551 bytes (1272 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 609 bytes (1330 cumu)
; method 10 ( clrscr1 bytes ) -- 551 bytes (1272 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 244 bytes (965 cumu)
; method 12 ( clrscr2 bytes ) -- 548 bytes (1269 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 599 bytes (1320 cumu)
; method 14 ( clrscr2 bytes ) -- 548 bytes (1269 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 234 bytes (955 cumu)
; method 16 ( clrscr3 bytes ) -- 558 bytes (1279 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 609 bytes (1330 cumu)
; method 18 ( clrscr3 bytes ) -- 558 bytes (1279 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 244 bytes (965 cumu)
; METHOD 7 CHOSEN
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



;,; *_105
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 584 bytes (1539 cumu)
; method 1 ( ibpc0 bytes ) -- 643 bytes (1598 cumu)
; method 2 ( bytes ) -- 584 bytes (1539 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 372 bytes (1327 cumu)
; method 4 ( clrscr0 bytes ) -- 537 bytes (1492 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 570 bytes (1525 cumu)
; method 6 ( clrscr0 bytes ) -- 537 bytes (1492 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 345 bytes (1300 cumu)
; method 8 ( clrscr1 bytes ) -- 564 bytes (1519 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 597 bytes (1552 cumu)
; method 10 ( clrscr1 bytes ) -- 564 bytes (1519 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 372 bytes (1327 cumu)
; method 12 ( clrscr2 bytes ) -- 566 bytes (1521 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 575 bytes (1530 cumu)
; method 14 ( clrscr2 bytes ) -- 566 bytes (1521 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 350 bytes (1305 cumu)
; method 16 ( clrscr3 bytes ) -- 593 bytes (1548 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 602 bytes (1557 cumu)
; method 18 ( clrscr3 bytes ) -- 593 bytes (1548 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 377 bytes (1332 cumu)
; METHOD 7 CHOSEN
!byte $e4,3,chFFFFFFFFFFFFFFFF ; clrscr
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
!byte $DA,$0F ;addr
!byte $47,$02 ;fill
!byte $8E ;skip
!byte $47,$02 ;fill
!byte $8E ;skip
!byte $e2,1;mode4
!byte $04 ;data4
!byte $22
!byte $42
!byte $24
!byte $22
!byte $32
!byte $8D ;skip
!byte $04 ;data4
!byte $22
!byte $42
!byte $74
!byte $22
!byte $32
!byte $8B ;skip
!byte $05 ;data4
!byte $31
!byte $22
!byte $42
!byte $44
!byte $27
!byte $32
!byte $8D ;skip
!byte $04 ;data4
!byte $22
!byte $42
!byte $44
!byte $27
!byte $32
!byte $86 ;skip
!byte $07 ;data4
!byte $31
!byte $33
!byte $33
!byte $23
!byte $22
!byte $44
!byte $77
!byte $22
!byte $8E ;skip
!byte $04 ;data4
!byte $22
!byte $42
!byte $77
!byte $27
!byte $32
!byte $8D ;skip
!byte $08 ;data4
!byte $22
!byte $72
!byte $77
!byte $27
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
!byte $4D,$01 ;fill
!byte $04 ;data4
!byte $22
!byte $22
!byte $77
!byte $22
!byte $12
!byte $DB,$80 ;addr
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
!byte $CE,$2A ;addr
!byte $e2,$ff;mode1
!byte $39 ;data1
!byte $80
!byte $00
!byte $20
!byte $40
!byte $00
!byte $70
!byte $20
!byte $04
!byte $E0
!byte $10
!byte $0E
!byte $70
!byte $10
!byte $1C
!byte $70
!byte $30
!byte $0E
!byte $60
!byte $50
!byte $0E
!byte $20
!byte $90
!byte $0C
!byte $20
!byte $90
!byte $04
!byte $70
!byte $90
!byte $04
!byte $78
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
!byte $00,chFFFFFFFFFFFFFFFF ;fill
!byte $95 ;skip
!byte $00 ;data8
!byte ch0000207070707020
!byte $92 ;skip
!byte $00 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte $95 ;skip
!byte $00 ;data8
!byte ch0000207070707020
!byte $9B ;skip
!byte $00 ;data8
!byte ch000F1F3F7F7F3F0F
!byte $85 ;skip
!byte $00 ;data8
!byte ch000103070F1F3F7F
!byte $8F ;skip
!byte $00 ;data8
!byte ch0F0F0F0F0F0F0F0F
!byte $85 ;skip
!byte $00 ;data8
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
!byte $89 ;skip
!byte $01 ;data8
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $93 ;skip
!byte $03 ;data8
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
!byte $e1,12



;,; *_106
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 139 bytes (1439 cumu)
; method 1 ( ibpc0 bytes ) -- 166 bytes (1466 cumu)
; method 2 ( bytes ) -- 139 bytes (1439 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 254 bytes (1554 cumu)
; method 4 ( clrscr0 bytes ) -- 546 bytes (1846 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 555 bytes (1855 cumu)
; method 6 ( clrscr0 bytes ) -- 546 bytes (1846 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 391 bytes (1691 cumu)
; method 8 ( clrscr1 bytes ) -- 576 bytes (1876 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 585 bytes (1885 cumu)
; method 10 ( clrscr1 bytes ) -- 576 bytes (1876 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 421 bytes (1721 cumu)
; method 12 ( clrscr2 bytes ) -- 571 bytes (1871 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 560 bytes (1860 cumu)
; method 14 ( clrscr2 bytes ) -- 571 bytes (1871 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 396 bytes (1696 cumu)
; method 16 ( clrscr3 bytes ) -- 601 bytes (1901 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 590 bytes (1890 cumu)
; method 18 ( clrscr3 bytes ) -- 601 bytes (1901 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 426 bytes (1726 cumu)
; METHOD 0 CHOSEN
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
!byte $AF ;skip
!byte $00 ;data4
!byte $24
!byte $96 ;skip
!byte $00 ;data4
!byte $24
!byte $91 ;skip
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
!byte $02 ;data4
!byte $74
!byte $77
!byte $22
!byte $91 ;skip
!byte $02 ;data4
!byte $74
!byte $77
!byte $22
!byte $91 ;skip
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
!byte $CE,$89 ;addr
!byte $42,ch0000000000000000 ;fill
!byte $93 ;skip
!byte $e2,0;mode8
!byte $03 ;data8
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $93 ;skip
!byte $03 ;data8
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $93 ;skip
!byte $02 ;data8
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $94 ;skip
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
!byte $e1,12



;,; *_107
;,; <- ibpcaablocks
; method 0 ( bytes ) -- 150 bytes (1589 cumu)
; method 1 ( ibpc0 bytes ) -- 189 bytes (1628 cumu)
; method 2 ( bytes ) -- 150 bytes (1589 cumu)
; method 3 ( ibpc0 ibpcaa bytes ) -- 269 bytes (1708 cumu)
; method 4 ( clrscr0 bytes ) -- 549 bytes (1988 cumu)
; method 5 ( clrscr0 ibpc0 bytes ) -- 573 bytes (2012 cumu)
; method 6 ( clrscr0 bytes ) -- 549 bytes (1988 cumu)
; method 7 ( clrscr0 ibpc0 ibpcaa bytes ) -- 357 bytes (1796 cumu)
; method 8 ( clrscr1 bytes ) -- 573 bytes (2012 cumu)
; method 9 ( clrscr1 ibpc0 bytes ) -- 597 bytes (2036 cumu)
; method 10 ( clrscr1 bytes ) -- 573 bytes (2012 cumu)
; method 11 ( clrscr1 ibpc0 ibpcaa bytes ) -- 381 bytes (1820 cumu)
; method 12 ( clrscr2 bytes ) -- 572 bytes (2011 cumu)
; method 13 ( clrscr2 ibpc0 bytes ) -- 578 bytes (2017 cumu)
; method 14 ( clrscr2 bytes ) -- 572 bytes (2011 cumu)
; method 15 ( clrscr2 ibpc0 ibpcaa bytes ) -- 362 bytes (1801 cumu)
; method 16 ( clrscr3 bytes ) -- 596 bytes (2035 cumu)
; method 17 ( clrscr3 ibpc0 bytes ) -- 602 bytes (2041 cumu)
; method 18 ( clrscr3 bytes ) -- 596 bytes (2035 cumu)
; method 19 ( clrscr3 ibpc0 ibpcaa bytes ) -- 386 bytes (1825 cumu)
; METHOD 0 CHOSEN
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
!byte $DA,$2A ;addr
!byte $e2,1;mode4
!byte $00 ;data4
!byte $22
!byte $95 ;skip
!byte $00 ;data4
!byte $22
!byte $95 ;skip
!byte $01 ;data4
!byte $72
!byte $22
!byte $93 ;skip
!byte $01 ;data4
!byte $72
!byte $27
!byte $92 ;skip
!byte $02 ;data4
!byte $22
!byte $77
!byte $22
!byte $91 ;skip
!byte $02 ;data4
!byte $72
!byte $77
!byte $22
!byte $91 ;skip
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
!byte $CE,$41 ;addr
!byte $e2,0;mode8
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
!byte $03 ;data8
!byte chFCFCFCFCFCFCFCFC
!byte ch0000000000000000
!byte chFFFFFFFFFFFFFFFF
!byte chFFFFFFFFFFFFFFFF
!byte $93 ;skip
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
