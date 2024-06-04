# $s0 = r
# $s1 = m
# $s2 = n
# $s3 = o
# $s4 = p

# Exercício C: r = (m - n) - (0 + p)

sub $t0, $s1, $s2 # t0 = (m -n)
add $t1, $s3, $s4 # t1 = (o + p)
sub $s0, $t0, $t1 # s0 = t0 -t1

