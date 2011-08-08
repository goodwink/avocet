CSOURCES=kprint.c kernel.c
ASMSOURCES=loader.s
LDSCRIPT=linker.ld
OBJS=$(CSOURCES:.c=.o) $(ASMSOURCES:.s=.o)
DEBUG=-g
CFLAGS=-c -Wall -Wextra -Werror -ansi -pedantic -nostdlib -nostartfiles -nodefaultlibs -m32 $(DEBUG)
ASMFLAGS=-f elf32 $(DEBUG)
LDFLAGS=-melf_i386 -T
BINARY=kernel.bin

all: $(BINARY)

$(BINARY): $(OBJS) $(LDSCRIPT)
	ld $(LDFLAGS) $(LDSCRIPT) -o $(BINARY) $(OBJS)

.c.o:
	gcc $(CFLAGS) -o $@ $<

.s.o:
	nasm $(ASMFLAGS) -o $@ $<

clean:
	rm *.o *.bin
