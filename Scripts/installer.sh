#!/bin/bash
clear
# AUTO RIPPLE INSTALLER SCRIPT OF ANGEL UNIMININ # 
printf "This script has to run in sudo mode.\nIf this isn't the case CTRL+C now.\n Install this in /root.\n\t- Uniminin\n"

[ $(id -u) -ne 0 ] && { echo "Needs to be run with sudo!" ; exit ; }

#HERE BE GLOBAL VARIABLES - needed for them to be accesible in all following functions
#USER SET VARIABLES. SEE askPrerequisites()
declare valid_domain
declare MasterDir
declare peppy_cikey
declare lets_osuapikey
declare pp_cap
declare hanayo_port
declare hanayo_apisecret
declare mysql_usr
declare mysql_psw

#Git Repo's to clone from during installation
declare GIT_ripple_peppy="https://zxq.co/ripple/pep.py"
declare GIT_ripple_lets="https://zxq.co/ripple/lets"
declare GIT_ripple_python_common="https://zxq.co/ripple/ripple-python-common"
declare GIT_ripple_old_frontent="https://zxq.co/ripple/old-frontend.git"
declare GIT_oppai_ng="https://github.com/Francesco149/oppai-ng"
declare GIT_catch_the_pp="https://github.com/osuripple/catch-the-pp"
declare GIT_osufx_secret="https://github.com/osufx/secret"
declare GIT_osufx_secretgit="https://github.com/osufx/secret.git"
declare GIT_acme.sh="https://github.com/Neilpang/acme.sh"

askPrerequisites(){
	valid_domain=0

	#Ask user for install directory
	printf "\nInstall directory "[$(pwd)"/ripple"]": "
	read MasterDir
	MasterDir=${MasterDir:=$(pwd)"/ripple"}
	
	#Ask user for values for nginx config
	printf "\n\n..:: NGINX CONFIGS ::.."
	while [ $valid_domain -eq 0 ]; do
		printf "\nMain domain name: "
		read domain
		
		if [ "$domain" = "" ]; then
			printf "\n\nYou need to specify the main domain. Example: ripple.moe"
		else
			printf "\n\nFrontend: $domain"
			printf "\nBancho: c.$domain"
			printf "\nAvatar: a.$domain"
			printf "\nBackend: old.$domain"
			printf "\n\nIs this configuration correct? [y/n]: "
			read q
			if [ "$q" = "y" ]; then
				valid_domain=1
			fi
		fi
	done
	
	#Ask user for bancho server key
	printf "\n\n..:: BANCHO SERVER ::.."
	printf "\ncikey [changeme]: "
	read peppy_cikey
	peppy_cikey=${peppy_cikey:=changeme}
	
	#Ask user for LETS server key - OSU API key
	printf "\n\n..:: LETS SERVER::.."
	printf "\nosuapi-apikey [YOUR_OSU_API_KEY_HERE]: "
	read lets_osuapikey
	lets_osuapikey=${lets_osuapikey:=YOUR_OSU_API_KEY_HERE}
	printf "\nPP Cap [700]: "
	read pp_cap
	pp_cap=${pp_cap:=700}
	
	#Ask user for port to use for frontend
	printf "\n\n..:: FRONTEND ::.."
	printf "\nPort [6969]: "
	read hanayo_port
	hanayo_port=${hanayo_port:=6969}

	#Ask user for hanayo api key.
	printf "\nAPI Secret [Potato]: "
	read hanayo_apisecret
	hanayo_apisecret=${hanayo_apisecret:=Potato}
	
	#Ask user to set DB credentials
	printf "\n\n..:: DATABASE ::.."
	printf "\nUsername [root]: "
	read mysql_usr
	mysql_usr=${mysql_usr:=root}
	printf "\nPassword [meme]: "
	read mysql_psw
	mysql_psw=${mysql_psw:=meme}
	
	printf "\n\nStarting To Setup the Server!\n\n"
	sleep 3
}

