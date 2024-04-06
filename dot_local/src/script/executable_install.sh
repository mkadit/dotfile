#!/bin/sh

scrDir=$HOME/.local/src/script/install

# Pre-Install
"${scrDir}/install_pre.sh"
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

"${scrDir}/install_pkg.sh" "${scrDir}/pkglist.lst"

# Unpack fonts, icons, and themes
cat ~/.local/src/themes/Font_Old.tar.gz.* >~/.local/src/themes/Font_Old.tar.gz

"${scrDir}/restore_fnt.sh"

# Install tools that cannot be installed throug AUR

# Install neovim
cd "$HOME/.local/src/neovim" || exit
sudo make CMAKE_BUILD_TYPE=Release
sudo make install

# Install grammar linter through vale
# vale sync

# install tmuxp for tmux
pipx install tmuxp

# Set configurations
chsh -s "$(which zsh)"
fc-cache -rv
sudo chmod u+s "$(command -v brightnessctl)"

timedatectl set-ntp true

sudo usermod -aG libvirt "$(whoami)"
sudo usermod -aG wireshark "$(whoami)"
sudo usermod -aG docker "$(whoami)"

localectl set-x11-keymap us "" "" caps:escape

# Add ollama
# curl https://ollama.ai/install.sh | sh

while read servChk; do

	if [[ $(systemctl list-units --all -t service --full --no-legend "${servChk}.service" | sed 's/^\s*//g' | cut -f1 -d' ') == "${servChk}.service" ]]; then
		echo -e "\033[0;33m[SKIP]\033[0m ${servChk} service is active..."
	else
		echo -e "\033[0;32m[systemctl]\033[0m starting ${servChk} system service..."
		sudo systemctl enable "${servChk}.service"
		sudo systemctl start "${servChk}.service"
	fi
done <"${scrDir}/system_ctl.lst"
