#!/usr/bin/env bash

##################################
### XCode Command Line Tools
#      thx  https://github.com/alrra/dotfiles/blob/c2da74cc333/os/os_x/install_applications.sh#L39

if [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; then
    xcode-select --install &> /dev/null
    # Wait until the XCode Command Line Tools are installed
    while [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; do
        sleep 5
    done
    xcode-select -p &> /dev/null
    if [ $? -eq 0 ]; then
        # Prompt user to agree to the terms of the Xcode license
        # https://github.com/alrra/dotfiles/issues/10
       sudo xcodebuild -license
   fi
fi
###
##################################

##########################
#   Homebrew
##########################

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
fi

# Update homebrew recipes
brew update
# Upgrade any already-installed formulae.
brew upgrade --all

# Tap some other kegs
brew tap homebrew/dupes
brew tap homebrew/versions

# GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Other useful utilities like `sponge`.
brew install moreutils

# GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
#   running `chsh`.
brew install bash
brew install bash-completion2

# `wget` with IRI support.
brew install wget --with-iri

# RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
brew install ringojs
brew install narwhal

# more recent versions of some OS X tools
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen
brew install homebrew/dupes/tidy
brew install homebrew/php/php55 --with-gmp

$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# The ongoing list of binaries that I'm into
mybinaries=(
    ack
    autoconf
    autoenv
    automake
    brew-cask
    composer
    coreutils
    csshx
    dark-mode
    doxygen
    duti
    faac
    ffmpeg
    flac
    freetype
    gdbm
    gcc
    git
    git-lfs
    gh                  # github util. imho better than hub
    graphicsmagick
    grep
    htop-osx
    hub
    imagemagick
    jpeg
    lame
    libgpg-error
    libksba
    libpng
    libtool
    libvo-aacenc
    libyaml
    mackup
    mad
    mercurial
    mp3gain
    mtr                 # mtr - ping & traceroute. best.
    mvnvm
    netpbm
    node
    openssl
    pcre
    phantomjs
    phpunit
    pidcat              # colored logcats
    pkg-config
    python
    readline
    rename
    sox
    sqlite
    terminal-notifier
    thefuck
    tidy-html5          # tidy > tidy-html5 <https://github.com/Homebrew/homebrew/pull/39010>
    tig
    trash
    tree
    vault-cli
    vcprompt
    vorbisgain
    webkit2png
    wifi-password
    x264
    xvid
    xz
    z
    zsh
)

echo "Installing my brew binaries..."
brew install ${mybinaries[@]}

# Things with special configs or prerequisites fulfilled above
brew install casperjs --devel

# allow mtr to run without sudo
mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//') #  e.g. `/Users/jannae/.homebrew/Cellar/mtr/0.86`
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr

### Other Things
# For [SublimeLinter-phplint](https://github.com/SublimeLinter/SublimeLinter-phplint)
brew install homebrew/php/phplint

# For [SublimeLinter-jsl](https://github.com/SublimeLinter/SublimeLinter-jsl)
brew install homebrew/binary/jsl

# Cleanup!
brew cleanup

##########################
#   Post Homebrew Things
##########################

# change to bash 4 (installed by homebrew)
BASHPATH=$(brew --prefix)/bin/bash
if [ $(cat /private/etc/shells | grep "$BASHPATH" | wc -l) -eq 0 ]; then
    sudo bash -c "echo $BASHPATH >> /private/etc/shells"
fi
chsh -s $BASHPATH # will set for current user only.
echo $BASH && echo $BASH_VERSION # should be 4.x not the old 3.2.X


##########################
#   PHP things
##########################

# For [SublimeLinter-PHPCodeSniffer](https://github.com/SublimeLinter/SublimeLinter-phpcs)
pear install PHP_CodeSniffer

# For [SublimeLinter-phpmd](https://github.com/SublimeLinter/SublimeLinter-phpmd)
pear channel-discover pear.phpmd.org
pear channel-discover pear.pdepend.org
pear install --alldeps phpmd/PHP_PMD


##########################
#   Python things
##########################

# things from this install:
pip install --upgrade setuptools
pip install --upgrade pip

# Some global packages I need
mypys=(
    virtualenv
    virtualenvwrapper
    pylint
)

echo "Installing my brew binaries..."
pip install ${mypys[@]}


##########################
#   Node things
##########################

mynpms=(
    git-open
)

echo "Installing my global npm packages..."
npm install -g ${mynpms[@]}

##########################
#   Ruby things
##########################

# Install rvm
\curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles

# rvm install ruby-head
rvm install 2.2; rvm use 2.2 --default

# test install
ruby -v; which ruby

mygems=(
    scss-lint
    bundler
)

echo "Installing my ruby gems..."
gem install ${mygems[@]}
