# linux下OpenCV环境的配置（ubuntu 16.04）
---
title: linux下OpenCV环境的配置
date: 2018-05-17 12:23:48
tags:
    - OpenCV
    - 文件管理
categories:
    - OpenCV
keywords:
description:
---


1. 官网地址：[http://opencv.org/](http://opencv.org/)，我下的是3.3的版本，格式为 `tar.gz`
2. 在 `/home/你的用户名/`下新建一个`software/opencv`文件夹来存放源码
``` 
mkdir software
cd software
mkdir opencv //来存放opencv源代码
```
3. 以cmake方法进行安装，先要在终端中安装依赖项
```
sudo apt-get install build-essential libgtk2.0-dev libavcodec-dev libavformat-dev libjpeg.dev libtiff4.dev libswscale-dev libjasper-dev
```
4. 安装cmake
`sudo apt-get install cmake`

5. cmake安装opencv

	简单讲一下Cmake编译，首先要有一个`CMakeLists.txt`(注意文件名不能错)文件，告诉编译器你需要编译哪些内容，这个“内容”在自己编写的项目中需要自行添加，而在OpenCV里面已经写好了这个文件，我们只需编译即可。
	接下来开始cmake编译安装opencv。
	- 先进入opencv源码目录：`cd software/opencv/opencv-3.3.0`
	- 在源码目录下新建build文件夹，用来编译：`mkdir build`
	- 进入build文件夹：`cd mkdir `
	- 开始编译：
	```
	cmake ..
	make
	```
	接下来就是漫长的等待
	- 使用 make install 安装：`sudo make install`
	- 查看opencv依赖库：`pkg-config opencv --libs`

6. opencv环境的配置
	```
	//链接库被系统共享
	sudo gedit /etc/ld.so.conf (在弹出的窗口中复制如下一段文字：/usr/local/lib)
	sudo ldconfig (使得配置生效)

	//为程序指定openvc的头文件位置
	sudo gedit /etc/bash.bashrc
	(在弹出的窗口中添加
	PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
	export PKG_CONFIG_PATH
	)
	source /etc/bash.bashrc 使得配置生效
	```
7. 运行测试
	首先先简答了解一下`CMakeLists.txt`文件的写法
	
	1. 指定cmake版本
		`cmake_minimum_required(VERSION 2.8)`
	2. 指定项目名称，一般和项目的文件夹名称对应
	  	`PROJECT(DisplayImage)`
	3. 寻找需要用到的其他CMake packages
		`find_package(OpenCV REQUIRED)`
	4. 头文件目录
		`include_directories(${OpenCV_INCLUDE_DIRS})`
	5. 添加要编译的可执行文件
		`add_executable(DisplayImage test.cpp)`
	6. 添加可执行文件需要用的库
		`target_link_libraries(DisplayImage ${OpenCV_LIBS})`
    
	OK...

	随便写一个程序用来显示图片
	```cpp
	#include <iostream>
	#include "opencv2/opencv.hpp"
	int main() {
	
	    cv::Mat srcImage = cv::imread("lena.jpg", 1);
	    cv::namedWindow("Hello", cv::WINDOW_AUTOSIZE);
	    cv::imshow("Hello", srcImage);
	    cv::waitKey(0);
	
	
	    return 0;
}
	```
	OK...

   开始运行（在CMakeLists.txt文件同级目录下）
   ```
	cmake ..
	make
   ```
   
   OK...

这里附上操作视频，看文档没配置成功的可以直接看视频操作。

**参考链接：**
[Cmake知识----编写CMakeLists.txt文件编译C/C++程序](https://www.cnblogs.com/cv-pr/p/6206921.html)
[opencv-3.0.0在Ubuntu14.04下的配置与安装](https://blog.csdn.net/junmuzi/article/details/49888123)
[Ubuntu-Opencv Ubuntu14.04 Opencv3.3.0 安装配置及测试](https://blog.csdn.net/lgh0824/article/details/78487234)
[Linux\Ubuntu 16.04配置Opencv](https://blog.csdn.net/keith_bb/article/details/52685231)
下一篇：ubuntu下CLion的配置和使用

**写于2018/5/29**
	
