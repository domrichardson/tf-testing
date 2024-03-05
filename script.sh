#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common -y
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF -y
sudo apt-add-repository 'deb https://download.mono-project.com/repo/ubuntu stable-focal main' -y
sudo apt install mono-complete mono-runtime -y