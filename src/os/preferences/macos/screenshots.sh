#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Screenshots"

execute "mkdir -p "${HOME}/Screenshots"" \
    "Creation of the Screenshots folder"

execute "defaults write com.apple.screencapture "location" -string "${HOME}/Screenshots"" \
    "Move screen shots to ~/Screenshots"

# Other options: BMP, GIF, JPG, PDF, TIFF
execute "defaults write com.apple.screencapture type -string "png"" \
    "Save screenshots in PNG format"

execute "defaults write com.apple.screencapture "disable-shadow" -bool "true"" \
    "Remove the shadow"
