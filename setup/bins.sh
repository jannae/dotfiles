#!/usr/bin/env bash

##################################
### XCode Command Line Tools
#      thx https://github.com/alrra/dotfiles/blob/ff123ca9b9b/os/os_x/installs/install_xcode.sh

if ! xcode-select --print-path &> /dev/null; then

    # Prompt user to install the XCode Command Line Tools
    xcode-select --install &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path &> /dev/null; do
        sleep 5
    done

    print_result $? 'Install XCode Command Line Tools'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Point the `xcode-select` developer directory to
    # the appropriate directory from within `Xcode.app`
    # https://github.com/alrra/dotfiles/issues/13

    sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
    print_result $? 'Make "xcode-select" developer directory point to Xcode'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Prompt user to agree to the terms of the Xcode license
    # https://github.com/alrra/dotfiles/issues/10

    sudo xcodebuild -license
    print_result $? 'Agree with the XCode Command Line Tools licence'

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
brew upgrade

# GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

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
brew install brew-cask-completion

brew install wget

# RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
# brew install ringojs
# brew install narwhal

# more recent versions of some OS X tools
brew install vim --with-override-system-vi
brew install grep
brew install screen
# brew install tidy
# brew install homebrew/php/php56 --with-gmp

# The ongoing list of binaries that I'm into
brew install ack
brew install ag                  # Code-search similar to ack
brew install autoconf
brew install autoenv
brew install automake
brew install coreutils
brew install csshx
brew install diff-so-fancy
brew install dos2unix            # Handy Dandy for working with files across platforms
brew install duti
brew install faac
brew install ffmpeg
brew install flac
brew install flow                # for sublimelinter-flow / js static type checker <http://flowtype.org/>
brew install freetype
brew install fzf                 # Fuzzy finder written in Go
brew install gdbm
brew install gcc
brew install git
brew install git-lfs
brew install graphicsmagick
brew install grep
brew install gpg                 # GNU Privacy Guard: a free PGP replacement
brew install htop-osx
brew install hub
brew install imagemagick
brew install jpeg
brew install jq                  # handy dandy cmd line json processor
brew install lame
brew install libgpg-error
brew install libksba
brew install libpng
brew install libtool
brew install libvo-aacenc
brew install libyaml
brew install mackup
brew install mad
brew install mercurial
brew install mp3gain
brew install mtr                 # mtr - ping & traceroute. best.
brew install netpbm
brew install nmap
brew install node
brew install openssl
brew install pcre
brew install phpunit
brew install pidcat              # colored logcats
brew install pkg-config
brew install python
brew install python3
brew install readline
brew install rename
brew install sift                # sift is faster than grep, ack, or ag
brew install shellcheck          # Static analysis and lint tool, for (ba)sh scripts
brew install sox
brew install sqlite
brew install terminal-notifier
brew install testssl             # Tool which checks for the support of TLS/SSL ciphers and flaws
brew install thefuck
brew install tidy-html5          # tidy > tidy-html5 <https://github.com/Homebrew/homebrew/pull/39010>
brew install tig
brew install trash
brew install tree
brew install vbindiff            # Visual Binary Diff tool
brew install vcprompt
brew install vorbisgain
brew install webkit2png
brew install wifi-password
brew install x264
brew install xvid
brew install xz
brew install z

# echo "Installing my brew binaries..."
# brew install ${mybinaries[@]}

# Things with special configs or prerequisites fulfilled above
# brew install casperjs --devel

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

# configure locate
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist


##########################
#   PHP things
##########################

# # For [SublimeLinter-PHPCodeSniffer](https://github.com/SublimeLinter/SublimeLinter-phpcs)
# pear install PHP_CodeSniffer

# # For [SublimeLinter-phpmd](https://github.com/SublimeLinter/SublimeLinter-phpmd)
# pear channel-discover pear.phpmd.org
# pear channel-discover pear.pdepend.org
# pear install --alldeps phpmd/PHP_PMD


##########################
#   Python things
##########################

# things from this install:
pip install --upgrade setuptools
pip install --upgrade pip

# Some global packages I need
pip install virtualenv
pip install pylint
pip install python-nmap


##########################
#   NPM things
##########################

npm install -g diff-so-fancy
npm install -g git-open
npm install -g git-recent
npm install -g trash-cli
npm install -g npm-check


##########################
#   Ruby things
##########################

# Install rvm
\curl -sSL https://get.rvm.io | bash -s stable --ruby --ignore-dotfiles

# rvm install ruby-head
rvm install ruby-head; rvm use ruby-head --default

# test install
ruby -v; which ruby

mygems=(
    scss_lint
    bundler
    puppet-lint
)

echo "Installing my ruby gems..."
gem install ${mygems[@]}
