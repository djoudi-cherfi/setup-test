#!/usr/bin/env bash

# ----------------------------------------------------------------------
# | CMD                                                                |
# ----------------------------------------------------------------------

ask_for_sudo() {

    # Ask for the administrator password upfront.
    if sudo -v; then

    # Keep-alive
    # update existing `sudo` time stamp until `setup.sh` has finished
    while true; do
        sudo -n true
        sleep 60
        kill -0 "$$" || exit
    done 2>/dev/null &
        echo "Sudo credentials updated."
    else
        echo "Failed to obtain sudo credentials."
    fi
}

# ----------------------------------------------------------------------
# | OS                                                                 |
# ----------------------------------------------------------------------

get_os_name() {

    local kernel_name="$(uname -s)"
    
    case "$kernel_name" in
        Darwin) echo "macos" ;;
        Linux) echo "ubuntu" ;;
        *) echo "$kernel_name" ;;
    esac
}

get_os_version() {

    local os_name="$(get_os_name)"
    local os_version_default=""

    case "$os_name" in
        "macos") os_version_default="$(sw_vers -productVersion)" ;;
        "ubuntu") os_version_default="$(lsb_release -rs)" ;;
    esac

    echo "$os_version_default"
}

# ----------------------------------------------------------------------
# | CMD                                                                |
# ----------------------------------------------------------------------

compare_versions() {

    local version1=$1
    local version2=$2

    # Extract major, minor, and patch parts
    IFS='.' read -r major1 minor1 patch1 <<< "$version1"
    IFS='.' read -r major2 minor2 patch2 <<< "$version2"

    # Remove leading zeros
    major1=$(echo "$major1" | sed 's/^0*//')
    minor1=$(echo "$minor1" | sed 's/^0*//')
    patch1=$(echo "$patch1" | sed 's/^0*//')
    major2=$(echo "$major2" | sed 's/^0*//')
    minor2=$(echo "$minor2" | sed 's/^0*//')
    patch2=$(echo "$patch2" | sed 's/^0*//')

    # Initialize values if empty
    major1=${major1:-0}
    minor1=${minor1:-0}
    patch1=${patch1:-0}
    major2=${major2:-0}
    minor2=${minor2:-0}
    patch2=${patch2:-0}

    # Compare each part of the versions
    if (( major1 < major2 )); then
        return 0
    elif (( major1 > major2 )); then
        return 1
    fi

    if (( minor1 < minor2 )); then
        return 0
    elif (( minor1 > minor2 )); then
        return 1
    fi

    if (( patch1 < patch2 )); then
        return 0
    elif (( patch1 > patch2 )); then
        return 1
    fi

    return 1
}

wait_for() {

    local check_function="$1"
    local name="$2"
    
    until $check_function; do
        echo "Waiting for $name..."
        sleep 5
    done
}

# ----------------------------------------------------------------------
# | Status                                                             |
# ----------------------------------------------------------------------

display_status() {

    local status="$1"
    local message="$2"

    if [ "$status" -eq 0 ]; then
        echo "[✔] $message"
    else
        echo "[✖] $message"
    fi

    return "$status"
}

# ----------------------------------------------------------------------
# | Question / Answer                                                  |
# ----------------------------------------------------------------------

ask() {

    local prompt="$1"
    
    echo -e "$prompt"
    read -r -e REPLY
}

get_answer() {
    echo "$REPLY"
}

confirm_ask() {

    local prompt="$1"
    
    while true; do
        ask "$prompt (y/n)"

        case "$REPLY" in
            [yY]) return 0 ;;
            [nN]) return 1 ;;
            *) echo "Invalid response. Please respond with 'y' (yes) or 'n' (no)." ;;
        esac
    done
}

ask_another_location() {
    
    local prompt="$1"

    while true; do
        ask "$prompt"

        if [[ "$REPLY" =~ ^\~/[a-zA-Z]+ ]]; then
            break
        else
            echo "Invalid response."
            echo "- Enter a directory starting with '~/<path>'."
            echo "- Only use letters A-Z (lowercase or uppercase) after '~/'."
        fi
    done
}
