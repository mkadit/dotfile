#!/usr/bin/env sh

# set variables
ScrDir=$(dirname "$(realpath "$0")")
source $ScrDir/globalcontrol.sh
alacrittyDir="${ConfDir}/alacritty/themes"

#Override alacritty config
ln -fs ${alacrittyDir}/${gtkTheme}.toml ${alacrittyDir}/theme.toml
