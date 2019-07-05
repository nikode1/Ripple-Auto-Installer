#!/bin/bash
clear
[ $(id -u) -ne 0 ] && { echo "Needs to be run with sudo!" ; exit ; }
clear

echo "Are you sure you want to remove it? (y/n)"
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    sudo apt-get autopurge
    sudo apt-get purge \
		build-essential \
		autoconf \
		libtool \
		pkg-config \
		python-opengl \
		python-imaging \
		python-pyrex \
		python-pyside.qtopengl \
		idle-python2.7 \
		qt4-dev-tools \
		qt4-designer \
		libqtgui4 \
		libqtcore4 \
		libqt4-xml \
		libqt4-test \
		libqt4-script \
		libqt4-network \
		libqt4-dbus \
		python-qt4 \
		python-qt4-gl \
		libgle3 \
		python-dev -y
    
    apt-get purge git curl python3-pip python3-mysqldb -y
	apt-get purge python-dev libmysqlclient-dev nginx software-properties-common libssl-dev mysql-server* mysql* -y
  
    apt-get purge php7.0* php7.0-mbstring php7.0-mcrypt php7.0-fpm php7.0-curl php7.0-mysql golang-go -y
	
	apt-get purge composer -y
	apt-get purge zip unzip php7.0-zip -y
  
    apt-get purge mysql-client-core-5.7
    apt-get purge mysql-server-core-5.7
    
    sudo rm -rf /var/log/mysql

    sudo rm -rf /var/log/mysql.*

    sudo rm -rf /var/lig/mysql

    sudo rm -rf /var/etc/mysql
    apt autoremove
    rm -rf /var/lib/dpkg/lock
	sudo du -sh /var/cache/apt
	sudo apt-get clean

	sudo apt-get update && sudo apt-get upgrade -y
    sudo apt-get update
	apt-get -qq update && apt-get -qq dist-upgrade
else
    echo Done Uninstalling Dependencies
fi

  
  echo "package removed. Do you want to remove ripple source files?  (y/n) "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo Continuing
    rm -rf ripple
    rm -rf go
    rm -rf acme.sh
    rm -rf .acme.sh
    rm -rf /root/acme.sh
    rm -rf /var/www/osu.ppy.sh
    echo Done!
else
    echo See you Next time.
fi
