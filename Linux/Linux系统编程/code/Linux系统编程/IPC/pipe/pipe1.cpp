/*创建父子进程，子进程从管道读，父进程向管道写*/

#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/wait.h>
void sys_err(const char *str)
{
    perror(str);
    exit(1);
}

int main(void)
{
    pid_t pid;
    int fd[2];//文件描述符，fd[0]->r,fd[1]->w
    
    int ret = pipe(fd);//创建管道
    if(ret == -1)
    {
        sys_err("pipe error");
    }
    pid = fork();//创建子进程
    if(pid == -1)
        sys_err("fork error");

    if(pid == 0)//子进程，负责读
    {
        //关闭写操作符
        close(fd[1]);
        char buf[1024];
        ret = read(fd[0],buf,sizeof(buf));
        if(ret == 0)
        {
            printf("----\n");
        }
        write(STDOUT_FILENO,buf,ret);
    }else
    {
        close(fd[0]);//关闭读字符
        write(fd[1],"hello pipe\n",strlen("hello pipe\n"));
    }
    return 0;
}