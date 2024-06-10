#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./close_system_preferences_panes.sh
./delete_ds_store.sh
./files.sh
./fonts.sh

./displays.sh
./dock.sh
./finder.sh
./keyboard.sh
./language_and_region.sh
./mouse.sh
./screenshots.sh
./siri.sh
./spaces.sh # TO DO
./sound.sh
./trackpad.sh # TO DO
./ui_and_ux.sh
./wallpaper.sh
./window.sh

./brave.sh # TO DO
./safari.sh
./textedit.sh
./notes.sh
./terminal.sh
