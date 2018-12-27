cmake_minimum_required(VERSION 2.8)
SET(EXECUTABLE_OUTPUT_PATH bin)
PROJECT(execl)
ADD_EXECUTABLE(execl execl.cpp)

PROJECT(output)
ADD_EXECUTABLE(output output.c)

PROJECT(execv)
ADD_EXECUTABLE(execv execv.cpp)
