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
brew install bash-completion2

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
    ack
    autoconf
    autoenv
    automake
    brew-cask
    coreutils
    csshx
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
    maven30
    mercurial
    mp3gain
    netpbm
    node
    openssl
    pcre
    phantomjs
    pkg-config
    python
    readline
    rename
    sox
    sqlite
    tidy
    tig
    trash
    tree
    vault-cli
    vcprompt
    vorbisgain
    webkit2png
    x264
    xvid
    xz
    z
)

echo "Installing my brew binaries..."
brew install ${mybinaries[@]}

# Things with special configs or prerequisites fulfilled above
brew install casperjs --devel

### Other Things
# For [SublimeLinter-phplint](https://github.com/SublimeLinter/SublimeLinter-phplint)
brew install homebrew/php/phplint

# For [SublimeLinter-PHPCodeSniffer](https://github.com/SublimeLinter/SublimeLinter-phpcs)
pear install PHP_CodeSniffer

# For [SublimeLinter-phpmd](https://github.com/SublimeLinter/SublimeLinter-phpmd)
pear channel-discover pear.phpmd.org
pear channel-discover pear.pdepend.org
pear install --alldeps phpmd/PHP_PMD

# For [SublimeLinter-jsl](https://github.com/SublimeLinter/SublimeLinter-jsl)
brew install homebrew/binary/jsl

# Cleanup!
brew cleanup

# things from this install:
pip install --upgrade setuptools
pip install --upgrade pip

# Python things
pip install virtualenv virtualenvwrapper pylint
