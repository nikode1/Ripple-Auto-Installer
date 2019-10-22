# 
# NOTE: THESE SCRIPTS ARE OUTDATED AND PRETTY MUCH BROKEN! ALSO OUTDATED DEPENDENCIES WHICH MAKES THE STACK TO NOT WORK PROPERLY!!! <a href="//www.dmca.com/Protection/Status.X" title="DMCA.com Protection Status" class="dmca-badge"> <img src ="https://images.dmca.com/Badges/dmca_protected_16_120.png?ID=e27dca2b-597b-4718-b582-372dd24ab1b5"  alt="DMCA.com Protection Status" /></a>
Me, <a href=https://github.com/Kreyren>Krey</a> and with the help of some of our other friends are working to fix Ripple code and create a new efficient Auto Ripple Stack Installer Script! It might take a while but we will complete it within this year. Not now but surely!


[![Codacy Badge](https://api.codacy.com/project/badge/Grade/cb1261c63f114f03afb11f6e26711662)](https://app.codacy.com/app/Uniminin/Ripple-Auto-Installer?utm_source=github.com&utm_medium=referral&utm_content=Uniminin/Ripple-Auto-Installer&utm_campaign=Badge_Grade_Settings)
# Auto Ripple Server Installer [![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)  [![Open Source Love svg1](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/Uniminin/) 


<b>**THIS SCRIPT IS NOT FOR LOCAL PC (localhost)**</b><br>
Github: https://github.com/osuripple |
Origin: https://zxq.co/ripple/lets

<p align="center">
  <img src="https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/X/ripple.svg"/>
</p>

# Important Note
This Script installs most of the things for server! If you want to use other stuffs, You need to edit it yourself. Please Star and Fork it if you use it! (THIS IS NOT DESIGNED FOR WINDOWS OR FOR LOCAL PC!) This is designed to be used on VPS.
Also Please Do Note that when you're using this script, if you get any errors you'll have to fix it yourself. If you don't have enough knowledge on linux and how ripple works, then I would prefer you to not host it. Wish you all the best

# Requirements
* Any VPS with Ubuntu OS is strongly recommended
* Ubuntu 16.04+ OS/Server

# Features
* A configurable shell script for installing most of the things for your clone Ripple server
* Ripple Based
* Everything is Pre-ready and is getting via wget
* Simple and user friendly Installation
* Installs the most of the things for your server within about 10-15 Minutes

# Installation Instructions
* Note: There are more than 1 installer from different persons, re-edited! You can use any of them you want, or just by a bit modifying yourself. Get those installers via `wget` (raw). And rename it to installer, then follow Step 2. You can also do `sudo sh installer.sh`

### Step 1:
Note: `Ripple.sh` <<= this script seems to be working. You may use this for now.
First of all you need to download it by downloading it from GitHub, or running this command to download: 

```bash
wget https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Main/ripple.sh
```

### Step 2:

After you do this, copy-paste then run the following command and it will take you into the installation process!

```bash
chmod +x installer.sh && ./installer.sh
```

You `don't have to be root` then, although `it is recommended`.

### Step 3: Follow These Steps To Start The Server!
<img src="https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/X/start.png"/>


Make sure you set your DNS like this:
Note: You can also replace `YOUR-DOMAIN` with your VPS/SSH IP!

* YOUR-DOMAIN
* c.YOUR-DOMAIN
* i.YOUR-DOMAIN
* a.YOUR-DOMAIN
* s.YOUR-DOMAIN
* old.YOUR-DOMAIN

# Removal Process
Copy-Paste the following commands in the terminal to remove all dependencies installed including ripple server.

### Step 1:

```bash
wget https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/Extras/uninstaller.sh
```

### Step 2:

```bash
chmod +x uninstaller.sh && ./uninstaller.sh
```
Note: Although I strongly Recommend, in order to remove your server completely please reinstall your vps instance!

# Extras
* <a href=https://old.ppy.sh/p/api>OSU!API</a>
* <a href=http://www.dot.tk>Dot.Tk</a>
* <a href=https://my.freenom.com>Freenom</a>
* <a href=https://tmuxguide.readthedocs.io/en/latest/tmux/tmux.html>Tmux Docs</a>

# Tested OS

| NO | Status| Platform|
|----|-------|---------|
|1|[![](https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/X/pass.svg)](https://github.com/uniminin)| Ubuntu
|2|[![](https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/X/pass.svg)](https://github.com/uniminin)| Pop!OS
|3|[![](https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/X/pass.svg)](https://github.com/uniminin)| Kubuntu
|4|[![](https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/X/fail.svg)](https://github.com/uniminin)| Kali Linux
|5|[![](https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/X/fail.svg)](https://github.com/uniminin)| Mint 19
|6|[![](https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/X/fail.svg)](https://github.com/uniminin)| OpenSuse

# Need Help?
You can ask for any kinds of help regarding this project via Discord DMs or through Github Issues.<br>
<br>
@uniminin#1151 - Uniminin

# Credits [![saythanks](https://img.shields.io/badge/say-thanks-ff69b4.svg)](https://github.com/Uniminin/)
* <a href=https://github.com/Uniminin>Uniminin</a> - Main Script Successor. (Owner)
* <a href=https://github.com/Kreyren>Krey</a> - It's Krey. (Master Helper)
* <a href=https://github.com/Ozymandias42>Ozymandias42</a> - Thank You so much for rearranging and styling everything. You're the best <3.
* <a href=https://github.com/LilPietrek>LilPietrek</a> - Thanks for your time for managing and supporting my shell project.
* <a href=https://github.com/FIREFOXCYBER>! FoXy !</a> - Thanks for endless support and solve all the problems.
* <a href=https://github.com/r33int>r33int</a> - Thanks for immediate response and help.
* <a href=https://github.com/ssCherry>Cherry</a> - Thanks for endless help.
* <a href=https://github.com/denmarkistrash>Simon</a> - Thanks for endless help and solving problems.
* <a href=https://github.com/Hazuki-san>Aoba Suzukaze</a> - Thanks you for your ripple auto installer project and best helps <3 
* <a href=https://github.com/ppy>peppy</a> - Thank you for the wonderful game.
* <a href=https://github.com/osuripple>Ripple</a> - Thank you for your private server.
* <a href=https://github.com/osufx>osu!fx</a> - Thanks for the secret module!
* <a href=https://github.com/osuYozora>osu!Yozora</a> - Thanks for the past!
* <a href=https://github.com/Nightsh0t>Night</a> - Thanks for the helps, maybe you're a bit rude.
* <a href=https://github.com/infernalfire72>Flame</a> - Thanks for the your help and time. Good supporter too <3 
* <a href=https://github.com/EmilySunpy>Sunpy</a> - Thanks for most of the commands and dependencies! And little help too
* <a href=https://github.com/rumoi>rumoi</a> - Thanks for the Support!

# License 2X :scroll: [![License: AGPL v3](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)](https://www.gnu.org/licenses/agpl-3.0) [![License: ODbL](https://img.shields.io/badge/License-ODbL-brightgreen.svg)](https://opendatacommons.org/licenses/odbl/)
This project is licenced under the GNU Affero General Public License V3. For more information, see the file `LICENSE` or visit https://www.gnu.org/licenses/agpl-3.0.

# [![ForTheBadge built-with-love](http://ForTheBadge.com/images/badges/built-with-love.svg)](https://GitHub.com/Naereen/) [![ForTheBadge built-by-developers](http://ForTheBadge.com/images/badges/built-by-developers.svg)](https://GitHub.com/Naereen/)

Also Licensed under the Free Will License AKA WTFPL http://www.wtfpl.net
