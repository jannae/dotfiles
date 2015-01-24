#####
##
##  Application Installer; using [Homebrew Cask](http://caskroom.io/)
##
##  Cask is an extension for Homebrew that allows you to automate the installation of Mac Apps and Fonts.
##
#####

set -e

## Install it!
brew install caskroom/cask/brew-cask --appdir="/Applications"
brew tap caskroom/versions

# Install the ongoing list of mac apps that I'm into
apps=(
    alfred
    appcleaner
    brackets
    box-sync
    coda
    dash
    day-o
    evernote
    firefox
    firefoxdeveloperedition
    fluid
    google-chrome
    google-drive
    intellij-idea
    iterm2
    java7
    lastfm
    livereload
    mamp
    markdown-service-tools
    mou
    musicbrainz-picard
    qlmarkdown
    qlstephen
    quicklook-json
    rescuetime
    sequel-pro
    shiori
    spotify
    sourcetree
    sublime-text3
    virtualbox
    the-unarchiver
    transmission
    transmit
    xld
)

# Install the ongoing list of mac fonts that I'm into
fonts=(
    font-inconsolata
    font-input
    font-roboto
    font-source-code-pro
)

# Old things
# adium genymotion

# Casks for apps I'm on the fence about:
# fence=( adium

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# Link up to alfred:
brew cask alfred link

# Cleanup!
brew cask cleanup