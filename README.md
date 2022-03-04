# dot-setup
minimalist setup for Parrot / Debian - Linux/*

Based on kali-clean from https://github.com/xct/kali-clean, i3 desktop setup.

After cloning the repo just run ./install.sh from a non-root user.

## Installation

Change the update line if you are in Parrot or other linux

First update manually

Parrot-OS
````
sudo apt update
sudo parrot-upgrade
````

if you want this script in another OS change the packet manager `apt`

```
./install.sh
```

After the script is done reboot and select i3 (top right corner) on the login screen. Then open a terminal (`ctrl+return`) run `lxa>

Credits xct

## Configuration
**Change i3-blocks and order for the header bar.**
go to:
````js
cd .config/i3/ // file location
nano i3blocks.conf # // edit it with your preferred editor
````

**Change or add shortcuts**
````js
cd .config/i3/ // file location
nano config # // edit it with your preferred editor
````

**Change the opacity for the windows**
````js
cd .config/compton/ // file location
nano compton.conf # // edit it with your preferred editor
````

**Change wallapeper**
````js
nano .fehgb // edit it with your preferred editor
````

## Shortcuts for window manager
| command | exec |
| :--- | :--- |
| Windows + D | Program launcher|
| Windows + Enter | open alacritty or (gnome console)|
| Windows + Shift + Q | close focused window|
| Windows + Shift + R | Restar I3 manager |
| Windows + Shift + E |Close session (interactive mode) |


## Shortcuts for personal tools
| command | exec |
| :--- | :--- |
| Windows + O | Obsidian |
| Windows + J | Flameshot (screenshots) |
| Windows + I | Peek (recorder) |
