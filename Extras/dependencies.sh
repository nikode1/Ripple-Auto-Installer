#!/bin/bash
clear
[ $(id -u) -ne 0 ] && { echo "Needs to be run with sudo!" ; exit ; }

apt-get update && sudo apt-get upgrade -y
apt-get update
apt-get -qq update && apt-get -qq dist-upgrade
apt-get install aptitude -y
apt-get install build-essential autoconf libtool pkg-config python3-opengl python-imaging* python-pyrex* python3-pyside.qtopengl idle-python3.6 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3 python3-dev -y
add-apt-repository ppa:jonathonf/python-3.6 -y
apt-get update
apt-get install libxss1 -y
sudo aptitude install libxmu6
sudo apt install -y apt-rdepends
apt-get install python3.6
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 
apt-get update
sudo rm /usr/bin/python3
sudo ln -s python3.5 /usr/bin/python3
apt-get update
sudo add-apt-repository ppa:deadsnakes/ppa -y
apt-get update
apt-get install python3 python3-dev -y
apt-get update
add-apt-repository ppa:ondrej/php -y
sudo apt-get update
add-apt-repository ppa:longsleep/golang-backports -y
apt-get update
apt install git curl python3-pip python3-mysqldb -y
sudo apt-get update
apt-get install python3-dev libmysqlclient-dev nginx software-properties-common libssl-dev mysql-server -y
apt-get update
apt install python3-pip -y
apt install gcc -y
apt-get install tmux -y
sudo apt-add-repository ppa:roblib/ppa -y
apt-get update
apt-get install librl librl-demos librl-examples
apt-get install librl-dev
apt-get install librl-extras librl-doc librl-dbg
apt-get update
sudo apt-get update && sudo apt-get upgrade -y
apt install git -y
pip3 install --upgrade pip
apt install libmysqlclient-dev -y
pip3 install -U pip
apt install Cython
pip3 install setuptools
apt-get update
apt-get install php5.6 php5.6-mbstring php5.6-mcrypt php5.6-fpm php5.6-curl php5.6-mysql golang-go -y
apt-get install php7.0 php7.0-mbstring php7.0-mcrypt php7.0-fpm php7.0-curl php7.0-mysql -y
apt-get install php7.2 php7.2-mbstring php7.2-mcrypt php7.2-fpm php7.2-curl php7.2-mysql -y
apt-get update && apt-get upgrade -y	
apt-get install composer -y
apt-get install zip unzip php7.0-zip -y
sudo apt-get update --fix-missing
sudo apt-get install -f
sudo add-apt-repository ppa:dawidd0811/neofetch -y
apt-get update
apt install neofetch -y	
apt-get upgrade
sudo apt install figlet -y
sudo apt install libaa-bin -y
apt-get update
neofetch
sleep 2
figlet Done Installing!

