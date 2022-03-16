#!/bin/bash
echo -e " -------------------------------------------------------------"
echo -e "the_____      _               _____             _             "
echo -e "  / ____|    | |             |  __ \           | |            "
echo -e " | |    _   _| |__   ___ _ __| |__) |   _ _ __ | | _____ _ __ "
echo -e " | |   | | | | '_ \ / _ \ '__|  ___/ | | | '_ \| |/ / _ \ '__|"
echo -e " | |___| |_| | |_) |  __/ |  | |   | |_| | | | |   <  __/ |   "
echo -e "  \_____\__, |_.__/ \___|_|  |_|    \__,_|_| |_|_|\_\___|_|   "
echo -e "         __/ |                                                "
echo -e "        |___/                                        v0.1     "
echo -e "--------------------------------------------------------------"
echo -e "This setup is the same of kali-clean from xct, just a little  "
echo -e "check the original https://github.com/xct/kali-clean          "
echo -e "change the update line if you are in Parrot or other linux.   "
echo -e "--------------------------------------------------------------"
echo -e "##############################################################"
## $(whoami) var user

## sleep 1 // pause
read -s -n 1 -p "Update the system. Press ANY key to continue.\n"
sleep 1
#update
sudo apt update && sudo parrot-upgrade -y
echo -e "System updated \n"
read -s -n 1 -p "Install dependencies. Press ANY key to continue.\n"

sleep 1
#install dependencies
sudo apt install -y arandr arc-theme feh i3blocks i3status i3 i3-wm lxappearance python3-pip rofi unclutter cargo compton papirus-icon-theme imagemagick
sudo apt install -y libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev autoconf meson
sudo apt install -y libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev 
sudo apt install -y i3-gaps
sudo apt install -y jq
#install utilities
#peek record screen and make gif
#flameshot screenshots
sudo apt install -y peek flameshot

echo -e "Dependencies installed \n"
read -s -n 1 -p "Install fonts - obsidianMD / Brave-browser (nerdfonts/Iosevka,RobotoMono). Press ANY key to continue \n"
#install obsidianMD
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v0.12.15/obsidian_0.12.15_amd64.deb
sudo dpkg -i obsidian_0.12.15_amd64.deb
sudo chmod 4755 /opt/Obsidian/chrome-sandbox

#install brave-browser
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

sleep 1
#install fonts
mkdir -p ~/.local/share/fonts/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip
unzip Iosevka.zip -d ~/.local/share/fonts/
unzip RobotoMono.zip -d ~/.local/share/fonts/
fc-cache -fv #update fonts cache
echo -e "Fonts installed \n"
read -s -n 1 -p "Install Alacritty Terminal, Press ANY key to continue \n"

sleep 1
#install alacritty terminal or other terminal
wget https://github.com/barnumbirr/alacritty-debian/releases/download/v0.10.1-1/alacritty_0.10.1-1_amd64_bullseye.deb
sudo dpkg -i alacritty_0.10.1-1_amd64_bullseye.deb
sudo apt install -f
echo -e "Alacritty installed \n"
read -s -n 1 -p "Configure and copy the dot files, Press ANY key to continue \n"

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

echo "Done! Grab some wallpaper and run pywal -i filename to set your color scheme. \n"
echo "To have the wallpaper set on every boot edit ~.fehbg \n"
echo "After reboot: Select i3 on login, run lxappearance and select arc-dark \n"
read -s -n 1 -p "Press ANY key to finish \n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
