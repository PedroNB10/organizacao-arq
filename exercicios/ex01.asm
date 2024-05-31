.data # .data: especifica que os itens serão armazenados no segmento de dados


positivo: .asciiz "positivo"
negativo: .asciiz "negativo"

.text
.globl main

main: 
	# $a0 --> $a0 = address of null-terminated string to print

	
	# leitura do valor digitado em v0
	li $v0, 5 # ler inteiro 
	syscall
	
if:	
	slt $t0,$v0, $zero # if v0 < 0:  (slt = Set on Less than)
	beq $t0, $zero, else # se t0 == 0 significa que v0 pode ser >= 0	   
			   
then:	
	la $a0, negativo # load address 
	li $v0, 4 # load immediate
	syscall
	j end_if
	
else:
	la $a0, positivo # load address 
	li $v0, 4 # load immediate
	syscall
	j end_if
	
end_if:

