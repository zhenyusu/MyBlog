# cmake中一些预定义变量
|常量名称|常量解释|
|-----|-------|
|`PROJECT_SOURCE_DIR`|工程的根目录|
|`PROJECT_BINARY_DIR`|运行cmake命令的目录,通常是`${PROJECT_SOURCE_DIR}/build`|
|`EXECUTABLE_OUTPUT_PATH`|重新定义目标二进制可执行文件的存放位置|
|`LIBRARY_OUTPUT_PATH `|重新定义目标链接库文件的存放位置|

# cmake常用命令
## 基本语法规则
* cmake变量使用${}方式取值,但是在IF控制语句中是直接使用变量名
* 环境变量使用$ENV{}方式取值,使用SET(ENV{VAR} VALUE)赋值
* 指令(参数1 参数2...)参数使用括弧括起,参数之间使用空格或分号分开。
* 指令是大小写无关的,参数和变量是大小写相关的。推荐你全部使用大写指令。

## 部分命令列表

|命令|作用|参数列表|
|---------|-----------------|--------------|
|`PROJECT(projectname [CXX] [C] [Java])`|指定项目名称|projectname:项目名称|
|`INCLUDE_DIRECTORIES([AFTER|BEFORE] [SYSTEM] dir1 dir2 ...)`|向工程添加多个特定的头文件搜索路径|AFTER:追加<br>BEFORE:置前;<br>路径之间用空格分割，如果路径中包含了空格，可以使用双引号将它括起来，默认的行为是追加到当前的头文件搜索路径的后面,通过 AFTER 或者 BEFORE 参数，也可以控制是追加还是置前。|
|`ADD_EXECUTABLE(bin_file_name ${SRC_LIST})`|生成可执行文件|`bin_file_name`:生成的可执行文件名称<br>`${SRC_LIST}`:源文件列表|
|`ADD_SUBDIRECTORY(src_dir [binary_dir] [EXCLUDE_FROM_ALL])`|向当前工程添加存放源文件的子目录,并可以指定中间二进制和目标二进制的存放位置|`src_dir`:需要添加存放源文件的子目录<br>`binary_dir`:二进制文件存放目录<br>`EXCLUDE_FROM_ALL `:将这个目录从编译过程中排除|
|`SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)`|重新定义最终可执行文件的目录|
|`SET(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)`|重新定义最终共享库的目录|

##静态库与动态库
|命令|作用|参数列表|备注|
|---------|-----------------|--------------||
|`ADD_LIBRARY(libname [SHARED|STATIC|MODULE][EXCLUDE_FROM_ALL]source1 source2 ... sourceN)`|生成动态库或者静态库|`SHARED`:动态库<br>`STATIC`:动态库<br>`MODULE`:在使用 dyld 的系统有效，如果不支持 dyld，则被当作 SHARED 对待<br>`EXCLUDE_FROM_ALL `:这个库不会被默认构建，除非有其他的组件依赖或者手工构建。|
|`SET_TARGET_PROPERTIES(target1 target2 ...PROPERTIES prop1 value1 prop2 value2 ...)`|设置输出的名称,设置动态库的版本和API版本|

**注意：**如何生成同名的动态库和静态库？假设我们生成hello的静态库和动态库
(1)设置源文件列表
`SET(LIBHELLO_SRC hello.c)`
(2)生成动态库和静态库
`ADD_LIBRARY(hello SHARED ${LIBHELLO_SRC})`
`ADD_LIBRARY(hello STATIC ${LIBHELLO_SRC})`
(3)设置输出名称
`SET_TARGET_PROPERTIES(hello_static PROPERTIES OUTPUT_NAME "hello")`
如果上面三步还是不能生成同名的静态库或者动态库，请执行下面的第四部
(4)显示指定不删除同名的库
`SET_TARGET_PROPERTIES(hello PROPERTIES CLEAN_DIRECT_OUTPUT 1)`
`SET_TARGET_PROPERTIES(hello_static PROPERTIES CLEAN_DIRECT_OUTPUT 1)`

## 安装

`CMAKE_INSTALL_PREFIX`: 类似于 configure 脚本的 –prefix，常见的使用方法看
起来是这个样子：cmake -DCMAKE_INSTALL_PREFIX=/usr .

`INSTALL(TARGETS targets...`
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`[[ARCHIVE|LIBRARY|RUNTIME]`
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`[DESTINATION <dir>]`
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`[PERMISSIONS permissions...]`
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`[CONFIGURATIONS`
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`[Debug|Release|...]]`
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`[COMPONENT <component>]`
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`[OPTIONAL]`
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`] [...])`
(1)参数中的 TARGETS 后面跟的就是我们通过 ADD_EXECUTABLE 或者 ADD_LIBRARY 定义的
目标文件，可能是可执行二进制、动态库、静态库。
(2)目标类型也就相对应的有三种，ARCHIVE 特指静态库，LIBRARY 特指动态库，RUNTIME
特指可执行目标二进制。
(3)DESTINATION 定义了安装的路径，如果路径以/开头，那么指的是绝对路径，这时候
CMAKE_INSTALL_PREFIX 其实就无效了。如果你希望使用 CMAKE_INSTALL_PREFIX 来
定义安装路径，就要写成相对路径，即不要以/开头，那么安装后的路径就是
${CMAKE_INSTALL_PREFIX}/<DESTINATION 定义的路径>