install-dependencies(){	
	echo "Installing Dependencies!!!"
	sleep 2
	sudo apt-get update && sudo apt-get upgrade -y
    sudo apt-get update
	apt-get -qq update && apt-get -qq dist-upgrade
	sudo apt-get install build-essential autoconf libtool pkg-config python3-opengl python-imaging* python-pyrex* python3-pyside.qtopengl idle-python3.6 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3 python3-dev -y
	sudo add-apt-repository ppa:jonathonf/python-3.6 -y
	apt-get update
	apt-get install python3.6
	sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 
	sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 
	apt-get update
	sudo rm /usr/bin/python3
	sudo ln -s python3.5 /usr/bin/python3
	apt-get update
	sudo add-apt-repository ppa:deadsnakes/ppa -y
	sudo apt-get update
	apt-get install python3 python3-dev -y
	sudo apt-get update
	add-apt-repository ppa:ondrej/php -y
	sudo apt-get update
	add-apt-repository ppa:longsleep/golang-backports -y
	apt-get update
	apt install git curl python3-pip python3-mysqldb -y
	sudo apt-get update
	apt-get install python3-dev libmysqlclient-dev nginx software-properties-common libssl-dev mysql-server -y
	sudo apt-get update
	sudo apt install python3-pip -y
	sudo apt install gcc -y
	apt-get install tmux -y
	sudo apt-get update && sudo apt-get upgrade -y
	apt install git -y
	pip3 install --upgrade pip
	apt install libmysqlclient-dev -y
	pip3 install -U pip
	apt install Cython
	pip3 install setuptools
	apt-get update
	apt-get install php7.0 php7.0-mbstring php7.0-mcrypt php7.0-fpm php7.0-curl php7.0-mysql golang-go -y
	apt-get install composer -y
	apt-get install zip unzip php7.0-zip -y
	echo "Done Installing All Necessary Dependencies!"
	sleep 1
}

install-bancho-server(){
	# For Easy Management
	mkdir ripple
	cd ripple
	echo "Downloading Bancho Server!!!"
	sleep 2
	cd $MasterDir
	git clone $GIT_ripple_peppy
	cd pep.py
	git submodule init && git submodule update
	python3.6 -m pip install -r requirements.txt
	cd handlers
	rm -rf mainHandler.pyx
	wget -O mainHandler.pyx https://pastebin.com/raw/kcy8yrsJ
	cd ..
	python3.6 setup.py build_ext --inplace
	python3.6 pep.py
	sed -i 's#root#'$mysql_usr'#g; s#changeme#'$peppy_cikey'#g'; s#http://.../letsapi#'http://127.0.0.1:5002/letsapi'#g; s#http://cheesegu.ll/api#'https://cg.mxr.lol/api'#g' config.ini
	sed -E -i -e 'H;1h;$!d;x' config.ini -e 's#password = #password = '$mysql_psw'#'
	cd $MasterDir
	echo "Bancho Server setup completed"
	sleep 1
}

install-lets-server-and-oppai(){
	
	echo "Setting Up LETS Server & Oppai!!!"
	sleep 2
	git clone https://zxq.co/ripple/lets
	cd lets
	python3.6 -m pip install -r requirements.txt
	echo "Downloading Patches"
	sleep 1
	cd pp
	rm -rf oppai-ng/
	git clone https://github.com/Francesco149/oppai-ng
	cd oppai-ng
	./build
	cd ..
	rm -rf catch_the_pp/
	git clone https://github.com/osuripple/catch-the-pp
	mv catch-the-pp/ catch_the_pp/
	rm -rf __init__.py
	wget -O __init__.py https://pastebin.com/raw/bYLuPfgX
	wget -O wifipiano2.py https://pastebin.com/raw/PYaBUMSQ
	cd ..
	rm -rf common
	git clone https://zxq.co/ripple/ripple-python-common
	mv ripple-python-common/ common/
	cd $MasterDir/lets/handlers
	sed -i 's#700#'$pp_cap'#g' submitModularHandler.pyx
	cd $MasterDir/lets/objects
	sed -i 's#dataCtb["difficultyrating"]#'dataCtb["diff_aim"]'#g' beatmap.pyx
	cd $MasterDir/lets
	git clone https://github.com/osufx/secret
	cd secret
	git submodule init && git submodule update
	cd ..
	python3.6 setup.py build_ext --inplace
	cd helpers
	rm -rf config.py
	wget -O config.py https://pastebin.com/raw/Kh488Vnz
	sed -i 's#root#'$mysql_usr'#g; s#mysqlpsw#'$mysql_psw'#g; s#DOMAIN#'$domain'#g; s#changeme#'$peppy_cikey'#g; s#YOUR_OSU_API_KEY_HERE#'$lets_osuapikey'#g; s#http://cheesegu.ll/api#'https://cg.mxr.lol/api'#g' config.py
	cd $MasterDir
	echo "LETS Server Setup is Completed!"
	sleep 1
}

