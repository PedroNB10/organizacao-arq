# G) Escreva, em MIPS assembly, um programa que leia um inteiro N e mostre a soma dos números de 1
# até N (inclusive). Não deixe o usuário inserir um valor de N menor ou igual a zero. Nesse caso, continue
# lendo valores N, até que um valor positivo seja digitado. Imprima, como resposta, apenas o valor da soma.
# Não imprima outras mensagens de texto para indicar entrada/saída de dados.


.data
.text

.globl main

# t1 = soma
# t2 = i
# t3 = i <= N (verdadeiro ou falso)

main:

    do1:
        li $v0, 5
        syscall

    while1:
    
        slti $t0, $v0, 1 #  se N <= 0 ==> N < 1
        bne $t0, $zero, do1 # se N > 0

    end_do_while1:

        li $t1, 0 # soma = 0
        li $t2, 1 # i = 1

    while2:
        addi $s0, $v0, 1 # N + 1

        slt $t3, $t2, $s0 # i <= N
        beq $t3, $zero, end_while2 # se i > N

        add $t1, $t1, $t2 # soma = soma + i
        addi $t2, $t2, 1 # i = i + 1
        j while2

    end_while2:


        li $v0, 1
        add $a0, $zero, $t1
        syscall




