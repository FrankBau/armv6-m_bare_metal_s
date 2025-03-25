This is a very simple assembler example for use on a Nucleo-L432KC board.

Build with `make`, clean with 'make clean', `make` command is needed.

The arm-none-eabi toolchain must be on the path.
Available from https://www.st.com/en/development-tools/stm32cubeclt.html

Execute by copying the resulting .bin file onto the Nucleo-L432KC "USB drive".

Build and debug with VS Code: Open the *folder*, use the STM32 VS Code Extension.


The MCU has a Arm Cortex-M4 core. 
For didactical reasons, we use only a subset of instructions 
corresponding to an Arm Cortex-M0 or Arm Cortex-M0+. 

Help with the instrucion set and the Arm Cortex core:
-  STM32 Cortex®-M0+ MCUs programming manual
- https://developer.arm.com/documentation/ddi0419/c/Application-Level-Architecture/The-ARMv6-M-Instruction-Set

Help with GPIO registers and ST peripherals in the MCU:
- STM RM0394 Reference manual
