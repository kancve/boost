# Introduction
A build environment containing the Boost C++ Libraries.

In addition, it will include some common development tools:

* vim
* cmake
* g++
* gdb
* git
* subversion
* wget
* openssh-server

# Build

By default, VERSION=latest & BOOST_VERSION=1.78.0

```bash
docker build -t boost --build-arg VERSION=latest --build-arg BOOST_VERSION=1.78.0
```
