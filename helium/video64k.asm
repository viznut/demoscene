; set 256x256x256 chained

; IN:   cx=14  256x256x256
;       cx=9   400line
;       cx=6   minimal tweak
;       cx=0   mcga!!!

        push cx
        mov ax,013       ; mcga
        int 010
        pop cx
        jcxz ret

         mov dx,03c4

        mov si,data65536
        cmp cl,14
        jne >c0

         inc cx

         mov ax,0100    ; seq off
         out dx,ax

         mov dl,0c2  ;# ; 25mhz, 60hz
         mov al,0e3
         out dx,al

         mov dl,0c4  ;# ; seq on
         mov ax,0300
         out dx,ax

c0:     mov dl,0d4   ;#
        mov ds,cs
        rep outsw
        ret

data65536:

                ; unprotect registers; screen width 256; yretrace end

        dw 02c11 ; ; unprotect regs; yretr end (bits0-4)
        dw 02013 ; ; 32x8 bytes/scanline
        dw 03f02 ; ; xblank (256 pix)

                ; 400 scanlines

        dw 04009 ; ; pixel height 1
        dw 01707 ; ; overflows (3e minus svb8 = 36)
        dw 0ff15 ; ; yblank start

                ; x centering

        dw 04701 ; ; xdisplay end
        dw 04b04 ; ; xretr start  ; 4f-6=4b
        dw 09b05 ; ; xret end etc  (f->b)

                ; y centering for 256 scanlines

        dw 04109 ; ; p”hm”
        dw 03e07 ; ; overflows ; vrs9.vde9.vto9.lcmp8 : svb8.vrs8.vde8.vto8
        dw 00d06 ; ; ytotal
        dw 0ff12 ; ; ydisp end
        dw 0ff10 ; ; yretr start
        dw 00616 ; ; yblank end

