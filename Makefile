CC= gcc
CFLAGS= -Wall -Wextra -std=c11
SRC= ./linker.ld ./startup.S ./main.c
OUT= ./build

cross_compile:
	@arm-none-eabi-gcc \
    -mcpu=cortex-m3 \
    -mthumb \
    -ffreestanding \
    -fno-builtin \
    -O0 -g \
    -nostdlib \
    -nostartfiles \
    -T $(SRC) \
    -Wl,-Map=$(OUT)/firmware.map \
    -Wl,--build-id=none \
    -o $(OUT)/firmware.elf

elf_to_bin:
	@arm-none-eabi-objcopy -O binary $(OUT)/firmware.elf $(OUT)/firmware.bin

emu_with_debug:
	@qemu-system-arm \
		-M stm32vldiscovery \
		-kernel $(OUT)/firmware.bin \
		-display none \
		-serial null \
		-monitor stdio \
		-S \
		-gdb tcp:127.0.0.1:1234

