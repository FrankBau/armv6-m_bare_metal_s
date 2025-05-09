# all tools shall be on PATH to ensure cross-system build compatibility. no need to set GCC_DIR or EXE

RM=del

AS=$(GCC_DIR)arm-none-eabi-as$(EXE)
CC=$(GCC_DIR)arm-none-eabi-gcc$(EXE)
LD=$(GCC_DIR)arm-none-eabi-ld$(EXE)
OBJCOPY=$(GCC_DIR)arm-none-eabi-objcopy$(EXE)
OBJDUMP=$(GCC_DIR)arm-none-eabi-objdump$(EXE)
SIZE=$(GCC_DIR)arm-none-eabi-size$(EXE)

CFLAGS  = -g -mcpu=cortex-m0 -mthumb -fomit-frame-pointer
ASFLAGS = -g -mcpu=cortex-m0 -mthumb

PROG=main

OBJS=$(PROG).o

all: $(PROG).bin $(PROG).list $(PROG).hex

%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<
	
$(PROG).elf: $(OBJS) flash.ld
	$(LD) -T flash.ld -o $@ $(OBJS) -Map=$(PROG).map
	$(SIZE) $@

$(PROG).list: $(PROG).elf
	$(OBJDUMP) -d -h $< > $@

$(PROG).bin: $(PROG).elf
	$(OBJCOPY) -Obinary  $< $@

$(PROG).hex: $(PROG).elf
	$(OBJCOPY) -Oihex  $< $@

clean:
	-$(RM) $(PROG).bin $(PROG).hex $(PROG).elf $(PROG).map $(PROG).list $(OBJS)
