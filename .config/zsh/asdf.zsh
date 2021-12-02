# Find where asdf should be installed
ASDF_DIR="${ASDF_DIR:-$HOME/.asdf}"
ASDF_COMPLETIONS="$ASDF_DIR/completions"

_install_asdf(){
git clone https://github.com/asdf-vm/asdf.git ~/.asdf 
cp $ASDF_COMPLETIONS/_asdf ~/.zfunc/_asdf

}

# If not found, check for Homebrew package
[[ ! -f "$ASDF_DIR/asdf.sh" || ! -f "$ASDF_COMPLETIONS/asdf.bash" ]] && _install_asdf

# Load command
if [[ -f "$ASDF_DIR/asdf.sh" ]]; then
    . "$ASDF_DIR/asdf.sh"

fi
