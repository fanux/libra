FROM centos:7.6.1810
RUN set -x && yum install -y gcc-c++ make automake && yum install -y autoconf && yum install -y wget \
	&& wget https://github.com/Kitware/CMake/releases/download/v3.16.0-rc3/cmake-3.16.0-rc3.tar.gz \
	&& tar zxvf cmake-3.16.0-rc3.tar.gz \
	&& cd cmake-3.16.0-rc3 \
	&& yum install -y openssl-devel \
	&& ./configure && make && make install
RUN yum install -y libtool &&  wget https://github.com/google/protobuf/releases/download/v3.6.1/protobuf-all-3.6.1.tar.gz \
	&& tar zxvf protobuf-all-3.6.1.tar.gz \
	&& cd protobuf-3.6.1 && ./autogen.sh \
	&& ./configure && make && make install
RUN yum install -y zlib gcc-c++.x86_64 git which && git clone https://github.com/fanux/libra.git && cd libra && git checkout fanux-testnet
RUN cd libra && ./scripts/dev_setup.sh 
