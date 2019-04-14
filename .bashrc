#!/usr/bin/env bash

[ -n "$PS1" ] && source ~/.bash_profile;

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
