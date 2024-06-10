#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

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

    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for file in "${files_to_symlink[@]}"; do

        local source_file="$(cd .. && pwd)/$file"
        local target_file="$HOME/.$(basename "$file")"

        # Check if the target file does not exist
        if [ ! -e "$target_file" ] || $skipQuestions; then
            execute "ln -sf $source_file $target_file" "$source_file → $target_file"
            
        # Check if the existing target file points to the same source file.
        elif [ "$(readlink "$target_file")" == "$source_file" ]; then
            print_result "$?" "$source_file → $target_file"

        # Check if the target file already exists
        else
            if ! $skipQuestions; then
                if confirm_ask "\n'$target_file' already exists, do you want to overwrite it?"; then
                    rm -rf "$target_file"
                    execute "ln -sf $source_file $target_file" "$source_file → $target_file"
                else
                    print_result "$?" "$source_file → $target_file"
                fi
            fi
        fi
    done
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_title "Create symbolic links"

create_symlinks
