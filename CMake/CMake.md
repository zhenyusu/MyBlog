# cmake中一些预定义变量
|常量名称|常量解释|
|-----|-------|
|`PROJECT_SOURCE_DIR`|工程的根目录|
|`PROJECT_BINARY_DIR`|运行cmake命令的目录,通常是${PROJECT_SOURCE_DIR}/build|
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
|`SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)`|重新定义最终共享库的目录|

##静态库与动态库
|命令|作用|参数列表|备注|
|---------|-----------------|--------------||
|`ADD_LIBRARY(libname [SHARED|STATIC|MODULE][EXCLUDE_FROM_ALL]source1 source2 ... sourceN)`|`SHARED`:动态库<br>`STATIC`:动态库<br>`MODULE`:在使用 dyld 的系统有效，如果不支持 dyld，则被当作 SHARED 对待<br>`EXCLUDE_FROM_ALL `:这个库不会被默认构建，除非有其他的组件依赖或者手工构建。|








