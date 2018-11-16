# Linux系统编程

[TOC]
## 1. 进程相关概念
[进程相关概念](https://www.cnblogs.com/tianlangshu/p/5224178.html)

## 2. 进程控制

### fork()

> **功能**: 创建一个子进程。**子进程会接着父进程的fork()语句后继续执行。**
> **返回值**: 失败返回-1；  成功返回：(1)父进程返回子进程的ID(非负) (2)子进程返回 0 
> **注意**: pid_t类型表示进程ID，但为了表示-1，它是有符号整型。(0不是有效进程ID，init最小为1)。注意返回值，不是fork函数能返回两个值，而是fork后，fork函数变为两个，父子需各自返回一个。

**Demo**:循环创建n个进程
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

## 进程共享