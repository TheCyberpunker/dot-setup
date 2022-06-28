# dot-setup
Minimalist setup for Parrot - Kali / Debian - Linux/*

After cloning the repo just run from a non-root user

```Shell

Debian: ./install-debian.sh
Kali: ./install-kali.sh
Parrot: ./install-parrot.sh
```

## Installation

Change the update line if you are in Parrot or other linux

First update manually

Parrot-OS
````bash
sudo apt update
sudo parrot-upgrade
````

if you want this script in another OS change the packet manager `apt`

```bash
./install.sh
```


## Configuration
**Change i3-blocks and order for the header bar.**
go to:
````bash
cd .config/i3/  # file location
nano i3blocks.conf  # edit it with your preferred editor
````

**Change or add shortcuts**
````bash
cd .config/i3/ # file location
nano config  # edit it with your preferred editor
````

**Change the opacity for the windows**
````bash
cd .config/compton/ # file location
nano compton.conf # // edit it with your preferred editor
````

**Change wallpaper**
````bash
nano .fehgb # edit it with your preferred editor
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


## Updates

#### Update 2022 / 04 / 19
- Feature: Add cbatticon (cbatticon notify about the battery level) utility to i3-bar

#### Update 2022 / 04 / 18
- Feature: Add Kali linux installer (install-kali.sh)
- Dependency: add neofetch (display system information)

#### Update 2022 / 04 / 09
- Feature: Add Debian Bullseye installer (install-debian.sh)

#### Update 2022 / 03 / 16
- Feature: Change workspace name (windows + n)
- Dendency: Add jq dependency required to change Workspace name - lightweight and flexible command-line JSON

#### Update 2022 / 03 / 12
- Feature: Add battery level for laptop
- New documentation

### Old updates
Transparency: Check all the commits https://github.com/TheCyberpunker/dot-setup/commits
