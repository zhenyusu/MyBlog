#include <stdio.h>
#include <unistd.h>

int main(int argc,char *argv[])
{
	pid_t pid = fork();
	if(pid > 0)//parent
	{
		//通过路径+程序名来加载，参数以NULL结尾
		execl("/Users/suzhenyu/workplace/study/project/Linux/Linux系统编程/exec/build/bin/output","output",NULL);
	}else if(pid == 0)
	{
		sleep(11);
		printf("i am son");
	}

    return 0;

}


