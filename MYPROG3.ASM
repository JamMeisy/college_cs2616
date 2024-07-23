TITLE MYPROG2.ASM
DOSSEG
.MODEL SMALL
.STACK 0100H
.DATA
.CODE
        MOV AX, @DATA
        MOV DS, AX

        MOV CX, 9h
        MOV DL, '9'
        MOV AH, 02H

 A:     MOV BX, CX     ; Initializing inner loop
 B:     INT 21h
        LOOP B

        MOV CX, BX     ; Back to outer loop
        MOV BL, DL     ; Commands for spacing
        MOV DL, 0Ah
        INT 21h
        MOV DL, 0Dh
        INT 21h
        MOV DL, BL
        DEC DL
        LOOP A

        MOV AX,4C00H
        INT 21H
END            