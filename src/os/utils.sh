#!/usr/bin/env bash

# ----------------------------------------------------------------------
# | CMD                                                                |
# ----------------------------------------------------------------------

ask_for_sudo() {

    # Ask for the administrator password upfront.
    
    sudo -v &> /dev/null

    # Update existing `sudo` time stamp
    # until this script has finished.

    while true; do
        sudo -n true
        sleep 60
        kill -0 "$$" || exit
    done &> /dev/null &
}

# ----------------------------------------------------------------------
# | OS                                                                 |
# ----------------------------------------------------------------------

get_os_name() {

    local os_name=""
    local kernel_name="$(uname -s)"

    if [ "$kernel_name" == "Darwin" ]; then
        os_name="macos"

    elif [ "$(expr substr $kernel_name 1 5)" == "Linux" ]; then
        os_name="ubuntu"

    else
        os_name="$kernel_name"
    fi

    echo "$os_name"
}

get_os_version() {

    local os_name="$(get_os_name)"
    local os_version_default=""

    if [ "$os_name" == "macos" ]; then
        os_version_default="$(sw_vers -productVersion)"
        
    elif [ "$os_name" == "ubuntu" ]; then
        os_version_default="$(lsb_release -rs)"
    fi

    echo "$os_version_default"
}

check_supported_os_version() {

    local os_name="$(get_os_name)"
    local os_version_default="$(get_os_version)"

    # Substring extraction
    local os_version=${os_version_default:0:2}

    local -r minimum_macos_version="10.10"
    local -r minimum_ubuntu_version="20.04"


    if [ "$os_name" == "macos" ]; then

        if [ "$(echo "$os_version >= $minimum_macos_version" | bc)" -eq 1 ]; then
            return 0
        else
            erro_message="Sorry, this script is intended only for $os_name $minimum_macos_version and +."
        fi

    elif [ "$os_name" == "ubuntu" ]; then
        
        if [ "$(echo "$os_version >= $minimum_ubuntu_version" | bc)" -eq 1 ]; then
            return 0
        else
            erro_message="Sorry, this script is intended only for $os_name $minimum_ubuntu_version and +."
        fi
        
    else
        erro_message="Sorry, this script is intended only for macos and ubuntu!"
    fi

    echo "$erro_message"
}

# ----------------------------------------------------------------------
# | Status                                                             |
# ----------------------------------------------------------------------

status() {

    if [ "$1" -eq 0 ]; then
        echo "[✔] $2"
    else
        echo "[✖] $2"
    fi

    return "$1"
}

# ----------------------------------------------------------------------
# | Question / Answer                                                  |
# ----------------------------------------------------------------------

ask() {
    echo "$1"
    read -r -e
}

get_answer() {
    echo "$REPLY"
}

confirm_ask() {

    while true; do
        ask "$1 (y/n)"

        case "$REPLY" in
            [yY])
                return 0
                ;;
            [nN])
                return 1
                ;;
            *)
                echo "Invalid:"
                echo "Please respond with 'y' (yes) or 'n' (no)."
                ;;
        esac
    done
}

ask_another_location() {

    while true; do
        ask "$1"

        if [[ "$REPLY" =~ ^\~/[a-zA-Z]+ ]]; then
            break
        else
            echo "Invalid:"
            echo "- Enter a directory starting with '~/<path>'."
            echo "- Only use letters A-Z (lowercase or uppercase) after '~/'."
        fi
    done
}
