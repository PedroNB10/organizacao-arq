# $s0 = r
# $s1 = m
# $s2 = n
# $s3 = o
# $s4 = p

# Exercício D: r = m - (n + 2)

addi  $t0, $s2, 2 # t0 = (n + 2)
sub $s0, $s1, $t0 # s0 = m -t0

