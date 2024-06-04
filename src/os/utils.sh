#!/usr/bin/env bash

# ----------------------------------------------------------------------
# | Colors                                                             |
# ----------------------------------------------------------------------

if command -v tput >/dev/null 2>&1; then
  bold=$(tput bold)
  reset=$(tput sgr0)
  red=$(tput setaf 1)
  green=$(tput setaf 2)
  yellow=$(tput setaf 3)
  purple=$(tput setaf 5)
else
  bold='\e[1m'
  reset='\e[0m'
  red='\e[31m'
  green='\e[32m'
  yellow='\e[33m'
  purple='\e[35m'
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_color() {
    echo -e "$2""$1" "$reset"
}

print_red() {
    print_color "$1" "$bold$red"
}

print_green() {
    print_color "$1" "$green"
}

print_yellow() {
    print_color "$1" "$yellow"
}

print_purple() {
    print_color "$1" "$bold$purple"
}

# ----------------------------------------------------------------------
# | Success - Error - Warning - Result                                 |
# ----------------------------------------------------------------------

print_success() {
    print_green " [+] $1"
}

print_error() {
    print_red " [x] $1"
}

print_warning() {
    print_yellow "\n [!] $1"
}

print_result() {

    local -r status="$1"
    local -r message="$2"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ "$status" -eq 0 ]; then
        print_success "$message"
    else
        print_error "$message"
    fi

    return "$status"
}

# ----------------------------------------------------------------------
# | Title - Subtitle                                                   |
# ----------------------------------------------------------------------

print_title() {
    print_purple "\n [•] $1"
}

print_subtitle() {
    print_purple "\n [-] $1"
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

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    
    while true; do
        ask "$prompt (y/n)"

        case "$REPLY" in
            [yY]) return 0 ;;
            [nN]) return 1 ;;
            *) echo "Invalid response. \
                Please respond with 'y' (yes) or 'n' (no)." ;;
        esac
    done
}

ask_another_location() {
    
    local prompt="$1"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    while true; do
        ask "$prompt"

        if [[ "$REPLY" =~ ^\~/[a-zA-Z]+ ]]; then
            break
        else
            echo "Invalid response."
            echo "- Enter a directory starting with '~/<path>'."
            echo "- Only use letters A-Z (lowercase \
                or uppercase) after '~/'."
        fi
    done
}

# ----------------------------------------------------------------------
# | Execute                                                            |
# ----------------------------------------------------------------------

error_stream() {

    while read -r line; do
        print_error "↳ ERROR: $line"
    done
}

kill_all_subprocesses() {

    local i=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in $(jobs -p); do
        kill "$i"
        wait "$i" &> /dev/null
    done
}

set_trap() {

    trap -p "$1" | grep "$2" &> /dev/null \
        || trap '$2' "$1"
}

show_spinner() {

    local -r pid="$1"
    local -r message="$2"
    local -r delay=0.1
    local -r spinstr='|/-\'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    while kill -0 "$pid" 2>/dev/null; do
        for ((i=0; i<${#spinstr}; i++)); do
            echo -ne " [${spinstr:$i:1}] $message"
            sleep "$delay"
            echo -ne "\033[0K\r"
        done
    done
}

execute() {

    local -r command="$1"
    local -r message="$2"
    local -r TMP_FILE="$(mktemp /tmp/XXXXX)"
    local command_pid=""
    local status_code=0

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # If the current process is ended,
    # also end all its subprocesses.
    set_trap "EXIT" "kill_all_subprocesses"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Run the command in the background
    eval "$command" \
        &> /dev/null \
        2> "$TMP_FILE" &
        
    command_pid=$!

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    show_spinner "$command_pid" "$message"

    # Wait for the command to finish
    wait "$command_pid" &> /dev/null
    status_code=$?

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Print output based on what happened.
    print_result "$status_code" "$message"

    if [ $status_code -ne 0 ]; then
        error_stream < "$TMP_FILE"
    fi

    rm -rf "$TMP_FILE"

    return $status_code
}

# ----------------------------------------------------------------------
# | OS                                                                 |
# ----------------------------------------------------------------------

get_os_name() {

    local kernel_name="$(uname -s)"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    
    case "$kernel_name" in
        Darwin) echo "macos" ;;
        Linux) echo "ubuntu" ;;
        *) echo "$kernel_name" ;;
    esac
}

get_os_version() {

    local os_name="$(get_os_name)"
    local os_version_default=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    case "$os_name" in
        "macos") os_version_default="$(sw_vers -productVersion)" ;;
        "ubuntu") os_version_default="$(lsb_release -rs)" ;;
    esac

    echo "$os_version_default"
}

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

compare_versions() {

    local version1=$1
    local version2=$2

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

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

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

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

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    
    until $check_function; do
        echo "Waiting for $name..."
        sleep 5
    done
}
