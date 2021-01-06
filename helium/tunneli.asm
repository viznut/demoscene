calctuntab: ;;;;;;;;;;;;;;;;;;;;; 115 bytes w/o calcsqrt&recursepoly
            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
pusha
push ds,es

mov ax,cs       ; temp = videobuf
add ah,16
mov es,ax

mov cx,256              ; draws a filled circle divided in 256 sectors
mov dx,bx,0fe77         ; with color=angle (2pi == 256)
mov si,sintable

l0:     mov dx,bp               ; edge2=prev sin&cos
        mov bp,bx

        lodsw
        mov bl,ah               ; edge0=next sin&cos
        mov bh,[si+126+1]
        add bx,08080

        pusha
        mov al,ah,cl
        mov di,1
        push bx,dx
        push 08080              ; edge1=origo
        call recursepoly
        popa

        loop l0

mov ds,es       ; ds=cs+16x4k   temptab
mov ax,cs       ; es=cs+32x4k   final tunneltab
add ah,32
mov es,ax    ; -> copy the circle into the finaltab area
             ;    2x zoomed at 128,128
             ;    write the point<->center distance to every other byte

mov si,04040
xor di,di

;       cx=0 already

l0:     mov al,cl       ; distance
        sub al,128
        imul al
        mov bx,ax

        mov al,ch
        sub al,128
        imul al
        add bx,ax

        je >c0
        js >c0
           call calcsqrt
     c0:mov ax,bp

        movsb           ; distance
        stosb           ; angle

        dec ch
        je >c0
        dec ch
        jne l0
     c0:
        add si,128
        test cl,1
        if ne sub si,256
        loop l0

        mov ax,cs       ; clr da tunnel texture segm
        add ah,040
        mov es,ax
        xor ax,ax
        mov cx,32768
        rep stosw

pop es,ds
popa
ret

drawtunnel:
        pusha
        push ds,es

        mov ax,cs
        add ah,030
        mov ds,ax       ; ds = bitmap   cs+$3000
        add ah,010
        mov es,ax       ; es = tunmap   cs+$4000

        xor di,di

t0:     mov si,0
        tunoff equ t0+1

        mov bx,07fff      ; pHuRst addition
t0:     mov bp,1          ; yloop
        tunlgt equ t0+1

        cmp bp,210        ; 256x210 texture fills the whole screen
        if nc mov bp,210

l0:     mov ax,bx
        sar ax,5
        sub bx,ax

        push si,bx
          add bx,bx
          mov bl,0
          add si,bx
          cmp si,0ff00          ; prevent movsw when si==0ffff
          if nc sub si,0ff00    ; compatibility suxxxx!!!!!!
          mov cx,128
          rep movsw
        pop bx,si
        dec bp
        jne l0

        inc ch  ;cx=256
        mov ax,0c0c0    ; da nice yellow hyperborder
        rep stosw

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        xor bx,bx       ; IKSPLOOSON!
                        ; (do some xors&adds in the tunnel bitmap)
     l1:
     t0:mov al,0            ; -> ax=actual hgth
            explofac equ t0+1
        test al
        je >c1
        mov dx,bx
        add dl,b[cs:timer]
        ror dl,3
        and dl,15
        xor al,dl
        je >c1
        mov ah,al
           mov bh,0
           l0:or w[es:bx],ax;add
              add w[es:bx],ax
              inc bh
              dec al
              jne l0
    c1:inc bl
       jne l1

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

o0:     push es         ; ds = tunmap cs+3000
        pop ds

        mov ax,cs       ; es = output cs+1000
        add ah,010
        mov es,ax
        add ah,010      ; fs = tuntab cs+2000
        mov fs,ax

        xor bx,bx
        mov di,65534

l0:     movsw           ; dA hOLY dRAWLOOP
        mov esi,[fs:bx]
        movsw
        shr esi,16
        add bx,4
        jne l0

c0:     pop es,ds
        popa
        ret

