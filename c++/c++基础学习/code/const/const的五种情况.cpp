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

