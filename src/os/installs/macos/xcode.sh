#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

is_xcode_installed() {
    
    xcode-select -p &> /dev/null
}

is_command_line_tools_installed() {
    
    xcode-select --install 2>&1 | grep -q "already installed"
}

wait_for_installation() {

    local check_function=$1
    local name=$2

    until $check_function; do
        echo "Waiting for the installation of $name..."
        sleep 5
    done
}

ask_install_xcode() {

    confirm_ask "\nXcode is not installed. Do you want to install it now?"

    if [ "$?" -eq 0 ]; then
        open "macappstore://itunes.apple.com/app/id497799835"
        display_status "$?" "Opening the App Store to install Xcode..."

        # Wait for the installation to complete
        wait_for_installation is_xcode_installed "Xcode"
        display_status "$?" "Xcode has been installed."
        return 0

    else
        display_status 1 "Installation of Xcode canceled."
        return 1
    fi
}

ask_install_command_line_tools() {
    
    confirm_ask "\nXcode Command Line Tools are not installed. Do you want to install them now?"
    
    if [ "$?" -eq 0 ]; then
        xcode-select --install
        display_status "$?" "Installing Xcode Command Line Tools..."

        # Wait for the installation to complete
        wait_for_installation is_command_line_tools_installed "Xcode Command Line Tools"
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
