#!/bin/bash

# Install docker
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
dnf install -y docker-ce-24.0.2 docker-ce-cli-24.0.2 containerd.io-1.6.21 docker-compose-plugin-2.6.0 

usermod -a -G docker vagrant
sudo systemctl --now enable docker
