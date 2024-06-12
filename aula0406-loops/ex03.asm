.data

.text

.globl main

main:

    li $t0, 0 # total = 0


inicio:
    li $v0, 5 # 5 = read_int
    syscall   # leitura de i (esta em $v0)

    slt $t1, $zero, $v0 # if (0 < i) t1 = 1 else t1 = 0
    beq $t1, $zero, fim # if (0 < i) goto fim

    add $t0, $t0, $v0 # total = total + i
    j inicio

fim:

    add $a0, $t0, $zero # $a0 = total
    li $v0, 1 # 1 = print_int
    syscall
