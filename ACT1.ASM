TITLE ACT1
DOSSEG
.MODEL SMALL
.STACK 0100H
.DATA
        input db 100 dup('$')
.CODE
        mov ax, @data
        mov ds, ax
        mov si, offset input

        mov ah, 01h     ;   Input character until carriage return is detected
read:   int 21h
        cmp al, 0dh
        je x
        mov [si], al
        inc si
        jmp read

x:      mov [si],'$'    ;   Preliminary steps before writing
        mov ah, 02h
        mov di, offset input

write:  mov dl, [di]    ;   Writes until $ is detected
        cmp dl, 24h
        je done         ;   Jumps on $ detection
        
        int 21h         ;   Otherwise, print character and space
        inc di
        mov dl, 20h     
        int 21h
        jmp write

done:   mov ah, 4ch
        int 21h
END
        
