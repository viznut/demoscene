dophongball:    ; lightvec = bp.si.dl
                ; ztable   = ds:nnnn
                ; out      = es:nnnn

        lea bx,[bp+si]  ; -128*(lx+ly) ..
        shl bx,7
        neg bx          ; .. inits (x*lx+y*ly)

        xor cx,cx
        xor di,di

     l1:push bx
     l0:mov al,[di]     ; z
        test al,al
        js >c0          ; imaginary?

        imul dl         ; z*lz
        add ax,bx       ; + (x*lx+y*ly)
        mov al,ah
        add al,64

        stosb
        add bx,bp       ; (x*lx+y*ly) += lx
        dec ch
        jne l0
        jmp>o8
     c0:inc di
        add bx,bp
        dec ch
        jne l0

     o8:pop bx
        add bx,si       ; (x*lx+y*ly) += ly
        loop l1
        ret

prephongball:   ; out      = es:nnnn

        xor cx,cx
        xor di,di

     l0:mov bx,122*122  ; r^2

        mov al,cl       ; -y^2
        sub al,128
        imul al
        sub bx,ax

        mov al,ch       ; -x^2
        sub al,128
        imul al
        sub bx,ax       ; =z^2

        mov al,0ff
        js >c0          ; no roots?
        je >c0
          call calcsqrt ; bp=sqrt(bx)=z
          mov ax,bp
     c0:stosb

        loop l0
        ret

calcsqrt:               ; fixed point sqrt  bp=sqrt(bx)
        push cx
        mov cx,8
        mov bp,1
     l0:mov ax,bx
        push dx
        cwd
        div bp
        pop dx
        add bp,ax
        sar bp,1
        loop l0
        pop cx
        ret

