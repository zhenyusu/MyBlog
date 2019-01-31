
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>

/*
	用户输入创建的进程数，父进程回收所有的子进程
*/
int main(int argc,char *argv[])
{
	int n ,i;
	pid_t p,q;
	if(argc == 2)
		n = atoi(argv[1]);
	for(i = 0; i <n; i++)
	{
		p = fork();
		if (p == 0)//parent
			break;
	}

	if(n == i)//parent
	{
		sleep(n);
		printf("i am parent ,pid=%d\n",getpid());
		for(i = 0; i < n; i++)
		{
			p = waitpid(0,NULL,WNOHANG);//不阻塞
			printf("wait pid = %d\n",p);
		}
	}else
	{
		sleep(i);
		printf("i am %dth child,pid = %d\n",i+1,getpid());
	}
	return 0;
}