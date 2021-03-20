# /bin/zsh

autoload -U promptinit; promptinit
autoload -U colors && colors

ZSH_THEME_GIT_PROMPT_PREFIX="[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]+"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]"

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

local ret_status="%(?:%{$terminfo[bold]$fg[yellow]%} :%{$terminfo[bold]$fg[red]%} )"
# local ret_status="%(?:%{$terminfo[bold]$fg[yellow]%} :%{$terminfo[bold]$fg[red]%} )"

local user="%{$terminfo[bold]$fg[magenta]%}%n%{$reset_color%}"
local at="%{$terminfo[bold]$fg[blue]@%}%{$reset_color%}"
local host="%{$terminfo[bold]$fg[magenta]%m%}%{$reset_color%}"
local colon="%{$terminfo[bold]$fg[white]%}:%{$reset_color%}"

PROMPT='${user}${at}${host}${colon} %{$terminfo[bold]$fg[yellow]$(get_pwd)%}%{$reset_color%} $(git_prompt_info)
${ret_status}%{$reset_color%}'
