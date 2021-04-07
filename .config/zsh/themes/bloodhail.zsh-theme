#!/bin/zsh

autoload -U promptinit; promptinit

GIT_BRANCH="%{$fg[blue]%}"
GIT_CLEAN="%{$fg[blue]%}"
GIT_MODIFIED="%{$fg[green]%}"
GIT_STAGED="%{$fg[cyan]%}"
GIT_CONFLICTED="%{$fg[red]%}"
GIT_STASHED="%{$fg[magenta]%}"
GIT_UNTRACKED="%{$fg[yellow]%}"

function gitstatus_prompt_update() {
    emulate -L zsh
    typeset -g GITSTATUS_PROMPT=''
    typeset -gi GITSTATUS_PROMPT_LEN=0

    # Call gitstatus_query synchronously. Note that gitstatus_query can also be called
    # asynchronously; see documentation in gitstatus.plugin.zsh.
    gitstatus_query 'MY' || return 1 # error
    [[ $VCS_STATUS_RESULT == 'ok-sync' ]] || return 0  # not a git repo

    local p
    local where # branch name, tag or commit
    p+="%{$terminfo[bold]$GIT_BRANCH%}"
    if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
        where=$VCS_STATUS_LOCAL_BRANCH
    elif [[ -n $VCS_STATUS_TAG ]]; then
        p+="#"
        where=$VCS_STATUS_TAG
    else
        p+="@"
        where=${VCS_STATUS_COMMIT[1,8]}
    fi

    (( $#where > 32 )) && where[13,-13]="…" # truncate long branch names and tags
    p+="${where//\%/%%}" # escape %
    p+="%{$reset_color%}"

    # ⇣ 42 if behind the remote.
    (( VCS_STATUS_COMMITS_BEHIND )) && p+=" $GIT_CLEAN⇣ ${VCS_STATUS_COMMITS_BEHIND}"

    # ⇡ 42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
    (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && p+=" "
    (( VCS_STATUS_COMMITS_AHEAD )) && p+="$GIT_CLEAN⇡ ${VCS_STATUS_COMMITS_AHEAD}"

    # ⇠ 42 if behind the push remote.
    (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && p+=" $GIT_CLEAN⇠ ${VCS_STATUS_PUSH_COMMITS_BEHIND}"
    (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && p+=" "

    # ⇢ 42 if ahead of the push remote; no leading space if also behind: ⇠ 42⇢ 42.
    (( VCS_STATUS_PUSH_COMMITS_AHEAD )) && p+="$GIT_CLEAN⇢ ${VCS_STATUS_PUSH_COMMITS_AHEAD}"

    # @42 if have stashes.
    (( VCS_STATUS_STASHES )) && p+=" $GIT_STASHED@${VCS_STATUS_STASHES}"

    # 'merge' if the repo is in an unusual state.
    [[ -n $VCS_STATUS_ACTION ]] && p+=" $GIT_CONFLICTED${VCS_STATUS_ACTION}"

    # ~42 if have merge conflicts.
    (( VCS_STATUS_NUM_CONFLICTED )) && p+=" $GIT_CONFLICTED~${VCS_STATUS_NUM_CONFLICTED}"

    # +42 if have staged changes.
    (( VCS_STATUS_NUM_STAGED )) && p+=" $GIT_STAGED+${VCS_STATUS_NUM_STAGED}"

    # +42 if have unstaged changes.
    (( VCS_STATUS_NUM_UNSTAGED )) && p+=" $GIT_MODIFIED+${VCS_STATUS_NUM_UNSTAGED}"

    # ?42 if have untracked files. It's really a question mark, your font isn't broken.
    (( VCS_STATUS_NUM_UNTRACKED )) && p+=" $GIT_UNTRACKED?${VCS_STATUS_NUM_UNTRACKED}"

    GITSTATUS_PROMPT="(${p}%f)"

    # The length of GITSTATUS_PROMPT after removing %f and %F.
    GITSTATUS_PROMPT_LEN="${(m)#${${GITSTATUS_PROMPT//\%\%/x}//\%(f|<->F)}}"
}

gitstatus_stop 'MY' && gitstatus_start -s -1 -u -1 -c -1 -d -1 'MY'
autoload -Uz add-zsh-hook
add-zsh-hook precmd gitstatus_prompt_update
setopt no_prompt_bang prompt_percent prompt_subst

user="%{$terminfo[bold]$fg[magenta]%}%n%{$reset_color%}"
at="%{$terminfo[bold]$fg[blue]@%}%{$reset_color%}"
host="%{$terminfo[bold]$fg[magenta]%m%}%{$reset_color%}"
colon="%{$terminfo[bold]$fg[white]%}:%{$reset_color%}"
pwd="%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}"
git='${GITSTATUS_PROMPT:+$GITSTATUS_PROMPT}'
ret_status="%(?:%{$terminfo[bold]$fg[yellow]%} :%{$terminfo[bold]$fg[red]%} )"
# ret_status="%(?:%{$terminfo[bold]$fg[yellow]%} :%{$terminfo[bold]$fg[red]%} )"

PROMPT="$user$at$host$colon $pwd $git
$ret_status%{$reset_color%}"
