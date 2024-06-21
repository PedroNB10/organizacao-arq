# J) Escreva, em MIPS assembly, um programa, dividido em dois subprogramas, para: ler 6 valores inteiros
# informados pelo usuário e armazenar em um array (subprograma), percorrer o array e retornar o maior
# valor presente (subprograma), imprimir o maior valor (main). Em sua resposta, imprima apenas o maior
# valor. Não imprima outras mensagens de texto para indicar entrada/saída de dados.


.data

    array: .space 24 # array de 6 inteiros -> 6 * 4 = 24 bytes
    msg1: .asciiz "primeiro valor: "
    msg2: .asciiz "valor atual:"
    pula_linha: .asciiz "\n"
.text
.globl main
# COMEÇO MAIN
main:
    # leitura dos 6 valores
    la $a0, array # carrega o endereço do array em $a0
    
    jal leitura_array #  retornar o endereço base do array em v0


    # chamada da função que retorna o maior valor
    add $a0, $v0, $zero # passa o endereço base do array para a função maior_valor como argumento
    jal maior_valor


    # imprime o maior valor
    add $a0, $v0, $zero # passa o maior valor para a função print_int como argumento

    li $v0, 1 # v0 = 1 (print_int)
    syscall

    # fim do programa
    li $v0, 10 #  v0 = 10 (sair)
    syscall

# COMEÇO FUNÇÃO LEITURA ARRAY (6 inteiros)
.data
.text

# não tem argumentos
# o endereço base do array está em $a0
# retorna o endereço base do array já preenchido em $v0 

leitura_array:

    li $t0, 0 # contador

loop:
    slti $t1, $t0, 6 # t1 = 1 se t0 < 6, senão t1 = 0


    beq $t1, 0, fim_loop # se t1 == 0, então pula para fim_loop

    # leitura do inteiro
    li $v0, 5 # v0 = 5 (leitura inteiro)
    syscall

    # armazena o inteiro no array

    # armazenar o deslocamento do array em $t2
    sll $t2, $t0, 2 # t2 = t0 * 4, t2 armazena o deslocamento do array 

    # soma o endereço base do array com o deslocamento, a0 é o endereço base do array
    add $t2, $a0, $t2 # t2 = a0 + t2

    # armazena o inteiro no array --> vetor[t2] = v0, precisa do 0 ali por pardão da função
    sw $v0, 0($t2) # armazena o inteiro no array, 0($t2) é o endereço do array atual

    # c = c + 1
    addi $t0, $t0, 1
    
    j loop

fim_loop:

add $v0, $a0, $zero # retorna o endereço base do array em $v0

jr $ra # retorna para a função chamadora


# FIM FUNÇÃO LEITURA ARRAY

# COMEÇO FUNÇÃO MAIOR VALOR
# recebe como argumento o endereço base do array em $a0
# retorna o maior valor em $v0
.data
.text
maior_valor:
    # s0 = endereço base do array
    # t0 = contador
    # t1 = maior valor
    # t2 = deslocamento do array

    # armazenando endereço base do array em $s0
    add $s0, $a0, $zero # s0 = a0 => endereco base do array

    # carrega o primeiro valor do array
    lw $t1, 0($s0) # t1 = array[0]

    # inicializa o contador em 0
    li $t0, 0 # contador = 0
loop2:
    # armazenar o deslocamento do array em $t2
    sll $t2, $t0, 2 # t2 = t0 * 4, t2 armazena o deslocamento do array 


    slti $t3, $t0, 6 # t3 = 1 se t0 < 6, senão t3 = 0
    beq $t3, 0, fim_loop2 # se t3 == 0, então pula para fim_loop

    # armazena o valor atual do array em $t4

    # soma o endereço base do array com o deslocamento, s0 é o endereço base do array
    add $t2, $s0, $t2 # t2 = s0 + t2
    lw $t4, 0($t2) # t4 = array[t2]

    # começo  imprime o valor atual
    # imprime mensagem
    # li $v0, 4 # v0 = 4 (print_str)
    # la $a0, msg2 # a0 = endereço da string
    # syscall

    # # imprime o valor atual
    # add $a0, $t4, $zero # passa o valor atual para print_int como argumento
    # li $v0, 1 # v0 = 1 (print_int)
    # syscall

    # # imprime pular linha
    # li $v0, 4 # v0 = 4 (print_str)
    # la $a0, pula_linha # a0 = endereço da string
    # syscall 

     # fim  imprime o valor atual

# se o valor não for maior que o maior valor, não atualiza
if:
    # compara o valor atual com o maior valor
    slt $t5, $t1, $t4 # t5 = 1 se t1 < t4, senão t5 = 0
    beq $t5, 0, else # se t5 != 0, então pula para else

then:
    add $t1, $t4, $zero # t1 = t4, t4 é o novo maior valor

else:

    addi $t0, $t0, 1
    j loop2

fim_loop2:
    add $v0, $t1, $zero # retorna o maior valor em $v0
    jr $ra # retorna para a função chamadora


# FIM FUNÇÃO MAIOR VALOR