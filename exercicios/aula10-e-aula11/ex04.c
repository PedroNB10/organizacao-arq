#include <stdio.h>

int main ()
{
    int l1, l2, l3;

    scanf("%d", &l1);
    scanf("%d", &l2);
    scanf("%d", &l3);

    if (l1 == l2 && l2 == l3)
    {
        printf("equilatero\n");
    }

    else if (l1 == l2 || l2 == l3 || l1 == l3)
    {
        printf("isosceles\n");
    }

    else
    {
        printf("escaleno\n");
    }

    return 0;
}