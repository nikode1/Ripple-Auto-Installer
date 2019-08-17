#!/bin/bash
clear

sudo apt-get update && sudo apt-get update -y
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo apt-get update
sudo apt-get install golang-go -y
sudo apt-get update && sudo apt-get update -y

echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=${PATH}:${GOPATH}/bin' >> ~/.bashrc
source ~/.bashrc

go get -u zxq.co/ripple/hanayo
cd go/src/zxq.co/ripple/hanayo
go build .
./hanayo
clear
./hanayo
echo "Done! You Can Now view your site in localhost:45221"
