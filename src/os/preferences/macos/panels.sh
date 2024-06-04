#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Panels"

execute "defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true" \
    "Expand save panel by default"

execute "defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true" \
    "Expand save panel by default 2"

execute "defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true" \
    "Expand print panel by default"

execute "defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true" \
    "Expand print panel by default 2"

execute "defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true" \
    "Automatically quit printer app once the print jobs complete"
