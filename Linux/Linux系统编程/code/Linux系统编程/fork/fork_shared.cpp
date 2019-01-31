/*************************************************************************
    > File Name: fork_shared.cpp
    > Author: Hat_Cloud
    > Mail: jijianfeng529@gmail.com 
    > Created Time: 2018-11-25 23:34
 ************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>


int a = 100; //.data
int main(int argc,char *argv[])
{
	pid_t pid;
	pid = fork();
	if(pid == 0) //son
	{	
		a = 2000;
		printf("child ,a = %d\n",a);

	}else{
		sleep(1);//保证son先执行
		printf("parent,a = %d\n",a);
	}

    return 0;

}


