#!/usr/bin/env bash
#|---/ /+------------------------------------+---/ /|#
#|--/ /-| Script to generate wallpaper cache |--/ /-|#
#|-/ /--| Kemipso                            |-/ /--|#
#|/ /---+------------------------------------+/ /---|#

export scrDir=$(dirname "$(realpath "$0")")
source "${scrDir}/global_fn.sh"
if [ $? -ne 0 ]; then
	echo "Error: unable to source global_fn.sh..."
	exit 1
fi

if ! pkg_installed imagemagick || ! pkg_installed parallel; then
	echo "ERROR : dependency failed, imagemagick/parallel is not installed..."
	exit 0
fi

# set variables
ctlLine=$(grep '^1|' ${ThemeCtl})
export cacheDir

# evaluate options
while getopts "fc:" option; do
	case $option in
	f) # force remove cache
		rm -Rf ${cacheDir}
		echo "Cache dir ${cacheDir} cleared..."
		;;
	c) # use custom wallpaper
		inWall="$OPTARG"
		if [[ "${inWall}" == '~'* ]]; then
			inWall="$HOME${inWall:1}"
		fi
		if [[ -f "${inWall}" ]]; then
			if [ $(echo "$ctlLine" | wc -l) -eq "1" ]; then
				curTheme=$(echo "$ctlLine" | cut -d '|' -f 2)
				awk -F '|' -v thm="${curTheme}" -v wal="${inWall}" '{OFS=FS} {if($2==thm)$NF=wal;print$0}' "${ThemeCtl}" >/tmp/t2 && mv /tmp/t2 "${ThemeCtl}"
			else
				echo "ERROR : ${ThemeCtl} Unable to fetch theme..."
				exit 1
			fi
		else
			echo "ERROR: wallpaper ${inWall} not found..."
			exit 1
		fi
		;;
	*) # invalid option
		echo "...valid options are..."
		echo "./create_cache.sh -f                      # force create thumbnails (delete old cache)"
		echo "./create_cache.sh -c /path/to/wallpaper   # generate cache for custom walls"
		echo "./create_cache.sh "Theme-Name"            # generate cache for a theme"
		exit 1
		;;
	esac
done

shift $((OPTIND - 1))
ctlRead=$(awk -F '|' -v thm="${1}" '{if($2==thm) print$0}' "${ThemeCtl}")
[ -z "${ctlRead}" ] && ctlRead=$(cat "${ThemeCtl}")

# magick function
fn_magick() {
	theme="$1"
	wpFullName="$2"
	wpBaseName=$(basename "${wpFullName}")

	if [ ! -f "${cacheDir}/${theme}/${wpBaseName}" ]; then
		convert "${wpFullName}"[0] -thumbnail 500x500^ -gravity center -extent 500x500 "${cacheDir}/${theme}/${wpBaseName}"
	fi

	if [ ! -f "${cacheDir}/${theme}/${wpBaseName}.rofi" ]; then
		convert -strip -resize 2000 -gravity center -extent 2000 -quality 90 "${wpFullName}"[0] "${cacheDir}/${theme}/${wpBaseName}.rofi"
	fi

	if [ ! -f "${cacheDir}/${theme}/${wpBaseName}.blur" ]; then
		convert -strip -scale 10% -blur 0x3 -resize 100% "${wpFullName}"[0] "${cacheDir}/${theme}/${wpBaseName}.blur"
	fi

	if [ ! -f "${cacheDir}/${theme}/${wpBaseName}.dcol" ]; then
		"${scrDir}/wallbash.sh" "${wpFullName}" &>/dev/null
	fi
}

export -f fn_magick

# create thumbnails for each theme > wallpapers
echo "${ctlRead}" | while read ctlLine; do
	theme=$(echo $ctlLine | awk -F '|' '{print $2}')
	fullPath=$(echo "$ctlLine" | awk -F '|' '{print $NF}' | sed "s+~+$HOME+")
	wallPath=$(dirname "$fullPath")
	mkdir -p ${cacheDir}/${theme}
	mapfile -d '' wpArray < <(find "${wallPath}" -type f \( -iname "*.gif" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -print0 | sort -z)
	echo -e "\033[0;32m[cache]\033[0m creating thumbnails for ${theme} [${#wpArray[@]}]"
	parallel --bar fn_magick ::: "${theme}" ::: "${wpArray[@]}"

	if pkg_installed code; then
		if [ ! -z "$(echo $ctlLine | awk -F '|' '{print $3}')" ]; then
			codex=$(echo $ctlLine | awk -F '|' '{print $3}' | cut -d '~' -f 1)
			if [ $(code --list-extensions | grep -iwc "${codex}") -eq 0 ]; then
				code --install-extension "${codex}" 2>/dev/null || true
			fi
		fi
	fi
done
