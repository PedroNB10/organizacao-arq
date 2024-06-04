# D) Escreva, em MIPS assembly, um programa que leia as medidas dos 3 lados de um triângulo e
# informe o tipo de triângulo: equilátero, isósceles ou escaleno. Em sua resposta, imprima apenas o nome
# do tipo (sem acentos). Não imprima outras mensagens de texto para indicar entrada/saída de dados.

.data # .data: especifica que os itens serão armazenados no segmento de dados

equi: .asciiz "equilatero"
iso: .asciiz "isosceles"
esca: .asciiz "escaleno"


.text
.globl main

# registradores

# $v0: registrador de valor de retorno
# $a0, $a1, $a2, $a3: argumentos para as chamadas de sistema
# $t0, $t1, $t2, $t3, $t4, $t5, $t6, $t7: registradores temporários
# $s0, $s1, $s2, $s3, $s4, $s5, $s6, $s7: registradores salvos

# t0 é o lado 1
# t1 é o lado 2
# t2 é o lado 3

main: # main é o ponto de entrada do programa

    li $v0, 5 # Carrega o valor 5 no registrador `$v0`. Na convenção do MIPS, esse valor indica que queremos ler um inteiro da entrada padrão.
	syscall # Chama o sistema para executar a operação solicitada (neste caso, ler um inteiro). O valor lido será armazenado em `$v0`

    add $t0, $v0, $zero # $t0 = $v0

    li $v0, 5 # Carrega o valor 5 no registrador `$v0`. Na convenção do MIPS, esse valor indica que queremos ler um inteiro da entrada padrão.
    syscall # Chama o sistema para executar a operação solicitada (neste caso, ler um inteiro). O valor lido será armazenado em `$v0`

    add $t1, $v0, $zero # $t1 = $v0

    li $v0, 5 # Carrega o valor 5 no registrador `$v0`. Na convenção do MIPS, esse valor indica que queremos ler um inteiro da entrada padrão.
    syscall # Chama o sistema para executar a operação solicitada (neste caso, ler um inteiro). O valor lido será armazenado em `$v0`

    add $t2, $v0, $zero # $t2 = $v0

    if1:    bne $t0, $t1, if2 # se t0 for diferente de t1, vá para if2
            bne $t1, $t2, if2 # se t1 for diferente de t2, vá para if2
            li $v0, 4 # Carrega o valor 4 no registrador `$v0`. Na convenção do MIPS, esse valor indica que queremos imprimir uma string.
            la $a0, equi # Carrega o endereço da string "equilatero" no registrador `$a0`.
            syscall # Chama o sistema para executar a operação solicitada (neste caso, imprimir a string).

            j fim # vá para o fim


    if2:    beq $t0, $t1, if3 # se t0 for igual a t1, vá para if3
            beq $t0, $t2, if3 # se t0 for igual a t2, vá para if3
            beq $t1, $t2, if3 # se t1 for igual a t2, vá para if3
            li $v0, 4 # Carrega o valor 4 no registrador `$v0`. Na convenção do MIPS, esse valor indica que queremos imprimir uma string.
            la $a0, esca # Carrega o endereço da string "escaleno" no registrador `$a0`.
            syscall # Chama o sistema para executar a operação solicitada (neste caso, imprimir a string).

            j fim # vá para o fim


    if3:    
            li $v0, 4 # Carrega o valor 4 no registrador `$v0`. Na convenção do MIPS, esse valor indica que queremos imprimir uma string.
            la $a0, iso # Carrega o endereço da string "isosceles" no registrador `$a0`.
            syscall # Chama o sistema para executar a operação solicitada (neste caso, imprimir a string).

            j fim # vá para o fim
    fim:

