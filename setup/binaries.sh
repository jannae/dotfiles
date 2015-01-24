# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
fi

# Update homebrew recipes
brew update
brew tap homebrew/dupes

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
#   running `chsh`.
brew install bash
brew install bash-completion

# Install `wget` with IRI support.
brew install wget --with-iri

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
brew install ringojs
brew install narwhal

# Install more recent versions of some OS X tools
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen
brew install homebrew/dupes/tidy
brew install homebrew/php/php55 --with-gmp

$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# Install the ongoing list of binaries that I'm into
mybinaries=(
    mercurial
    git
    node
    python
    maven
    vcprompt
    tig
    imagemagick
    graphicsmagick
    webkit2png
    rename
    trash
    tree
    ack
    hub
    sox
    htop
    mackup
    vault-cli
    phantomjs
    slimerjs
    doxygen
)

echo "Installing my brew binaries..."
brew install ${mybinaries[@]}

# Things with special configs
brew install casperjs --devel

# Cleanup!
brew cleanup

# things from this install:
pip install --upgrade setuptools
pip install --upgrade pip

