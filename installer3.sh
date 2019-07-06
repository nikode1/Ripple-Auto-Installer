#!/bin/bash
clear
set -e
[ $(id -u) -ne 0 ] && { echo "Run as root dir/sudo. Please ctrl+c and then type, sudo-i" ; exit ; }

server-install () {

valid_domain=0

printf "\nInstall directory "[$(pwd)"/ripple"]": "
read MasterDir
MasterDir=${MasterDir:=$(pwd)"/ripple"}

printf "\n\n..:: NGINX CONFIGS ::.."
while [ $valid_domain -eq 0 ]
do
printf "\nMain domain: "
read domain

if [ "$domain" = "" ]; then
	printf "\n\nYou need to specify the main domain. Example: test.tk"
else
	printf "\n\nFrontend: $domain"
	printf "\nBancho: c.$domain"
	printf "\nAvatar: a.$domain"
	printf "\nBackend: old.$domain"
	printf "\n\nAgree? [Y]: "
	read q
	if [ "$q" = "y" ]; then
		valid_domain=1
	fi
fi
done

printf "\n\n..:: BANCHO SERVER ::.."
printf "\ncikey [changeme]: "
read peppy_cikey
peppy_cikey=${peppy_cikey:=changeme}

printf "\n\n..:: LETS SERVER::.."
printf "\nosuapi-apikey [OSU! API]: "
read lets_osuapikey
lets_osuapikey=${lets_osuapikey:=YOUR_OSU_API_KEY_HERE}
printf "\nPP Cap [700]: "
read pp_cap
pp_cap=${pp_cap:=700}

printf "\n\n..:: FRONTEND ::.."
printf "\nPort [6969]: "
read hanayo_port
hanayo_port=${hanayo_port:=6969}
printf "\nAPI Secret [Potato]: "
read hanayo_apisecret
hanayo_apisecret=${hanayo_apisecret:=Potato}

printf "\n\n..:: DATABASE ::.."
printf "\nUsername [root]: "
read mysql_usr
mysql_usr=${mysql_usr:=root}
printf "\nPassword [meme]: "
read mysql_psw
mysql_psw=${mysql_psw:=meme}

START=$(date +%s)

        apt-get update
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
	pip3 install mysqlclient
	pip3 install flask
	pip3 install raven
	pip3 install bcrypt
	pip3 install tornado
	apt install libmysqlclient-dev -y
	pip3 install -U pip
	pip3 install Cython
	pip3 install setuptools
	apt-get update
	apt-get install php7.0 php7.0-mbstring php7.0-mcrypt php7.0-fpm php7.0-curl php7.0-mysql golang-go -y
	apt-get install composer -y
	apt-get install zip unzip php7.0-zip -y

mkdir ripple
cd ripple
cd $MasterDir
git clone https://github.com/osuripple/pep.py
cd pep.py
git submodule init && git submodule update
python3.6 -m pip install -r requirements.txt
cd handlers
rm -rf mainHandler.pyx
wget -O mainHandler.pyx https://pastebin.com/raw/HG9Khfux
cd ..
python3.6 setup.py build_ext --inplace
python3.6 pep.py
sed -i 's#root#'$mysql_usr'#g; s#changeme#'$peppy_cikey'#g'; s#http://.../letsapi#'http://127.0.0.1:5002/letsapi'#g; s#http://cheesegu.ll/api#'https://cg.mxr.lol/api'#g' config.ini
sed -E -i -e 'H;1h;$!d;x' config.ini -e 's#password = #password = '$mysql_psw'#'
cd $MasterDir


git clone https://github.com/osuripple/lets
cd lets
python3.6 -m pip install -r requirements.txt
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
wget -O __init__.py https://pastebin.com/raw/gKaPU6C6
wget -O wifipiano2.py https://pastebin.com/raw/ZraV7iU9
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
wget -O config.py https://pastebin.com/raw/E0zUvLuU
sed -i 's#root#'$mysql_usr'#g; s#mysqlpsw#'$mysql_psw'#g; s#DOMAIN#'$domain'#g; s#changeme#'$peppy_cikey'#g; s#YOUR_OSU_API_KEY_HERE#'$lets_osuapikey'#g; s#http://cheesegu.ll/api#'https://cg.mxr.lol/api'#g' config.py
cd $MasterDir
echo "LETS Server setup is done!"

apt-get install redis-server -y

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
wget -O nginx.conf https://pastebin.com/raw/B4hWMmZn
sed -i 's#DOMAIN#'$domain'#g; s#DIRECTORY#'$MasterDir'#g; s#6969#'$hanayo_port'#g' nginx.conf
wget -O old-frontend.conf https://pastebin.com/raw/bMXE2m6n
sed -i 's#DOMAIN#'$domain'#g; s#DIRECTORY#'$MasterDir'#g; s#6969#'$hanayo_port'#g' old-frontend.conf
echo "Downloading certificate..."
wget -O cert.pem https://raw.githubusercontent.com/osuthailand/ainu-certificate/master/cert.pem
wget -O key.pem https://raw.githubusercontent.com/osuthailand/ainu-certificate/master/key.key
echo "Certificate downloaded!"
nginx
cd $MasterDir

wget -O ripple.sql https://raw.githubusercontent.com/Uniminin/AOBAS-LATEST-RIPPLE-INSTALLER/master/ripple_database.sql
mysql -u "$mysql_usr" -p"$mysql_psw" -e 'CREATE DATABASE ripple;'
mysql -u "$mysql_usr" -p"$mysql_psw" ripple < ripple.sql

mkdir hanayo
cd hanayo
go get -u https://github.com/osuripple/hanayo
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



go get -u zxq.co/Sunpy/avatar-server-go
mkdir avatar-server
mkdir avatar-server/avatars
mv /root/go/bin/avatar-server-go ./avatar-server/avatar-server
cd $MasterDir/avatar-server/avatars
wget -O 0.png https://raw.githubusercontent.com/osuthailand/avatar-server/master/avatars/-1.png
wget -O 999.png https://raw.githubusercontent.com/osuthailand/avatar-server/master/avatars/0.png
cd $MasterDir

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

apt-get install phpmyadmin -y
cd /var/www/osu.ppy.sh
ln -s /usr/share/phpmyadmin phpmyadmin

cd /root/
git clone https://github.com/Neilpang/acme.sh
apt-get install socat -y
cd acme.sh/
./acme.sh --install
./acme.sh --issue --standalone -d $domain -d c.$domain -d i.$domain -d a.$domain -d old.$domain

chmod -R 777 ../ripple

END=$(date +%s)
DIFF=$(( $END - $START ))

pkill -f nginx
nginx

echo "Setup is done"
echo "PhpMyAdmin can be accessed here: http://old.$domain/phpmyadmin"

fi

}

echo ""
echo "Type Y and Enter to start the installation (Y)"
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo Continuing
    server-install
else
    echo Exiting
fi
