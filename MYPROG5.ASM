TITLE MYPROG5
DOSSEG
.MODEL SMALL
.STACK 0100h
.DATA
     X DB "Jolly$"
     Y DB "Happy!$"
     Z DB 0Ah, 0Dh, "$"
.CODE
     MOV AX, @DATA
     MOV DS, AX

     MOV AH, 09h
     MOV DX, OFFSET X
     INT 21h
     MOV DX, OFFSET Z
     INT 21h

     MOV AH, 02h
     MOV DL, 'b'
     INT 21h

     MOV AH, 09h
     MOV DX, OFFSET Z
     INT 21h

     MOV AH, 02h
     MOV DL, 'e'
     INT 21h

     MOV AH, 09h
     MOV DX, OFFSET Z
     INT 21h
     MOV DX, OFFSET Y
     INT 21h

     MOV AX, 4C00h
     INT 21h
END  