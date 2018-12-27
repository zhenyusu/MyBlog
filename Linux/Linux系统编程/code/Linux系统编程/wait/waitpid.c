/*
    创建两个子进程，回收指定id的子进程
*/
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main(void)
{
    pid_t pid_1,pid_2,wpid;
    int flag = 0;
    pid_1 = fork();
    pid_2 = fork();
    if(pid_1 == -1)
    {
        perror("error");
        exit(1);
    }else if(pid_1 == 0)//son
    {
        printf("i am child ,pid = %d\n",getpid());
        sleep(5);
        exit(1);
    }else{
        do{
            wpid = waitpid(pid_1,NULL,WNOHANG);//不获取进程退出状态吗，非阻塞。
            printf("wpid=%d,flag=%d,child pid= %d\n",wpid,flag++,pid_1);
            if(wpid == 0)
            {
                printf("no child process exit\n");
                sleep(1);
            }
        }while(wpid == 0);
        if(wpid == pid_1)
        {
            printf("i am parent,i catched child process,pid = %d\n",wpid);
        }else{
            printf("other....\n");
        }
    }
    }