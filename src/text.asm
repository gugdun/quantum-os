; r1 - string, r2 - x, r3 - y, r4 - color, r5 - font
puts:
    ; save registers used in this procedure
    push r1
    push r2
    push r6
    push r7
    push r8
    ; copy string pointer to r8
    mov  r8, r1
.putc_loop:
    ; load character and check if it is 0
    ldb  r1, r8
    ldbi r7, 0
    je   r1, r7, .end
    call putc
    ; move to next X and increase string pointer
    ldbi r7, 8
    add  r2, r7
    inc  r8
    jmp .putc_loop
.end:
    ; restore used registers and return
    pop  r8
    pop  r7
    pop  r6
    pop  r2
    pop  r1
    ret

; r1 - char, r2 - x, r3 - y, r4 - color, r5 - font
putc:
    ; save registers used in this procedure
    push r1
    push r6
    push r7
    push r8
    push r9
    ; r6 - current row, r7 - current column
    ldbi r6,  0
    ldbi r7,  0
    ldbi r8,  20h
    sub  r1,  r8
    ldbi r8,  8
    mul  r1,  r8
.row_loop:
    ; calculate bitmap row pointer
    mov  r8,  r1
    add  r8,  r6
    add  r8,  r5
    ldb  r9,  r8
    ; check if current column bit is set
    ldbi r8,  8
    sub  r8,  r7
    shr  r9,  r8
    ldbi r8,  1
    and  r9,  r8
    jne  r9,  r8, .skip
    ; calculate framebuffer offset and draw
    ldbi r8,  160
    mov  r9,  r3
    add  r9,  r6
    mul  r8,  r9
    add  r8,  r2
    add  r8,  r7
    ldwi r9,  8000h
    add  r8,  r9
    stb  r4,  r8
.skip:
    ; check if all columns are drawn
    inc  r7
    ldbi r8,  8
    jne  r7,  r8, .row_loop
    ; check if all rows are drawn
    ldbi r7,  0
    inc  r6
    jne  r6,  r8, .row_loop
    ; restore used registers and return
    pop r9
    pop r8
    pop r7
    pop r6
    pop r1
    ret
