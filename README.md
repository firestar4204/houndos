# HoundOS #
The HoundOS operating system.  Still in development.

Just a little hobby thing to figure out how operating systems work.  I don't want to just read through another kernel (very large).

Using cfenollosa/os-tutorial for some source code.

Sorry in advance for the way I use git.

## Building ##

You will need `nasm`, `clang`, and `lldb` (if you want to debug).

Run `make` to build, and `make run` or `make debug` to run.

## Features (Implemented and still TODO) ##

[x] 1-stage bootloader capable of loading a kernel
[x] 32-bit protected mode
[x] Port I/O drivers
[x] Screen drivers
[x] memcpy() and various string functions (very basic libc)
[ ] Interrupts (in progress)
[ ] Keyboard drivers (in progress)
[ ] FAT12/16/32 2-stage bootloader
[ ] Disk drivers
[ ] ELF parsing
[ ] A very basic shell

### Far Future (Ambitious projects) ###

[ ] Finish libc
[ ] Maybe a text editor (port houndtext)
[ ] Rewrite some basic GNU tools (coreutils)

## Contributing ##

Go ahead and submit some PRs if you want to.

My work on this is on/off, because school and rowing.

Anything is appreciated!

