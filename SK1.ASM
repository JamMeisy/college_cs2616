TITLE SkillTest1
DOSSEG
.MODEL SMALL
.STACK
.DATA
    fullname DB "Full Name: ", "Jam Meisy Tan", 0DH, 0AH, "$"
    id DB "Student ID: ", "2022-171093", 0DH, 0AH, "$"
    course DB "Course: ", "Computer Science", 0DH, 0AH, "$"
.CODE
    MOV AX, @DATA
    MOV DS, AX
    MOV AH, 09H
    MOV DX, OFFSET fullname
    INT 21H
    MOV DX, OFFSET id
    INT 21H
    MOV DX, OFFSET course
    INT 21H

    MOV AX, 4C00H
    INT 21H
END