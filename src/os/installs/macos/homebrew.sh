#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

is_homebrew_installed() {
    command -v brew &> /dev/null
}

is_homebrew_updated() {
    brew update &> /dev/null
}

is_homebrew_upgraded() {
    brew upgrade &> /dev/null
}

ask_install_homebrew() {
    
    if confirm_ask "\nHomebrew is not installed. Do you want to install it now?"; then
        execute "/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"" "Installing Homebrew..."
        execute is_homebrew_installed "Homebrew has been installed."
        return 0
    else
        display_status 1 "Installation of Homebrew canceled."
        return 1
    fi
}

ask_update_upgrade_homebrew() {

    if confirm_ask "\nDo you want to update and upgrade it now?"; then
        execute is_homebrew_updated "Homebrew has been updated."
        execute is_homebrew_upgraded "Homebrew has been upgraded."
        return 0
    else
        display_status 1 "Update and upgrade of Homebrew canceled."
        return 1
    fi
}

install_homebrew() {

    if is_homebrew_installed; then
        display_status 0 "Homebrew is already installed."
    else
        ask_install_homebrew || return 1
    fi
    
    ask_update_upgrade_homebrew
}

echo -e "\n• Install homebrew"

install_homebrew
