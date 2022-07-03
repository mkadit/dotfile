# Find where asdf should be installed
ASDF_DIR="/opt/asdf-vm"

_install_asdf(){
    yay -S asdf-vm || paru -S asdf-vm

}

[[ ! -f "$ASDF_DIR/asdf.sh" ]] && _install_asdf

# Load command
if [[ -f "$ASDF_DIR/asdf.sh" ]]; then
    . "$ASDF_DIR/asdf.sh"

fi
