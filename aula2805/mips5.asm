# $s0 = r
# $s1 = m
# $s2 = n
# $s3 = o
# $s4 = p

# Exercício E: r = [m - (2 -n)] - (o + p + 3)

inicio:	add  $t0, $s3, $s4 # t0 = o + p
	addi $t0, $t0, 3 # t0 = t0 + 3

addi $t1, $zero, 2 # t1 = 2
sub $t2, $t1, $s2 # t2 = t1 -n
sub $t3, $s1, $t2 # t3 = m - t2

sub $s0, $t3, $t0 # s0 = t3 - t0

