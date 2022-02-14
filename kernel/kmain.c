#include "../drivers/screen.h"
#include "../libc/string.h"

void kmain()
{
	clear_screen();
	kprint("Hi, new\nline.");
	kprint("More new\nlines\nto\nfill\nup\nscreen\n\n\n\n\nmore new lines and other stuff\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nlets\nsee");
}

