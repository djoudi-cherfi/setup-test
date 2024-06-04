#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Projects"

execute "mkdir -p ~/Projects/{Personal,Work}" \
    "Creation of the projects folder and its personal and work subfolders"
