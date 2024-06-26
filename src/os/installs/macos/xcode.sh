#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

is_xcode_installed() {
    cmd_exists xcode-select
}

is_command_line_tools_installed() {
    xcode-select --install 2>&1 | grep -q "already installed"
}

ask_install_xcode() {
    
    if confirm_ask "\nXcode is not installed. Do you want to install it now?"; then
        execute "open "macappstore://itunes.apple.com/app/id497799835"" "Opening the App Store to install Xcode..."
        execute is_xcode_installed "Xcode has been installed."
    else
        print_result 1 "Installation of Xcode canceled."
    fi
}

ask_install_command_line_tools() {

    if confirm_ask "\nXcode Command Line Tools are not installed. Do you want to install them now?"; then
        execute "xcode-select --install" "Installing Xcode Command Line Tools..."
        execute is_command_line_tools_installed "Xcode Command Line Tools have been installed."
    else
        print_result 1 "Installation of Xcode Command Line Tools canceled."
    fi
}

install_command_line_tools() {

    if is_command_line_tools_installed; then
        print_result 0 "Xcode Command Line Tools are already installed."
    else
        ask_install_command_line_tools
    fi
}

install_xcode() {

    if is_xcode_installed; then
        print_result 0 "Xcode is already installed."
    else
        ask_install_xcode || return 1
    fi

    install_command_line_tools
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Install xcode"

install_xcode
