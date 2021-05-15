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
alsa-utils
awesome-git
brightnessctl
clipmenu
dmenu
dunst
ffmpeg
htop
imagemagick
lxsession
mpc
mpd
git
bat
fd
ripgrep
fd
mpv
ncmpcpp
neofetch
neovim-nightly-git
newsboat
neomutt
mutt-wizard
pamixer
pavucontrol
picom
playerctl
pulseaudio
pulseaudio-alsa
qutebrowser
rclone
rofi
slimlock
sxiv
thunar
tmux
vifm
xclip
xorg-xprop
xorg-xwinfo
xwallpaper
zathura
zsh
zsh-autosuggestions
zsh-fast-syntax-highlighting
```

## FAQ
Q: Why is there no wallpaper?

A: My config use xwallpaper to set the background using the file located  ~/.local/share/bg. In order to address
this you can use the script `setbg` on a wallpaper of your chosing and all should be well

Q: Neovim is not working as intended

A: Make sure you use the latest version (nightly) and not the stable one since there are many plugins unavailable on the stable branch. Make ure you already have the necessary LSP in ~/.local/share/nvim/lspinstall as the
configuration for the LSP is set to point to there
