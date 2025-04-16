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
		curl

#install angsd
RUN wget http://popgen.dk/software/download/angsd/angsd0.940.tar.gz && tar xf angsd0.940.tar.gz
RUN cd htslib;make
RUN cd angsd;make HTSSRC=../htslib

RUN apt install samtools -y

USER root

##test files

#RUN apt install samtools -y
#RUN wget http://popgen.dk/software/download/angsd/bams.tar.gz && tar xf bams.tar.gz
#RUN for i in bams/*.bam;do samtools index $i;done
#RUN ls bams/*.bam > bam.filelist

##

COPY generate_filelist.sh /generate_filelist.sh

RUN chmod a+x /generate_filelist.sh


ENTRYPOINT ["/generate_filelist.sh"]
