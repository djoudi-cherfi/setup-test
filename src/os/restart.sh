#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ask_to_restart() {

    if confirm_ask "Do you want to restart?"; then
        sudo shutdown -r now &> /dev/null
    else
        print_result 1 "Restart canceled."
    fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_title "Restart"

ask_to_restart
