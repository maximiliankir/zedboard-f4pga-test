FROM gcr.io/hdl-containers/conda/f4pga/xc7/z020

RUN apt update && apt install -y \
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
  g++

RUN git clone https://github.com/trabucayre/openFPGALoader && cd openFPGALoader && mkdir build && cd build && cmake .. && cmake --build . && make install

RUN mkdir /usr/local/share/f4pga/arch/xc7z020_test/xc7z020clg484-1
ADD data/archs/xc7z020clg484-1 /usr/local/share/f4pga/arch/xc7z020_test/xc7z020clg484-1

# RUN useradd -ms /bin/bash f4pga
# USER f4pga