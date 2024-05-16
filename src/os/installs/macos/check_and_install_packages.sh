#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_package() {

    local package_type="$1"
    local package_name="$2"

    case "$package_type" in
        "tap")
            brew tap "$package_name" ;;
        "brew")
            brew install "$package_name" ;;
        "cask")
            brew install --cask "$package_name" ;;
        "mas")
            id=$(echo "$package_name" | awk '{print $(NF-1)}' | cut -d ',' -f1)
            mas install "$id" ;;
    esac
}

check_and_install_packages() {
    
    local file="$1"

    if [ ! -f "$file" ]; then
        display_status 1 "$file not found..."
        exit 1
    else
        display_status 0 "Running $file found..."
    fi

    while IFS= read -r line; do
        if [[ $line == "tap "* ]]; then
            element=$(echo "$line" | sed 's/tap "//;s/"$//')
            brew tap | grep -q "^$element$" && status=0 || status=1
            display_status "$status" "$element"
            if [ "$status" -ne 0 ]; then
                install_package "tap" "$element"
            fi

        elif [[ $line == "brew "* ]]; then
            element=$(echo "$line" | sed 's/brew "//;s/"$//')
            brew list --formula | grep -q "^$element$" && status=0 || status=1
            display_status "$status" "$element"
            if [ "$status" -ne 0 ]; then
                install_package "brew" "$element"
            fi

        elif [[ $line == "cask "* ]]; then
            element=$(echo "$line" | sed 's/cask "//;s/"$//')
            brew list --cask | grep -q "^$element$" && status=0 || status=1
            display_status "$status" "$element"
            if [ "$status" -ne 0 ]; then
                install_package "cask" "$element"
            fi
            
        elif [[ $line == "mas "* ]]; then
            id=$(echo "$line" | awk '{print $(NF-1)}' | cut -d ',' -f1)
            element=$(mas list | grep "$id" | awk '{$1=$2=""; print $0}' | xargs)
            [ -n "$element" ] && status=0 || status=1
            display_status "$status" "$element"
            if [ "$status" -ne 0 ]; then
                install_package "mas" "$line"
            fi
        fi
    done < "$file"
}

check_and_install_packages "Brewfile"

