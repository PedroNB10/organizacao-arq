.data 

msg1: .asciiz "Informe a temperatura: "
sol: .asciiz "solido"
liq: .asciiz "liquido"
gas: .asciiz "gasoso"

.text
.globl main

main: 	# imprimir a mensagem
	la $a0, msg1
	li $v0, 4  # imprimir string
	syscall
	
	# leitura do valor digitado em v0
	li $v0, 5 # ler inteiro 
	syscall
	
	# o valor digitado está em v0 por padrão 
	
	# determinar o estado físico da água
	# com base na temperatura digitada
	
	# condição do sólido
if1:	slt $t0,$v0, $zero # if v0 < 0
			   # t0 = 1
			   # else
			   #  t0 = 0
			   
	beq $t0, $zero, else1
	
then1:
	# imprime a menságem: sólido
	la $a0, sol
	li $v0, 4
	syscall
	j end_if
else1:

if2:	# else if
	li $t1, 100
	slt $t0, $t1, $v0 # if (100 < temp) ==> temp > 100 mesma coisa
	beq $t0, $zero, else2
then2:
	# imprime a menságem: gas
	la $a0, gas
	li $v0, 4
	syscall 
	j end_if
else2: # else
	# imprime a menságem: liq
	la $a0, liq
	li $v0, 4
	syscall 

end_if:
			   