#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

update_content() {

    ssh -T git@github.com &> /dev/null

    if [ $? -ne 1 ]; then
        ./set_github_ssh_key.sh || return 1
    fi

    if confirm_ask "Do you want to update the content from the 'dotfiles' directory?"; then

        git fetch --all 1> /dev/null \
            && git reset --hard origin/main 1> /dev/null \
            && git checkout main &> /dev/null \
            && git clean -fd 1> /dev/null

        print_result $? "Update the content from the 'dotfiles' directory"

    fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_title "Update content"

update_content
