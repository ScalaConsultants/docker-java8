FROM phusion/baseimage:latest

MAINTAINER Jakub Zubielik <jakub.zubielik@scalac.io>

RUN apt-add-repository ppa:webupd8team/java && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886  && \
    apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections  && \
    apt-get install -y --force-yes \
                    oracle-java8-installer \
                    oracle-java8-unlimited-jce-policy \
                    oracle-java8-set-default

RUN apt-get install -y make

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init"]
