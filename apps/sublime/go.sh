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

# Install Sublime Text Package Manager settings
cp -r Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Package\ Control.sublime-settings 2> /dev/null
rwq()

# Install Sublime Text settings
cp -r Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings 2> /dev/null
rwq()