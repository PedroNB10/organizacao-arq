// H) Escreva, em MIPS assembly, um programa que leia um inteiro N e mostre o seu fatorial. Imprima
// apenas o valor do fatorial como resposta. Não imprima outras mensagens de texto para indicar
// entrada/saída de dados.

#include <stdio.h>


int main ()
{   
    int n, fatorial = 1, i = 1;

    scanf("%d", &n);

    while (i <= n)
    {
        fatorial *= i;
        i++;
    }


    printf("%d\n", fatorial);


    return 0;
}