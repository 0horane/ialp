AS := nasm
ASFLAGS := -f elf64 -F DWARF -g -Wall
LD := ld
LDFLAGS := -g
TARGET := hello-world

.PHONY: all clean
all: $(TARGET)
# assembly
$(TARGET).o: $(TARGET).asm
		$(AS) $(ASFLAGS) $<

# linking
$(TARGET): $(TARGET).o
		$(LD) $(LDFLAGS) $< -o $@
clean:
		rm -rf *.o $(TARGET)