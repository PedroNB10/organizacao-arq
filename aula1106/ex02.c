#include <stdio.h>

int main ()
{
    int n, i;

    scanf("%d", &n);

    i = 0;

    while (i * i < n)
    {
        i++;
    }

    if (i * i == n)
    {
        printf("%d é um quadrado perfeito.\n", n);
    }
    else
    {
        printf("%d não é um quadrado perfeito.\n", n);
    }

    return 0;
}