#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_symlinks() {

    declare -a files_to_symlink=(
        "shell/bashrc"
        "shell/bash_inputrc"
        "shell/bash_options"
        "shell/zshrc"
        "shell/zsh_inputrc"
        "shell/zsh_options"
        "shell/profile"

        "git/gitattributes"
        "git/gitconfig"
        "git/gitignore"

        "vim/vim"
        "vim/vimrc"
    )

    for file in "${files_to_symlink[@]}"; do
        local source_file="$(cd .. && pwd)/$file"
        local target_file="$HOME/.$(basename "$file")"

        # Check if the target file does not exist
        if [ ! -e "$target_file" ]; then
            ln -sf "$source_file" "$target_file"
            display_status "$?" "$source_file → $target_file"
        # Check if the existing target file points to the same source file.
        elif [ "$(readlink "$target_file")" == "$source_file" ]; then
            display_status "$?" "$source_file → $target_file"
        # Check if the target file already exists
        else
            if confirm_ask "\n'$target_file' already exists, do you want to overwrite it?"; then
                rm -rf "$target_file"
                ln -sf "$source_file" "$target_file"
                display_status "$?" "$source_file → $target_file"
            else
                display_status "$?" "$source_file → $target_file"
            fi
        fi
    done
}

echo -e "\n• Create symbolic links"

create_symlinks
