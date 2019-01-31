# Linux系统编程

[TOC]
## 1. 进程相关概念
[进程相关概念](https://www.cnblogs.com/tianlangshu/p/5224178.html)

## 2. 进程控制

### fork()

> **功能**: 创建一个子进程。**子进程会接着父进程的fork()语句后继续执行。**
> **返回值**: 失败返回-1；  成功返回：(1)父进程返回子进程的ID(非负) (2)子进程返回 0 
> **注意**: pid_t类型表示进程ID，但为了表示-1，它是有符号整型。(0不是有效进程ID，init最小为1)。注意返回值，不是fork函数能返回两个值，而是fork后，fork函数变为两个，父子需各自返回一个。



**fork后父子进程的相同与不相同之处**

> 相同之处:全局变量、.data(初始化的全局变量和局部静态变量都保存在.data段)、.text(c语言程序编译后执行语句都编译成机器代码，保存在.text段)、栈、堆、环境变量、用户ID、宿主目录、进程工作目录、信号处理方式。

> 不同之处：进程ID、父进程ID、fork返回值、进程运行时间、定时器、未决信号集合。



Demo **:循环创建n个进程**

错误写法：(自己画图分析，分析下这段代码会导致什么结果)

```cpp
for(i = 0; i < n; i++)
    fork();
```

正确写法：

```cpp
#include<stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main(int argc,char *argv[])
{
    int n = 5;
    int i;
    for(i = 0; i < n; i++)
    {
        if(fork() == 0)//fork 返回值为0，表示是子进程
            break;
    }
    if(n == i)
    {
    	sleep(n);
    	printf("i am parent ,pid = %d\n",getpid());
    }else
    {
    	sleep(i);
    	printf("i am %dth child,pid = %d\n",i + 1,getpid());
    }
    return 0;
}
```
### pid_t  getpid(void)

获取当前进程的ID。



### pid_t getppid(void)
获取当前进程的父进程的ID



### uid_t getuid(void)

获取当前进程实际用户的ID



### uid_t geteuit(void)

获取当前进程有效有用ID



### gid_t getgid(void)

获取当前进程使用用户组ID



### gid_t getegit(void)

获取当前进程有效用户组ID

### 进程共享

父子进程之间是遵循***读时共享写时复制***
**Demo**
```cpp
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

```

## 3. exec函数族
[参考链接](https://blog.csdn.net/zhengqijun_/article/details/52852074)

fork创建子进程后执行的是和父进程相同的程序（但有可能执行不同的代码分支），子进程往往要调用一种exec函数以执行另一个程序。当进程调用一种exec函数时，该进程的用户空间代码和数据完全被新程序替换，从新程序的启动例程开始执行。调用exec并不创建新进程，所以调用exec前后该进程的id并未改变。
将当前进程的.text、.data替换为所要加载的程序的.text、.data，然后让进程从新的.text第一条指令开始执行，但进程ID不变，换核不换壳。

其实有六种以exec开头的函数，统称exec函数：
```cpp
int execl(const char *path, const char *arg, ...);
int execlp(const char *file, const char *arg, ...);
int execle(const char *path, const char *arg, ..., char *const envp[]);
int execv(const char *path, char *const argv[]);
int execvp(const char *file, char *const argv[]);
int execve(const char *path, char *const argv[], char *const envp[]);
```
### exec函数族的一些规律
>exec函数一旦调用成功即执行新的程序，不返回。**只有失败才返回，错误值-1**。所以通常我们直接在exec函数调用后直接调用perror()和exit()，无需if判断。

| item    | value          |
| ------- | -------------- |
| l(list) | 命令行参数列表 |
| p(path) | 搜素file时使用path变量|
|v(vector)|使用命令行参数组|
|e (environment)|使用环境变量数组,不使用进程原有的环境变量，设置新加载程序运行的环境变量|

>事实上，只有execve是真正的系统调用，其它五个函数最终都调用execve

### execl
```cpp
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
```
### execv

## 4. 子进程回收
### 孤儿进程

孤儿进程：父进程比子进程先结束，则子进程成为孤儿进程。孤儿进程将被init进程(进程号为1)所收养，并由init进程对它们完成状态收集工作。

**Demo**
```cpp
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

```

### 僵尸进程

僵尸进程是当子进程比父进程先结束，而父进程又没有回收子进程，释放子进程占用的资源，此时子进程将成为一个僵尸进程。如果父进程先退出 ，子进程被init接管，子进程退出后init会回收其占用的相关资源

>注意：僵尸进程不能是用kill命令清除，因为Kill命令只是用来终止进程的，但是僵尸进程以及终止。

### wait && waitpid
一个进程在终止时会关闭所有文件描述符，释放在用户空间分配的内存，但它的PCB还保留着，内核在其中保存了一些信息：如果是正常终止则保存着退出状态，如果是异常终止则保存着导致该进程终止的信号是哪个。这个进程的父进程可以调用wait或waitpid获取这些信息，然后彻底清除掉这个进程。我们知道一个进程的退出状态可以在Shell中用特殊变量$?查看，因为Shell是它的父进程，当它终止时Shell调用wait或waitpid得到它的退出状态同时彻底清除掉这个进程。

```cpp
#include <sys/wait.h>
pid_t wait(int *statloc);
pid_t waitpid(pid_t pid,int *statloc, int options);
```
**返回值:**成功返回成功清理掉的子进程ID，失败返回-1(无子进程)。
**参数**

1. **statloc**：指向终止进程的终止状态，如果不关心终止状态可指定为空指针
2. pid有四种情况：
  pid==-1 回收任意子进程(相当于wait)
  pid>0   回收指定的ID的子进程
  pid==0 回收和当前调用waitpid一个组的所有子进程
  pid<-1  回收制定进程组内的任意子进程
3. **options**控制waitpid的操作：
   1,2是支持作业控制
   1.WCONTINUED
   2.WUNTRACED
   3.WNOHANG   **waitpid不阻塞**



可使用wait函数传出参数status来保存进程的退出状态。借助宏函数来进一步判断进程终止的具体原因。宏函数可分为如下三组：

1. WIFEXITED(status) 为非0，进程正常结束

​           WEXITSTATUS(status) 如上宏为真，使用此宏获取进程退出状态 (exit的参数)

2. WIFSIGNALED(status) 为非0，进程异常终止

​           WTERMSIG(status) 如上宏为真，使用此宏， 取得使进程终止的那个信号的编号。

3. WIFSTOPPED(status) 为非0，进程处于暂停状态

​           WSTOPSIG(status) 如上宏为真，使用此宏，取得使进程暂停的那个信号的编号。

​           WIFCONTINUED(status) 为真， 进程暂停后已经继续运行



#### wait函数
父进程调用wait函数可以回收子进程终止信息。该函数有三个功能：
1. 阻塞等待子进程退出 
2. 回收子进程残留资源 
3. 获取子进程结束状态(退出原因)。

**Demo**

```cpp
/*wait的简单使用*/
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

```



```cpp
/*获取进程退出状态等信息*/
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
```

#### waitpid函数



```cpp
/*
    创建两个子进程，非阻塞回收指定id的子进程
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
```



```cpp
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
```



```cpp

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
```



