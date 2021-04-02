#!/bin/zsh

# Reverse menu on tab
bindkey '^[[Z' reverse-menu-complete

# fzf
bindkey '^R' fzf-history-widget

# autosuggest
bindkey '^l' autosuggest-accept
bindkey '^k' autosuggest-toggle
bindkey '^h' autosuggest-clear
bindkey '^j' autosuggest-execute

# ctrl+right/left
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
