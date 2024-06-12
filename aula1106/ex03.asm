# Exemplo 2: escrever, em MIPS assembly, uma função que verifique se um
# número é um quadrado perfeito.


.data 

sim: .asciiz "impar\n"
nao: .asciiz "par\n"
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
    andi $v0, $a0, 1
    jr $ra

