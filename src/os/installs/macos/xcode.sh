#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

is_xcode_installed() {
    command -v xcode-select &> /dev/null
}

is_command_line_tools_installed() {
    xcode-select --install 2>&1 | grep -q "already installed"
}

ask_install_xcode() {
    
    if confirm_ask "\nXcode is not installed. Do you want to install it now?"; then
        open "macappstore://itunes.apple.com/app/id497799835"
        display_status "$?" "Opening the App Store to install Xcode..."

        wait_for is_xcode_installed "the installation of Xcode"
        display_status "$?" "Xcode has been installed."
        return 0
    else
        display_status 1 "Installation of Xcode canceled."
        return 1
    fi
}

ask_install_command_line_tools() {
    
    if confirm_ask "\nXcode Command Line Tools are not installed. Do you want to install them now?"; then
        xcode-select --install
        display_status "$?" "Installing Xcode Command Line Tools..."

        wait_for is_command_line_tools_installed "the installation of Xcode Command Line Tools"
        display_status "$?" "Xcode Command Line Tools have been installed."
        return 0
    
    else
        display_status 1 "Installation of Xcode Command Line Tools canceled."
        return 1
    fi
}

install_command_line_tools() {

    if is_command_line_tools_installed; then
        display_status 0 "Xcode Command Line Tools are already installed."
    else
        ask_install_command_line_tools
    fi
}

install_xcode() {

    if is_xcode_installed; then
        display_status 0 "Xcode is already installed."
    else
        ask_install_xcode || return 1
    fi

    install_command_line_tools
}

install_xcode
