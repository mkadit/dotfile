alias v='nvim'
alias cl='clear;echo ""'
alias h='history'
alias mv='mv -i'
alias rm='rm -i'
alias sss='. ~/.profile'
alias ls="ls -hN --color=auto --group-directories-first"
alias l="ls"
alias ll="ls -al"
alias vifm="vifmrun"
alias bassh="ssh -L 6969:db.cs.ui.ac.id:5432 -i ~/muhammad.krishertanto_kawung.key muhammad.krishertanto@kawung.cs.ui.ac.id -p 12122"
alias vbg='xwinwrap -ov -fs -fdt -ni -b -nf -un -o 1.0 -debug -- mpv -wid WID --loop --no-audio'

# youtube-dl
alias ytdlm="youtube-dl -f bestaudio --extract-audio --audio-format mp3 -o '~/Music/%(title)s.%(ext)s'"
alias ytdlv="youtube-dl -f bestvideo+bestaudio -o '~/Videos/%(title)s.%(ext)s'"

# Package
QPAS='pacman -Si {1}'
QYAS='yay -Si {1}'
QPAR='pacman -Qi {1}'
QYAR='yay -Qi {1}'
alias pas='pacman -Slq | fzf -m --preview ${QPAS} | xargs -ro sudo pacman -S'
alias yas='yay -Slq | fzf -m --preview ${QYAS} | xargs -ro  yay -S'
alias par='pacman -Qqe | fzf -m --preview ${QPAR} | xargs -ro sudo pacman -Rns'
alias yar='yay -Qqe | fzf -m --preview ${QYAR} | xargs -ro  yay -Rns'

#Tmux
alias tmn="tmux new -s"
alias tma="tmux a -t"

# Git
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=/$HOME'
alias gac='git add $1 && git commit -m "\$2"'
alias ggC='git commit -m "$1"'
alias ggP='git push origin $1'
alias ggR='git reset'
alias ggc='git checkout'
alias ggg='git pull; git add -A; git commit -m \"$1\"; git push;'
alias ggm='git merge $1'
alias ggp='git pull origin $1'
alias ggr='git revert'
alias ggs='git status'
alias ggf='git fetch'
alias glog='git log --all --decorate --oneline --graph'
