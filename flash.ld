ENTRY(_start)

MEMORY
{
    FLASH(rx) : ORIGIN = 0x08000000, LENGTH = 256k
    RAM(rw)   : ORIGIN = 0x20000000, LENGTH =  64k
}

PROVIDE( _estack = ORIGIN(RAM)+LENGTH(RAM) );   
    
SECTIONS {
    .isr_vector : { # start of flash: initial SP and PC
    	KEEP(*(.isr_vector))
    } > FLASH

    .text : {       # code (instructions) go here
    	*(.text*)
    } > FLASH

    .rodata : {     # read only (const) global data 
        *(.rodata*) 
    } > FLASH
}
