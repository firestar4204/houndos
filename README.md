# HoundOS #
The HoundOS operating system.  Still in development.

Just a little hobby thing to figure out how operating systems work.  I don't want to just read through another kernel (very large).

Using cfenollosa/os-tutorial for some source code.

Sorry in advance for the way I use git.

## Building ##

You will need `nasm`, `i686-elf-gcc`, and `i386-elf-gdb` (if you want to debug).

Run `make` to build, and `make run` or `make debug` to run.

## Features (Implemented and still TODO) ##

- [x] 1-stage bootloader capable of loading a kernel
- [x] 32-bit protected mode
- [x] Port I/O drivers
- [x] Screen drivers
- [x] memcpy() and various string functions (very basic libc)
- [x] Interrupts
- [ ] Keyboard drivers (in progress)
- [ ] FAT12/16/32 2-stage bootloader
- [ ] Disk drivers
- [ ] ELF parsing
- [ ] A very basic shell

### Far Future (Ambitious projects that probably won't happen) ###

- [ ] Finish libc
- [ ] Maybe a text editor (port houndtext)
- [ ] Rewrite some basic GNU tools (coreutils)

## Contributing ##

Go ahead and submit some PRs if you want to.

My work on this is on/off, because school and rowing.

Anything is appreciated!

#### A cut-off picture of Andy the hound ####
<img src="./docs/1611671277683_4651693421818f874b0ec29f0da151b2.jpeg" alt="Andy the hound" width=500 />
