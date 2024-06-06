.data # seção de dados

x:  .word 1
y:  .word 2
z:  .word 7

.text # seção de texto

    lw $s1, x
    lw $s2, y

    add $s0, $s1, $s2 # s0 = x + y = 1 + 2 = 3

    sw $s0, z # z = s0 = 3



