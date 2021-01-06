!byte $80,$c0,$e0,$f0,$f8,$fc,$fe,$ff	; char $20 HERE      
!byte $ff,$fe,$fc,$f8,$f0,$e0,$c0,$80	; char $21 HERE      
!byte $ff,$7f,$3f,$1f,$0f,$07,$03,$01	; char $22 HERE      
!byte $ff,$61,$31,$19,$0d,$07,$03,$01	; char $23 HERE      
!byte $ff,$ff,$ff,$ff,$3f,$0f,$03,$00	; char $24 HERE      
!byte $01,$03,$07,$0f,$1f,$00,$00,$00	; char $25 HERE  ; hum      
!byte $fc,$fc,$b4,$84,$fc,$fc,$cc,$b4	; char $26 HERE      
!byte $e3,$c1,$c1,$c1,$c1,$c1,$c1,$c1	; char $27 HERE      
!byte $00,$00,$ff,$ff,$ff,$ff,$ff,$ff	; char $28 HERE      
!byte $01,$03,$07,$0f,$1f,$3f,$7f,$ff	; char $29 HERE     





; $25: suu:   $01 $03 $07 $0f $1f ...
;             $00 $00 $00 $00 $00 

; $28: leuka: $00 $00 $00 $00 $00 ...
;             $ff $ff $ff $ff $ff

; suun asema: y=1..7

; suu liikkuu ylös:
;     lda #$ff ^ sta $1800+$25*8,y ^ dey
;    

; $1800+25*8


; todo: 

z