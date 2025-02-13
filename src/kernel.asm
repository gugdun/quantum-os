org 1000h

jmp start

include 'font.asm'
include 'text.asm'

start:
    ; setup stack
    ldwi sp, 2000h
    
    ; setup puts interrupt
    ldwi r1, puts
    ldbi r2, 42h
    ldbi r3, 1
    shl  r2, r3
    stw  r1, r2

    ; print message
    ldwi r1, hello
    ldbi r2, 2
    ldbi r3, 2
    ldbi r4, 11001101b
    ldwi r5, font
    int 42h

    hlt

hello db 'Hello, World!', 0
