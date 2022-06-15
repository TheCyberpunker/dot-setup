#!/bin/bash
echo -e " ---------------------------------------------------------------------"
echo -e "The_____      _               _____             _                     "
echo -e "   ________  ______  __________  ____  __  ___   ____ __ __________   "
echo -e "  / ____/\ \/ / __ )/ ____/ __ \/ __ \/ / / / | / / //_// ____/ __ \  "
echo -e " / /      \  / __  / __/ / /_/ / /_/ / / / /  |/ / ,<  / __/ / /_/ /  "
echo -e "/ /___    / / /_/ / /___/ _, _/ ____/ /_/ / /|  / /| |/ /___/ _, _/   "
echo -e "\____/   /_/_____/_____/_/ |_/_/    \____/_/ |_/_/ |_/_____/_/ |_|v1.0"
echo -e "----------------------------------------------------------------------"
echo -e "change the update line if you are in Parrot or other linux.           "
echo -e "----------------------------------------------------------------------"
echo -e "######################################################################"
## $(whoami) var user

## sleep 1 // pause
read -s -n 1 -p "Update the system. Press ANY key to continue"
echo -e ""

read -s -n 1 -p "Need to install with the root user: sudo, git and change sudoers file with your user, then run this program again"
read -s -n 1 -p "change the source list file"
echo -e ""
# > login with root
# > nano /etc/apt/sourcelist.d
# add this to the file
#deb http://deb.debian.org/debian/ bullseye contrib non-free main
#deb http://security.debian.org/debian-security bullseye-security main contrib non-free
#deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free

# > apt update -y
# > apt upgrade -y
# > apt full-upgrade -y
# > apt install sudo git
# > nano /etc/sudoers
# > add your user exaclty like root user 

# > change from root to your user
sleep 1
#update
#sudo apt update && sudo parrot-upgrade -y
# fix problem with gcc
sudo apt-get install -y build-essential dkms linux-headers-$(uname -r)

sudo apt update -y
sudo apt upgrade -y
sudo apt full-upgrade -y
echo -e "System updated"
echo -e ""
read -s -n 1 -p "Install dependencies. Press ANY key to continue"
echo -e ""

sleep 1
#install dependencies
sudo apt install -y arandr arc-theme feh i3blocks i3status i3 i3-wm lxappearance
sudo apt install -y python3-pip rofi unclutter cargo compton papirus-icon-theme
sudo apt install -y imagemagick gcc zsh
sudo apt install -y libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev
sudo apt install -y xcb libxcb1-dev libzxcb-icccm4-dev libyajl-dev
sudo apt install -y libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev
sudo apt install -y libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev
sudo apt install -y libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev autoconf meson
sudo apt install -y libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev

## install i3-gaps with kali-clean ninja
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps && mkdir -p build && cd build && meson ..
ninja
sudo ninja install
cd ../..
#sudo apt install -y i3-gaps
#neofeth command line system information
sudo apt install -y neofetch
sudo apt install -y jq

#install utilities
#peek record screen and make gif
#flameshot screenshots
sudo apt install -y peek flameshot

#install view to allow choose i3 or default
apt install -y lightdm unzip p7zip-full rxvt-unicode

# install firefox
apt install -y cbatticon
apt install -y firefox-esr

echo -e "Dependencies installed \n"
read -s -n 1 -p "Install fonts - obsidianMD / Brave-browser (nerdfonts/Iosevka,RobotoMono). Press ANY key to continue"
echo -e ""
#install obsidianMD
#wget https://github.com/obsidianmd/obsidian-releases/releases/download/v0.12.15/obsidian_0.12.15_amd64.deb
# FIX: Try to install obsidian with the app image
#sudo dpkg -i obsidian_0.12.15_amd64.deb
#sudo chmod 4755 /opt/Obsidian/chrome-sandbox

#install brave-browser
sudo apt install -y apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update -y
sudo apt install -y brave-browser

sleep 1
#install fonts
mkdir -p ~/.local/share/fonts/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip
unzip Iosevka.zip -d ~/.local/share/fonts/
unzip RobotoMono.zip -d ~/.local/share/fonts/
fc-cache -fv #update fonts cache
echo -e "Fonts installed \n"
echo -e ""
read -s -n 1 -p "Install Alacritty Terminal, Press ANY key to continue"
echo -e ""

sleep 1
#install alacritty terminal or other terminal
wget https://github.com/barnumbirr/alacritty-debian/releases/download/v0.10.1-1/alacritty_0.10.1-1_amd64_bullseye.deb
sudo dpkg -i alacritty_0.10.1-1_amd64_bullseye.deb
sudo apt install -f
echo -e "Alacritty installed"
echo -e ""
read -s -n 1 -p "Configure and copy the dot files, Press ANY key to continue"
echo -e ""
pip3 install pywal

sleep 1
#copy the dot config files
mkdir -p ~/.config/i3
mkdir -p ~/.config/compton
mkdir -p ~/.config/rofi
mkdir -p ~/.config/alacritty
mkdir -p ~/thecyberpunker
mkdir -p ~/HDbackup
cp .config/i3/config ~/.config/i3/config
cp .config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
cp .config/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
cp .config/compton/compton.conf ~/.config/compton/compton.conf
cp .config/rofi/config ~/.config/rofi/config
cp .fehbg ~/.fehbg
cp .config/i3/clipboard_fix.sh ~/.config/i3/clipboard_fix.sh
cp encrypt.sh ~/thecyberpunker
cp decrypt.sh ~/thecyberpunker
chmod +x ~/thecyberpunker/encrypt.sh
chmod +x ~/thecyberpunker/decrypt.sh

#remove packages from dot-config
rm alacritty_0.10.1-1_amd64_bullseye.deb
rm Iosevka.zip
rm RobotoMono.zip
rm obsidian_0.12.15_amd64.deb

echo "Done! Grab some wallpaper and run pywal -i filename to set your color scheme."
echo -e ""
echo "To have the wallpaper set on every boot edit ~.fehbg"
echo -e ""
echo "After reboot: Select i3 on login, run lxappearance and select arc-dark"
echo -e ""
read -s -n 1 -p "Press ANY key to finish"
echo -e ""
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo -e "Done! reboot manually :)"
