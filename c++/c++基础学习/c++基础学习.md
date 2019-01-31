# C++基础学习

## C/C++中的const

### 1. 基础知识

```cpp
const int a;//常整形数
int const b;//常整形数
const int *c;//c是一个指向常整形数的指针(所指向的内存数据不能被修改，但是本身可以修改)
int * const d;//d是常指针(指针变量不能修改，但是所指向的内存数据可以修改)
const int * const e ;//e是一个指向常整形的常指针(指针和他所指向的内存空间都不能被修改)

```

```cpp

#include <iostream>
using namespace std;

struct Teacher
{
    char name[6];
    int age;
};


int OperatorTeacher01(const Teacher *pt)
{
    //pt->age = 10;//不能修改
    pt = NULL;
}

int OperatorTeacher02( Teacher *const pt)
{
    pt->age = 10;
    //pt = NULL;//不能修改
}

int OperatorTeacher03(const Teacher * const pt)
{
    //pt->age = 10;//不能修改
    //pt = NULL;//不能修改
}


int main(int argc,char *argv[])
{

    Teacher t1;
    t1.age = 33;
    return 0;

}

```

