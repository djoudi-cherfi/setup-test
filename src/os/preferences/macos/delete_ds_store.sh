#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "DS_Store"

# After configuring preferred view style, clear all `.DS_Store` files
# to ensure settings are applied for every directory
execute "find . -name '.DS_Store' -type f -delete" \
    "Delete all .ds_store files"
