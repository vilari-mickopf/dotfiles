#!/bin/zsh

autoload -U promptinit; promptinit

function get_pwd() {
    echo "${PWD/$HOME/~}"
}

ret_status="%(?:%{$terminfo[bold]$fg[yellow]%} :%{$terminfo[bold]$fg[red]%} )"
# ret_status="%(?:%{$terminfo[bold]$fg[yellow]%} :%{$terminfo[bold]$fg[red]%} )"

user="%{$terminfo[bold]$fg[magenta]%}%n%{$reset_color%}"
at="%{$terminfo[bold]$fg[blue]@%}%{$reset_color%}"
host="%{$terminfo[bold]$fg[magenta]%m%}%{$reset_color%}"
colon="%{$terminfo[bold]$fg[white]%}:%{$reset_color%}"

set_prompt () {
PROMPT="$user$at$host$colon %{$terminfo[bold]$fg[yellow]$(get_pwd)%}%{$reset_color%} $(git_status)
$ret_status%{$reset_color%}"
}

precmd_functions+=set_prompt
set_prompt
