# Exemplo 2: escrever, em MIPS assembly, uma função que verifique se um
# número é um quadrado perfeito.


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
    jal quadrado_perfeito


    add $s0, $zero, $v0 # armazena o resultado em $s0

if2: 
    bne $s0, $zero, else2 # if $s0 != 0
    
then2:
    li $v0, 4
    la $a0, nao
    syscall

    j end_if2

else2:

    li, $v0, 4
    la $a0, sim
    syscall

end_if2:
    # encerrar o programa
    li $v0, 10
    syscall



# subprograma que verifica se um número é um quadrado perfeito
# recebe um argumento em $a0
# devlolve em $v0 1 se for quadrado perfeito, 0 caso contrário
.data
.text
quadrado_perfeito:
    li $t0, 0 # t0 é o valor de i que será incrementado 


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
