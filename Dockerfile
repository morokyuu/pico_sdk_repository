FROM ubuntu:22.04

#WORKDIR pico
#COPY ./hoge/foo /pico

RUN apt update -y && apt upgrade -y \
    && apt install -y vim git wget gperf curl unzip sudo \
    python3 python3-pip python3-venv \
    gcc-arm-none-eabi libnewlib-arm-none-eabi \
    build-essential checkinstall zlib1g-dev libssl-dev \
    automake autoconf build-essential texinfo libtool libftdi-dev libusb-1.0-0-dev
    
RUN wget https://github.com/Kitware/CMake/releases/download/v3.23.3/cmake-3.23.3.tar.gz \
    && tar -zxvf cmake-3.23.3.tar.gz \
    && cd cmake-3.23.3 \
    && ./bootstrap \
    && make && make install && hash -r \
    && cmake --version

#RUN cd /root \
#    && wget https://raw.githubusercontent.com/raspberrypi/pico-setup/master/pico_setup.sh \
#    && chmod +x pico_setup.sh \
#    && export SKIP_VSCODE=1 \
#    && export SKIP_UART=1 \
#    && ./pico_setup.sh



