#!/bin/bash

export DOMJUDGE_VERSION=latest
MARIADB_VERSION=latest

## Update apt repositories then install docker
#
# sudo apt update
# sudo apt upgrade -y

# sudo apt install -y docker.io
#
## Arch linux version
# sudo pacman -Syu --noconfirm

# sudo pacman -S docker --noconfirm


sudo docker pull mariadb:$MARIADB_VERSION
sudo docker pull domjudge/domserver:$DOMJUDGE_VERSION
sudo docker pull domjudge/judgehost:$DOMJUDGE_VERSION
