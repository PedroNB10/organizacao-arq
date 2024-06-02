# B) Escreva, em MIPS assembly, um programa que leia 4 valores inteiros digitados pelo usuário e mostre
# qual o maior deles. Em sua resposta, imprima apenas o maior dos 4 valores digitados. Não imprima
# outras mensagens de texto para indicar entrada/saída de dados.

.data # .data: especifica que os itens serão armazenados no segmento de dados

msg: .asciiz "Digite um numero:"
resp: .word 0 # espaço para armazenar um inteiro


.text
.globl main

# registradores

# $v0: registrador de valor de retorno
# $a0, $a1, $a2, $a3: argumentos para as chamadas de sistema
# $t0, $t1, $t2, $t3, $t4, $t5, $t6, $t7: registradores temporários
# $s0, $s1, $s2, $s3, $s4, $s5, $s6, $s7: registradores salvos

# t0, t1, t2 e t3 armazenam os valores digitados pelo usuário
# t4 é utilizado para comparações


main:
    li $v0, 5 # Carrega o valor 5 no registrador `$v0`. Na convenção do MIPS, esse valor indica que queremos ler um inteiro da entrada padrão.
	syscall # Chama o sistema para executar a operação solicitada (neste caso, ler um inteiro). O valor lido será armazenado em `$v0`

    add $t0, $v0, $zero # $t0 = $v0

    li $v0, 5 # Carrega o valor 5 no registrador `$v0`. Na convenção do MIPS, esse valor indica que queremos ler um inteiro da entrada padrão.
    syscall # Chama o sistema para executar a operação solicitada (neste caso, ler um inteiro). O valor lido será armazenado em `$v0`

    add $t1, $v0, $zero # $t1 = $v0

    li $v0, 5 # Carrega o valor 5 no registrador `$v0`. Na convenção do MIPS, esse valor indica que queremos ler um inteiro da entrada padrão.
    syscall # Chama o sistema para executar a operação solicitada (neste caso, ler um inteiro). O valor lido será armazenado em `$v0`

    add $t2, $v0, $zero # $t2 = $v0


    li $v0, 5 # Carrega o valor 5 no registrador `$v0`. Na convenção do MIPS, esse valor indica que queremos ler um inteiro da entrada padrão.
    syscall # Chama o sistema para executar a operação solicitada (neste caso, ler um inteiro). O valor lido será armazenado em `$v0`

    add $t3, $v0, $zero # $t3 = $v0


    if1:
        slt $t4, $t1, $t0 # $t4 = $t1 < $t0 ==> $t0 > $t1
        beq $t4, $zero, end_if1 # se $t4 == 0, então vá para end_if1

    if2:
        slt $t4, $t2, $t0 # $t4 = $t2 < $t0 ==> $t0 > $t2
        beq $t4, $zero, end_if1 # se $t4 == 0, então vá para else2

    if3:
        slt $t4, $t3, $t0 # $t4 = $t3 < $t0 ==> $t0 > $t3
        bne $t4, $zero, primeiro_eh_maior # se $t4 != 0, então vá para end_if1

    end_if1:
        # não faz nada serve para pular caso algun dos ifs acima esteja errado


    if4:
        slt $t4, $t0, $t1 # $t4 = $t0 < $t1 ==> $t1 > $t0
        beq $t4, $zero, end_if2 # se $t4 == 0, então vá para end_if2

    if5:
        slt $t4, $t2, $t1 # $t4 = $t2 < $t1 ==> $t1 > $t2
        beq $t4, $zero, end_if2 # se $t4 == 0, então vá para else2


    if6:
        slt $t4, $t3, $t1 # $t4 = $t3 < $t1 ==> $t1 > $t3
        bne $t4, $zero, segundo_eh_maior # se $t4 != 0, então vá para end_if2


    end_if2:

        # não faz nada serve para pular caso algun dos ifs acima esteja errado

    if7:
        slt $t4, $t0, $t2 # $t4 = $t0 < $t2 ==> $t2 > $t0
        beq $t4, $zero, end_if3 # se $t4 == 0, então vá para end_if3

    if8:
        slt $t4, $t1, $t2 # $t4 = $t1 < $t2 ==> $t2 > $t1
        beq $t4, $zero, end_if3 # se $t4 == 0, então vá para else2

    if9:
        slt $t4, $t3, $t2 # $t4 = $t3 < $t2 ==> $t2 > $t3
        bne $t4, $zero, terceiro_eh_maior # se $t4 != 0, então vá para end_if3

    end_if3:
        j quarto_eh_maior
        # não faz nada serve para pular caso algun dos ifs acima esteja errado    

    # se não entrou em nenhum if ai o maior é o t3


    primeiro_eh_maior:
        add $a0, $t0, $zero # o a0 deve conter o valor que você deseja imprimir
        li $v0, 1
        syscall
        j end
    
    segundo_eh_maior:
        add $a0, $t1, $zero # o a0 deve conter o valor que você deseja imprimir
        li $v0, 1
        syscall
        j end

    terceiro_eh_maior:
        add $a0, $t2, $zero # o a0 deve conter o valor que você deseja imprimir
        li $v0, 1
        syscall
        j end

    quarto_eh_maior:
        add $a0, $t3, $zero # o a0 deve conter o valor que você deseja imprimir
        li $v0, 1
        syscall
        j end

    end:
       


	# PRINT DE UM INTEIRO VINDO DO TERMINAL
    # add $a0, $t0, $zero # o a0 deve conter o valor que você deseja imprimir
    # li $v0, 1
    # syscall

	# li $v0, 4 # # Carrega o valor 4 no registrador `$v0`. Este valor indica que queremos imprimir um string.
	# syscall # Chama o sistema para executar a operação solicitada




	
