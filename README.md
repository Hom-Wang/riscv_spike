# riscv_spike


```shell
sudo apt update
sudo apt install autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev device-tree-compiler libboost-regex-dev libboost-system-dev
```

### PATH

``` shell
nano ~/.bashrc
    # add the following lines at the end of the file
    export PATH=/opt/riscv/bin:$PATH

source ~/.bashrc

# fish_add_path /opt/riscv/bin
```

### riscv-gnu-toolchain

``` shell
git clone https://github.com/riscv-collab/riscv-gnu-toolchain.git
cd riscv-gnu-toolchain

./configure --prefix=/opt/riscv --with-arch=rv32gc --with-abi=ilp32d --enable-multilib
sudo make -j4
sudo make install

riscv32-unknown-elf-gcc --version
riscv32-unknown-elf-gcc -print-multi-lib
```

### riscv-isa-sim

``` shell
git clone https://github.com/riscv-software-src/riscv-isa-sim.git
cd riscv-isa-sim

mkdir build
cd build
../configure --prefix=/opt/riscv
make -j4
sudo make install

spike -h
```

### riscv-pk

``` shell
git clone https://github.com/riscv-software-src/riscv-pk.git
cd riscv-pk

mkdir build
cd build
../configure --prefix=/opt/riscv --host=riscv32-unknown-elf
make -j4
sudo make install  # install path: /opt/riscv/riscv32-unknown-elf/bin
```

### build & run

``` shell
riscv32-unknown-elf-gcc -march=rv32imafc -mabi=ilp32f -o main32 main.c
spike --isa=rv32imafc /opt/riscv/riscv32-unknown-elf/bin/pk main32
```
