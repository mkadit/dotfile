#!/bin/sh

# Go
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

paru -S --needed - <~/.local/src/script/pkglist.txt

# Install tools that cannot be installed throug AUR

# Install neovim
cd "$HOME/.local/src/neovim" || exit
sudo make install

# Install picom
# cd "$HOME/.local/src/picom" || exit
# git checkout implement-window-animations
# git submodule update --init --recursive
# meson --buildtype=release . build
# ninja -C build
# sudo ninja -C build install

# Unpack icons
cd "$HOME/.icons" || exit
tar -xf icons.tar.gz

# Unpack fonts
cd "$HOME/.fonts" || exit
cat fonts.tar.gz.* >fonts.tar.gz
tar -xf fonts.tar.gz

# Unpack themes
cd "$HOME/.themes" || exit
tar -xf themes.tar.gz

~/.local/bin/setbg ~/assets/wallpaper/wallpaper.png
betterlockscreen -u ~/assets/wallpaper/wallpaper.png

# Install grammar linter through vale
vale sync

# install tmuxp for tmux
pipx install tmuxp

# TODO: Change to rtx
# Install npm, etc
# asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
# asdf install nodejs lts

# Set configurations
chsh -s "$(which zsh)"
fc-cache -rv
sudo chmod u+s "$(command -v brightnessctl)"

timedatectl set-ntp true

sudo usermod -aG libvirt "$(whoami)"
sudo usermod -aG wireshark "$(whoami)"
sudo usermod -aG docker "$(whoami)"

localectl set-x11-keymap us "" "" caps:escape

sudo cp ~/assets/wallpaper/wallpaper2.png /usr/share/backgrounds/wallpaper.png
sudo sed -i "s/background =.*/background = \/usr\/share\/backgrounds\/wallpaper.png/g" /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i "s/theme-name =.*/theme-name = Nordic/g" /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i "s/icon-theme-name =.*/icon-theme-name = Papirus/g" /etc/lightdm/lightdm-gtk-greeter.conf

# Add ollama
# curl https://ollama.ai/install.sh | sh

sudo systemctl enable lightdm.service
