FROM debian:jessie

RUN apt-get update -y

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN apt-get update -y

# Yes Oracle, it's cool
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

RUN apt-get install -y oracle-java8-installer

ADD https://www.free-decompiler.com/flash/download/ffdec_6.1.1.deb /tmp/ffdec_6.1.1.deb

RUN dpkg -i /tmp/ffdec_6.1.1.deb
RUN apt-get install -f
