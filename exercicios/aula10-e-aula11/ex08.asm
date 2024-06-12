# H) Escreva, em MIPS assembly, um programa que leia um inteiro N e mostre o seu fatorial. Imprima
# apenas o valor do fatorial como resposta. Não imprima outras mensagens de texto para indicar
# entrada/saída de dados.


.data
.text

.globl main

main:

    li $t0, 1 # t0 = i
    li $t1, 1 # t1 = fatorial

    li $v0, 5
    syscall

    add $t2, $zero, $v0 # t2 = N

    loop:

        beq $t0, $t2, end
        addi $t0, $t0, 1
        mul $t1, $t1, $t0
        j loop

    end:

    li $v0, 1
    add $a0, $zero, $t1
    syscall
