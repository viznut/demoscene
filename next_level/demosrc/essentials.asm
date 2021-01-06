;,; essentials

;,; <- unusable0 .pos=$0400 .sz=$0c00
;,; <- unusable1 .pos=$2000 .sz=$7400
;,; <- unusable2 .pos=$9800 .sz=$6800

;,; &- irqvector .pos=$0314 .sz=2
;,; &- nmivector .pos=$0318 .sz=2
;,; <- stackspace .pos=$01E0 .sz=32
;,; <- colmem .sz=504 .pos=$9600
;,; <- scrmem .sz=504 .pos=$1e00

;,; &- framer
;,; &- loader
;,; &- irqhandler
;,; &- voice_interrupt
;,; &- player

