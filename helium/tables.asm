; da evil command language

;     { byte delay; /* in 1/18.2-sex */
;       commandcode; }

;          |
;          |
;         \ /
;          v

;       1;txt;0         set text (neg vals = go down H*16, left L*16)
;       2..5            fade in/out
;       6;byte          set fxbits
;          1            starfield
;          2            vec.engine
;          4            phongball
;          8            use bg image (instead of clearing scr)
;          16           gokhlop picture
;          32           tunnel
;          128          gokhlop eye mode (all da text blink)
;                       128+64 = no sTarBaTTLE aiming grid
;       7;paldata;0     set palette
;                       inits with 0,0,0
;                       db howmanycols, r_add, g_add, b_add
;                       where r/g/b max is 255 (not 63)
;       8;objdata       set object
;                       db numfaces
;                       db col1,col2, vtx0,vtx1,vtx2
;                                     vertexnums are like 4x8x8 coords
;       9  ;addr        recall a command (like a subroutine)
;       10              precalc phongball
;       11              calc a cheezeplanet image
;       12 ;a;b;c;z     set 3d rotator values (db angles a,b,c; db zoom)
;       13 ;da;db;dc;dz set 3d rotator deltas
;       14              calc tunneltab
;       15              init the tunnel
;       16              lazer gun
;       17              explosion
;       18              textcolor
;       19              fAkEgOurAuD on/off
;       else            end demo

dezign: ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        db 0 ;;;;;;;;;;;;;;;;;;
defapalli:
        db 7                    ; the first palette
        ;     b g r
        db 16,5,2,4     ; 0..96
        db 16,2,6,1
        db 16,-7,-2,-3
        db 16,2,0,2
        db 16,8,-4,0
        db 16,-8,2,0
        db 32,6,3,1
        db 32,-6,-2,-1
        db 32,3,4,5
        db 32,-3,-3,-5

        db 16,7,2,1
        db 16,-7,4,-2

lametext:
        db 0
        db 0,6,1                ; starfields
        db 0,2                  ; fadein

        db 16
        db 1,-022,"in",-011,"the",-011,"year",-047,"897392",-022,".. .",0

        db 48
        db 1,-026,"a",-011,"xillion",-012,"light",-010,"years"
        db -03b,"away .. .",0

        db 32,2         ; fadeout

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        db 16,10        ; prephongball

        db 16,6,4+1     ; phongball+stars
        db 0,1,0        ; no text
        db 0,2          ; fadein

        db 16
        db 1,-058,"a",-028,"tiny",-010,"planet",-02e,"shines",-018,"..",0
        db 80,1,-016,"lonely",0
        db 16,1,-042,"peaceful",0
        db 16,1,-071,"impossible",0
        db 16,1,0
        db 16,1,-077,"...",-030,"sigh",0
        db 16,2         ; fadeout

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        db 16,11        ; calc da planet image

        db 16,6,8       ; show it
        db 0,2          ; fadein
        db 0,1,-065,"'hELiUM'",-036,"asm'97 pc 4k",0
        db 0,19
        db 10,14         ; calc tUNNELTAB
        db 72-10,2       ; ..& fadeout

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        db 32
        db   13,66,16,62,1        ; vec init pos
        db 0,12,3,0,7,26          ; vec rotodeltaz
        db 0,6,1+2                ; vex on
        db 0,1,0                  ; no text
        db 0,2                    ; fadeiN

        db 16,1,-011,"patrol ship $F6",-011,"scanning ..",0
        db 64-16,12,3,2,7,0       ; zooming stops

        db 16,12,0,0,0,0          ; rotation ztopzz
        db 0,1," hey,",-02c,"what's that?",0

        db 32,1,-045,"*gasp*",0   ; da great escape
        db 0,12,12,8,20,-104

        db 14,6,0                ; blank for a sec
        db 0,1,0

        db 10,                    ; new rotoxiez
        db   13,66+64,55,-80-64,01a
        db 0,12,-7,-11,0,-20
        db 0                      ; da evil ship
gokhship:db 8,12

        db 051,015,     101q,104q,162q       ; warpengine #0
        db 051,015,     101q,162q,002q
        db 051,015,     104q,162q,002q

pvalo0: db 0c0,0b7,     101q,104q,002q       ; rear lightz

        db 051,015,     104q,107q,166q       ; warpengine #1
        db 051,015,     104q,166q,006q
        db 051,015,     107q,166q,006q
pvalo1: db 0c0,0b7,     104q,107q,006q       ; rear lightz

        db 051,015,     131q,137q,174q       ; torso
        db 051,015,     131q,174q,234q
        db 051,015,     137q,174q,234q
pvalo2: db 0c0,0b7,     131q,137q,234q       ; rear lightz

        db 0,6,1+2                           ; fx back on
        db 0,1,-021,"the",-01f,"EVIL",-010,"gokhlops",0

        db 56,2                              ; fadeout

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        db 32,
        db   15,1                            ; tUNNEL init
        db 0,13,66,16,62,01a      ; vec init pos
        db 0,12,2,6,5,-20
        db 0
patship:db 8,8

shipc:;=default obby, the brave patrol ship

db      0a0,088,        120q,214q,242q  ; pohja   ; 0<->1
db      0a0,088,        160q,274q,242q
db      0a0,088,        214q,274q,246q
db      0a0,088,        214q,274q,242q

