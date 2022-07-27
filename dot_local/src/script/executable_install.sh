#!/bin/sh

cd "$HOME" || exit

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Paru
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru || exit
makepkg -si
cd ..
rm -rf paru

# Delete existing config
rm -f .bash_profile .bashrc .profile

# Install Dependencies
PKGS=(
  "libconfig"
"abook"
"alsa-utils"
"ani-cli"
"aria2"
"asdf-vm"
"atool"
"base-devel"
"bat"
"betterdiscordctl-git"
"betterlockscreen"
"bluez"
"bluez-utils"
"bridge-utils"
"brightnessctl"
"btop"
"clipmenu"
"cmake"
"code"
"cronie"
"curl"
"deno"
"discord-canary"
"dmenu"
"dnsmasq"
"docker"
"docker-compose"
"dosfstools"
"downgrade"
"dunst"
"ebtables"
"emusak-bin" # For easy yuzu
"eslint_d"
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
"iptables-nft"
"isync"
"jq"
"kubectl"
"libnotify"
"libxft-bgra"
"lutris"
"lxappearance-obconf"
"lxsession"
"man-db"
"mangodl"
"mediainfo"
"mesa-utils"
"minikube"
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
"notion-app-enhanced"
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
# "postgresql"
"prettierd"
"protonup-git"
"pulseaudio"
"pulseaudio-alsa"
"python-magic"
"python-pip"
"python-pipx"
"qbittorrent"
"qemu"
"qemu-arch-extra"
"qt5ct"
"qutebrowser"
"rclone"
"ripgrep"
"rmlint"
"rofi"
"rofi-pass"
"rsync"
"shellcheck"
"shfmt"
"simple-mtpfs"
"slop"
"stylua"
"sxiv"
"telegram-desktop"
"thunar"
"tint2"
"tldr"
"tmux"
"tree-sitter"
"ttf-ms-fonts"
"ueberzug"
"ufw"
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
"vale"
"yt-dlp-drop-in"
"yt-dlp-git"
"yuzu-mainline-bin"
"zathura"
"zathura-pdf-mupdf"
"zsh"
"zsh-autocomplete-git"
"zsh-autosuggestions"
"zsh-fast-syntax-highlighting"
)

paru -S "$PKGS" --needed


# Install tools that cannot be installed throug AUR

# Install terminal
cd "$HOME/.local/src/st" || exit
sudo make install

# Install neovim
cd "$HOME/.local/src/neovim" || exit
sudo make install

# Install picom
cd "$HOME/.local/src/picom" || exit
sudo ninja -C build install

# Unpack icons
cd "$HOME/.icons" || exit
tar -xf Papirus-Custom.tar.xz

# Unpack fonts
cd "$HOME/.fonts" || exit
tar -xf fonts.tar.gz

~/.local/bin/setbg ~/assets/wallpaper.png

# Install grammar linter through vale
vale sync


# Set configurations
chsh -s "$(which zsh)"
fc-cache -rv
sudo chmod u+s "$(command -v brightnessctl)"

timedatectl set-ntp true

sudo usermod -aG libvirt "$(whoami)"

# sudo -iu postgres
# initdb -D '/var/lib/postgres/data'
# exit
# sudo systemctl enable postgresql
# sudo systemctl start postgresql

# nvim +JetpackSync
