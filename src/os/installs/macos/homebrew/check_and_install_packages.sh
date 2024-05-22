#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

BREW_FILE="${BREW_FILE:-Brewfile}"

install_package() {
    
    local package_type="$1"
    local package_name="$2"

    case "$package_type" in
        "tap")
            execute "brew tap $package_name" "brew tap $package_name" ;;
        "brew")
            execute "brew install $package_name" "brew install $package_name" ;;
        "cask")
            execute "brew install --cask $package_name" "brew install --cask $package_name" ;;
    esac
}

check_and_install_packages() {

    if [ ! -f "$BREW_FILE" ]; then
        display_status 1 "$BREW_FILE not found..."
        exit 1
    else
        display_status 0 "Running $BREW_FILE found..."
    fi

    while IFS= read -r line; do
        
        if [[ $line == "tap "* ]]; then
            element=$(echo "$line" | sed 's/tap "//;s/"$//')
            brew tap | grep -q "^$element$" && status=0 || status=1
            if [ "$status" -ne 0 ]; then
                install_package "tap" "$element"
            fi
        elif [[ $line == "brew "* ]]; then
            element=$(echo "$line" | sed 's/brew "//;s/"$//')
            brew list --formula | grep -q "^$element$" && status=0 || status=1
            if [ "$status" -ne 0 ]; then
                install_package "brew" "$element"
            fi
        elif [[ $line == "cask "* ]]; then
            element=$(echo "$line" | sed 's/cask "//;s/"$//')
            brew list --cask | grep -q "^$element$" && status=0 || status=1
            if [ "$status" -ne 0 ]; then
                install_package "cask" "$element"
            fi
        fi
    done < "$BREW_FILE"
}

echo -e "\n• Install packages from homebrew"

check_and_install_packages
