.data
newline: .asciiz "\n" # nova linha

.text

.globl main

main:
    # Leitura do valor de N
    li $v0, 5       # syscall para leitura de um inteiro
    syscall
    li $s0, 0       # Inicializa $s0 para uso posterior
    add $s0, $s0, $v0 # N = valor lido (armazena em $s0)

    # Inicializar o contador com N
    li $s1, 0       # Inicializa $s1 para uso posterior
    add $s1, $s1, $s0 # contador = N

inicio:
    # Verificar se o contador é zero
    beq $s1, $zero, fim # se contador == 0, fim

    # Imprimir o valor do contador
    li $a0, 0       # Inicializa $a0 para uso posterior
    add $a0, $a0, $s1 # move o valor do contador para $a0 (argumento para a syscall de impressão)
    li $v0, 1       # syscall para imprimir um inteiro
    syscall

    # Imprimir um espaço (ASCII 32)
    li $a0, 32      # espaço em ASCII
    li $v0, 11      # syscall para imprimir um caractere
    syscall

    # Decrementar o contador
    addi $s1, $s1, -1 # contador = contador - 1

    # Voltar ao início do loop
    j inicio

fim:
    # Imprimir uma nova linha no final
    la $a0, newline # carrega o endereço de newline
    li $v0, 4       # syscall para imprimir uma string
    syscall

    # Terminar o programa
    li $v0, 10      # syscall para terminar o programa
    syscall
