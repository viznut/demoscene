; suffer, you tasm sukkerz!  use nasm or a386
; this one compiles only through a386 though

db "VIZNUT'97"          ; signature
			; does something, pushes 4 extra bytes

;	segmentation:

;	cs+$0000	 code, all the smaller tabs
;	cs+$1000	 videobuffer
;	cs+$2000	 effect precalc tab (sphere/tunnel)
;	cs+$3000	 bground gfx or something
;	cs+$4000	 tunnel texture temp

cld			; reset sumthing
xor ecx,ecx

call init65536		; read commandline, init video, possibly disable
			; audio

call initadlib		; init audio

mov es,cs		; zero out some tablez (ihan varulta)
xor ax,ax
mov cx,tablgt
mov di,tab0
rep stosb

mov es,cs		; precalc sinus table with 2d rotation
mov cx,256+64
xor si,si
mov bx,32767
mov di,sintable
l0: mov ax,si
    stosw
    call roto2d
    loop l0

call hookint8		; init da timing

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; dEMO MAiNLOOP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; dEMO MAiNLOOP
;;;;;;			  ;;;;;;; dEMO MAiNLOOP
	     mainloop:	  ;;;;;;; dEMO MAiNLOOP
;;;;;;			  ;;;;;;; dEMO MAiNLOOP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; dEMO MAiNLOOP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; dEMO MAiNLOOP

	mov es,ds,cs

     t0:mov si,dezign		; program catches da int-updated timer
	dezipoint equ t0+1
     l9:mov w[dezipoint],si	; db timeadd
	xor ax,ax
	lodsb
	shl ax,2		; timeadd*4
     t0:add ax,0		; +last_time
	cmp ax,w[timer] 	; if not reached it yet
	if a jmp ho9		;    -> draw da frame and loop back

mov w[t0+1],ax			; else: update last_time
push l9 ; return addr

su0: lodsb			; #1  set textstring (1;txt;0)
     cmp al,1
     jne >c0

	mov w[txtloc],si
	l0:lodsb
	   test al,al
	   jne l0
	retn

  c0:cmp al,6			; #2..#5 fade palette in/out
     jnc >c0

	mov bx,ax

	  mov di,paltemp+768	; zero out palette fraction part
	  xor ax,ax
	  mov cx,768
	  push cx
	  rep stosb
	  pop cx

	xor b[fadedir],014 xor 01c ; sbb<->adc == fadein<->fadeout

	mov b[fadetym],64	; int8 fadeloop: 64 cycles to go!
	retn

  c0:jne >c0			; #6  set fx control rEgIStERs

	  lodsb
	  mov b[switches],al
	  retn

  c0:cmp al,8			; #7  set palette (7;paldata;0)
     jnc >c0

	  call setpal
	  inc si
	  retn

  c0:jne >c0			; #8  set 3dobject (8;numfaces;facelist)

	  lodsb
	  mov b[numfaces],al
	  mov w[facelist],si
	  cbw
	  imul ax,5
	  add si,ax
	  retn

  c0:cmp al,10			; #9  recall command at address xxxx
     jnc >c0			;     like a subroutine

	  lodsw
	  push si
	  mov si,ax
	  call su0
	  pop si
	  retn

  c0:jne >c0			; #10 precalc sphere ztable

	  push es
	  mov ax,cs
	  add ah,32
	  mov es,ax
	  call prephongball
	  pop es
	  retn

  c0:cmp al,12			; #11 calculate a fukken beautiful
     jnc >c0                    ; planet image/tunneltexture/etcetc

	  push ds,es,si

	  mov dx,bp,si,80	; set some lightvec
	  mov ax,cs
	  add ah,32
	  mov ds,ax
	  add ah,16
	  mov es,ax

	  xor ax,ax		; clear the area
	  xor di,di
	  mov cx,32768
	  rep stosw

	  call dophongball	; calc a phongball image there

	  xor cx,cx
       l0:mov bx,cx
	  and bx,01f1f
	  sub bx,01010
	  mov al,[di]		; do something like
	  and al,63		; abs(x-hmx)+abs(y-hmy)+abs(z-hmz)
	  sub al,32
	  cbw
	  xor al,ah
	  mov dl,al
	  mov al,bl
	  cbw
	  xor al,ah
	  add dl,al
	  mov al,bh
	  cbw
	  xor al,ah
	  add al,dl
	  imul b[es:di] 	; color =
	  shr ax,6		;  phongballcolor * texturecolor
	  stosb
	  loop l0

	  pop si,es,ds		; jups
	  retn

  c0:jne >c0			; #12  set 3drotator deltaz sb a,b,c,z

	  mov di,delta
	  movsb
	  lodsb
	  mov b[di-1-delta+deltb],al
	  lodsb
	  mov b[di-1-delta+deltc],al
	  lodsb
	  mov b[di-1-delta+deltz],al
	  retn

  c0:cmp al,14			; #13  set 3drotator values db a,b,c,z
     jnc >c0

	  mov di,anglez
	  mov cx,3
       l0:lodsb
	  cbw;??
	  add ax,ax
	  stosw
	  loop l0
	  lodsb
	  shl ax,8
	  mov w[zoomrate],ax
	  retn

  c0:jne >c0			; #14  calculate tunnel lookuptab
     jmp calctuntab

  c0:cmp al,16			; #15  set tunnel length
     jnc >c0                    ;      (incs automatically, for the
                                ;       'entering tunnel' part)
	  lodsb
	  mov ah,0
	  mov w[tunlgt],ax
	  retn

  c0:jne >c0			; #16  fire!!!

	  mov b[lazrfac+1],4
	  retn

  c0:cmp al,18			; #17  explode!!!
     jnc >c0

	  mov b[explofac],255
	  retn

  c0:jne>c0			; #18  set text color (or smthng)

	  lodsb
	  mov b[txtcol],al
	  retn

  c0:cmp al,20			; #19  switch fAkeGoURaUD on/off
     jnc>c0

	  xor w[swizu],0e803 xor 09090	; some add <-> nop nop
	  retn

  c0:	pop ax			; #n (anything else) = demo endz!
	jmp finale

