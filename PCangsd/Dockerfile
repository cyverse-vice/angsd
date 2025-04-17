FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

USER root

# install dependencies
RUN apt-get update && apt-get install -y g++ \
		build-essential \
	   	make \
		git \
		libcurl4 \
		libcurl4-openssl-dev \
		libssl-dev \
		libncurses5-dev \
		libsodium-dev \
		libmariadb-dev \
		libbz2-dev \
		liblzma-dev \
		libssl-dev \
		zlib1g-dev \
		libxml2-dev \
		libfontconfig1-dev \
		libharfbuzz-dev \
		libfribidi-dev \
		libfreetype6-dev \
		libpng-dev \
		libtiff5-dev \
		libjpeg-dev \
		libpq-dev \
		openssl \
		default-jdk \
		lbzip2 \
		unzip \
		bzip2 \
		tzdata \ 
		perl \
		wget \
		bcftools \
		curl \
		nano \
		sudo

# Install python dependencies
RUN apt-get update && apt-get install -y \
    wget build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev curl \
    libncursesw5-dev xz-utils tk-dev libxml2-dev \
    libxmlsec1-dev libffi-dev liblzma-dev git \
    && rm -rf /var/lib/apt/lists/*

# Download and install Python 3.12
RUN wget https://www.python.org/ftp/python/3.12.2/Python-3.12.2.tgz && \
    tar -xvf Python-3.12.2.tgz && \
    cd Python-3.12.2 && \
    ./configure --enable-optimizations && \
    make -j$(nproc) && \
    make altinstall && \
    cd .. && rm -rf Python-3.12.2*

# Set python3.12 as default python
RUN ln -s /usr/local/bin/python3.12 /usr/bin/python && \
    ln -s /usr/local/bin/pip3.12 /usr/bin/pip

# install pcangsd
RUN /usr/local/bin/python3.12 -m venv /root/pcangsd
RUN /root/pcangsd/bin/pip install --upgrade pip setuptools
RUN /bin/bash -c "source ~/pcangsd/bin/activate" && echo "source ~/pcangsd/bin/activate" >>  ~/.bashrc
RUN pip install pcangsd

ENTRYPOINT ["pcangsd"]
