TITLE MYPROG1.ASM
DOSSEG
.MODEL SMALL
.STACK 0100H
.DATA
.CODE
        MOV AX,@DATA
        MOV DS,AX

        MOV AH,02H
        MOV DL,'9'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        MOV CX,000AH
 A:     INT 21H
        DEC DL
        LOOP A

        MOV AX,4C00H
        INT 21H
END
        
