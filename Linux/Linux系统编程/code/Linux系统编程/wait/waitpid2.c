/*阻塞回收指定id的子线程*/
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <sys/types.h>
int main(int argc, char const *argv[])
{
    pid_t pid;
    pid = fork();
    if(pid < 0)
    {
        perror("fork failed");
        exit(1);
    }
    if(pid == 0)
    {//son
        int i;
        for(i = 3; i > 0; i--)
        {
            printf("this is the child \n");
            sleep(1);
        }
        exit(34);
    }else{//parent
        int state;
        waitpid(pid,&state,0);//阻塞
        if(WIFEXITED(state))
            printf("child exited wiht code %d\n",WEXITSTATUS(state));
        else if(WIFSIGNALED(state))
            printf("Child terminated abnormally ,signal %d\n",WTERMSIG(state));
    }
    return 0;
}
