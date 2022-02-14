
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
source ~/.profile
fpath+=~/.zfunc

##############################################################################
# History Configuration
##############################################################################
HISTFILE="$HOME/.local/share/history"
HISTSIZE=10000
SAVEHIST=10000          # Number of history entries to save to disk
# HISTDUP=erase           # Erase duplicates in the history file
setopt appendhistory    # Append history to the history file (no overwriting)
setopt sharehistory     # Share history across terminals
setopt incappendhistory # Immediately append to the history file, not just when a term is killed
setopt hist_find_no_dups

# GPG Dialog
export GPG_TTY=$(tty)

# BAT Theme (cat replacement)
export BAT_THEME="Nord"

autoload -U colors && colors # Load colors

# autoload -U compinit # completion
# zstyle ':completion:*' menu select
# zmodload zsh/complist
# compinit
# _comp_options+=(globdots) # Include hidden files.
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7ec0ee"
# ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# ZSH_AUTOSUGGEST_USE_ASYNC=1

# Autocomplete
# FIX: .autocomplete.key-binding.precmd:40: terminfo[kcbt]: parameter not set
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.config/zsh/completion.zsh
#
source ~/.config/zsh/asdf.zsh
# source ~/.config/zsh/pyenv.zsh
# source ~/.config/zsh/fnm.zsh
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source ~/.config/zsh/key-bindings.zsh
source ~/.config/zsh/git_prompt.zsh

#
[[ -f $HOME/.bash_aliases ]] && . ~/.bash_aliases

setopt PROMPT_SUBST

# Prompt
export VIRTUAL_ENV_DISABLE_PROMPT=yes

function virtenv_indicator {
    [[ -z $VIRTUAL_ENV ]] && psvar[1]='' || psvar[1]=${VIRTUAL_ENV##*/}
}
add-zsh-hook precmd virtenv_indicator
PS1="%B%{$fg[magenta]%}%(1V.%B%{$fg[red]%}(%B%{$fg[magenta]%}%1v%B%{$fg[red]%}).)"
PS1+="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}"
PS1+='${vcs_info_msg_0_}'
PS1+=$'\n'"$%b "
# Added by zap installation script
# PATH=$PATH:$HOME/.local/bin/
# Added by zap installation script
PATH=$PATH:$HOME/.local/bin/
