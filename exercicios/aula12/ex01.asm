# I) Escreva, em MIPS assembly, um programa que leia dois valores A e B e passe-os como parâmetros para 
# um subprograma que computa e devolve a soma dos valores no intervalo [A, B]. Em sua resposta, imprima 
# apenas o valor da soma. Não imprima outras mensagens de texto para indicar entrada/saída de dados. 


.data

.text
.globl main
# COMEÇO MAIN
main:

    # Leitura do valor
    li $v0, 5 # v0 = 5 (ler inteiro)
    syscall # valor lido está em v0

    # Armazenar o valor lido em a0
    add $a0, $a0, $v0 # a0 = a0 + v0

    # Leitura do valor
    li $v0, 5 # v0 = 5 (ler inteiro)
    syscall # valor lido está em v0

    # Armazenar o valor lido em a1
    add $a1, $a1, $v0 # a1 = a1 + v0

    # Chamada da função soma
    jal soma

    # o valor de retorno está em v0, então usamos o registrador a0 para imprimir o resultado
    addi $a0, $v0, 0 # a0 = v0 + 0

    # imprimir resultado
    li $v0, 1 # v0 = 1 (imprimir inteiro)
    syscall

    # fim do programa
    li $v0, 10 # v0 = 10 (sair)
    syscall


# FIM MAIN


# COMEÇO FUNÇÃO SOMA
.data
.text

# recebe dois argumentos em a0 e a1
# retorna a soma dos valores em v0
soma:

    # armazenar a soma em a0
    add $a0, $a0, $a1

    # armazenar a soma em v0
    li $v0, 1 # serve para armazenar o valor da soma, mas também armazena 1 no registrador v0 (cuidado)
    add $v0, $zero, $a0 # v0 = a0 + 0, (nova atribuição, pois v0 era igual a 1)
    
    # retorno da função para o main
    jr $ra

# FIM FUNÇÃO SOMA