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

#RUN wget https://github.com/Kitware/CMake/releases/download/v3.26.4/cmake-3.26.4-linux-x86_64.sh \
#    && chmod +x cmake-3.26.4-linux-x86_64.sh \
#    && yes | /bin/sh cmake-3.26.4-linux-x86_64.sh \
#    && cp -r ./cmake-3.26.4-linux-x86_64 /opt \
#    && ln -s /opt/cmake-3.26.4-linux-x86_64/bin/* /usr/bin

RUN wget https://raw.githubusercontent.com/raspberrypi/pico-setup/master/pico_setup.sh \
    && chmod +x pico_setup.sh \
    && export SKIP_VSCODE=1 \
    && export SKIP_UART=1 \
    && ./pico_setup.sh

#    && cd /pico-sdk \
#    && git submodule update --init \
#    && cd .. \
#    && git clone https://github.com/raspbberypi/pico-examples.git --branch master \
#    && ./install.sh esp32


