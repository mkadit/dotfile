source /etc/profile

[[ -f $HOME/.bash_aliases ]] && . ~/.bash_aliases
[[ -f $HOME/.bash_profile ]] && . ~/.bash_profile
source "$HOME/.cargo/env"
alias config='/usr/bin/git --git-dir=/home/mkadit/.cfg/ --work-tree=/home/mkadit'
