#include <unistd.h>
#include <stdio.h>

int main(int argc,char *argv[])
{
	pid_t pid = fork();

	char *argvv[] = {"ls","-a","-l",NULL};
	if(pid ==0 )
	{
		execl("/bin/ls","ls","-a",NULL);
		execv("/bin/ls",argvv);

	}else if(pid > 0)
	{
		printf("i am parent");
	}
    return 0;

}


