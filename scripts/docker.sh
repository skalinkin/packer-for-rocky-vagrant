#!/bin/bash

# Install docker
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
dnf install -y docker-ce-24.0.2 docker-ce-cli-24.0.2 containerd.io-1.7.2
echo "{" >> /etc/docker/daemon.json
echo "  \"data-root\": \"/media/persistent-storage/docker-data\"" >> /etc/docker/daemon.json
echo "}" >> /etc/docker/daemon.json

# Install docker-compose
curl -s https://api.github.com/repos/docker/compose/releases/tags/v2.12.2 \
  | grep browser_download_url \
  | grep docker-compose-linux-x86_64 \
  | cut -d '"' -f 4 \
  | wget -qi -
chmod +x docker-compose-linux-x86_64
mv docker-compose-linux-x86_64 /bin/docker-compose
rm -f docker-compose-linux-x86_64.sha256
/bin/docker-compose version
usermod -a -G docker vagrant
