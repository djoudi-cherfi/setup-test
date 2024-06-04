#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_gitconfig_local() {

    declare -r FILE_PATH="$HOME/.gitconfig.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ] || [ -z "$FILE_PATH" ]; then
        echo -e \
"\n[commit]
    # Sign commits using GPG.
    # https://help.github.com/articles/signing-commits-using-gpg/

    # gpgsign = true

[user]
    name =
    email =" >> "$FILE_PATH"
    fi

    print_result "$?" "$FILE_PATH"
}

create_vimrc_local() {

    declare -r FILE_PATH="$HOME/.vimrc.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ]; then
        echo "" >> "$FILE_PATH"
    fi

    print_result "$?" "$FILE_PATH"
}

create_hushlogin() {

    declare -r FILE_PATH="$HOME/.hushlogin"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ]; then
        echo "" >> "$FILE_PATH"
    fi

    print_result "$?" "$FILE_PATH"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_title "Create local config files"

create_gitconfig_local
create_vimrc_local
create_hushlogin
