#!/bin/bash

# Default Sublime Text Location
SUBLIME_PATH="/Applications"
# SUBLIME_PATH="/opt/homebrew-cask/Caskroom/sublime-text3/Build 3083"
SUBLIME_NAME="Sublime Text.app"
NEW_ICON_PATH="icons/Sublime Text.icns"

# The direction this script is running in
THIS_DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Replace the app icon (assumes default location, requires sudo)
sudo mv "$SUBLIME_PATH/$SUBLIME_NAME/Contents/Resources/Sublime Text.icns" "$SUBLIME_PATH/$SUBLIME_NAME/Contents/Resources/Sublime Text.icns.bak"
sudo cp "$THIS_DIR/$NEW_ICON_PATH" "$SUBLIME_PATH/$SUBLIME_NAME/Contents/Resources/Sublime Text.icns"
# sudo cp $THIS_DIR/Document\ Icons/*.icns "$SUBLIME_PATH/$SUBLIME_NAME/Contents/Resources/"

SUBLIME_COPY="Sublime Text COPY"

# Trickery to force icon replace
sudo cp -r "$SUBLIME_PATH/$SUBLIME_NAME" "$SUBLIME_PATH/$SUBLIME_COPY"
sudo rm -rf "$SUBLIME_PATH/$SUBLIME_NAME"
sudo mv "$SUBLIME_PATH/$SUBLIME_COPY" "$SUBLIME_PATH/$SUBLIME_NAME"

# Clear Mac's icon cache:
sudo find /private/var/folders/ -name com.apple.dock.iconcache -exec rm {} \;
