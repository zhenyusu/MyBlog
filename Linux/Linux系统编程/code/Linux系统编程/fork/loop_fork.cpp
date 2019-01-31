#include<stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main(int argc,char *argv[])
{
    int n = 5;
    int i;
    for(i = 0; i < n; i++)
    {
        if(fork() == 0)//fork 返回值为0，表示是子进程
            break;
    }
    if(n == i)
    {
    	sleep(n);
    	printf("i am parent ,pid = %d\n",getpid());
    }else
    {
    	sleep(i);
    	printf("i am %dth child,pid = %d\n",i + 1,getpid());
    }
    return 0;

}


