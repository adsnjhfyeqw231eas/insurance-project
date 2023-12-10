#!/bin/bash
apt update -y
sleep 3
apt upgrade -y
sleep 5
apt install openjdk-11-jdk openjdk-11-jre -y
sleep 2
apt install docker.io maven -y
sleep 2
usermod -aG docker ubuntu
sleep 1
hostnamectl set-hostname slave
sleep 1