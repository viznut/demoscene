hookint8:
mov ds,cs
mov si,offset oldint
lodsw                   ; 3508
int 021                 ; bx:es = old 8vector
lodsw                   ; 4000
mov w[si-4],bx          ; save old vec to da jmpfar
mov w[si-2],es

mov dx,timehandler      ; set new vec & clockrate

timerset:
cli
  mov al,036            ; clock
  out 043,al
  mov al,0
  out 040,al
  mov al,ah
  out 040,al
  mov ax,02508          ; vec
  int 021
sti
ret

timehandler:

pusha
push ds
cld

mov ds,cs

;;;;;;;;;;;;;;;;;;;;;;;;;

inc w[starposx]           ; starfield faktorz
add w[starposy],2

add w[tunoff],256+3       ; tunnel faktorz
inc w[tunlgt]

test b[lazrfac+1],0ff     ; lazergun faktorz
if ne add b[lazrfac+1],4

test b[explofac],0ff
if ne dec b[explofac]

t0:add w[anglez],1        ; rotation anglez
        delta equ t0+4
t0:add w[anglez+2],2
        deltb equ t0+4
t0:add w[anglez+4],6
        deltc equ t0+4
t0:add w[zoomrate],0
        deltz equ t0+4

t0:mov ax,0               ; palette fade cycles left
fadetym equ t0+1
test ax
jz >o0
      dec w[fadetym]

      mov si,paltemp

      mov dx,03c8
      xor ax,ax
      out dx,al
      inc dx
      mov cx,768
l0:   lodsb                   ; current
      mov ah,[si+768*2-1]     ; new
      add [si+768-1],ah       ; fraction+=new
      t0:sbb al,0       ;adc
        fadedir equ t0
      mov [si-1],al           ; cur+=fraxxonz overflow
      out dx,al
      loop l0
o0:

t0:mov ax,0                   ; inc timer
timer equ t0+1
inc w[timer]

test al,7                     ; every 8 cycles..
jne >c5
        xor w[pvalo0],0b7c0 xor 0e000   ; * switch the rear lights in
        xor w[pvalo1],0b7c0 xor 0e000   ;   the gokhlop ship
        xor w[pvalo2],0b7c0 xor 0e000
        call player                     ; * play a tick of muzax
c5:

test al,3                     ; if cycles &3 = 1,2,3...

mov al,020                    ; return with iret
out 020,al
pop ds
popa
jne >c0
t0:jmp far 04000:03508        ; else return to da original vec
oldint EQU t0+1
c0:
iret

