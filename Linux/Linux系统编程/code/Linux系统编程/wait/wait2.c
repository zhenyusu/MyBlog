#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>

int main(void)
{
    pid_t pid ,wpid;
    int status;
    pid = fork();
    if(pid == -1)
    {
        perror("fork error");
        exit(1);
    }else if(pid == 0)//son
    {
        printf("i am process child ,pid = %d\n",getpid());
        sleep(1);
        exit(1);
    }else {
        wpid = wait(&status);//传出参数
        if(WIFEXITED(status))//正常退出
        {
            printf("i am parent,the child process %d exit normally\n",wpid);
            printf("return value:%d\n",WEXITSTATUS(status));
        }else if(WIFSIGNALED(status))//异常退出
        {
            printf("the chile process exit abnormally,killed by signal %d \n",WTERMSIG(status));//获取使进程终止的那个编号
        }
    }
    return 0;
}