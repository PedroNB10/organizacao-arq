# L) Escreva, em MIPS assembly, um programa que leia 4 valores inteiros e os armazene em um array A. A
# seguir, leia 6 inteiros e os armazene em um array B. Crie um subprograma que compute e retorne quantos
# elementos estão presentes em A e B simultaneamente. O main deve imprimir a resposta. Não imprima
# outras mensagens de texto para indicar entrada/saída de dados.

.data
    arrayA: .space 16   # array A de 4 inteiros (4 * 4 = 16 bytes)
    arrayB: .space 24   # array B de 6 inteiros (6 * 4 = 24 bytes)
.text
.globl main


main:
    # Leitura dos valores para o array A
    la $a0, arrayA        # Carrega o endereço do array A em $a0
    li $a1, 4             # Tamanho do array A
    jal leitura_array     # Chama a função leitura_array

    # Leitura dos valores para o array B
    la $a0, arrayB        # Carrega o endereço do array B em $a0
    li $a1, 6             # Tamanho do array B
    jal leitura_array     # Chama a função leitura_array

    # Chama a função que conta os elementos comuns
    la $a0, arrayA        # Carrega o endereço do array A em $a0
    la $a1, arrayB        # Carrega o endereço do array B em $a1
    li $a2, 4             # Tamanho do array A
    li $a3, 6             # Tamanho do array B
    jal conta_comuns      # Chama a função conta_comuns

    # Imprime o resultado
    add $a0, $v0, $zero   # Passa o resultado para a função print_int
    li $v0, 1             # Código para imprimir inteiro
    syscall               # Realiza a impressão

    # Fim do programa
    li $v0, 10            # Código para encerrar o programa
    syscall               # Termina o programa


# Subprograma que lê inteiros e os armazena em um array
leitura_array:
    li $t0, 0             # Inicializa o contador em 0

loop_leitura:
    slt $t1, $t0, $a1     # Verifica se o contador é menor que o tamanho do array
    beq $t1, 0, fim_leitura  # Se o contador não for menor, termina o loop

    li $v0, 5             # Syscall para ler um inteiro
    syscall

    sll $t2, $t0, 2       # Calcula o deslocamento (t0 * 4)
    add $t2, $a0, $t2     # Calcula o endereço do elemento atual
    sw $v0, 0($t2)        # Armazena o valor lido no array

    addi $t0, $t0, 1      # Incrementa o contador
    j loop_leitura        # Repete o loop

fim_leitura:
    jr $ra                # Retorna para a função chamadora

# Subprograma que conta quantos elementos estão presentes em A e B simultaneamente
conta_comuns:
    li $t0, 0             # Inicializa o contador para array A
    li $t6, 0             # Inicializa o contador de comuns

loop_A:
    slt $t1, $t0, $a2     # Verifica se o contador de A é menor que o tamanho de A
    beq $t1, 0, fim_conta # Se o contador não for menor, termina o loop

    sll $t2, $t0, 2       # Calcula o deslocamento (t0 * 4) e armaeza em $t2
    add $t2, $a0, $t2     # Calcula o endereço do elemento atual de A e armazena em $t2
    lw $t3, 0($t2)        # Carrega o valor atual de A

    # Inicia o loop para array B
    li $t4, 0             # Inicializa o contador para array B
    
loop_B:
    slt $t5, $t4, $a3     # Verifica se o contador de B é menor que o tamanho de B
    beq $t5, 0, fim_loop_B # Se o contador não for menor, termina o loop

    sll $t7, $t4, 2       # Calcula o deslocamento (t4 * 4)
    add $t7, $a1, $t7     # Calcula o endereço do elemento atual de B
    lw $t8, 0($t7)        # Carrega o valor atual de B

    # Compara os valores de A e B
    beq $t3, $t8, found   # Se os valores são iguais, incrementa o contador de comuns
    j next_B

found:
    addi $t6, $t6, 1      # Incrementa o contador de comuns

next_B:
    addi $t4, $t4, 1      # Incrementa o contador de B
    j loop_B              # Repete o loop para array B

fim_loop_B:
    addi $t0, $t0, 1      # Incrementa o contador de A
    j loop_A              # Repete o loop para array A

fim_conta:
    add $v0, $t6, $zero   # Retorna o contador de elementos comuns
    jr $ra                # Retorna para a função chamadora