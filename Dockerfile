ARG VERSION=latest

FROM ubuntu:${VERSION}

# install some common development tools
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    vim \
    cmake \
    g++ \
    gdb \
    git \
    subversion \
    wget \
    openssh-server

ARG BOOST_VERSION=1.78.0

# install boost source
RUN cd /opt && \
    wget https://boostorg.jfrog.io/artifactory/main/release/${BOOST_VERSION}/source/boost_${BOOST_VERSION//./_}.tar.gz && \
    tar -zxvf boost_${BOOST_VERSION//./_}.tar.gz && \
    rm boost_${BOOST_VERSION//./_}.tar.gz

ENV BOOST_ROOT=/opt/boost_${BOOST_VERSION//./_}
