# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.12.4/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.12.4/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/suzhenyu/workplace/study/Linux/Linux网络编程/code/Linux系统编程/wait

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/suzhenyu/workplace/study/Linux/Linux网络编程/code/Linux系统编程/wait/build

# Include any dependencies generated for this target.
include CMakeFiles/wait2.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/wait2.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/wait2.dir/flags.make

CMakeFiles/wait2.dir/wait2.c.o: CMakeFiles/wait2.dir/flags.make
CMakeFiles/wait2.dir/wait2.c.o: ../wait2.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/suzhenyu/workplace/study/Linux/Linux网络编程/code/Linux系统编程/wait/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/wait2.dir/wait2.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/wait2.dir/wait2.c.o   -c /Users/suzhenyu/workplace/study/Linux/Linux网络编程/code/Linux系统编程/wait/wait2.c

CMakeFiles/wait2.dir/wait2.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wait2.dir/wait2.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/suzhenyu/workplace/study/Linux/Linux网络编程/code/Linux系统编程/wait/wait2.c > CMakeFiles/wait2.dir/wait2.c.i

CMakeFiles/wait2.dir/wait2.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wait2.dir/wait2.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/suzhenyu/workplace/study/Linux/Linux网络编程/code/Linux系统编程/wait/wait2.c -o CMakeFiles/wait2.dir/wait2.c.s

# Object files for target wait2
wait2_OBJECTS = \
"CMakeFiles/wait2.dir/wait2.c.o"

# External object files for target wait2
wait2_EXTERNAL_OBJECTS =

bin/wait2: CMakeFiles/wait2.dir/wait2.c.o
bin/wait2: CMakeFiles/wait2.dir/build.make
bin/wait2: CMakeFiles/wait2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/suzhenyu/workplace/study/Linux/Linux网络编程/code/Linux系统编程/wait/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable bin/wait2"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wait2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/wait2.dir/build: bin/wait2

.PHONY : CMakeFiles/wait2.dir/build

CMakeFiles/wait2.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/wait2.dir/cmake_clean.cmake
.PHONY : CMakeFiles/wait2.dir/clean

CMakeFiles/wait2.dir/depend:
	cd /Users/suzhenyu/workplace/study/Linux/Linux网络编程/code/Linux系统编程/wait/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/suzhenyu/workplace/study/Linux/Linux网络编程/code/Linux系统编程/wait /Users/suzhenyu/workplace/study/Linux/Linux网络编程/code/Linux系统编程/wait /Users/suzhenyu/workplace/study/Linux/Linux网络编程/code/Linux系统编程/wait/build /Users/suzhenyu/workplace/study/Linux/Linux网络编程/code/Linux系统编程/wait/build /Users/suzhenyu/workplace/study/Linux/Linux网络编程/code/Linux系统编程/wait/build/CMakeFiles/wait2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/wait2.dir/depend

