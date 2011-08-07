CSOURCES=kprint.c kernel.c
ASMSOURCES=loader.s
OBJS=$(CSOURCES:.c=.o) $(ASMSOURCES:.s=.o)
DEBUG=-g
CFLAGS=-c -Wall -Wextra -Werror -ansi -pedantic -nostdlib -nostartfiles -nodefaultlibs -m32 $(DEBUG)
ASMFLAGS=-f elf32 $(DEBUG)

kernel.bin: $(OBJS)
	ld -melf_i386 -T linker.ld -o $(.TARGET) $(OBJS)

.c.o:
	gcc $(CFLAGS) -o $@ $<

.s.o:
	nasm $(ASMFLAGS) -o $@ $<

clean:
	rm *.o *.bin
