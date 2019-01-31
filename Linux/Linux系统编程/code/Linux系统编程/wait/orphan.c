#include<stdio.h>
#include<unistd.h>
#include<sys/wait.h>

int main(void)
{
    pid_t pid = fork();//创建进程
    if(pid == 0)//子进程
    {
        while(1)
        {
            printf("i am son,my parent pid = %d\n",getppid());
            sleep(1);
        }

    }else if(pid > 0)
    {
        printf("i am parent,my pid = %d\n",getpid());
        sleep(9);
        printf("i am going to die!!\n");
    }else{
        perror("fork");
        return 1;
    }

    return 0;

}
