# K) Escreva, em MIPS assembly, um programa que leia um valor inteiro e o repasse para um subprograma.
# Se o valor for um quadrado perfeito, o subprograma deve retornar 1; caso contrário, retornar zero. O main
# deve imprimir como resposta apenas o valor retornado. Em sua resposta, imprima apenas o maior valor.
# Não imprima outras mensagens de texto para indicar entrada/saída de dados.


.data 

sim: .asciiz "O número é um quadrado perfeito\n"
nao: .asciiz "O número não é um quadrado perfeito\n"
.text
.globl main


main:
    # leitura do número
    li $v0, 5
    syscall

    # armazenar o número em $a0
    add $a0, $v0, $zero

    # chamar a função quadrado_perfeito
    # a0 é o parâmetro, e vai retornar em v0 se é ou não quadrado perfeito (0 ou 1)
    jal quadrado_perfeito

    # armazenar resposta em $s0
    add $s0, $zero, $v0 # armazena o resultado em $s0

    # imprimir a resposta
    add $a0, $zero, $s0 # armazena o resultado em $a0

    li $v0, 1 # imprime inteiro 
    syscall


    # encerrar programa
    li $v0, 10
    syscall


# subprograma que verifica se um número é um quadrado perfeito
# recebe um argumento em $a0
# devlolve em $v0 1 se for quadrado perfeito, 0 caso contrário
.data
.text
quadrado_perfeito:
    li $t0, 0 # t0 é o valor de i que será incrementado 
# enquanto i * i < a0
while:

    # i * i
    mul $t1, $t0, $t0 # t1 = i * i

    slt $t2, $t1, $a0 # t2 = i * i < a0
    # if i * i < a0 then continue
    # else break
    beq $t2, $zero, fim_while

    addi $t0, $t0, 1 # i = i + 1

    j while

fim_while:

if:
    mul $t1, $t0, $t0 # t1 = i * i

    bne $t1, $a0, else # if i * i != a0 

then: 
    li $v0, 1 # sim, é quadrado perfeito
    j end_if

else:
    li $v0, 0 # não é quadrado perfeito

end_if:
    jr $ra
