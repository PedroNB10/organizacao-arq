# F) Escreva, em MIPS assembly, um programa que leia um inteiro N e mostre os N primeiros números
# ímpares. Imprima os números em uma linha, separados entre si por um único espaço. Não imprima outras
# mensagens de texto para indicar entrada/saída de dados. Atenção: se o usuário informar um valor N = 4, a
# resposta deve ser: 1 3 5 7

.data
espaco: .asciiz " " # espaço

.text

.globl main


main:

    # Leitura do valor de N
    li $v0, 5       # syscall para leitura de um inteiro
    syscall

    add $s1, $s1, $v0 # s1 = s1 + N -> s1 armazena o valor de N

    li $t0, 1       # t0 = 1 -> t0 armazena o valor 1
    li $t1,0       # t1 = 0 -> t1 armazena o valor 0, será o contador de números ímpares

inicio:

    # Verifica se o contador de números ímpares é igual ao valor de N
    beq $t1, $s1, fim

    
    
    li $v0, 1       # syscall para imprimir um inteiro
    li $a0, 0       # Inicializa $a0 = 0 para a syscall de impressão de inteiros
    add $a0, $a0, $t0 # a0 = a0 + t0 -> a0 armazena o valor do número ímpar
    syscall

    li $v0, 4      # syscall para imprimir um caractere
    la $a0, espaco  # carrega o endereço de espaco
    syscall

    addi $t0, $t0, 2 # t0 = t0 + 2 -> t0 armazena o valor do próximo número ímpar

    addi $t1, $t1, 1 # t1 = t1 + 1 -> t1 armazena o valor do contador de números ímpares

    j inicio # goto para o início do loop

fim: