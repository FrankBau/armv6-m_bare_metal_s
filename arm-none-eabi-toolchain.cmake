# Specify the C and ASM compilers
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)

# Specify the system name and processor
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR cortex-m0)

# Optional: Additional compiler and linker flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mcpu=cortex-m0 -mthumb")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -mcpu=cortex-m0 -mthumb")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -nostartfiles -Wl,--gc-sections")
