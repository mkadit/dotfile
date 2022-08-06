#!/bin/sh

# Go ~
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

# Install Dependencies
PKGS=(
"abook"
"alsa-utils"
"ani-cli"
"aria2"
"asdf-vm"
"atool"
"base-devel"
"bat"
"betterlockscreen"
"bluez"
"bluez-utils"
"bridge-utils"
"brightnessctl"
"btop"
"calibre"
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
"iptables-nft" # Say yes
"isync"
"jq"
"kubectl"
"libconfig"
"libnotify"
"libxft-bgra"
"lightdm-gtk-greeter-settings"
"lightdm-webkit2-greeter"
"logseq-desktop-bin"
"lxappearance-obconf"
"lxsession"
"maim"
"man-db"
"mangodl"
"mediainfo"
"mesa-utils"
"meson"
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
"ninja"
"nordic-theme-git"
"notion-app-enhanced"
"notmuch"
"noto-fonts-cjk"
"ntfs-3g"
"obmenu-generator"
"obs-studio"
"openbox"
"openbsd-netcat"
"openssh"
"ovmf"
"pamixer"
"papirus-nord"
"pass"
"pavucontrol"
"pdfarranger-git"
"plank"
"playerctl"
"polybar"
"poppler"
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
"screenkey"
"shellcheck"
"shfmt"
"simple-mtpfs"
"sioyek"
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
"uthash"
"vale"
"vde2"
"vieb-bin"
"vifm"
"virt-manager"
"weechat"
"wireless_tools"
"wireshark-qt"
"xclip"
"xdotool"
"xorg-server"
"xorg-xdpyinfo"
"xorg-xinit"
"xorg-xprop"
"xorg-xsetroot"
"xorg-xwininfo"
"xournalpp"
"xwallpaper"
"yt-dlp-drop-in"
"yt-dlp-git"
"zathura"
"zathura-pdf-mupdf"
"zsh"
"zsh-autocomplete-git"
"zsh-autosuggestions"
"zsh-fast-syntax-highlighting"
#"betterdiscordctl-git"
#"emusak-bin"
#"lutris"
#"nvidia-prime"
#"wine"
#"wine-gecko"
#"wine-mono"
#"winetricks"
#"yuzu-mainline-bin"
)

for PKG in "${PKGS[@]}"; do
    paru -S "$PKG" --needed --noconfirm
done


# Install tools that cannot be installed throug AUR

# Install terminal
cd "$HOME/.local/src/st" || exit
sudo make install

# Install neovim
cd "$HOME/.local/src/neovim" || exit
sudo make install

# Install picom
cd "$HOME/.local/src/picom" || exit
git checkout implement-window-animations
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

# Unpack icons
cd "$HOME/.icons" || exit
tar -xf Papirus-Custom.tar.xz

# Unpack fonts
cd "$HOME/.fonts" || exit
tar -xf fonts.tar.gz

# Unpack themes
cd "$HOME/.themes" || exit
tar -xf themes.tar.gz

~/.local/bin/setbg ~/assets/wallpaper.png
betterlockscreen -u ~/assets/wallpaper.png

# Install grammar linter through vale
vale sync


# Set configurations
chsh -s "$(which zsh)"
fc-cache -rv
sudo chmod u+s "$(command -v brightnessctl)"

timedatectl set-ntp true

sudo usermod -aG libvirt "$(whoami)"
sudo usermod -aG wireshark "$(whoami)"

# sudo -iu postgres
# initdb -D '/var/lib/postgres/data'
# exit
# sudo systemctl enable postgresql
# sudo systemctl start postgresql

# nvim +JetpackSync
