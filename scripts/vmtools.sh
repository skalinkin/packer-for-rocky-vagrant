#!/bin/bash

# install VBox Guest Additions
mount /dev/sr1 /mnt
/mnt/VBoxLinuxAdditions.run

reboot
