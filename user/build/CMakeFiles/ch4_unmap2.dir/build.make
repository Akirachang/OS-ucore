# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/cmake-3.20.0-rc4-linux-x86_64/bin/cmake

# The command to remove a file.
RM = /usr/local/cmake-3.20.0-rc4-linux-x86_64/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/akira/Desktop/compare/OS2/user

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/akira/Desktop/compare/OS2/user/build

# Include any dependencies generated for this target.
include CMakeFiles/ch4_unmap2.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/ch4_unmap2.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/ch4_unmap2.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ch4_unmap2.dir/flags.make

CMakeFiles/ch4_unmap2.dir/src/ch4_unmap2.c.o: CMakeFiles/ch4_unmap2.dir/flags.make
CMakeFiles/ch4_unmap2.dir/src/ch4_unmap2.c.o: ../src/ch4_unmap2.c
CMakeFiles/ch4_unmap2.dir/src/ch4_unmap2.c.o: CMakeFiles/ch4_unmap2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/akira/Desktop/compare/OS2/user/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/ch4_unmap2.dir/src/ch4_unmap2.c.o"
	riscv64-linux-musl-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/ch4_unmap2.dir/src/ch4_unmap2.c.o -MF CMakeFiles/ch4_unmap2.dir/src/ch4_unmap2.c.o.d -o CMakeFiles/ch4_unmap2.dir/src/ch4_unmap2.c.o -c /home/akira/Desktop/compare/OS2/user/src/ch4_unmap2.c

CMakeFiles/ch4_unmap2.dir/src/ch4_unmap2.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ch4_unmap2.dir/src/ch4_unmap2.c.i"
	riscv64-linux-musl-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/akira/Desktop/compare/OS2/user/src/ch4_unmap2.c > CMakeFiles/ch4_unmap2.dir/src/ch4_unmap2.c.i

CMakeFiles/ch4_unmap2.dir/src/ch4_unmap2.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ch4_unmap2.dir/src/ch4_unmap2.c.s"
	riscv64-linux-musl-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/akira/Desktop/compare/OS2/user/src/ch4_unmap2.c -o CMakeFiles/ch4_unmap2.dir/src/ch4_unmap2.c.s

# Object files for target ch4_unmap2
ch4_unmap2_OBJECTS = \
"CMakeFiles/ch4_unmap2.dir/src/ch4_unmap2.c.o"

# External object files for target ch4_unmap2
ch4_unmap2_EXTERNAL_OBJECTS =

riscv64/ch4_unmap2: CMakeFiles/ch4_unmap2.dir/src/ch4_unmap2.c.o
riscv64/ch4_unmap2: CMakeFiles/ch4_unmap2.dir/build.make
riscv64/ch4_unmap2: libulib.a
riscv64/ch4_unmap2: CMakeFiles/ch4_unmap2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/akira/Desktop/compare/OS2/user/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable riscv64/ch4_unmap2"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ch4_unmap2.dir/link.txt --verbose=$(VERBOSE)
	mkdir -p asm
	riscv64-linux-musl-objdump -d -S /home/akira/Desktop/compare/OS2/user/build/riscv64/ch4_unmap2 > asm/ch4_unmap2.asm
	mkdir -p bin
	riscv64-linux-musl-objcopy -O binary /home/akira/Desktop/compare/OS2/user/build/riscv64/ch4_unmap2 bin/ch4_unmap2.bin --set-section-flags .bss=alloc,load,contents

# Rule to build all files generated by this target.
CMakeFiles/ch4_unmap2.dir/build: riscv64/ch4_unmap2
.PHONY : CMakeFiles/ch4_unmap2.dir/build

CMakeFiles/ch4_unmap2.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ch4_unmap2.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ch4_unmap2.dir/clean

CMakeFiles/ch4_unmap2.dir/depend:
	cd /home/akira/Desktop/compare/OS2/user/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/akira/Desktop/compare/OS2/user /home/akira/Desktop/compare/OS2/user /home/akira/Desktop/compare/OS2/user/build /home/akira/Desktop/compare/OS2/user/build /home/akira/Desktop/compare/OS2/user/build/CMakeFiles/ch4_unmap2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ch4_unmap2.dir/depend

