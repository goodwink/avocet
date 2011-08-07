#include "kprint.h"

/* note this example will always write to the top
   line of the screen */
void kprint(char *string) {
  int color = 0x07;
  volatile char *video = (volatile char*) 0xB8000;

  while (*string != 0) {
    *video=*string;
    string++;
    video++;
    *video=color;
    video++;
  }
}
