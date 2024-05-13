#!/usr/bin/env bash

declare -a source_files=(
    "shell/common/ui/colors"
    "shell/common/ui/neofetch"
    "shell/common/ux/autocompletion"
    "shell/common/ux/autojump"
    "shell/common/ux/autosuggestions"
    "shell/common/ux/fzf"
    "shell/common/ux/syntax_highlighting"
    "shell/common/aliases"
    "shell/common/exports"
    "shell/common/functions"
    "shell/common/init"
    "shell/common/prompt"
    "shell/common/curlrc"
    "shell/common/logout"

    "shell/macos/ui/colors"
    "shell/macos/ui/neofetch"
    "shell/macos/ux/autocompletion"
    "shell/macos/ux/autojump"
    "shell/macos/ux/autosuggestions"
    "shell/macos/ux/fzf"
    "shell/macos/ux/syntax_highlighting"
    "shell/macos/aliases"
    "shell/macos/exports"
    "shell/macos/functions"
    "shell/macos/init"
    "shell/macos/prompt"

    "shell/ubuntu/ui/colors"
    "shell/ubuntu/ui/neofetch"
    "shell/ubuntu/ux/autocompletion"
    "shell/ubuntu/ux/autojump"
    "shell/ubuntu/ux/autosuggestions"
    "shell/ubuntu/ux/fzf"
    "shell/ubuntu/ux/syntax_highlighting"
    "shell/ubuntu/aliases"
    "shell/ubuntu/exports"
    "shell/ubuntu/functions"
    "shell/ubuntu/init"
    "shell/ubuntu/prompt"

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

if [ ! -d "$HOME/projects/dotfiles" ]; then
    mkdir -p "$HOME/projects/dotfiles/src/shell/common/ui" \
    "$HOME/projects/dotfiles/src/shell/common/ux" \
    "$HOME/projects/dotfiles/src/shell/macos/ui" \
    "$HOME/projects/dotfiles/src/shell/macos/ux" \
    "$HOME/projects/dotfiles/src/shell/ubuntu/ui" \
    "$HOME/projects/dotfiles/src/shell/ubuntu/ux" \
    "$HOME/projects/dotfiles/src/git" \
    "$HOME/projects/dotfiles/src/vim"
fi

for file in "${source_files[@]}"; do
    echo "" >> "$HOME/projects/dotfiles/src/$file"
done
