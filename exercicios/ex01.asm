# A) Escreva, em MIPS assembly, um programa que leia um único valor inteiro digitado pelo usuário e
# informe se o valor digitado é positivo ou negativo. Em sua resposta, imprima apenas as palavras
# “positivo” ou “negativo”. Não imprima outras mensagens de texto para indicar entrada/saída de dados.

.data # .data: especifica que os itens serão armazenados no segmento de dados


positivo: .asciiz "positivo"
negativo: .asciiz "negativo"

.text
.globl main

main: 
	# $a0 --> $a0 = address of null-terminated string to print

	
	# leitura do valor digitado em v0
	li $v0, 5 # Carrega o valor 5 no registrador `$v0`. Na convenção do MIPS, esse valor indica que queremos ler um inteiro da entrada padrão.
	syscall # Chama o sistema para executar a operação solicitada (neste caso, ler um inteiro). O valor lido será armazenado em `$v0`
	
if:	
	slt $t0,$v0, $zero # if v0 < 0:  (slt = Set on Less than)
	beq $t0, $zero, else # se t0 == 0 significa que v0 pode ser >= 0	   
			   
then:	# v0 por padrão imprime a string cujo endereço está carregado em $a0
	la $a0, negativo # Carrega o endereço do string "negativo" no registrador `$a0`.
	li $v0, 4 # Carrega o valor 4 no registrador `$v0`. Este valor indica que queremos imprimir um string.
	syscall # Chama o sistema para executar a operação solicitada
	j end_if
	
else:
	la $a0, positivo # Carrega o endereço do string "negativo" no registrador `$a0`.
	li $v0, 4 # # Carrega o valor 4 no registrador `$v0`. Este valor indica que queremos imprimir um string.
	syscall # Chama o sistema para executar a operação solicitada
	j end_if
	
end_if:

