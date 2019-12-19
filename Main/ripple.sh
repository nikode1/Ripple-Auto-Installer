#!/bin/sh
# Ripple Stack Installation Helper Installation Script by UNIMININ!
# Copyright @UNIMININ | Permission is hereby granted to any copyright holder!

clear && read -n 1 -s -r -p "Press Any key to confirm & continue >>"

dependencies() {
	echo "Starting To Install Required/Necessary Dependencies [<>]"
	sleep 2 
	sudo apt-get install gcc g++ build-essential git tmux nginx wget mysql-server redis-server libmariadbclient-dev libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
	sudo apt-get install checkinstall golang-go cython && cd cd /usr/src && sudo wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz
	sudo apt-get install nginx php-fpm composer php7.0-mbstring php7.0-curl php-mysql vsftpd luajit && sudo apt-get install mc screen
	sudo tar xzf Python-3.6.8.tgz && cd Python-3.6.8
	sudo ./configure --enable-optimizations && sudo make altinstall
 	sudo apt-get install python3-pip
 	sudo apt-get update && sudo apt-get upgrade -y
	echo "Done Installing all the necessary Dependencies!"
	sleep 2
}


main_dir() {
	# Createing Master Folder
	mkdir RIPPLE && cd RIPPLE
}

peppy () {
	echo "Cloning pep.py and setting it up"
	sleep 2
	git clone https://zxq.co/ripple/pep.py && cd pep.py
	git submodule init && git submodule update
	python3.6 -m pip install -r requirements.txt
	python3.6 setup.py build_ext --inplace
	python3.6 pep.py && cd $MasterDir
	echo "Done Setting up pep.py!"
	sleep 2
}


lets() {
	echo "Cloning & Setting up LETS"
	sleep 2
	git clone https://zxq.co/ripple/lets && cd lets
	git submodule init && git submodule update
	python3.6 -m pip install -r requirements.txt
	python3.6 setup.py build_ext --inplace
	python3.6 lets.py && cd $MasterDir
	echo "Setting up LETS is completed!"
	sleep 2
}


mysql_datbase() {
	echo "Setting up MySQL database!"
	sleep 2
	echo -n "Enter MySQL Username: "
	read mysql_user
	echo -n "Enter MySQL Password: "
	read mysql_password
	mkdir mysql && cd mysql 
	wget https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Database%20files/ripple.sql
	mysql -u "$mysql_user" -p"$mysql_password" -e 'CREATE DATABASE ripple;'
	mysql -p -u $mysql_user $ripple < ripple.sql
	echo "Setting up MySQL Database is completed!"
	sleep 2
}


hanayo() {
	echo "Cloning & Setting up Hanayo!"
	sleep 2
	mkdir hanayo
	go get -u zxq.co/ripple/hanayo && sudo -i
	cd go/src/zxq.co/ripple/hanayo && go build && ./hanayo
	mv go/src/zxq.co/ripple/hanayo /home/RIPPLE
	cd $MasterDir
	echo "Configuring Hanayo is completed!"
	sleep 2
}

rippleapi() {
	echo "Cloning & Setting up API"
	sleep 2
	go get -u zxq.co/ripple/rippleapi && sudo -i
	cd go/src/zxq.co/ripple/rippleapi && go build && ./rippleapi
	mv go/src/zxq.co/ripple/rippleapi /home/RIPPLE
	cd $MasterDir
	echo "Setting up API is completed!"
	sleep 2
}

avatar_server() {
	echo "Cloning & Setting up avatar server!"
	sleep 2
	git clone https://github.com/Uniminin/OSU-AVATAR-SERVER && cd OSU-AVATAR-SERVER
	python3 -m pip install -r requirements.txt
	cd $MasterDir
	echo "Setting up avatar-server is completed!"
	sleep 1
}

old_frontend() {
	echo "Cloning & Setting up old frontend!"
	sleep 2
	git clone https://github.com/osuripple/old-frontend
	composer install
	git clone https://github.com/osufx/secret
	cd $MasterDir
	echo "Setting up old frontend is done"
	sleep 1
}

finishing() {
	echo "Changing Folder and Files Permissions [RIPPLE]"
	sleep 1
	chmod -R 777 RIPPLE
	pkill -f nginx
	echo "Done Installing Ripple Stack!"
}

run() {
	dependencies
	mysql_database
	main_dir
	peppy
	lets
	avatar_server
	hanayo
	rippleapi
	old_frontend
	finishing
}
# Start the whole process
run
