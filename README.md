# Embedded 101


Basic emulation of an arm architecture using qemu, cross compilation and debugger.

## Features

- Can compile C code to arm architecture
- Can emulate with qemu a stm32vldiscovery machine, launch it and stop the process
- Can debug with gdb the cpus registers and breakpoint the flow of the program

## Requirements

- qemu-system-arm
- arm-none-eabi-gcc
- gdb-multiarch

Tested on Linux Debian 12
```bash
    sudo apt update
    sudo apt install qemu-system-arm gdb-multiarch gcc-arm-none-eabi binutils-arm-none-eabi
```
## Build

```bash
mkdir build
make cross_compile
make elf_to_bin
make emu_with_debug
```

## Debug

You can then inspect in a new terminal with gdb
```bash
gdb-multiarch ./build/firmware.elf
target remote 127.0.0.1:1234
x/16wx 0x08000000
info registers
break main
...
```
## License

This project is for learning and experimentation purposes.
