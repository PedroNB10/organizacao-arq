#include <stdio.h>


int main ()
{
    int n1;
    int n2;
    int n3;
    int n4;

    scanf("%d", &n1);
    scanf("%d", &n2);
    scanf("%d", &n3);
    scanf("%d", &n4);

    if (n1 > n2 && n1 > n3 && n1 > n4)
    {
        printf("%d\n", n1);
    }
    else if (n2 > n1 && n2 > n3 && n2 > n4)
    {
        printf("%d\n", n2);
    }
    else if (n3 > n1 && n3 > n2 && n3 > n4)
    {
        printf("%d\n", n3);
    }
    else
    {
        printf("%d\n", n4);
    }

    

    return 0;
}