.data
msg: .asciiz "teste"
.text
.globl main



main:


    li $v0, 5
    syscall

    add $t0, $v0, $zero

    add $a0, $a0, $t0

    li $v0, 1
    syscall

    la $a0, msg
    li $v0, 4
    syscall



