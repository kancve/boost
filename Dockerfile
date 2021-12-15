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
    openssh-server \
    net-tools \
    iputils-ping \
    openjdk-8-jdk-headless

ARG MAVEN_VERSION=3.6.3 BOOST_VERSION=1.78.0

# install maven
RUN cd /opt && \
    wget https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    tar -zxvf apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    rm apache-maven-${MAVEN_VERSION}-bin.tar.gz

# install boost source
RUN cd /opt && \
    BOOST_NAME=boost_$(echo $BOOST_VERSION | sed "s?\.?_?g").tar.gz && \
    wget https://boostorg.jfrog.io/artifactory/main/release/${BOOST_VERSION}/source/${BOOST_NAME} && \
    tar -zxvf ${BOOST_NAME} && \
    rm ${BOOST_NAME}

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 MAVEN_HOME=/opt/apache-maven-${MAVEN_VERSION} BOOST_ROOT=/opt/boost_$(echo $BOOST_VERSION | sed "s?\.?_?g")
ENV PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin

# turn on ssh service
RUN sed -i "s?prohibit-password?yes?g" /etc/ssh/sshd_config && \
    echo "root:root" | chpasswd && \
    mkdir -p /var/run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
