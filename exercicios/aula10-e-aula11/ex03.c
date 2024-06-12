#include <stdio.h>

int main ()
{
    int idade;
    int tempo_servico;


    scanf("%d", &idade);
    scanf("%d", &tempo_servico);

    if (   idade >= 65 
        || tempo_servico >= 35 
        || (idade >= 60 && tempo_servico >= 30))
    {
        printf("Pode se aposentar\n");
    }
    else
    {
        printf("Nao pode se aposentar\n");
    }

    return 0;
}