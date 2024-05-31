.data # .data: especifica que os itens serão armazenados no segmento de dados

msg1: .asciiz "Informe a temperatura: "
sol: .asciiz "solido"
liq: .asciiz "liquido"
gas: .asciiz "gasoso" # .asciiz: armazena uma string (com terminador) na memória.

.text #  .text: especifica a área de instruções (itens armazenados no segmento de texto)
.globl main # .globl: declara o label seguinte como global. Normalmente usado para definir o main.

main: 	# imprimir a mensagem
	# $a0 --> $a0 = address of null-terminated string to print
	la $a0, msg1 # "informe a temperatura"
	li $v0, 4  # imprimir string
	syscall
	
	# leitura do valor digitado em v0
	li $v0, 5 # ler inteiro, v0 armazena o valor de entrada
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
			   
