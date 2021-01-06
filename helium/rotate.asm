draw3d: ;;;;;;;;;;;;;;; draws the obutin ; cx=numfaces; si=facelist
        mov es,ds,cs

        push cx
        push cx

        mov di,tempstore

     l1:push cx

        movsw                           ; set colors

        mov cl,3
        xor dx,dx
     l0:lodsb                           ; vertexnum
        mov ah,0
        imul bx,ax,3

        mov ax,[vertexgrid+bx]          ; vertex.xy
        add ax,08080
        stosw

        mov al,[vertexgrid+2+bx]        ; zed+= vertex.z
        cbw
        add dx,ax

        loop l0
        pop cx

        mov ax,dx                       ; store face.zed +something
        add ah,16 ; tuttu
        stosw
        loop l1                         ; next face

        ;;; ;;; ;;;

        mov ax,cs       ; joo.
        add ah,16
        mov es,ax

        pop bp  ; numfaces
        pop bx

     l1:mov cx,bp                       ; get da highest zed
        xor dx,dx
        mov si,tempstore
     l0:add si,4*2
        lodsw
        cmp ax,dx
        jc >c0                          ; max so far
                mov dx,ax
                mov di,si
     c0:loop l0                         ; chekk all

        mov w[di-1*2],cx                ; zero it out

        pusha
        push d[di-4*2]          ; vtx0-1
        push w[di-2*2]          ; vtx2
        mov ax,w[di-5*2]        ; colz
          mov di,3
          call recursepoly
        popa

        dec bx                          ; get da next face
        jne l1

        ret

dounitvex: ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        xor cx,cx               ; bx=unitlength, cx=si=0
        xor si,si

        mov di,unitvex
        push di         ; to be popped

l0:     push bx,cx,si   ; originalz (1/0/0)

        push di         ; rotate tHem
        mov di,anglez
        call rotopart
        xchg bx,si
        call rotopart
        xchg cx,si
        call rotopart
        pop di

        mov ax,bx
        mov dx,cx
        mov bp,si
        stosw           ; sAVE
        mov [di],cx
        mov [di+2],si

        add di,4

        pop si,cx,bx    ; >originalz

        push bp,dx,ax

        xchg bx,si
        xchg cx,si
        test bx,bx
        je l0

dovertexgrid: ;;;;;;;;;;; generate a vec3dgrid 8x8x4 -> di
                        ; using the rotated unit vectors just calced

        pop ax,bx,dx    ; pop initial axbxdx hmm
        mov cx,2
     l0:pop bp          ; x=4ix+4jx+2kx
        shl bp,1
        add ax,bp
        pop bp          ; y=4iy+4jy+2ky
        shl bp,1
        add bx,bp
        pop bp          ; z=4iz+4jz+2kz
        shl bp,1
        add dx,bp
        loop l0

        shl ax,1
        shl bx,1
        shl dx,1

        ;       ;       ;

        inc ch  ; cx=256
        pop si  ; unitvex
        mov di,vertexgrid

        push ax,bx,dx   ; push sumthing
        push ax,bx,dx

     l0:xor bp,bp       ; recurselevel=0

     s0:sub ax,[si]
        sub bx,[si+2]
        sub dx,[si+4]
        test cl,7
        jne >c0
            pop dx,bx,ax        ; restore the old vals
                add si,6
                shr cx,3
                inc bp
                jne s0;jmp      ; recurse to da higher unitvec
             r1:sub si,6
                shl cx,3
            push ax,bx,dx
     c0:dec bp
        jns r1  ; return from recursion

        mov [di],ah     ; store vals
        inc di
        mov [di],bh
        inc di
        mov [di],dh
        inc di

        loop l0

        add sp,12
        ret

rotopart: ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

push bx                 ; get angle
mov bx,[di]             ; & rewrite sin/cos vals
and bx,510      ;!!!
mov ax,[bx+sintable+128]
mov w[rcos],ax
mov ax,[bx+sintable]
mov w[rsin],ax
pop bx
inc di                  ; next
inc di

roto2d: ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

call >s0          ; cos*X+sin*Y
add bp,dx
push bp

call >s0          ; cos*Y-sin*X
sub bp,dx

mov bx,bp         ; y=cos*Y-sin*X
pop si            ; x=cos*X+sin*Y
ret

s0: ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

t0:mov ax,32757         ; these initial sin&cos vals
   rcos equ t0+1        ; are those of 2pi/256 (for the sinus gen)
imul si
mov bp,dx
t0:mov ax,804
   rsin equ t0+1
imul bx
xchg si,bx
add bp,bp
add dx,dx
ret

