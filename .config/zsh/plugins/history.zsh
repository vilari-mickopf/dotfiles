#!/bin/zsh

# Record timestamp of command in HISTFILE
setopt extended_history

# Delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_expire_dups_first

# Ignore duplicated commands history list
setopt hist_ignore_dups
# setopt hist_find_no_dups

# Ignore commands that start with space
setopt hist_ignore_space

# Ignore functions
setopt hist_no_functions

# Show command with history expansion to user before running it
setopt hist_verify

# Immediately add history
setopt inc_append_history

export HISTFILE=$ZDOTDIR/.zsh_history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
