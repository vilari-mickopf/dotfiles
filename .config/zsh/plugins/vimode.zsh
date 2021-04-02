#!/bin/zsh

bindkey -v
bindkey -v '^?' backward-delete-char

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey '^a' _complete_menu
bindkey -M menuselect '^a' accept-and-infer-next-history
bindkey -M menuselect '/'  accept-and-infer-next-history
bindkey -M menuselect '^?' undo
bindkey -M menuselect ' ' accept-and-hold

bindkey -M menuselect '*' history-incremental-search-forward
bindkey -M menuselect '?' history-incremental-search-backward

zle-keymap-select () {
    [ $KEYMAP = vicmd ] && printf "\033[4 q" || printf "\033[2 q"
}

zle -N zle-keymap-select
zle-line-init () {
    zle -K viins
    printf "\033[2 q"
}
zle -N zle-line-init

export KEYTIMEOUT=1
