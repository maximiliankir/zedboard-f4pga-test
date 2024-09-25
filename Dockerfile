FROM gcr.io/hdl-containers/conda/f4pga/xc7/z020

RUN apt update && apt install -y \
  sudo \
  git \
  gzip \
  libftdi1-2 \
  libftdi1-dev \
  libhidapi-hidraw0 \
  libhidapi-dev \
  libudev-dev \
  zlib1g-dev \
  cmake \
  pkg-config \
  make \
  g++ \
  libncursesw5 \
  wget \
  openocd

RUN git clone https://github.com/trabucayre/openFPGALoader && cd openFPGALoader && mkdir build && cd build && cmake .. && cmake --build . && make install

RUN wget https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi.tar.xz && \
  tar -xf arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi.tar.xz -C /usr/share/ && \
  ln -s /usr/share/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi/bin/* /usr/bin/

RUN mkdir /usr/local/share/f4pga/arch/xc7z020_test/xc7z020clg484-1
ADD data/archs/xc7z020clg484-1 /usr/local/share/f4pga/arch/xc7z020_test/xc7z020clg484-1

RUN useradd -ms /bin/bash zedboardtester
RUN usermod -aG sudo zedboardtester
RUN passwd -d zedboardtester
USER zedboardtester