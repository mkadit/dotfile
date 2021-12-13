#!/bin/sh

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru

rm .bash_profile .bashrc .profile

alias config="/usr/bin/git --git-dir $HOME/.cfg/ --work-tree=$HOME"
git clone --bare https://www.github.com/mkadit/dotfile.git $HOME/.cfg
config checkout
config config --local status.showUntrackedFiles no

PKGS=(
"abook" 
"alsa-utils" 
"atool" 
"base-devel" 
"bat" 
"betterlockscreen" 
"bluez" 
"bridge-utils" 
"brightnessctl" 
"btop" 
"clipmenu" 
"cmake" 
"code"
"cronie" 
"curl" 
"discord-canary"
"dmenu" 
"dnsmask" 
"docker" 
"docker-compose" 
"dosfstools" 
"downgrade" 
"dunst" 
"ebtables" 
"exfat-utils" 
"exiv2" 
"fcitx5" 
"fcitx5-configtool" 
"fcitx5-gtk" 
"fcitx5-mozc" 
"fcitx5-nord" 
"fcitx5-qt" 
"fd" 
"ffmpeg" 
"firefox"
"fzf" 
"git" 
"gnome-keyring" 
"gnupg" 
"google-chrome"
"gsimplecal" 
"htop" 
"imagemagick" 
"iproute2" 
"isync" 
"jq" 
"libnotify" 
"libxft-bgra" 
"lutris"
"lxappearance" 
"lxsession" 
"man-db" 
"mediainfo" 
"mesa-utils" 
"mpc" 
"mpd" 
"mpv" 
"msmtp" 
"mutt-wizard" 
"ncdu" 
"ncmpcpp" 
"neofetch" 
"neomutt" 
"nerd-fonts-jetbrains-mono" 
"newsboat" 
"nordic-theme-git" 
"notmuch" 
"ntfs-3g" 
"nvidia-prime" 
"obmenu-generator" 
"openbox" 
"openbsd-netcat"
"openssh" 
"ovmf" 
"pamixer" 
"papirus-nord" 
"pass" 
"pavucontrol" 
"picom" 
"plank" 
"playerctl" 
"poppler" 
"postgresql" 
"prettierd" 
"protonup-git" 
"pulseaudio" 
"pulseaudio-alsa" 
"python-magic"
"python-pipx"
"qbittorrent"
"qemu" 
"qemu-arch-extra" 
"qutebrowser" 
"rclone" 
"ripgrep" 
"rmlint" 
"rofi" 
"rofi-pass"
"shellcheck" 
"shfmt" 
"simple-mtpfs" 
"slop" 
"stylua" 
"sxiv" 
"telegram-desktop"
"thunar" 
"tint2" 
"tmux" 
"tree-sitter"
"ttf-ms-fonts"
"ueberzug" 
"unclutter" 
"unrar" 
"unzip" 
"urlview" 
"vde2" 
"vieb-bin" 
"vifm" 
"virt-manager" 
"wine" 
"wine-gecko" 
"wine-mono"
"winetricks" 
"wireless_tools" 
"wireshark-qt"
"xclip" 
"xdotool" 
"xorg-server" 
"xorg-xbacklight" 
"xorg-xdpyinfo" 
"xorg-xinit" 
"xorg-xprop" 
"xorg-xsetroot" 
"xorg-xwininfo" 
"xwallpaper" 
"yt-dlp-drop-in" 
"yt-dlp-git" 
"yuzu-mainline-bin" 
"zathura" 
"zathura-pdf-mupdf" 
"zsh" 
"zsh-autocomplete-git" 
"zsh-fast-syntax-highlighting" 
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    paru -S "$PKG" --noconfirm --needed
done


mkdir github
cd github
git clone https://github.com/neovim/neovim
git clone https://github.com/mafredri/zsh-async
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd neovim
sudo make install

cd $HOME/.local/src
git clone https://github.com/mkadit/st
cd st
sudo make install

cd $HOME/.icons
tar -xf Papirus-Custom.tar.xz

cd $HOME/.fonts
tar -xf fonts.tar.gz

source $HOME/.profile
setbg ~/assets/wallpaper.png


chsh -s $(which zsh)
fc-cache -rv
sudo chmod u+s $(command -v brightnessctl)

timedatectl set-ntp true

sudo -iu postgres
initdb -D '/var/lib/postgres/data'
exit
sudo systemctl enable postgresql
sudo systemctl start postgresql
