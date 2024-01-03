#!/bin/bash

export DOMJUDGE_VERSION=8.2.2
MARIADB_VERSION=focal  # Use the appropriate Ubuntu version codename

sudo apt update
sudo apt upgrade -y

sudo apt install -y docker.io

sudo docker pull mariadb:$MARIADB_VERSION
sudo docker pull domjudge/domserver:$DOMJUDGE_VERSION
sudo docker pull domjudge/judgehost:$DOMJUDGE_VERSION
