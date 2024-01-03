#!/bin/bash

DOMJUDGE_VERSION=8.2.2
WORKER_ID=$1 #number (id) of judgehost
SERVER_URL="192.168.1.143:12345/" #domserver url

WORKER_PASSWORD="judge_pass" #judgehost user account password in the server

sudo docker run -it --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro --name judgehost-$(whoami)-$WORKER_ID --link domserver:domserver --hostname judgedaemon-$(whoami)-$WORKER_ID -e DAEMON_ID=$WORKER_ID -e DOMSERVER_BASEURL=$SERVER_URL -e JUDGEDAEMON_PASSWORD=$WORKER_PASSWORD -e CONTAINER_TIMEZONE=Asia/Tehran domjudge/judgehost:$DOMJUDGE_VERSION
