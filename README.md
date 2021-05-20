# Dotfile
This is a WIP

## Setup
* **Distro** : Arch Linux
* **WM** : awesome wm
* **status bar** : wibar
* **Shell** : zsh
* **File Manager** : vifm
* **Terminal** : st
* **Editor** : nvim (nightly)

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
sxiv
thunar
tmux
unclutter
unrar
unzip
urlview
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
## After
```
chsh -s $(which zsh)
fc-cache -rv
sudo chmod u+s $(command -v brightnessctl)
```

## FAQ
Q: Why is there no wallpaper?

A: My config use xwallpaper to set the background using the file located  ~/.local/share/bg. In order to address
this you can use the script `setbg` on a wallpaper of your chosing and all should be well

Q: Neovim is not working as intended

A: Make sure you use the latest version (nightly) and not the stable one since there are many plugins unavailable on the stable branch. Make ure you already have the necessary LSP in ~/.local/share/nvim/lspinstall as the
configuration for the LSP is set to point to there
