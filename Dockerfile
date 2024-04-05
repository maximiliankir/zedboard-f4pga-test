FROM gcr.io/hdl-containers/conda/f4pga/xc7/z020

RUN apt update && apt install sudo git make -y

RUN mkdir /usr/local/share/f4pga/arch/xc7z020_test/xc7z020clg484-1
ADD data/archs/xc7z020clg484-1 /usr/local/share/f4pga/arch/xc7z020_test/xc7z020clg484-1

# RUN useradd -ms /bin/bash f4pga
# USER f4pga