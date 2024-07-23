TITLE ACT4
DOSSEG
.MODEL SMALL
.STACK 0100H
.DATA
        fullname db 100, ?, 100 dup('$')
        output db 100
        email db '@gmail.com$'
.CODE
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 0AH
        LEA DX, fullname
        INT 21H

        MOV BX, OFFSET fullname + 1
        MOV DI, OFFSET output

        MOV AH, 02H             ; Initializing next line
        MOV DL, 0AH
        INT 21h
        MOV DL, 0DH
        INT 21h

first:  MOV DL, byte [BX]
        INT 21H

fcheck: INC BX
        MOV DL, byte [BX]
        CMP DL, 20h
        JNE fcheck

mid:    INC BX
        MOV DL, byte [BX]
        INT 21H

mcheck: INC BX
        MOV DL, byte [BX]
        CMP DL, 20h
        JNE mcheck                

last:   INC BX
        MOV DL, byte [BX]
        CMP DL, 0Dh
        JE mail
        INT 21H
        JMP last
        

mail:   MOV AH, 09H
        MOV DX, OFFSET email
        INT 21H

        MOV AX, 4C00H
        INT 21H
END