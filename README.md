# Dotfile
This is a WIP

## Setup
* **Distro**       : Arch Linux
* **WM**           : awesome wm
* **status bar**   : wibar
* **Shell**        : zsh
* **File Manager** : vifm
* **Terminal**     : st
* **Editor**       : nvim (nightly)

## Screenshot
![Screenshot](./assets/normal.png)
![Screenshot2](./assets/nvim_zathura.png)

## Download
```
alias config="/usr/bin/git --git-dir $HOME/.cfg/ --work-tree=$HOME"  
git clone --bare https://www.github.com/mkadit/dotfile.git $HOME/.cfg  
config checkout  
config config --local status.showUntrackedFiles no
```

## Packages
Use the AUR for this to make life easier

```
abook
alsa-utils
atool
awesome-git
base-devel
bat
bluez
brightnessctl
clipmenu
cronie
curl
dmenu
dosfstools
downgrade
dunst
exfat-utils
exiv2
fd
ffmpeg
fzf
git
gnome-keyring
gnupg
htop
imagemagick
isync
libnotify
lxsession
man-db
mediainfo
mpc
mpd
mpv
msmtp
mutt-wizard
ncmpcpp
neofetch
neomutt
neovim-nightly-git
newsboat
nmdu
nordic-theme
notmuch
ntfs-3g
pamac-all
pamixer
papirus-nord
pass
pavucontrol
picom
playerctl
poppler
pulseaudio
pulseaudio-alsa
qutebrowser
rclone
ripgrep
rmlint
rofi
simple-mtpfs
slimlock
slop
sxiv
thunar
tmux
ueberzug
unclutter
unrar
unzip
urlview
vieb
vifm
xclip
xdotool
xorg-server
xorg-xbacklight
xorg-xdpyinfo
xorg-xinit
xorg-xprop
xorg-xwinfo
xwallpaper
youtube-dl
zathura
zathura-pdf-mupdf
zsh
zsh-autosuggestions
zsh-fast-syntax-highlighting
```
## Optional
Below package are optional
```
xwinwrap-git
```
## After
```
chsh -s $(which zsh)
fc-cache -rv
sudo chmod u+s $(command -v brightnessctl)
```

### Useful keybindings (maybe?)

| Key                                                             | Command           |
|-----------------------------------------------------------------|-------------------|
| <kbd>Ctrl</kbd> + <kbd>T</kbd>                                  | Search file       |
| <kbd>Ctrl</kbd> + <kbd>F</kbd>                                  | Search directory  |
| <kbd>Ctrl</kbd> + <kbd>H</kbd>                                  | Search history    |
| <kbd>Ctrl</kbd> + <kbd>G</kbd> , <kbd>Ctrl</kbd> + <kbd>F</kbd> | Search git file   |
| <kbd>Ctrl</kbd> + <kbd>G</kbd> , <kbd>Ctrl</kbd> + <kbd>B</kbd> | Search git branch |
| <kbd>Ctrl</kbd> + <kbd>G</kbd> , <kbd>Ctrl</kbd> + <kbd>R</kbd> | Search git remote |
| <kbd>Ctrl</kbd> + <kbd>G</kbd> , <kbd>Ctrl</kbd> + <kbd>H</kbd> | Search git log    |
| <kbd>Mod</kbd> + <kbd>Enter</kbd>                               | Terminal          |
| <kbd>Mod</kbd> + <kbd>R</kbd>                                   | Rofi              |
| <kbd>Mod</kbd> + <kbd>S</kbd>                                   | Cheatsheet        |
| <kbd>Mod</kbd> + <kbd>Q</kbd>                                   | Kill instance     |
| <kbd>Mod</kbd> + <kbd>Ctrl</kbd> + <kbd>Q</kbd>                 | Sysact            |


For more mappings see [.config/awesome/utils/keybind.lua](.config/awesome/utils/keybind.lua)

## FAQ
Q: Why is there no wallpaper?

A: My config use xwallpaper to set the background using the file located  ~/.local/share/bg. In order to address
this you can use the script `setbg` on a wallpaper of your chosing and all should be well. You could also use
<kbd>Ctrl</kbd> + <kbd>x</kbd>, <kbd>Ctrl</kbd> + <kbd>w</kbd> when using sxiv to use the selected wallpaper

Q: Neovim is not working as intended

A: Make sure you use the latest version (nightly) and not the stable one since there are many plugins unavailable on the stable branch. Make ure you already have the necessary LSP in ~/.local/share/nvim/lspinstall as the
configuration for the LSP is set to point to there.

Q: Rofi is not showing?
A: For the moment I'm using the downgraded version of rofi 1.6.1
