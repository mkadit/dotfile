#!/bin/sh

#TODO: Have asdf install the necessary packages
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
# PKGS=(
# "abook"
# "alsa-utils"
# "ani-cli"
# "aria2"
# "asdf-vm"
# "atool"
# "base-devel"
# "bat"
# "betterlockscreen"
# "expac"
# "bluez"
# "bluez-utils"
# "bridge-utils"
# "brightnessctl"
# "btop"
# "calibre"
# "clipmenu"
# "cmake"
# "code"
# "cronie"
# "curl"
# "deno"
# "discord-canary"
# "dmenu"
# "dnsmasq"
# "docker"
# "docker-compose"
# "dosfstools"
# "downgrade"
# "dunst"
# "ebtables"
# "eslint_d"
# "exfat-utils"
# "exiv2"
# "fcitx5"
# "fcitx5-configtool"
# "fcitx5-gtk"
# "fcitx5-mozc"
# "fcitx5-nord"
# "fcitx5-qt"
# "fd"
# "ffmpeg"
# "firefox"
# "fzf"
# "git"
# "gnome-keyring"
# "gnupg"
# "google-chrome"
# "gsimplecal"
# "htop"
# "imagemagick"
# "iproute2"
# "iptables-nft" # Say yes
# "isync"
# "jq"
# "kubectl"
# "libconfig"
# "libnotify"
# "libxft-bgra"
# "lightdm-webkit2-greeter"
# "logseq-desktop-bin"
# "lxappearance-obconf"
# "lxsession"
# "maim"
# "man-db"
# "mangodl"
# "mediainfo"
# "mesa-utils"
# "meson"
# "minikube"
# "mpc"
# "mpd"
# "mpv"
# "msmtp"
# "mutt-wizard"
# "ncdu"
# "ncmpcpp"
# "neofetch"
# "neomutt"
# "nerd-fonts-jetbrains-mono"
# "newsboat"
# "ninja"
# "nordic-theme-git"
# "notmuch"
# "noto-fonts-cjk"
# "nsxiv"
# "ntfs-3g"
# "obmenu-generator"
# "obs-studio"
# "openbox"
# "openbsd-netcat"
# "openssh"
# "ovmf"
# "pamixer"
# "papirus-nord"
# "pass"
# "pavucontrol"
# "pdfarranger-git"
# "plank"
# "playerctl"
# "polybar"
# "poppler"
# "prettierd"
# "protonup-git"
# "pulseaudio"
# "pulseaudio-alsa"
# "python-magic"
# "python-pip"
# "python-pipx"
# "qbittorrent"
# "qemu"
# "qemu-arch-extra"
# "qt5-styleplugins"
# "qt5ct"
# "qutebrowser"
# "rclone"
# "ripgrep"
# "rmlint"
# "rofi"
# "rofi-pass"
# "rsync"
# "screenkey"
# "shellcheck"
# "shfmt"
# "simple-mtpfs"
# "sioyek"
# "slop"
# "stylua"
# "sxiv"
# "telegram-desktop"
# "thunar"
# "thunderbird-bin"
# "tint2"
# "tldr"
# "tmux"
# "tree-sitter"
# "ttf-ms-fonts"
# "ueberzug"
# "ufw"
# "unclutter"
# "unrar"
# "unzip"
# "urlview"
# "uthash"
# "vale"
# "vde2"
# "vieb-bin"
# "vifm"
# "virt-manager"
# "weechat"
# "wireless_tools"
# "wireshark-qt"
# "xclip"
# "xdotool"
# "xorg"
# "xterm"
# "xournalpp"
# "xwallpaper"
# "yt-dlp-drop-in"
# "yt-dlp-git"
# "zathura"
# "zathura-pdf-mupdf"
# "zsh"
# #"betterdiscordctl-git"
# #"emusak-bin"
# #"hplip"
# #"hplip-plugin"
# #"lutris"
# #"nvidia-prime"
# "system-config-printer"
# #"wine"
# #"wine-gecko"
# #"wine-mono"
# #"winetricks"
# #"yuzu-mainline-bin"
# #"xf86-input-wacom"
# #"huiontablet"
# #"digimend-kernel-drivers-dkms-git"
# )

#for PKG in "${PKGS[@]}"; do
    #paru -S "$PKG" --needed --noconfirm
#done

paru -S abook alsa-utils ani-cli aria2 asdf-vm atool base-devel bat betterlockscreen bluez bluez-utils bridge-utils brightnessctl btop calibre clipmenu cmake code cronie curl deno dmenu dnsmasq docker docker-compose dosfstools downgrade dunst ebtables eslint_d exfat-utils exiv3 fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-mozc fcitx5-nord fcitx5-qt fd ffmpeg firefox fzf git gnome-keyring gnupg google-chrome gsimplecal htop imagemagick iproute2 iptables-nft isync jq kubectl libconfig libnotify libxft-bgra lightdm-gtk-greeter-settings lightdm-webkit2-greeter logseq-desktop-bin lxappearance-obconf lxsession maim man-db mangodl mediainfo mesa-utils meson minikube mpc mpd mpv msmtp mutt-wizard ncdu ncmpcpp neofetch neomutt nerd-fonts-jetbrains-mono newsboat ninja nordic-theme-git notion-app-enhanced notmuch noto-fonts-cjk ntfs-3g obmenu-generator obs-studio openbox openbsd-netcat openssh ovmf pamixer papirus-nord pass pavucontrol pdfarranger-git plank playerctl polybar poppler prettierd protonup-git pulseaudio pulseaudio-alsa python-magic python-pip python-pipx qbittorrent qemu qemu-arch-extra qt5ct qutebrowser rclone ripgrep rmlint rofi rofi-pass rsync screenkey shellcheck shfmt simple-mtpfs sioyek slop stylua sxiv texlive-most telegram-desktop thunar tint2 tldr tmux tree-sitter ttf-ms-fonts ueberzug ufw unclutter unrar unzip urlview uthash vale vde2 vieb-bin vifm virt-manager weechat wireless_tools wireshark-qt xclip xdotool xorg xournalpp xterm xwallpaper yt-dlp-drop-in yt-dlp-git zathura zathura-pdf-mupdf zsh zsh-autocomplete-git zsh-autosuggestions zsh-fast-syntax-highlighting


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
tar -xf icons.tar.gz

# Unpack fonts
cd "$HOME/.fonts" || exit
tar -xf fonts.tar.gz

# Unpack themes
cd "$HOME/.themes" || exit
tar -xf themes.tar.gz

~/.local/bin/setbg ~/assets/wallpaper/wallpaper.png
betterlockscreen -u ~/assets/wallpaper/wallpaper.png

# Install grammar linter through vale
vale sync

# Install npm, etc
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs lts

# Set configurations
chsh -s "$(which zsh)"
fc-cache -rv
sudo chmod u+s "$(command -v brightnessctl)"

timedatectl set-ntp true

sudo usermod -aG libvirt "$(whoami)"
sudo usermod -aG wireshark "$(whoami)"
sudo usermod -aG docker "$(whoami)"

localectl set-x11-keymap us "" "" caps:escape

sudo sed -i "s/background=.*/background = \/usr\/share\/backgrounds\/wallpaper.png/g" /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i "s/theme-name=.*/theme-name = Nordic/g" /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i "s/icon-theme-name=.*/icon-theme-name = Papirus/g" /etc/lightdm/lightdm-gtk-greeter.conf

# sudo -iu postgres
# initdb -D '/var/lib/postgres/data'
# exit
# sudo systemctl enable postgresql
# sudo systemctl start postgresql

sudo systemctl enable lightdm.service