install-redis-and-nginx(){
	
	echo "Installing Redis!"
	sleep 1
	apt-get install redis-server -y
	apt-get update
	echo "REDIS Server setup is completed!"
	sleep 1
	echo "Downloading Nginx Config!"
	sleep 1
	mkdir nginx
	cd nginx
	systemctl restart php7.0-fpm
	pkill -f nginx
	cd /etc/nginx/
	rm -rf nginx.conf
	wget -O nginx.conf https://pastebin.com/raw/9aduuq4e 
	sed -i 's#include /root/ripple/nginx/*.conf\*#include '$MasterDir'/nginx/*.conf#' /etc/nginx/nginx.conf
	cd $MasterDir
	cd nginx
	wget -O nginx.conf https://pastebin.com/raw/j17s9Lk0
	sed -i 's#DOMAIN#'$domain'#g; s#DIRECTORY#'$MasterDir'#g; s#6969#'$hanayo_port'#g' nginx.conf
	wget -O old-frontend.conf https://pastebin.com/raw/yXE5rtWN
	sed -i 's#DOMAIN#'$domain'#g; s#DIRECTORY#'$MasterDir'#g; s#6969#'$hanayo_port'#g' old-frontend.conf
	
	echo "Downloading certificate!"
	sleep 1
	wget -O cert.pem https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/X/cert.pem
	wget -O key.pem https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/X/key.key
	
	echo "Certificate Downloaded!"
	pkill -f nginx
	nginx
	
	cd $MasterDir
	
	echo "NGINX server setup is completed!"
	sleep 1
}

setup-database(){
	echo "Setting up Database!!!"
	sleep 2
	wget -O ripple.sql https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Database%20files/ripple_database.sql
	mysql -u "$mysql_usr" -p"$mysql_psw" -e 'CREATE DATABASE ripple;'
	mysql -u "$mysql_usr" -p"$mysql_psw" ripple < ripple.sql
	
	echo "Database setup is Done!"
	sleep 1
}

setup-hanayo(){
	echo "Setting up Hanayo!!!"
	sleep 2
	mkdir hanayo
	cd hanayo
	go get -u zxq.co/ripple/hanayo
	mv /root/go/bin/hanayo ./
	mv /root/go/src/zxq.co/ripple/hanayo/data ./data
	mv /root/go/src/zxq.co/ripple/hanayo/scripts ./scripts
	mv /root/go/src/zxq.co/ripple/hanayo/static ./static
	mv /root/go/src/zxq.co/ripple/hanayo/templates ./templates
	mv /root/go/src/zxq.co/ripple/hanayo/website-docs ./website-docs
	sed -i 's#ripple.moe#'$domain'#' templates/navbar.html
	./hanayo
	sed -i 's#ListenTo=#ListenTo=127.0.0.1:'$hanayo_port'#g; s#AvatarURL=#AvatarURL=https://a.'$domain'#g; s#BaseURL=#BaseURL=https://'$domain'#g; s#APISecret=#APISecret='$hanayo_apisecret'#g; s#BanchoAPI=#BanchoAPI=https://c.'$domain'#g; s#MainRippleFolder=#MainRippleFolder='$MasterDir'#g; s#AvatarFolder=#AvatarFolder='$MasterDir'/nginx/avatar-server/avatars#g; s#RedisEnable=false#RedisEnable=true#g' hanayo.conf
	sed -E -i -e 'H;1h;$!d;x' hanayo.conf -e 's#DSN=#DSN='$mysql_usr':'$mysql_psw'@/ripple#'
	sed -E -i -e 'H;1h;$!d;x' hanayo.conf -e 's#API=#API=http://localhost:40001/api/v1/#'
	cd $MasterDir
	
	echo "Hanayo setup is Done!"
	sleep 1
}

setup-api(){
	echo "Setting up Ripple API"
	sleep 2
	mkdir rippleapi
	cd rippleapi
	go get -u zxq.co/ripple/rippleapi
	rm -rf /root/go/src/zxq.co/ripple
	mv /root/go/src/zxq.co/rippleapi /root/go/src/zxq.co/ripple
	go build zxq.co/ripple/rippleapi
	mv /root/go/bin/rippleapi ./
	./rippleapi
	sed -i 's#root@#'$mysql_usr':'$mysql_psw'@#g; s#Potato#'$hanayo_apisecret'#g; s#OsuAPIKey=#OsuAPIKey='$peppy_cikey'#g' api.conf
	cd $MasterDir
	
	echo "API setup is Done!"
	sleep 1
}

