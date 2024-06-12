# int v[5] = 1,2,3,4,5

# for (int i = 0; i < 5; i++)
# soma += v[i]

.data
# vetor de 5 posições
v: .word 1,2,3,4,5 # nessa linha estamos alocando 5 palavras de 4 bytes cada, ou seja, 20 bytes


.text

.globl main

main:
    # li = load immediate
    li $s0, 0 # soma = 0
    li $s1, 0 # i = 0
    li $s3, 5 # n = 5 tamanho do vetor
    # endereço = base + deslocamento
    # posição 0 
    la $t0, v #load address => carrega o endereço do vetor v no registrador $t0 (ENDEREÇO BASE)

inicio:
    beq $s1, $s3, fim # se i == n, então fim
    # deslocamento de duas casas e multiplicação por 4
    # indice 0
    # t1 armazena o deslocamento
    # sll = shift left logical
    # t1 armazena o deslocamento
    # s1 é o i que será multiplicado por 4 (deslocamento de 2 casas binárias para a esquerda)
    sll $t1, $s1, 2 # 4 * i, nesse caso não precisa de shift left, pois o deslocamento é 0, mas por didática vamos fazer
    # deslocamento de duas casas do binário para a esquerda é a mesma coisa que multiplicar por 4
    # endereço 0: base + deslocamento

    # endereço i:

    # o endereço é armazenado em s2. s2 é o endereço de memória do elemento v[i] atual
    add $s2, $t0, $t1 # deslocando o endereço base para o endereço do elemento v[i] atual

    # carregando o valor no endereço de memória de s2 para t2
    lw $t2, 0($s2) # t2 = v[i], 0 é o deslocamento, precisa do 0 porque o lw precisa desse deslocamento para não referenciar o label mas sim o endereço de memória

    # soma = soma + v[i]
    add $s0, $s0, $t2 # soma = soma + v[i]

    # incrementar o i 
    addi $s1, $s1, 1 # i = i + 1
    j inicio

fim:

    # imprime o resultado
    add $a0, $zero, $s0 # passando o valor de s0 para o argumento da syscall
    li $v0, 1 # código da syscall para imprimir inteiro
    syscall
