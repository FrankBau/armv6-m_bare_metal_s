// target: Nucleo-L342KC board, user LED on pin PB3

.syntax unified                 // use modern syntax
.cpu cortex-m0                  // we restrict ourselves to cortex-m0 instructions
.thumb                          // we generate thumb code (not arm)


.section .isr_vector, "a", %progbits  // interrupt vector table section
.global  isr_vector             // declare the symbol 'isr_vector' as globally visible
.type    isr_vector, %object    // declare 'isr_vector' as an object (data) symbol
isr_vector:                     // vector table for the interrupt service routines (ISRs)
    .word   _estack             // initial value of the stack pointer (defined in the linker script)
    .word   _start              // reset vector (start of the program)


.section  .text, "ax", %progbits// program code section
.global   _start                // declare the symbol '_start' as globally visible
.type     _start, %function     // declare '_start' as a function
_start:
        ldr  r0, =0x4002104C
        movs r1, #3
        str  r1, [r0]
        ldr  r0, =0x48000400
        ldr  r1, =0xffffff7f
        str  r1, [r0]
        movs r1, #0x08
        str  r1, [r0, 0x14]    
        b .
