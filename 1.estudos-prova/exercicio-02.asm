# A) Escreva, em MIPS assembly, um programa que leia um único valor inteiro digitado pelo usuário e
# informe se o valor digitado é positivo ou negativo. Em sua resposta, imprima apenas as palavras
# “positivo” ou “negativo”. Não imprima outras mensagens de texto para indicar entrada/saída de dados.


.data
msg1: .asciiz "negativo"
msg2: .asciiz "positivo"
.text

.globl main


main:

    li $v0, 5
    syscall



    if:
        beq $v0, $zero, fim_do_programa


    if2:
        # verifica se é menor que zero
        slti $t0, $v0, 0

        # se v0 < 0 vai pro else2
        beq $t0, $zero, else2

    then2:
        la $a0, msg1

        li $v0, 4
        syscall
        j fim_do_programa


    else2:
        la $a0, msg2

        li $v0, 4
        syscall
    

    fim_do_programa:


