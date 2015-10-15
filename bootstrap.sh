#!/usr/bin/env bash

# cd "$(dirname "${BASH_SOURCE}")";

# git pull origin master;

# Where I keep my configs, because Mackup.
syncdir="$HOME/Dropbox/Apps/Configs"

function doIt() {
    rsync -l --exclude "apps/" --exclude "setup/" --exclude ".git/" \
        --exclude ".gitignore" --exclude ".gitmodules" --exclude ".DS_Store" \
        --exclude "bootstrap.sh" --exclude ".editorconfig" \
        --exclude "README.md" -avh --no-perms . $syncdir;
    source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
