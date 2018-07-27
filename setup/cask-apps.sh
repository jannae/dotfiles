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

# Install the ongoing list of mac apps that I'm into
brew cask install backblaze
brew cask install diffmerge
brew cask install firefox
brew cask install fliqlo
brew cask install google-chrome
brew cask install google-backup-and-sync
brew cask install istat-menus
# brew cask install java
brew cask install lastfm
brew cask install markdown-service-tools
brew cask install macdown
# brew cask install musicbrainz-picard
# brew cask install qlcolorcode
brew cask install qlimagesize
brew cask install qlmarkdown
brew cask install qlprettypatch
brew cask install qlstephen
brew cask install quicklook-csv
brew cask install quicklook-json
brew cask install sequel-pro
brew cask install slack
brew cask install sourcetree
brew cask install spotify
brew cask install sublime-text
# brew cask install suspicious-package
brew cask install telegram-desktop
brew cask install the-unarchiver
# brew cask install transmission
brew cask install virtualbox
brew cask install webpquicklook
# brew cask install xld

echo "installing fonts..."

# Install the ongoing list of mac fonts that I'm into
brew tap caskroom/fonts

brew cask install font-inconsolata
brew cask install font-input
brew cask install font-roboto
brew cask install font-source-code-pro


# Cleanup!
brew cask cleanup


###############################################################################
# Sublime Text Setup                                                          #
###############################################################################

# Download Sublime Text Package Manager
curl -o Package\ Control.sublime-package https://packagecontrol.io/Package%20Control.sublime-package

# Install Sublime Text Package Manager
cp -r Package\ Control.sublime-package ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package 2> /dev/null


###############################################################################
# TODO: Need some code for opening apps that require GUI config               #
#   Backblaze, iTunes, last.fm, Sublime                                       #
###############################################################################

open /usr/local/Caskroom/backblaze/latest/ #Backblaze\ Installer.app
