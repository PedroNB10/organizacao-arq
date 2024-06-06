.data # seção de dados

.text # seção de texto

.globl main

main:

    #inicialização
    li $t0, 0 # variavél total = 0
    li $t1, 0 # variavél i = 0
    li $t2, 5 # variavél n = 5 (quantidade de elementos)

# entrada do loop
inicio:
        # condição de parada
        slt $t3, $t1, $t2 # se i < n então $t3 = 1; else $t3 = 0
        beq $t3, $zero, fim # se $t3 = 0 então fim

        # corpo do loop
        add $t0, $t0, $t1 # total = total + i

        # incremento e desvio para o início do loop
        addi $t1, $t1, 1 # i = i + 1
        j inicio # volta para o início do loop

fim:


