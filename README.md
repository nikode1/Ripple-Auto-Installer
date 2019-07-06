# Auto Ripple Server Installer [![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)  [![Open Source Love svg1](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/Uniminin/) 
<b>**THIS SCRIPT IS NOT FOR LOCAL PC (localhost)**</b><br>
Ripple: https://github.com/osuripple
Uniminin's Auto Ripple OSU! Server Installer!

<p align="center">
  <img src="https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/ripple.svg"/>
</p>

# Important Note
This Script installs most of the things for server! If you want to use other stuffs, You need to edit it yourself. Please Star and Fork it if you use it! (THIS IS NOT DESIGNED FOR WINDOWS OR FOR LOCAL PC!) This is designed to be used on VPS.
Also Please Do Note that when you're using this script, if you get any errors you'll have to fix it yourself. If you don't have enough knowledge on linux and how ripple works, then I would prefer you to not host it. Wish you all the best
# Requirements
* Any VPS with Ubuntu OS is strongly recommended

# Features
* A configurable shell script for installing most of the things for your clone Ripple server
* Ripple Based
* Everything is Pre-ready and is getting via wget
* Simple and user friendly Installation
* Installs the most of the things for your server within about 10-15 Minutes

# Installation Instructions
* Note: There are more than 1 installer from different persons, re-edited! You can use any of them you want, or just by a bit modifying yourself. Get those installers via `wget` (raw). And rename it to installer, then follow Step 2. You can also do `sudo sh installer.sh`

### Step 1:

First of all you need to download it by either by downloading it from GitHub, or running this command to download: 

```bash
wget https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/installer.sh
```

### Step 2:

After you do this, copy-paste then run the following command and it will take you into the installation process!

```bash
chmod +x installer.sh && ./installer.sh
```

You `don't have to be root` then, although `it is recommended`.

### Step 3: Follow These Steps To Start The Server!
<img src="https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/start.png"/>


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
wget https://raw.githubusercontent.com/Uniminin/Ripple-Auto-Installer/master/uninstaller.sh
```

### Step 2:

```bash
chmod +x uninstaller.sh && ./uninstaller.sh
```

# Tested OS

| NO | Status| Platform|
|----|-------|---------|
|1|[![](https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/pass.svg)](https://github.com/uniminin)| Ubuntu
|2|[![](https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/pass.svg)](https://github.com/uniminin)| Pop!OS
|3|[![](https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/pass.svg)](https://github.com/uniminin)| Kubuntu
|4|[![](https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/fail.svg)](https://github.com/uniminin)| Kali Linux
|5|[![](https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/fail.svg)](https://github.com/uniminin)| Mint 19
|6|[![](https://github.com/Uniminin/Ripple-Auto-Installer/blob/master/fail.svg)](https://github.com/uniminin)| OpenSuse

# Need Help?
You can ask for any kinds of help regarding this project via Discord DMs or through Github Issues.<br>
<br>
@uniminin#1151 - Uniminin

# Credits [![saythanks](https://img.shields.io/badge/say-thanks-ff69b4.svg)](https://github.com/Uniminin/)
* <a href=https://github.com/Uniminin>Uniminin</a> - Aoba's Successor.
* <a href=https://github.com/Ozymandias42>Ozymandias42</a> - Thank You so much for rearranging and styling everything. You're the best <3.
* <a href=https://github.com/LilPietrek>LilPietrek</a> - Thanks for your time for managing and supporting my shell project.
* <a href=https://github.com/FIREFOXCYBER>! FoXy !</a> - Thanks for endless support and solve all the problems.
* <a href=https://github.com/Hazuki-san>Aoba Suzukaze</a> - Thanks you for your ripple auto installer project. Really helped me a lot.
* <a href=https://github.com/ppy>peppy</a> - Thank you for the wonderful game.
* <a href=https://github.com/osuripple>Ripple</a> - Thank you for your private server.
* <a href=https://github.com/osufx>osu!fx</a> - Thanks for the secret module!
* <a href=https://github.com/osuYozora>osu!Yozora</a> - Thanks for the past!
* <a href=https://github.com/EmilySunpy>Sunpy</a> - Thanks for most of the commands and dependencies!
* <a href=https://github.com/rumoi>rumoi</a> - Thanks for the Support!

# License [![License: AGPL v3](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)](https://www.gnu.org/licenses/agpl-3.0) [![License: ODbL](https://img.shields.io/badge/License-ODbL-brightgreen.svg)](https://opendatacommons.org/licenses/odbl/)
This installer falls under the GNU Affero General Public License V3. For more information, see the file `LICENSE` or visit https://www.gnu.org/licenses/agpl-3.0.