db      0c0,060,        224q,246q,044q  ; kupu
db      0c0,060,        264q,246q,044q
db      0c0,060,        224q,242q,044q
db      0c0,060,        264q,242q,044q

        db 0,6,34                            ; tunnel+vex
        db 0,2
        db 0,1,-024,"entering",-025,"hyberwormtunnel",0

        db 64,2

        db 32,
        db    13,66+64,55,-95-64,018         ; da evil
        db  0,12,-7,-11,0,-20 ;^-75
        db  0,9
        dw    offset gokhship
        db  0,6,32+2+16
        db  0,2
        db  0,1,-023,"this is",-017,"captain qzzfw",-014,"speaking",0

        db 64,1,-014,"you are",-017,"violating the",-012,"helium squidoid"
        db      -013,"civil rights",0
        db 16,6,32+16
        db 32+16,1,-013,"your world",-017,"will be",-017,"exbobolated",0
        db 64,1,0

        db 32,2
        db 32
gokhpalli:      ; the red/yellow gOkhlop viewpoint
        db 7
                db 64, 0,0,2
                db 32, 0,1,2
                db 62, 0,1,1
                db 66, 1,1,0
                db 32, 3,2,0
                db 0
        db 0,6,32+2
        db 0,2

        db 0,9
        dw offset patship
        db 0,13,66,16,62,1
        db 0,12,7,8,0,10;7
        db 0,19 ;fAKeGoURaUD
        db 0
alientext:
        db 1,32,  7,21,9,32,15,25,25,28,0

        db 32,6,32+2+128

        db 64-16,1,32,25,25,24,0
        db 8,16                ; FEUERHH!!
        db 16,12,5,-15,-5,-40
        db 0,6,32+2
        db 16,1,0

        db 16,12,7,8,1,25
           db 32,9
           dw alientext
        db 16,6,32+2+128
        db 16,16
        db 0,1,0
        db 0,6,32+2
        db 16,17                ; eKSPLOOSON
        db 0,6,32
        db 64,2 ;koe!

        db 16,6,4+2+1
        db 0,10     ; prephongball

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        db 48,9         ; dA sHiP lANdS on dA pHonGbALL
        dw offset gokhship
        db 0,9
        dw offset defapalli
        db 0,13,66+64,55,-95-64,01a
        db 0,12,2,-1,0,-24
        db 0,2
        db 64,2

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        db 16,6,4+1+16+64
        db 0,13,0,0,0,018
        db 0,12,6,2,1,0
        db 16,9
           dw gokhpalli
        db 0,2
        db 0,18,0f0
        db 0,1,-028,"there's",-022,"a small gokhlop",0
        db 64,1,-022,".. living",-026,"in your head",0
        db 64,1,-025,"listen",-028,"how it cries:",0
        db 64,1,-035,"HELIUM",0
        db 0,6,4+1+16+128+64

        db 64,2
        db 16,080

;;;;;;;;;;;;;;;;;;;;;;;;;;;; MUSiC ;;;;;;;;;;;;;;;;;;;;;;;;;;

k equ 255
musaseqs:

;$2
                db 12,k,k,k,19,k,12,k,24,k,12,k,19+12,k,12,k     ;$02
;$4
                db 12,k,15+12,k,19+12,k,12,15+12
                db 19+12,12,15+12,19,12+12,12,15+12,19+12
;$6
                db 12,12,24,12,24,k,12,k,24,12,24,k,12,k,12,k
;$8
                db 12,12,24,12,24,k,12,24,12,k,12,24,12,k,17,k

                db 000
seqlist:        db 000,050,030
                db     032,032
                db     052,053
                db     032,032
                db     033,002
                db     000,000
                db     040,050
                db     054,054
                db     074,074
                db     044,014
                db     004,003, -21

vecpic0:

        db 19                   ; # polys

        db 0d1,0d7,064,088,08d  ; dgreen fACE  ;pfiip

        db 0b2,0b6,0e1,002,003  ; bLACk mOUTH
        db 0e1,0e7,0b6,002,003

        db 0b2,0b3,0c2,070,073  ; cyan teeth
        db 0b3,0b5,0c4,070,073
        db 0b5,0b6,0c6,070,073

        db 0d2,0e1,0e3,070,073
        db 0d4,0e3,0e5,070,073
        db 0d6,0e5,0e7,070,073

        db 0b2,0e1,0d0,088,08d  ; jawz
        db 0b6,0e7,0c8,088,08d

        db 0e1,0e7,0f2,088,08d  ; joopsi
        db 0f2,0f6,0e7,088,08d

        db 022,017,072,088,08d  ; dgreen forehead
        db 086,017,072,088,08d

        db 061,092,064,0c0,0b6  ; yellow iCe
        db 061,064,053,0c0,0b6

        db 075,068,096,0c0,0b6
        db 075,068,056,0c0,0b6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; eMPTY tABLES

tab0:

paltemp:    dw 3*768 dup ?
sintable:   dw 256+64 dup ?
unitvex:    dw 3*3 dup ?
vertexgrid: db 256*3 dup ?
anglez:     dw 3*2 dup ?

tab1: ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
tablgt equ tab1-tab0

tempstore:

