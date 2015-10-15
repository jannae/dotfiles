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

######################################
# Post Updots Things
######################################

# I wrote the below crappy little script to check to see if there are any
# files in my repo that I've forgotten to add to my mackup config files.
#
# It could maybe be better.

# Files in the sync directory we can ignore
ignore=(. .. .DS_Store .MacOSX Library )

# Files I know are already in my custom mackup config
localcfg=( bin .bash_prompt .dircolors .eslintrc .exports .extra .functions \
    .hushlogin .path .mackup .mackup.cfg )

# Files I know mackup is already accounting for
mackup=( .aws .aliases .bash_aliases .bash_login .bash_logout .bashrc \
    .profile .bash_profile .inputrc .chef .config .gemrc .gitconfig \
    .gitattributes .gitignore_global .gvimrc .hgrc .hgignore_global .htoprc \
    .i2csshrc .irssi .m2 .netrc .curlrc .pearrc .ssh .subversion .vim .vimrc \
    .zlogin .zprofile .zshrc .gnupg )

# ALL THE THINGS
allfiles=( "${ignore[@]}" "${localcfg[@]}" "${mackup[@]}" )

contains () {
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}

for f in $syncdir/*; do
    file=${f##*/}
    contains "$file" "${allfiles[@]}"
    test "$?" == 1 && (echo ${f##*/};)
done
