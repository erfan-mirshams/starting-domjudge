#!/bin/bash

export DOMJUDGE_VERSION=latest
MARIADB_VERSION=latest

# sudo apt update
# sudo apt upgrade -y

# sudo apt install -y docker.io

sudo docker pull mariadb:$MARIADB_VERSION
sudo docker pull domjudge/domserver:$DOMJUDGE_VERSION
sudo docker pull domjudge/judgehost:$DOMJUDGE_VERSION
