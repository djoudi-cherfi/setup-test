#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./close_system_preferences_panes.sh
./delete_ds_store.sh
./files.sh
./fonts.sh

./displays.sh # applescripte
./dock.sh # applescripte
./finder.sh # applescripte
./keyboard.sh # applescripte
./language_and_region.sh # applescripte
./mouse.sh # applescripte
./panels.sh
./screenshots.sh # defaults
./siri.sh # applescripte
# ./spaces.sh # applescripte To do
./sound.sh # applescripte
# ./trackpad.sh # applescripte To do
./ui_and_ux.sh # applescripte
./wallpaper.sh # applescripte
./window.sh # applescripte

# ./brave.sh # applescripte To do
./safari.sh # applescripte
./textedit.sh # applescripte
./notes.sh # applescripte
./terminal.sh # applescripte
