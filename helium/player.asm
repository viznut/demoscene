initadlib:

        mov ax,244              ; clear regs
        mov di,offset adlib
     l0:call di
        dec ax
        jne l0

        mov ax,02001            ; enable waveforms
        call di
        mov si,adlibstring      ; init with instrdata
        mov cx,8+8
     l0:lodsw                   ; 3 chns each
        call di
        inc ax
        call di
        inc ax
        call di
        loop l0
        ret

player: pusha
        mov di,player

        mov cx,(4*4*256)+0a3    ; melody basechn & baseoct

t0:     mov bx,0                ; melody seq
        musapat0 equ t0+1
t0:     mov si,0                ; notecounter 0..15
        notecnt equ t0+1

        test bx                 ; seq#0 = nosound
        je >c1

l1:     mov bl,[si+bx+musaseqs-16]      ; next note

        test bl                 ; <0: none
        js >c1

t0:     add bl,0                ; add n halftones
        musaoff equ t0+2

        mov dh,3                ; phys.ch += notecounter mod 3
        mov ax,si
        idiv dh
        mov al,ah

        add al,cl               ; chn += basechn

        mov dl,ch               ; oct += baseoct
     l0:cmp bl,12
        jc >c0
                sub bl,12       ; note overflow -> inc oct
                add dl,4
                jmp l0
        c0:

        mov ah,[bx+freqs]       ; freq
        call adlib

        add al,010              ; key off
        mov ah,dl
        call adlib

        or ah,020               ; key on
        call adlib

    c1: cmp cl,0a0              ; done drums?
        je >c1
             t0:mov bx,6*8      ; no -> do drums
               musapat1 equ t0+1
               mov cx,(3*4*256)+0a0
               jmp l1

        ;;;;;;;;;;;;;;;;;;;;; after all chnz ..-

    c1: inc si                  ; inc notecounter
        cmp si,16
        jne >c0

             t0:xor b[di-player+musapat1],0     ; next drumseq
                xor b[di-player+t0+3],6*8 xor 8*8

             t0:mov si,seqlist
                seqcnt equ t0+1
             l0:lodsb                   ; nextseq data
                cbw
                test ax
                jns >c3                 ; sign: loop back n
                    add si,ax
                    jmp l0
             c3:push ax                 ; else
                  and al,15             ; nextseq offset = 8*al.low
                  shl ax,3
                  mov w[di+musapat0-player],ax
                pop ax                          ; noteadd = al.high
                shr ax,4
                mov b[di-player+musaoff],al

                mov w[di-player+seqcnt],si ; save seqcount
                xor si,si                  ; notecount=0
        c0:
        mov w[di-player+notecnt],si        ; save notecount
        popa
        ret

adlib:          ; ax=data.addr
pusha

 mov dx,0388

 out dx,al
   mov cx,6+1
   t1:in al,dx
   loop t1

 mov al,ah

 inc dx
  out dx,al
 dec dx
   mov cl,35+2
   t2:in al,dx
   loop t2
popa
ret

freqs:  db 02ae/8
        db 016b/4
        db 0181/4
        db 0198/4
        db 01b0/4
        db 01ca/4
        db 01e5/4
        db 0202/4
        db 0220/4
        db 0241/4
        db 0263/4
        db 0287/4

adlibstring:

dw 02020,0a123          ; drums
dw 0f660,0f363  ; ad
dw 0b180,00383  ; sr
dw 001e3
dw 006c0        ; fdbak

dw 00128,0a42b          ; melody
dw 0c368,0536b  ; ad
dw 08e88,08f8b  ; sr
dw 001e8
dw 008c3

