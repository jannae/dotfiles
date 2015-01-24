# Jannae's Dotfiles

This is for my personal machines, and I tend to make things up (and break them) as I go along. Fair warning.

Now, after years of cherry-picking adding/removing tools and tweaks from my worflow, I finally see the value in open-sourcing and version controlling these files. So come in and critique my computer's underwear. It's for the best.

## Set Up Files.

These run once, first thing, on a clean machine. I keep them maintained as I add/remove.

Set up Homebrew and add favorite binaries:

    ./setup/brew.sh

Set up [Homebrew Cask](http://caskroom.io/) and install favorite Apps:

    ./setup/brew-cask.sh




if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi


## License

The MIT license.

Copyright (c) 2014 Jannae Jacks (<http://jann.ae/>)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

