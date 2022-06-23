#!/bin/bash

# update system to the latest version
dnf update --assumeyes
dnf install epel-release -y

# install VBox Guest Additions
mount /home/vagrant/VBoxGuestAdditions.iso
/mnt/VBoxLinuxAdditions.run


# Install docker
dnf install -y yum-utils
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
dnf install -y docker-ce-20.10.17 docker-ce-cli-20.10.17 containerd.io-1.6.6
systemctl --now enable docker

systemctl stop docker

echo "{" >> /etc/docker/daemon.json
echo "  \"data-root\": \"/media/persistent-storage/docker-data\"" >> /etc/docker/daemon.json
echo "}" >> /etc/docker/daemon.json
systemctl start docker

# Install docker-compose
curl -s https://api.github.com/repos/docker/compose/releases/tags/v2.6.0 \
  | grep browser_download_url \
  | grep docker-compose-linux-x86_64 \
  | cut -d '"' -f 4 \
  | wget -qi -
  
chmod +x docker-compose-linux-x86_64
mv docker-compose-linux-x86_64 /bin/docker-compose
rm -f docker-compose-linux-x86_64.sha256
/bin/docker-compose version
usermod -a -G docker vagrant

# Install Crome
wget https://dl.google.com/linux/linux_signing_key.pub
rpm --import linux_signing_key.pub
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
dnf install google-chrome-stable_current_x86_64.rpm

# Disable Gnome Initial Setup Screen
bash -c 'echo "X-GNOME-Autostart-enabled=false" >> /etc/xdg/autostart/gnome-initial-setup-first-login.desktop'

# set GUI as interface
systemctl set-default graphical.target
