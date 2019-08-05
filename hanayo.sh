#!/bin/bash
clear

[ $(id -u) -ne 0 ] && { echo "Needs to be run with sudo!" ; exit ; }

apt-get update && apt-get update -y
add-apt-repository ppa:longsleep/golang-backports -y
apt-get update
apt-get install golang-go -y
apt-get update && apt-get update -y

echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=${PATH}:${GOPATH}/bin' >> ~/.bashrc
source ~/.bashrc

go get -u zxq.co/ripple/hanayo
cd go/src/zxq.co/ripple/hanayo
go build .
./hanayo
clear
./hanayo
Echo "Done! You Can Now view your site in localhost:45221"
