// # L) Escreva, em MIPS assembly, um programa que leia 4 valores inteiros e os armazene em um array A. A
// # seguir, leia 6 inteiros e os armazene em um array B. Crie um subprograma que compute e retorne quantos
// # elementos estão presentes em A e B simultaneamente. O main deve imprimir a resposta. Não imprima
// # outras mensagens de texto para indicar entrada/saída de dados.

#include <stdio.h>

void leitura_array(int *array, int tamanho)
{
    for (int i = 0; i < tamanho; i++)
    {
        scanf("%d", &array[i]);
    }
}

int conta_comuns(int *arrayA, int tamanhoA, int *arrayB, int tamanhoB)
{
    int contador_comuns = 0;
    for (int i = 0; i < tamanhoA; i++)
    {
        for (int j = 0; j < tamanhoB; j++)
        {
            if (arrayA[i] == arrayB[j])
            {
                contador_comuns++;
                break; // Evitar contar o mesmo elemento de B várias vezes
            }
        }
    }
    return contador_comuns;
}

int main()
{
    int arrayA[4];
    int arrayB[6];

    // Leitura dos valores para o array A
    leitura_array(arrayA, 4);

    // Leitura dos valores para o array B
    leitura_array(arrayB, 6);

    // Contagem dos elementos comuns
    int comuns = conta_comuns(arrayA, 4, arrayB, 6);

    // Impressão do resultado
    printf("%d\n", comuns);

    return 0;
}
