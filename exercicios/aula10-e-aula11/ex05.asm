# E) Escreva, em MIPS assembly, um programa que leia um inteiro N e implemente um contador regressivo,
# mostrando na tela os números de N até 1. Imprima os números em uma linha, separados entre si por um
# único espaço. Não imprima outras mensagens de texto para indicar entrada/saída de dados.

.data
espaco: .asciiz " " # espaço

.text

.globl main

main:
    # Leitura do valor de N
    li $v0, 5       # syscall para leitura de um inteiro
    syscall

    add $s1, $s1, $v0 # s1 = s1 + N -> s1 armazena o valor de N
inicio:
    # Verificar se o contador é zero
    beq $s1, $zero, fim # se contador == 0, fim

    # Imprimir o valor do contador
    li $a0, 0       # Inicializa $a0 = 0 para a syscall de impressão de inteiros
    add $a0, $a0, $s1 # a0 = a0 + s1
    li $v0, 1       # syscall para imprimir um inteiro
    syscall

    la $a0, espaco  # carrega o endereço de espaco
    li $v0, 4      # syscall para imprimir um caractere
    syscall

    # Decrementar o contador
    addi $s1, $s1, -1 # contador = contador - 1

    # Voltar ao início do loop
    j inicio

fim:
