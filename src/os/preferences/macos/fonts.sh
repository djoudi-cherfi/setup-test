#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Fonts"

execute "cp -R "../fonts/Fura-Mono-Regular-Nerd-Font-Complete.otf" "${HOME}/Library/Fonts"" \
    "Install Font Fura Mono Nerd in ${HOME}/Library/Fonts"
