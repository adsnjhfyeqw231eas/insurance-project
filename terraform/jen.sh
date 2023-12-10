#!/bin/bash
apt update -y
sleep 3
apt upgrade -y
sleep 5
apt install openjdk-11-jdk openjdk-11-jre -y
sleep 2
wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
sleep 1
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sleep 1
apt-get update -y
sleep 3
apt-get install jenkins -y
sleep 2
hostnamectl set-hostname Jen
sleep 1