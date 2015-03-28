###############################################################################
# Sublime Text Setup                                                          #
###############################################################################
#
# Reboot, wait, quit
function rwq() {
    open /Applications/Sublime\ Text.app;
    sleep 30;
    osascript -e 'quit app "Sublime Text"'
}

# Download Sublime Text Package Manager
curl -o Package\ Control.sublime-package https://packagecontrol.io/Package%20Control.sublime-package

# Install Sublime Text Package Manager
cp -r Package\ Control.sublime-package ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package 2> /dev/null
rwq()

# Link Sublime Text User Settings
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -s User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
rwq()

# setting up the sublime symlink (if not installed through cask)
# ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
