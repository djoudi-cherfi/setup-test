#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

BREW_FILE="${BREW_FILE:-Brewfile}"

uninstall_package() {
    
    local package_type="$1"
    local package_name="$2"

    case "$package_type" in
        "tap")
            execute "brew untap $package_name" "brew untap $package_name" ;;
        "brew")
            execute "brew uninstall $package_name" "brew uninstall $package_name" ;;
        "cask")
            execute "brew uninstall --cask $package_name" "brew uninstall --cask $package_name" ;;
    esac
}

check_and_uninstall_packages() {

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
            if [ "$status" -eq 0 ]; then
                uninstall_package "tap" "$element"
            fi
        elif [[ $line == "brew "* ]]; then
            element=$(echo "$line" | sed 's/brew "//;s/"$//')
            brew list --formula | grep -q "^$element$" && status=0 || status=1
            if [ "$status" -eq 0 ]; then
                uninstall_package "brew" "$element"
            fi
        elif [[ $line == "cask "* ]]; then
            element=$(echo "$line" | sed 's/cask "//;s/"$//')
            brew list --cask | grep -q "^$element$" && status=0 || status=1
            if [ "$status" -eq 0 ]; then
                uninstall_package "cask" "$element"
            fi
        fi
    done < "$BREW_FILE"
}

echo -e "\n• Uninstall packages from homebrew"

check_and_uninstall_packages
