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
CMAKE_SOURCE_DIR = /Users/suzhenyu/workplace/study/project/Linux/Linux系统编程/exec

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/suzhenyu/workplace/study/project/Linux/Linux系统编程/exec/build

# Include any dependencies generated for this target.
include CMakeFiles/execl.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/execl.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/execl.dir/flags.make

CMakeFiles/execl.dir/execl.cpp.o: CMakeFiles/execl.dir/flags.make
CMakeFiles/execl.dir/execl.cpp.o: ../execl.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/suzhenyu/workplace/study/project/Linux/Linux系统编程/exec/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/execl.dir/execl.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/execl.dir/execl.cpp.o -c /Users/suzhenyu/workplace/study/project/Linux/Linux系统编程/exec/execl.cpp

CMakeFiles/execl.dir/execl.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/execl.dir/execl.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/suzhenyu/workplace/study/project/Linux/Linux系统编程/exec/execl.cpp > CMakeFiles/execl.dir/execl.cpp.i

CMakeFiles/execl.dir/execl.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/execl.dir/execl.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/suzhenyu/workplace/study/project/Linux/Linux系统编程/exec/execl.cpp -o CMakeFiles/execl.dir/execl.cpp.s

# Object files for target execl
execl_OBJECTS = \
"CMakeFiles/execl.dir/execl.cpp.o"

# External object files for target execl
execl_EXTERNAL_OBJECTS =

bin/execl: CMakeFiles/execl.dir/execl.cpp.o
bin/execl: CMakeFiles/execl.dir/build.make
bin/execl: CMakeFiles/execl.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/suzhenyu/workplace/study/project/Linux/Linux系统编程/exec/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bin/execl"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/execl.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/execl.dir/build: bin/execl

.PHONY : CMakeFiles/execl.dir/build

CMakeFiles/execl.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/execl.dir/cmake_clean.cmake
.PHONY : CMakeFiles/execl.dir/clean

CMakeFiles/execl.dir/depend:
	cd /Users/suzhenyu/workplace/study/project/Linux/Linux系统编程/exec/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/suzhenyu/workplace/study/project/Linux/Linux系统编程/exec /Users/suzhenyu/workplace/study/project/Linux/Linux系统编程/exec /Users/suzhenyu/workplace/study/project/Linux/Linux系统编程/exec/build /Users/suzhenyu/workplace/study/project/Linux/Linux系统编程/exec/build /Users/suzhenyu/workplace/study/project/Linux/Linux系统编程/exec/build/CMakeFiles/execl.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/execl.dir/depend

