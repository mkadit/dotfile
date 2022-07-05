# Prompt
source ~/.config/zsh/modules/function/git_prompt.zsh

setopt PROMPT_SUBST
export VIRTUAL_ENV_DISABLE_PROMPT=yes

function virtenv_indicator {
    [[ -z $VIRTUAL_ENV ]] && psvar[1]='' || psvar[1]=${VIRTUAL_ENV##*/}
}
add-zsh-hook precmd virtenv_indicator

PS1="%B%{$fg[magenta]%}%(1V.%B%{$fg[red]%}(%B%{$fg[magenta]%}%1v%B%{$fg[red]%}).)"
PS1+="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}"
PS1+='${vcs_info_msg_0_}'
PS1+=$'\n'"$%b "
