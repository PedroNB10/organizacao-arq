#include <stdio.h>
int main() {
    // printf() displays the string inside quotation
    float temp;
    printf("Digite a temperatura:");
    scanf("%f", &temp);

    if (temp > 100)
    {
        printf("Estado gasoso\n");
    }
    else if (temp < 0)
    {
        printf("Estado sólido\n");
    }
    else
    {
        printf("Estado líquido\n");
    }

    return 0;
}

