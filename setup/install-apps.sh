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
    appcleaner
    backblaze
    bittorrent-sync
    box-sync
    brackets
    chromium
    coda
    colloquy
    dash
    day-o
    diffmerge
    evernote
    firefox
    firefoxdeveloperedition
    fliqlo
    fluid
    google-chrome
    google-drive
    intellij-idea
    iterm2
    java7
    lastpass
    lastfm
    livereload
    markdown-service-tools
    mou
    musicbrainz-picard
    picasa
    qlmarkdown
    qlstephen
    quicklook-json
    rescuetime
    sequel-pro
    shiori
    sourcetree
    spotify
    sublime-text3
    the-unarchiver
    transmission
    transmit
    virtualbox
    xld
)

# Old things
# adium genymotion

# Casks for apps I'm on the fence about:
# fence=( adium

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

# TODO: Need some code for opening apps that require config
#   Backblaze, iTunes, last.fm,