ho9: ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;;;;;;;;;;;;;;;;;;;;;;;;;;; FX HANDLER ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

t0:	MOV BX,0		; effect cOntRoL bITS
	switches equ t0+1

;;;;;;;;;;;;;;;;; init videobuffer with sumthng

mov ax,cs	; defaults: ds=cs; es=videobuf
mov ds,ax
add ah,16
mov es,ax

test bl,32	; &32: draw tunnel
je >c0
        push >c9
        jmp drawtunnel
c0:

xor edi,edi	; else ...
mov ecx,16384

test bl,8	; &8: use bground image (@ cs+$3000)
je>c1
	add ah,020
	mov ds,ax
	xor esi,esi
	rep movsd
	jmp>c9
c1:
	xor eax,eax
	rep stosd
c9:

;;;;;;;;;;;;;;;;; &1: draw a parallax starfield

test bl,1
je>c0
push bx

t0:mov dx,0	; add theze to every star's coordinates
   starposx equ t0+1
t0:mov bx,05c16
   starposy equ t0+1

   mov cx,8	; next_star_offset = last_star_offset
		; added/xorred with various values
l1:push bx
   mov bl,dh
   mov di,bx

   mov al,033
l0:add di,ax
   add di,cx
   xor ax,05c16
   stosb
   dec ch
   jne l0

   pop bx
   shl bx,1
   shl dx,1

   loop l1

pop bx
c0:

;;;;;;;;;;;;;; rotations: calc a grid of rotated 8x8x4 (256) vertices

	push bx
	mov es,ds,cs
     t0:mov bx,01a00
	zoomrate equ t0+1
	call dounitvex
	pop bx

;;;;;;;;;;;;;;; &4: phongball!!!

test bl,4
je>c0
	push bx

	mov ds,cs

	mov si,011q*3+offset vertexgrid ; get da lightvec angle
	lodsb
	  cbw
	  mov bp,ax
	lodsb
	  cbw
	  mov dx,ax
	lodsb
	  cbw
	  mov si,ax

	mov ax,cs
	add ah,32
	mov ds,ax
	sub ah,16
	mov es,ax	; ds=ztab, es=out

	call dophongball

	pop bx
c0:

;;;;;;;;;;;;;;; &64: da last effect, da phongball enhancement

test bl,64
je>c0
	push ds,es

	mov ax,cs
	add ah,010	; cs+1000 = videobuf
	mov es,ax
	add ah,020	; cs+3000 = planet image
	mov ds,ax

	xor esi,esi	; ... sum them
	xor di,di
	mov cx,16384
	 l0:lodsd
	    add d[es:di],eax
	    lodsd
	    add d[es:di+4],eax
	    add di,8
	    jne l0

	pop es,ds
c0:

;;;;;;;;;;;;;;;;; &2: draw the 3d object

test bl,2
je>c0

push bx
t0:mov cx,8
numfaces equ t0+1
t0:mov si,shipc
facelist equ t0+1
call draw3d
pop bx

;;;;;;;;;;;;;;;;; lazzer gun

c0:	mov ax,cs	; hmm
	add ah,010
	mov es,ax

	mov cx,128
	mov di,08080
	mov dx,0ffff

l0:	mov ax,0	; lazerfaktor
	lazrfac equ l0+1
	cmp dx,ax
	jnc >o0
		sub ah,24;<-ray length
		cmp dx,ax
		jc >o0

		pusha
		mov al,dh
		add al,ah
		xor al,170
		xor cl,07f
		shr cx,2
		inc cx
		  pusha
		  rep stosb
		  popa
		xor di,0ff
		std
		  pusha
		  rep stosb
		  popa
		cld
		popa

o0:	mov al,dh
	mov ah,0
	sub dx,ax
	sub dx,ax
	add di,255
	loop l0

