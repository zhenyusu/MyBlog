#include <stdio.h>

void main()
{

    const int a = 10;
    int *p = NULL;
    p = (int *)&a;
    *p = 20;//间接赋值
    printf("a = %d\n",a);
    printf("p = %d\n",*p);
   

}


