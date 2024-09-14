
all:
	@riscv32-unknown-elf-gcc -march=rv32imafc -mabi=ilp32f -o main32 main.c

test: clean all
	@spike --isa=rv32imafc /opt/riscv/riscv32-unknown-elf/bin/pk main32

clean:
	@if [ -f main32 ]; then rm main32; fi
