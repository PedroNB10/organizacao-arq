# Exercício 01: fatorial
# Exemplo 1: escrever, em MIPS assembly, a função fatorial(), como
# mostrada no slide 3.

.data

msg1: .asciiz "Informe o valor: "
msg2: .asciiz "Resposta: "

.text
.globl main
main:
    # Mensagem ao usuario
    li $v0, 4 # v0 = 4 (imprimir string)
    la $a0, msg1 # carrega o endereco da string
    syscall
    # Leitura do valor
    li $v0, 5 # v0 = 5 (ler inteiro)
    syscall # valor lido está em v0

    # enviar o valor para o subprograma fatorial

    # armazenar o valor em a0 que é o parâmetro do subprograma
    add $a0, $v0, $zero

    jal fatorial

    add $t0, $zero, $v0 # t0 recebe o valor de retorno do subprograma

    li $v0, 4 # v0 = 4 (imprimir string)
    la $a0, msg2 # carrega o endereco da string
    syscall


    add $a0, $zero, $t0
    li $v0, 1 # v0 = 1 (imprimir inteiro)
    syscall # imprime o valor em v0

    li $v0, 10 # v0 = 10 (sair)
    syscall # encerra a execução do programa

# Subprograma Fatorial
# Calcula o fatorial do valor em $a0
# Retorna o resultado em $v0
.data
.text

fatorial:
    # Inicializa o fatorial
    li $v0, 1 # v0 = 1, v0 vai ser o valor do fatorial

    # Enquanto t0 <= a0
    loop:
        beq $a0, $zero, fim # se a0 == 0, então fim --> n > 0
        mul $v0, $v0, $a0 # v0 = v0 * a0 --> f = f * i
        subi $a0, $a0, 1 # a0 = a0 - 1 --> i = i - 1

        j loop

    fim:
        jr $ra # retorna para o endereço de retorno