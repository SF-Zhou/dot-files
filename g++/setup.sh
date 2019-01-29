#!/bin/sh

VERSION=$1
VERSION=${VERSION:=4.9}
GCC_VERSION=gcc-"$VERSION"
GPP_VERSION=g++-"$VERSION"

sudo rm -rf /usr/bin/gcc /usr/bin/g++
sudo ln -s /usr/bin/"$GCC_VERSION" /usr/bin/gcc
sudo ln -s /usr/bin/"$GPP_VERSION" /usr/bin/g++
