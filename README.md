# Jannae's Dotfiles

This is for my personal machines, and I tend to make things up (and break them) as I go along. Fair warning.

Now, after years of cherry-picking adding/removing tools and tweaks from my worflow, I finally see the value in open-sourcing and version controlling these files. So come in and critique my computer's underwear. It's for the best.

## First, the credit.

Bits and pieces come from all over. Special thanks to the major players, @mathiasbynens, @paulirish, @paulmillr, @s10wen, and @sindresorhus.

# DotBot

https://github.com/anishathalye/dotbot




# OLD DIRECTIONS will probably delete from here down

## Set Up Files.

These run once, first thing, on a clean machine. I keep them maintained as I add/remove.

Set up Homebrew and add favorite binaries:

    ./setup/bins.sh

Set up [Homebrew Cask](http://caskroom.io/) and install favorite Apps:

    ./setup/cask-apps.sh

Set up OSX. Almost entirely stolen from [@mathiasbynens](https://github.com/mathiasbynens) famous [.osx](https://github.com/mathiasbynens/dotfiles/blob/master/.osx).

    ./setup/osx.sh

Now there are two ways of doing dotfiles. I am a giant fan of [Mackup](https://github.com/lra/mackup), so I use that. There is also a `bootstrap.sh` file if you do not use/want to use mackup.

### Mackup

Definitely read the docs if you have never used this before. I **highly** recommend it if you use multiple machines and enjoy being able to find things where you last left them.

    cp -r .mackup* ~/
    mackup restore

You'll be prompted for file replacements, I just type Yes a bunch. You may be more cautious than I am.

### Not Mackup

I haven't done this in awhile, but the idea is that you simply run `bootstrap.sh` to copy all the dotfiles in this repo to their appropriate locations. You probably want to vet that file before you use it, since I've been on mackup so long. But once upon a time, it worked great.


## Some Notes:

What are inside these directories?!

### `~/bin`

One-off binaries that aren't available via a friendly/package management means.
* [git-friendly](https://github.com/jamiew/git-friendly)
* [git-overwritten](https://github.com/mislav/dotfiles/blob/master/bin/git-overwritten)
* [httpcompression](https://github.com/mathiasbynens/dotfiles/blob/master/bin/httpcompression)

### `/setup`

This is the home of the initial configuration setup files, and also includes various attempts I have made over the years to script the automation of making certain application setting changes. YMMV.

As always I preach, OPEN THE FILE AND READ THE CODE before you blindly run someone else's shell file on your machine. :D

## License

The MIT license.

Copyright (c) 2014 Jannae Jacks (<http://jann.ae/>)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

