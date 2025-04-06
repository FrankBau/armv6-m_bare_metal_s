cmake_minimum_required(VERSION 3.13)

include(${CMAKE_SOURCE_DIR}/arm-none-eabi-toolchain.cmake)

project(CortexM0_Assembly LANGUAGES ASM)

add_executable(output.elf main.s)
target_compile_options(output.elf PRIVATE -march=armv6-m -mthumb)
target_link_options(output.elf PRIVATE "-T${CMAKE_SOURCE_DIR}/flash.ld")

add_custom_command(
    TARGET output.elf POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:output.elf> ${CMAKE_BINARY_DIR}/output.bin
    COMMAND ${CMAKE_OBJDUMP} -d -h $<TARGET_FILE:output.elf> > ${CMAKE_BINARY_DIR}/output.lst
    COMMENT "Generating output.bin and output.lst from output.elf"
)
