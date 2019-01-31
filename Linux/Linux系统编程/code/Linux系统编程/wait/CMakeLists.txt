cmake_minimum_required(VERSION 2.8)
SET(EXECUTABLE_OUTPUT_PATH bin)

PROJECT(orphan)
ADD_EXECUTABLE(orphan orphan.c)

PROJECT(wait1)
ADD_EXECUTABLE(wait1 wait1.c)

PROJECT(wait2)
ADD_EXECUTABLE(wait2 wait2.c)

PROJECT(waitpid)
ADD_EXECUTABLE(waitpid waitpid.c)

PROJECT(waitpid2)
ADD_EXECUTABLE(waitpid2 waitpid2.c)

PROJECT(waitpid3)
ADD_EXECUTABLE(waitpid3 waitpid3.c)
