export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/statusbar:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/scripts:$PATH"
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
export EDITOR="nvim"
HISTFILE="$HOME/.local/share/history"
HISTSIZE=10000
HISTFILESIZE=10000 
export FZF_DEFAULT_COMMAND='fd --hidden --follow --ignore-file=$HOME/.gitignore --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND --type f"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
# source "$HOME/.cargo/env"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
setopt INC_APPEND_HISTORY

# GPG Dialog
export GPG_TTY=$(tty)

# BAT Theme (cat replacement)
export BAT_THEME="base16"


autoload -U colors && colors	# Load colors


autoload -U compinit # completion
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/completion.zsh
source ~/.config/zsh/key-bindings.zsh
source ~/.config/zsh/git_prompt.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7ec0ee"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=1
[[ -f $HOME/.bash_aliases ]] && . ~/.bash_aliases


setopt PROMPT_SUBST
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}"
PS1+='${vcs_info_msg_0_}'
PS1+=$'\n'"$%b "
