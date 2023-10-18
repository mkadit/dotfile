# Find where asdf should be installed
# ASDF_DIR="/opt/asdf-vm"
ASDF_DIR=$(which rtx)

_install_asdf(){
    # yay -S asdf-vm || paru -S asdf-vm
    yay -S rtx || paru -S rtx

    # . "$ASDF_DIR/asdf.sh"
    rtx plugin install

    # asdf plugin-add direnv
    # asdf direnv setup --shell zsh --version latest

}

# [[ ! -f "$ASDF_DIR/asdf.sh" ]] && _install_asdf
[[ ! $(command -v rtx) ]] && _install_asdf

# Load command
# if [[ -f "$ASDF_DIR/asdf.sh" ]]; then
#     # . "$ASDF_DIR/asdf.sh"
#
# fi

if [[ $(command -v rtx) ]]; then
    # . "$ASDF_DIR/asdf.sh"
    eval "$($ASDF_DIR activate zsh)"

fi
