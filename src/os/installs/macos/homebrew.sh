#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

is_homebrew_installed() {
    cmd_exists brew
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
    else
        print_result 1 "Installation of Homebrew canceled."
    fi
}

ask_update_upgrade_homebrew() {

    if confirm_ask "\nDo you want to update and upgrade it now?"; then
        execute is_homebrew_updated "Homebrew has been updated."
        execute is_homebrew_upgraded "Homebrew has been upgraded."
    else
        print_result 1 "Update and upgrade of Homebrew canceled."
    fi
}

install_homebrew() {

    if is_homebrew_installed; then
        print_result 0 "Homebrew is already installed."
    else
        ask_install_homebrew || return 1
    fi
    
    ask_update_upgrade_homebrew
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Install homebrew"

install_homebrew
