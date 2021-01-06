; päätepisteet bx,cx,dx  värit al,ah  rekursiomäärä di

recursepoly:    ; edges bx,cx,dx
                ; recursively divides a triangle (depth = di)
                ; in smaller triangles of colors al,ah and draws them
        pop bp
        pop dx,cx,bx ; kulmat ja väri
        push bp
r0:
        test di,di      ; out of recursions -> draw it
        je triangle

        cmp di,3        ; swap some edge coords. just for dEzIgN
        jc >c0
        xchg bx,dx
        c0:

        mov bp,2        ; loop twice (divide into two halves)
l0:     pusha

        push bx,dx      ; set one of the edges to a mediane vec
        add dl,cl
        rcr dl,1
        add dh,ch
        rcr dh,1
        pop bx,cx

        dec di
        call r0         ; recurse
        popa
        xchg cx,dx      ; blah
        inc ax
        xchg al,ah
        dec bp
        jne l0
        ret

triangle:               ; draws a constant-filled triangle
                        ; in a 256x256 buffer (at es:nnnn)
                        ; edges bx,cx,dx color ax
                        ; -- not quite accurate calx
        mov bp,ax
        mov ax,cx
        sub ax,dx
        add ax,16
        and ax,31
swizu:  ADD BP,AX

        cmp b[lazrfac+1],210  ; da thingie wildly changes
        if nc xor bp,cx       ; its colorz when the lazer bullet is near

        cmp bx,cx       ; y-sort
        if nc xchg bx,cx
        cmp bx,dx
        if nc xchg bx,dx
        cmp cx,dx
        if nc xchg cx,dx

        inc ch          ; prevent flattops
        inc dh

        mov ax,dx       ; line #0 (p0->p2)
        sub ah,bh
        sub al,bl
        call >s1        ; div
        mov di,ax       ; di=k02

        push dx   ;p2>
        push bp   ;col>

        mov ax,cx       ; line #1 (p0->p1)
        sub ah,bh
        sub al,bl
        call >s1        ; div
        mov bp,ax       ; bp=k01

        mov dh,bl       ; dx=si=p0x
        mov dl,0
        mov si,dx

        pop ax    ;col<
        mov ah,ch ;y1   ; ax=y1;col. bx=y0 already

        call >s0        ; draw upper half

        pop bx    ;p2<
        mov ah,bh
        push ax   ;y2;col>

        mov ax,bx       ; line #2 (p1->p2)
        sub ah,ch
        sub al,cl
        call >s1        ; div
        mov bp,ax       ; bp=k12

        pop ax    ;y2;col<
        mov bx,cx ;y1

     s0:push cx         ;;;;;;;;;;;;;; drawloop

     l0:cmp bh,ah
        je >o9

        add dx,di
        add si,bp

        mov bl,dh

        mov cx,si ;x1
        sub ch,dh ;x0
        jnc >c0
            neg cx
            std
     c0:mov bl,dh
        push di
        mov di,bx
        mov cl,ch
        mov ch,0
        inc cx
        rep stosb
        cld
        pop di

        inc bh
        jmp l0
     o9:pop cx
        ret

     s1:push cx,dx      ; kinda div subrtn
        mov cl,ah
        mov ah,al
        mov al,0
        mov ch,0
        cwd
        jcxz >c0
        idiv cx
     c0:pop dx,cx
        ret

