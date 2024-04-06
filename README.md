# F4PGA Zedboard Example
Trying fully open-source flows on the Avnet Zedboard with the xc7z020clg484-1 Zynq-7000 FPGA.
The goal is to have three different examples for PL only, PS only and PS+PL, using only open-source tools.
Everything comes inside a VSCode Devcontainer, to use it out of the box.

**Attention: Docker Container runs as --privileged to have acces to the Zedboard via USB. This is potentially a security vulnerability.**

## Setup
- Clone the repository and open in VSCode.
- Install the official "Dev Container" extension
- Click in the bottom-left corner and select "Reopen in container"

## PL example
Connects the PL LEDs with the switches, using a 100 MHz Clock. 

Build the bitstream:
```Bash
cd pl/
make
```

Upload the bitstream to the Zedboard (connected via USB):
```Bash
openFPGALoader -b zedboard build/zedboard/top.bit
```

#### (Optional) Use with locally installed F4PGA tools

```Bash
export F4PGA_INSTALL_DIR="$HOME/f4pga"
export FPGA_FAM="xc7"
source "$F4PGA_INSTALL_DIR/$FPGA_FAM/conda/etc/profile.d/conda.sh"

conda activate xc7
```