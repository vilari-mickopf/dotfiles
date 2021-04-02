#!/bin/zsh

alias sudo='nocorrect sudo '

# alias fuck='sudo $(fc -ln -1)'
alias fuck='fc -e "sed -i -e \"s/^/sudo /\""'
alias fcuk='fuck'

# Avoid overwriting with windows-like 'Are you sure?' prompt
alias cp='cp -i'

# Make your life easier, type less
alias c='clear'

# Colorful ls
alias ls='ls --color=auto --group-directories-first'
alias l='ls'
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

# ls dir's content every time you do cd
cdls(){cd "$@" && ls;}
alias cd='cdls'
alias cd.='cdls'
alias cd..='cdls ..'
alias cd,,='cdls ..'

# grep
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox,__pycache__,.objs,.ccls-cache,.clang-format,.clangd}'
alias pg='ps aux | grep'
alias lg='ls | grep'

# make/remove firs
alias mkdir='mkdir -p'
alias md='mkdir'
alias rd=rmdir

# vim
alias vim='nvim'
alias v='nvim'
alias vimdiff='v -d'
alias vd='v -d'

# Exiting from ranger keeps terminal in last location
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias r='ranger'

# Fancy highlight
alias ccat='highlight --out-format=ansi --force'

# Drop caches
alias memfree='free && sync && echo "echo 3 > /proc/sys/vm/drop_caches" | sudo sh && free'

# pacman/yay
alias y='yay'
alias p='pacman'

yay_update(){yay "$@" -Syu --devel --timeupdate --noconfirm --overwrite "*"; pkill -RTMIN+2 i3blocks}
alias yu='yay_update'

# Open with default apps
function open () { mimeopen "$@" 2>/dev/null }
alias o='open'

# dotfiles
alias config='git --git-dir=$HOME/.dotfiles/.git/ --work-tree=$HOME/'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
