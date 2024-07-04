# C) Escreva, em MIPS assembly, um programa que leia a idade e o tempo de serviço de um trabalhador e
# informe se ele pode ou não se aposentar. Em sua resposta, imprima apenas as palavras “sim” ou “nao”
# (sem acento). Não imprima outras mensagens de texto para indicar entrada/saída de dados. As condições
# para aposentadoria são:
#  Ter pelo menos 65 anos OU
#  Ter trabalhado pelo menos 35 anos OU
#  Ter pelo menos 60 anos e ter trabalhado pelo menos 30 anos.


.data

msg1: .asciiz "sim" 
msg2: .asciiz "nao"

.text

.globl main

main:
    # Leitura da idade
    li $v0, 5
    syscall
    move $t0, $v0   # idade

    # Leitura do tempo de serviço
    li $v0, 5
    syscall
    move $t1, $v0   # tempo de serviço

    # Verifica se idade >= 65
    li $t2, 65
    slt $s0, $t0, $t2   # $s0 = 1 se $t0 < 65
    beq $s0, $zero, pode_aposentar  # se $s0 == 0, $t0 >= 65

    # Verifica se tempo de serviço >= 35
    li $t3, 35
    slt $s1, $t1, $t3   # $s1 = 1 se $t1 < 35
    beq $s1, $zero, pode_aposentar  # se $s1 == 0, $t1 >= 35

    # Verifica se idade >= 60 e tempo de serviço >= 30
    li $t4, 60
    li $t5, 30
    slt $s2, $t0, $t4   # $s2 = 1 se $t0 < 60
    slt $s3, $t1, $t5   # $s3 = 1 se $t1 < 30
    or $s4, $s2, $s3    # $s4 = 1 se $t0 < 60 ou $t1 < 30
    bne $s4, $zero, nao_aposenta  # se $s4 != 0, não pode aposentar

pode_aposentar:
    la $a0, msg1
    li $v0, 4
    syscall
    j fim_do_programa

nao_aposenta:
    la $a0, msg2
    li $v0, 4
    syscall

fim_do_programa:
    # Finaliza o programa
    li $v0, 10
    syscall
