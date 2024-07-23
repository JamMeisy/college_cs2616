TITLE ACT2
DOSSEG
.MODEL SMALL
.STACK 0100H
.DATA
        buffer db 100, ?, 100 dup('$')
        output db 100
.CODE
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 0AH
        LEA DX, buffer
        INT 21H

        MOV BX, OFFSET buffer + 1
        MOV DI, OFFSET output

transfer:   
        MOV DL, byte [BX]
        CMP DL, 20h
        JE next
        CMP DL, 0dh
        JE next
        CMP DL, 24h
        JE next

        SUB DL, 20H
        MOV [DI], DL
        INC BX
        INC DI
        JMP transfer

next:   MOV AH, 02H
        MOV DL, 0AH
        INT 21h
        MOV DL, 0DH
        INT 21h

        MOV [DI], '$'
        MOV AH, 09H
        MOV DX, OFFSET output
        INT 21h

        MOV AX, 4C00H
        INT 21H
END
        