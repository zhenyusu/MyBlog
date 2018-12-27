#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>

int main(void)
{
    pid_t pid,wpid;
    pid = fork();
    if(pid == -1)
    {
        perror("fork error");
        exit(1);
    }else if(pid == 0)//son
    {
        printf("i am process child,pid = %d\n",getpid());
        sleep(7);
    }else{
lable:
        wpid = wait(NULL);//阻塞等待
        if(wpid == -1)
        {
            perror("wait error");
            goto lable;
        }
        printf("i am parent ,i catched child process, pid = %d\n",wpid);
    }
    return 0;
}
