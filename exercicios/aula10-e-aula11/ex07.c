#include <stdio.h>

// G) Escreva, em MIPS assembly, um programa que leia um inteiro N e mostre a soma dos números de 1
// até N (inclusive). Não deixe o usuário inserir um valor de N menor ou igual a zero. Nesse caso, continue
// lendo valores N, até que um valor positivo seja digitado. Imprima, como resposta, apenas o valor da soma.
// Não imprima outras mensagens de texto para indicar entrada/saída de dados.


int main()
{

    int n, soma = 0;

    do
    {
        scanf("%d", &n);
    } while (n <= 0);


    int count = 1;

    while (count <= n)
    {
        soma += count;
        count++;
    }

    printf("%d\n", soma);

    return 0;
}