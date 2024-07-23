TITLE MYPROG2.ASM
DOSSEG
.MODEL MEDIUM
.STACK 0100H
.DATA
        x DB "English Alphabets$"
        y DB "Progam Ends Here!$"
.CODE
        MOV AX, @DATA
        MOV DS, AX

        MOV CX, 001Ah
        MOV AH, 02h
        MOV DX, OFFSET x
        MOV DL, 0Ah
        INT 21h
        MOV DL, 0Dh
        INT 21h
        MOV DL, 'A'

 A:     INT 21H
        MOV BL, DL
        MOV DL, 0Ah
        INT 21h
        MOV DL, 0Dh
        INT 21h
        MOV DL, BL
        INC DL
        LOOP A

        MOV AH,09h
        MOV DX,OFFSET y
        INT 21H                                                                                                                                                                                                                                                                                                                                                                                                                                                

        MOV AX,4C00H
        INT 21H
END                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
