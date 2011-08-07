#include "kprint.h"

void kmain(void *mbd, unsigned int magic) {
  char *boot_loader_name = (char *) ((long *) mbd)[16];

  if (magic != 0x2BADB002) {
    /* Something went not according to specs. Print an error */
    /* message and halt, but do *not* rely on the multiboot */
    /* data structure. */
  }
 
  kprint(boot_loader_name);
}
