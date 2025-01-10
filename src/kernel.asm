include 'commands.inc'

org 1000h

jmp start

include 'font.asm'
include 'text.asm'

start:
    ; setup stack
    ldwi sp, 2000h

    ; print message
    ldwi r1, hello
    ldwi r2, 2
    ldbi r3, 2
    ldbi r4, 11001101b
    ldwi r5, font
    call puts

    hlt

hello db 'Hello, World!', 0
