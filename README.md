# packer-prowler

Packer, Ansible, Serverspec, project to create [tonyblyx/prowler](https://github.com/toniblyx/prowler) VM, AWS AMI, and Docker images.

## Requirements

- [Packer](https://packer.io/)
- [Ansible](https://www.ansible.com/)
- [Gradle](https://gradle.org/install/#manually)
- [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- [Serverspec](https://serverspec.org/): gem install serverspec
- [docker-api](https://github.com/swipely/docker-api/releases): gem install docker-api

## Install
```shell
git clone https://github.com/apolloclark/packer-prowler
cd ./packer-prowler

# update submodules
git submodule update --recursive --remote

# set your Docker hub username
export DOCKER_USERNAME="apolloclark" # $(whoami)
export DOCKER_PASSWORD=""

# build both the Ubuntu 16.04 and Centos 7.6 images
./build_packer_docker_all.sh



# clean up ALL previous builds
./clean_packer_docker.sh

# Gradle, clean up previous builds, from today
gradle clean --parallel --project-dir gradle-build

# Gradle, build all images, in parallel
gradle test --rerun-tasks --parallel --project-dir gradle-build

# Gradle, build only specific OS images
gradle ubuntu18.04:test --project-dir gradle-build --rerun-tasks
gradle ubuntu16.04:test --project-dir gradle-build --rerun-tasks
gradle debian10:test    --project-dir gradle-build --rerun-tasks
gradle debian9:test     --project-dir gradle-build --rerun-tasks

gradle rhel8:test     --project-dir gradle-build --rerun-tasks
gradle rhel7:test     --project-dir gradle-build --rerun-tasks
gradle centos7:test   --project-dir gradle-build --rerun-tasks
gradle amzlinux2:test --project-dir gradle-build --rerun-tasks

gradle test --parallel --project-dir gradle-build

# Gradle, publish images
gradle push --parallel --project-dir gradle-build

# Gradle, list tasks, and dependency graph
gradle tasks --project-dir gradle-build
gradle tasks --all --project-dir gradle-build
gradle test taskTree --project-dir gradle-build

# Gradle, debug
gradle properties
gradle ubuntu16.04:info --project-dir gradle-build
gradle ubuntu16.04:test --project-dir gradle-build --info --rerun-tasks
rm -rf ~/.gradle
```

## Build Details

```shell
Prowler 2.0
https://github.com/toniblyx/prowler
```