;;;;;;;;;;;;;;;;; &16: add da evil gokhlop head

test bl,16
je>c0

	mov ax,cs
	mov ds,ax
	add ah,16
	mov es,ax

t0:	mov si,vecpic0
	vecsrc equ t0+1

	xor cx,cx
	lodsb		; # of ptz in da image
	mov cl,al

	mov dx,b[timer]
	shr dx,1
	test dl,010
	if e not dx
	and dl,0f
	sub dl,8

     l1:pusha
	mov ch,3

     l0:lodsb		; pointz (db 3 dup ?)

	shl ax,4
	shl ah,4

	cmp ah,0d0	; da lowest points go up'n'down
	if nc sub ah,dl
	push ax
	dec ch
	jne l0

	mov di,4
	lodsw		; colors
	call recursepoly

	popa
	add si,5
	loop l1
c0:

mov ax,cs	; joopsis
add ah,010
mov ds,ax

test bl,bl	; &128: gokhlop eye mode
jns >c1
test bl,64	; &64 simultaneously: don't draw the AiMiNG gRiD
jne >c2

	mov bx,08000
     l0:test bl,7
	je >c0
	xor b[bx],0ff
	xchg bh,bl
	xor b[bx],0ff
	xchg bh,bl
     c0:inc bl
	jne l0
c2:		; all the texts blink in g.E.M
cs test b[timer],16
je >d0
c1:

;;;;;;;;;;;;;;;;; text writer

xor di,di
t0:mov si,lametext
   txtloc equ t0+1

	mov ax,01130	; es:bp=romfont8x16
	mov bh,6	; ds=screenbuf
	int 010 	; es=romfont

     l2:cs lodsb
	cbw
	test al,al
	jz >o0
	jns >c0

	    neg ax
	    shl ax,4
	    shl ah,4
	    add di,ax
	    jmp l2

     c0:shl ax,4

	push si
	mov si,ax
	add si,bp

	mov bx,16
     l1:es lodsb

	mov dx,8
     l0:cbw
     t0:and ah,0b0
	txtcol equ t0+2
	or  [di],ah
	inc di
	or  [di],ah
	inc di
	shl ax,1
	dec dx	;tuopois?!??!
	jne l0

	add di,255-16

	dec bx
	jne l1

	pop si
	sub di,16*255-16

	jmp l2

d0:  o0:

;;;;;;;;;;;;;;;;; da frame is complete -> blit it

mov ax,cs
add ah,16
mov ds,ax
push 0a000
pop es

xor edi,edi
xor esi,esi

t0:mov al,0
   mcgako equ t0+1
test al
jne >c0

mov cx,16384		; 256-width blit
rep movsd
jmp >c9

c0:			; 320-width blit
	mov dx,200
	mov si,0400
    l0: add di,32
	  mov cx,64
	  rep movsd
	add di,32
	dec dx
	jne l0
c9:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

in al,060	      ;~; esc check
cbw			;
dec ax			;
jnz mainloop	      ;_;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;:;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;:;;;

finale:
mov ds,cs
lds dx,[oldint]       ;~; unhook int8 handler, reset freq
xor ax,ax		;
call timerset	      ;_;

mov ax,3		; back 2 da golden textmode
xor bx,bx
int 010

mov ds,cs

mov ah,9		; view some krapphh
mov dx,endtxt
int 021

call initadlib
pop ax,ax		; pop extraz
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

include polygon.asm	; polygon routinez
include int8.asm	; int8 handler
include player.asm	; muzax player

init65536:
	mov si,081	; check commandline
	mov cx,dx,14
l0:	lodsb
	cmp al,13
	je >c0
	and al,255-32

	cmp al,'S'      ; (s)ilence
	if e xor b[adlib],060 xor 0c3 ; pusha<->retn

	cmp al,'4'-32   ; (4)00 lines
	if e mov dl,9

	cmp al,'2'-32
	jne >c5
		mov dl,0
		mov b[mcgako],1
	c5:
	cmp al,'M'      ; (m)inimal tweak
	if e mov dl,6

	loop l0
c0:
	; a real dEmO should also do a ram/cpu check

	mov cx,dx	; set videomode
	include video64k.asm

setpal:
        mov di,paltemp  ;es     ;si=source

        xor ax,ax
        mov cx,0300
        rep stosw

l2:     mov cl,[si]
        jcxz >o0

l1:     mov bx,3

l0:     mov al,[di-3]   ; di=raw pal data
        add al,[si+bx]  ; si=sRcdAtA (da incrementation factor)
        stosb
        dec bx
        jne l0

        loop l1

        add si,4
        jmp l2
o0:     ret

endtxt: db "code by viznut - vheikkil@hytti.uku.fi - released at asm'97"

	db 10,10,13
	db "usage: helium <options>",10,13
	db "where",10,13
	db "2=200 lines (mcga)",10,13
	db "4=400 lines",10,13
        db "s=silence",10,13
	db "$"

include rotate.asm
include tunneli.asm
include phngball.asm
include tables.asm

