#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Close system preferences panes"

# Close system preferences panes, to prevent them from overriding
# settings we’re about to change
execute "osascript -e 'tell application "System Preferences" to quit'" \
    "Close system preferences panes"