setup-avatar-server(){
	echo "Setting Up Avatar Server!!!"
	sleep 2
	go get -u zxq.co/Sunpy/avatar-server-go
	mkdir avatar-server
	mkdir avatar-server/avatars
	mv /root/go/bin/avatar-server-go ./avatar-server/avatar-server
	cd $MasterDir/avatar-server/avatars
	# DEFAULT AVATAR
	wget -O 0.png https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/X/null.png
	# AC AVATAR
	wget -O 999.png https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/X/ac.png
	cd $MasterDir
	
	echo "Avatar Server setup is Done!"
}

setup-backend-server(){
	echo "Setting up Backend"
	sleep 2
	cd /var/www/
	git clone https://zxq.co/ripple/old-frontend.git
	mv old-frontend osu.ppy.sh
	cd osu.ppy.sh
	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
	cd inc
	cp config.sample.php config.php
	sed -i 's#root#'$mysql_usr'#g; s#meme#'$mysql_psw'#g; s#allora#ripple#g; s#ripple.moe#'$domain'#g' config.php
	cd ..
	composer install
	rm -rf secret
	git clone https://github.com/osufx/secret.git
	cd $MasterDir
	echo "Setting up Backend server is completed!"
	sleep 1
}

setup-phpmyadmin(){
	echo "Setting up PhpMyAdmin!"
	sleep 2		
	apt-get install phpmyadmin -y
	cd /var/www/osu.ppy.sh
	ln -s /usr/share/phpmyadmin phpmyadmin
	
	echo "PhpMyAdmin setup is completed!"
	sleep 1
}

install-ssl-certs(){
	echo "Making Up Certificate For SSL"
	sleep 2
	cd /root/
	git clone https://github.com/Neilpang/acme.sh
	apt-get install socat -y
	cd acme.sh/
	./acme.sh --install
	./acme.sh --issue --standalone -d $domain -d c.$domain -d i.$domain -d a.$domain -d old.$domain
	echo "Certificate is Ready!"
	sleep 1
}

correct-ripple-permissions(){
	
	echo "Changing folder and files permissions!"
	sleep 1
	chmod -R 777 ../ripple
}

server-install () {


#Call function askPrerequisites to do just that.
askPrerequisites

# Configuration is done.
# Start installing/downloading/setup

#Measure time to setup stuff after user-interaction is done.
START=$(date +%s)

#STEP 1  - Install all required dependencies
install-dependencies

#STEP 2  - Install the Bancho Server
install-bancho-server

#STEP 3  - Install the LETS Server and oppai
install-lets-server-and-oppai

#STEP 4  - Install redis and setup nginx
install-redis-and-nginx

#STEP 5  - Setup the database
setup-database

#STEP 6  - Setup Hanayo
setup-hanayo

#STEP 7  - Setup OSU! API
setup-api

#STEP 8  - Setup avatar server
setup-avatar-server

#STEP 9  - Setup backend server
setup-backend-server

#STEP 10 - Setup phpmyadmin
setup-phpmyadmin

#Step 11 - Install SSL certs
install-ssl-certs

#STEP 12 - correct Ripple Permissions
correct-ripple-permissions

END=$(date +%s)
DIFF=$(( $END - $START ))

########################################################
#FUNCTIONS DEFINED 
#ENTRPOINT STARTING HERE
     ######
	 ######
	 ######
	 ######
	 ######
	 ######
  ############
   ##########
    ########
	 ######
	  ####
	   ##

#Starting nginx
echo "Starting Nginx!"
pkill -f nginx
nginx
sleep 1

#End notes and installer feedback
echo "Setup up Ripple is Completed! It took $DIFF seconds to setup the server!"
echo "You can access PhpMyAdmin here:http://old.$domain/phpmyadmin"

printf "\n\nSetup is done. Continue?[y/n]: "
read q
if [ "$q" = "y" ]; then
	printf "\n\nWell... Thank you, much appreciated! You can start the server now, If you don't know how you can check my github Repo.\n\nAlright!\n\n"
fi

}

echo ""
echo "IMPORTANT: Ripple is licensed under the GNU AGPL license. This means, if your server is public, that ANY modification made to the original ripple code MUST be publically available."
echo "Also, to run an osu! private server, as well as any sort of server, you need to have minimum knowledge of command line, and programming."
echo "Running this script assumes you know how to use Linux in command line, secure and manage a server, and that you know how to fix errors, as they might happen while running that code."
echo "Do you agree? (y/n)"
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo Continuing
    server-install
else
    echo Exiting
fi
