;,; SC40_000 .waits=4
;,; <- ibpcaablocks
;,; <- player_ivars
;;,; <- player_songdata
!src "demosrc/smac.inc"

+s8bpc
+sAddr chptr+2
!byte $02
!byte shap_start-songdata
!byte melo_start-songdata;muteseq-songdata
!byte muteseq-songdata;muteseq-songdata

!byte $e4,2,chFFFFFFFFFFFFFFFF
!byte $e1,192
!byte $e4,3,chFFFFFFFFFFFFFFFF
!byte $e1,192
!byte $e4,2,chFFFFFFFFFFFFFFFF
!byte $e1,192
!byte $e4,3,chFFFFFFFFFFFFFFFF
!byte $e1,192
