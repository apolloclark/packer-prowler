#!/bin/bash -eux

# ensure that ENV VARs are set
export DOCKER_USERNAME=${DOCKER_USERNAME:=$(whoami)}
export PACKAGE=${PACKAGE:=prowler}
export PACKAGE_VERSION=${PACKAGE_VERSION:=2.0}
export BASE_IMAGE=${BASE_IMAGE:="apolloclark/python3:3.7.3-centos7.6"}
export IMAGE_NAME=${IMAGE_NAME:="centos7.6"}

./build_packer_docker.sh
