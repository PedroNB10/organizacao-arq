# I) Escreva, em MIPS assembly, um programa que leia dois valores A e B e passe-os como parâmetros para 
# um subprograma que computa e devolve a soma dos valores no intervalo [A, B]. Em sua resposta, imprima 
# apenas o valor da soma. Não imprima outras mensagens de texto para indicar entrada/saída de dados. 


.data

.text

.globl main

main:
    # le o primeiro valor
    li $v0, 5
    syscall

    # armazena o valor em a0
    move $a0, $v0

    # le o segundo valor
    li $v0, 5   
    syscall    

    # armazena o valor em a1
    move $a1, $v0

    jal subprograma_soma


    # armazenar resultado (retorno do subprograma)

    # armazena o valor de v0 em a0 para ser impresso
    move $a0, $v0

    # carrga o endereço para impressão de um valor inteiro
    li $v0, 1
    syscall


    # finaliza o programa
    li $v0, 10
    syscall



# a0 = primeiro valor
# a1 = segundo valor
# v0 = retorno
subprograma_soma:

    # remove qualquer valor que tenha em v0
    li $v0, 0

    add $v0, $a1, $a0
    jr $ra

