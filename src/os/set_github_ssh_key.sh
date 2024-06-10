#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

generate_ssh_keys() {

    ask "Please provide an email address: " && echo
    ssh-keygen -t ed25519 -C "$(get_answer)" -f "$1"

    print_result $? "Generate SSH keys"
}

add_ssh_configs() {

    echo "Host github.com" \
         "  IdentityFile $1" \
         "  LogLevel ERROR" >> ~/.ssh/config

    print_result $? "Add SSH configs"
}

copy_public_ssh_key_to_clipboard () {

    if cmd_exists "pbcopy"; then

        pbcopy < "$1"
        print_result $? "Copy public SSH key to clipboard"

    elif cmd_exists "xclip"; then

        xclip -selection clip < "$1"
        print_result $? "Copy public SSH key to clipboard"

    else
        print_warning "Please copy the public SSH key ($1) to clipboard"
    fi
}

open_github_ssh_page() {

    declare -r GITHUB_SSH_URL="https://github.com/settings/ssh"

    # The order of the following checks matters
    # as on Ubuntu there is also a utility called `open`.

    if cmd_exists "xdg-open"; then
        xdg-open "$GITHUB_SSH_URL"
    elif cmd_exists "open"; then
        open "$GITHUB_SSH_URL"
    else
        print_warning "Please add the public SSH key to GitHub ($GITHUB_SSH_URL)"
    fi
}

test_ssh_connection() {

    while true; do

        ssh -T git@github.com &> /dev/null

        [ $? -eq 1 ] && break
        sleep 5

    done
}

set_github_ssh_key() {

    local sshKeyFileName="$HOME/.ssh/github_ed25519"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # If there is already a file with that
    # name, generate another, unique, file name.

    if [ -f "$sshKeyFileName" ]; then
        sshKeyFileName="$(mktemp -u "$HOME/.ssh/github_ed25519_XXXXX")"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    generate_ssh_keys "$sshKeyFileName"
    add_ssh_configs "$sshKeyFileName"
    copy_public_ssh_key_to_clipboard "${sshKeyFileName}.pub"
    open_github_ssh_page
    test_ssh_connection && rm "${sshKeyFileName}.pub"

    print_result $? "Set up GitHub SSH keys"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Set up GitHub SSH keys"

set_github_ssh_key
