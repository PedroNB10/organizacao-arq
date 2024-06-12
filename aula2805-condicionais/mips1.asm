# $s0 = r
# $s1 = m
# $s2 = n
# $s3 = o
# $s4 = p

# Exercício A: r = m + n

# Guardando valor em um registrador
addi $s1, $zero, 10 # s1 = 10
addi $s2, $zero, 6  # s2 = 6

add $s0, $s1, $s2


