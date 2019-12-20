# <a href=https://ripple.moe>Ripple</a> Stack Installation Helper [![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)  [![Open Source Love svg1](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/Uniminin/) 


<b>**THIS SCRIPT IS NOT FOR LOCAL PC (localhost)**</b><br>
* Github: https://github.com/Uniminin/Ripple-Auto-Installer
* MIRROR: https://zxq.co/Uniminin/Ripple-Auto-Installer

<p align="center">
  <img src="https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/X/ripple.svg"/>
</p>

### Requirements
* Ubuntu/Debian/Bedrock VPS with debian/ubuntu stratum

### Features
* A configurable shell script for installing Ripple Stack
* Everything is Pre-ready 
* Simple and user friendly Installation
* Installs most of the things for your server within minutes

### Running the Script (Instructions)
```bash
$ wget https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Main/ripple.sh
$ chmod +x ripple.sh ; ./ripple.sh --help
```

### After Installation Steps
* Certificate  
Edit <a href=https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Main/openssl.cnf>openssl.cnf</a> and run <a href=https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Main/gencert.sh>gencert.sh</a> to generate certificates. Use `cert.pem` and `key.pem` in your nginx configuration and `cert.pem` in your switcher.  
Use this on your site:
```
git clone https://github.com/Neilpang/acme.sh.git
cd acme.sh
./acme.sh --issue --standalone -d osu.ripple.moe -d c.ripple.moe -d a.ripple.moe -d oldripple.ripple.moe
```  
* Proxy  
Edit and include <a href=https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/Main/ripple.conf>ripple.conf</a> in your nginx.conf

### Enable/Restart/Start Services
```
sudo systemctl enable vsftpd
sudo systemctl enable nginx
sudo systemctl enable php7.0-fpm
sudo systemctl enable redis-server
sudo systemctl enable mysql
sudo systemctl start vsftpd
sudo systemctl start nginx
sudo systemctl start php7.0-fpm
sudo systemctl start redis-server
sudo systemctl start mysql
sudo systemctl restart vsftpd
sudo systemctl restart nginx
sudo systemctl restart php7.0-fpm
sudo systemctl restart redis-server
sudo systemctl restart mysql
```
### Edit Config
Edit all configs.
* /RIPPLE/pep.py and run `nano config.ini`
* /RIPPLE/lets and run `nano config.ini`
* /RIPPLE/hanayo and run `nano hanayo.conf`
* /RIPPLE/rippleapi and run `nano api.conf`
* /RIPPLE/old-frontend and run `nano inc/config.php`

### Start Server
Create tmux sessions:`tmux new -s tmux_session_name` and go to
* /RIPPLE/pep.py and run `python3.6 pep.py`
* /RIPPLE/lets and run `python3.6 lets.py`
* /RIPPLE/OSU-AVATAR-SERVER and run `python3.6 avatar-server.py`
* /RIPPLE/hanayo and run `./hanayo`
* /RIPPLE/rippleapi and run `./rippleapi`

### Domain
Make sure you set your DNS like this:
```
* YOUR-DOMAIN
* c.YOUR-DOMAIN
* i.YOUR-DOMAIN
* a.YOUR-DOMAIN
* s.YOUR-DOMAIN
* old.YOUR-DOMAIN
```

### OSU!API
* You can get OSU!API Key Here:<a href=https://old.ppy.sh/p/api>OSU!API</a>

### Tested OS

| NO | Status| Platform|
|----|-------|---------|
|1|[![](https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/X/pass.svg)](https://github.com/uniminin)| Bedrock
|2|[![](https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/X/fail.svg)](https://github.com/uniminin)| Archlinux

### Need Help?
You can ask for any kinds of help regarding this project via Discord DMs or through Github Issues.<br>
<br>
Discord:`uniminin#1151`


### License :scroll: [![License: AGPL v3](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)](https://www.gnu.org/licenses/agpl-3.0)
This project is licenced under the GNU Affero General Public License V3. For more information, see the file `LICENSE` or visit https://www.gnu.org/licenses/agpl-3.0.
