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

## PS example
Blink the LD9 LED which is connected to the PS.

Build the binary:
```Bash
cd ps
make
```

Upload the binary to the board:
```Bash
make openocd # Connects to the board and starts GDB server
# In separate terminal:
make debug
# Press ENTER once to upload binary
# Press ENTER a second time to start the execution
# After that the GDB session can be used for debugging (set breakpoints etc.) 
```

### Credits:
- Blink example: [3ap/zybo-z7-baremetal](https://github.com/3ap/zybo-z7-baremetal)
- `bsp/boot.S` & `bsp/Zynq.ld` from [bigbrett/zybo-baremetal](https://github.com/bigbrett/zybo-baremetal)
- `bsp/ps7_init_gpl.{c,h}` & `bsp/ps7_spl_init.c` from [Das U-boot](http://git.denx.de/?p=u-boot.git;a=summary)