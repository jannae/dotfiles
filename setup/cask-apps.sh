#!/usr/bin/env bash

#####
##
##  Application Installer; using [Homebrew Cask](http://caskroom.io/)
##
##  Cask is an extension for Homebrew that allows you to automate the
##  installation of Mac Apps and Fonts.
##
#####

set -e

## Install it!
brew install caskroom/cask/brew-cask --appdir="/Applications"
brew tap caskroom/versions

# Install the ongoing list of mac apps that I'm into
apps=(
    adium
    backblaze
    betterzipql
    bittorrent-sync
    box-sync
    coda
    colloquy
    day-o
    diffmerge
    evernote
    firefox
    firefoxdeveloperedition
    fliqlo
    google-chrome
    google-drive
    intellij-idea
    iterm2
    java7
    lastpass
    lastfm
    markdown-service-tools
    mou
    musicbrainz-picard
    picasa
    qlcolorcode
    qlimagesize
    qlmarkdown
    qlprettypatch
    qlstephen
    quicklook-csv
    quicklook-json
    rescuetime
    sequel-pro
    shiori
    sourcetree
    spotify
    sublime-text3
    suspicious-package
    the-unarchiver
    transmission
    virtualbox
    webpquicklook
    xld

    # Hacker tools
    hex-fiend
    0xed
)

# Casks for apps I'm on the fence about:
# fence=(

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# Install the ongoing list of mac fonts that I'm into
brew tap caskroom/fonts

fonts=(
    font-inconsolata
    font-input
    font-roboto
    font-source-code-pro
)

echo "installing fonts..."
brew cask install --appdir="/Applications" ${fonts[@]}

# Cleanup!
brew cask cleanup

# TODO: Need some code for opening apps that require GUI config
#   Backblaze, iTunes, last.fm,
