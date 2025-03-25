This is a very simple assembler example.

# Advanced

Sections .data and .bss needed more startup code to work like in C.

Section aligment is sloppy.

Check .elf file with

`arm-none-eabi-readelf -e main.elf`

Disassemble:
`arm-none-eabi-objdump -d main.elf`
