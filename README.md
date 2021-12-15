# Introduction
A build environment containing the Boost C++ Libraries & Java.

In addition, it will include some common development tools:

* vim
* cmake
* g++
* gdb
* git
* subversion
* wget
* openssh-server
* net-tools
* iputils-ping
* openjdk-8-jdk-headless
* maven

# Build

By default, VERSION=latest & BOOST_VERSION=1.78.0 & MAVEN_VERSION=3.6.3

```bash
docker build -t boost --build-arg VERSION=latest --build-arg BOOST_VERSION=1.78.0 --build-arg MAVEN_VERSION=3.6.3
```
