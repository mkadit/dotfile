#! /bin/bash

#! /bin/bash

activemonitor=$(hyprctl monitors -j | jq '.[] | select(.focused == true).id')
passivemonitor=$(hyprctl monitors -j | jq '.[] | select(.focused == false).id')
activews=$(hyprctl monitors -j | jq '.[] | select(.focused == true).activeWorkspace.id')
passivews=$(hyprctl monitors -j | jq '.[] | select(.focused == false).activeWorkspace.id')

# Comment out all lines below except the last to switch back to the default Hyprland dispatch method
if [[ $1 -eq "p" ]]; then
	[[ $passivemonitor != "$activemonitor" ]] && (hyprctl dispatch swapactiveworkspaces "$activemonitor $passivemonitor")
	echo "somsomds"
	hyprctl dispatch moveworkspacetomonitor "$1 $activemonitor"
	hyprctl dispatch focusmonitor "$activemonitor"
	hyprctl dispatch workspace "$1"

else
	hyprctl dispatch workspace "$1"

fi
