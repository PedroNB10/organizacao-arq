# C) Escreva, em MIPS assembly, um programa que leia a idade e o tempo de serviço de um trabalhador e
# informe se ele pode ou não se aposentar. Em sua resposta, imprima apenas as palavras “sim” ou “nao”
# (sem acento). Não imprima outras mensagens de texto para indicar entrada/saída de dados. As condições
# para aposentadoria são:
#  Ter pelo menos 65 anos OU
#  Ter trabalhado pelo menos 35 anos OU
#  Ter pelo menos 60 anos e ter trabalhado pelo menos 30 anos.


.data # .data: especifica que os itens serão armazenados no segmento de dados

nao: .asciiz "nao"
sim: .asciiz "sim"

.text
.globl main

# registradores

# $v0: registrador de valor de retorno
# $a0, $a1, $a2, $a3: argumentos para as chamadas de sistema
# $t0, $t1, $t2, $t3, $t4, $t5, $t6, $t7: registradores temporários
# $s0, $s1, $s2, $s3, $s4, $s5, $s6, $s7: registradores salvos

# t0 é a idade
# t1 é o tempo de serviço

# t2 é a variável de controle do if

main: 
    li $v0, 5 # Carrega o valor 5 no registrador `$v0`. Na convenção do MIPS, esse valor indica que queremos ler um inteiro da entrada padrão.
	syscall # Chama o sistema para executar a operação solicitada (neste caso, ler um inteiro). O valor lido será armazenado em `$v0`

    add $t0, $v0, $zero # $t0 = $v0

    li $v0, 5 # Carrega o valor 5 no registrador `$v0`. Na convenção do MIPS, esse valor indica que queremos ler um inteiro da entrada padrão.
    syscall # Chama o sistema para executar a operação solicitada (neste caso, ler um inteiro). O valor lido será armazenado em `$v0`

    add $t1, $v0, $zero # $t1 = $v0

    if1: 
        slti $t2, $t0, 65 # $t2 = 1 se $t0 < 65, senão $t2 = 0

        beq $t2, $zero, pode_aposentar # se $t2 == 0, então pula para pode_aposentar

    if2:
        slti $t2, $t1, 35 # $t2 = 1 se $t1 < 35, senão $t2 = 0

        beq $t2, $zero, pode_aposentar # se $t2 == 0, então pula para pode_aposentar

    if3:
        slti $t2, $t0, 60 # $t2 = 1 se $t0 < 60, senão $t2 = 0

        bne $t2, $zero, nao_pode_aposentar # se $t2 != 0, então pula para nao_pode_aposentar

        slti $t2, $t1, 30 # $t2 = 1 se $t1 < 30, senão $t2 = 0

        beq $t2, $zero, pode_aposentar # se $t2 == 0, então pula para pode_aposentar

    nao_pode_aposentar:
        li $v0, 4 # Carrega o valor 4 no registrador `$v0`. Na convenção do MIPS, esse valor indica que queremos imprimir uma string na saída padrão.
        la $a0, nao # Carrega o endereço da string que queremos imprimir no registrador `$a0`.
        syscall # Chama o sistema para executar a operação solicitada (neste caso, imprimir a string).

        j fim # pula para o fim




    pode_aposentar:
        li $v0, 4 # Carrega o valor 4 no registrador `$v0`. Na convenção do MIPS, esse valor indica que queremos imprimir uma string na saída padrão.
        la $a0, sim # Carrega o endereço da string que queremos imprimir no registrador `$a0`.
        syscall # Chama o sistema para executar a operação solicitada (neste caso, imprimir a string).

        j fim # pula para o fim



    fim:

