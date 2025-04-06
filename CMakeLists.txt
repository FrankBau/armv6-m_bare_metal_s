# Minimum CMake version
cmake_minimum_required(VERSION 3.13)

# Include the toolchain file for ARM Cortex-M0
include(${CMAKE_SOURCE_DIR}/arm-none-eabi-toolchain.cmake)

# Set project name and the output executable name
project(CortexM0_Assembly LANGUAGES ASM)

# Set the GCC toolchain flags for Cortex-M0
set(CMAKE_TOOLCHAIN_FILE "arm-none-eabi-toolchain.cmake")

# Add the assembler source file
add_executable(output.elf main.s)
target_compile_options(output.elf PRIVATE -march=armv6-m -mthumb)
target_link_options(output.elf PRIVATE "-T${CMAKE_SOURCE_DIR}/flash.ld")

add_custom_command(
    TARGET output.elf POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:output.elf> ${CMAKE_BINARY_DIR}/output.bin
    COMMAND ${CMAKE_OBJDUMP} -d -h $<TARGET_FILE:output.elf> > ${CMAKE_BINARY_DIR}/output.lst
    COMMENT "Generating output.bin and output.lst from output.elf"
)
