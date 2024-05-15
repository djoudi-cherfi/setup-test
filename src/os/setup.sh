#!/usr/bin/env bash

echo -e "download and run the setup file\n"

declare -r GITHUB_REPOSITORY="djoudi-cherfi/setup-test"

declare -r DOTFILES_ORIGIN="git@github.com:$GITHUB_REPOSITORY.git"
declare -r DOTFILES_TARBALL_URL="https://github.com/$GITHUB_REPOSITORY/tarball/main"
declare -r DOTFILES_UTILS_URL="https://raw.githubusercontent.com/$GITHUB_REPOSITORY/main/src/os/utils.sh"

declare default_dotfiles_directory="$HOME/projects/dotfiles"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

download() {

    local url="$1"
    local output="$2"

    if command -v "curl" &> /dev/null; then

        curl --location --silent --show-error --output "$output" "$url" &> /dev/null
        return $?

    elif command -v "wget" &> /dev/null; then

        wget --quiet --output-document="$output" "$url" &> /dev/null
        return $?
    fi

    return 1
}

download_utils() {

    local tmpFile=""

    tmpFile="$(mktemp /tmp/XXXXX)"

    download "$DOTFILES_UTILS_URL" "$tmpFile" \
        && . "$tmpFile" \
        && rm -rf "$tmpFile" \
        && return 0

   return 1
}

check_supported_os_version() {

    local os_name="$(get_os_name)"
    local os_version_default="$(get_os_version)"

    case "$os_name" in
        "macos")
            local -r minimum_version="10.15"
            ;;
        "ubuntu")
            local -r minimum_version="20.04"
            ;;
        *)
            display_status 1 "Sorry, this script is intended only for macOS and Ubuntu!"
            exit 1
            ;;
    esac

    if compare_versions "$os_version_default" "$minimum_version"; then
        display_status 1 "Sorry, this script is intended only for $os_name $minimum_version and newer."
        exit 1
    else
        display_status 0 "OS version is supported."
    fi
}

extract() {

    local archive="$1"
    local outputDir="$2"

    if command -v "tar" &> /dev/null; then

        tar --extract --gzip --file "$archive" --strip-components 1 --directory "$outputDir"
        return $?
    fi

    return 1
}

download_dotfiles() {

    local tmpFile=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    echo "• Download and extract archive"

    tmpFile="$(mktemp /tmp/XXXXX)"

    download "$DOTFILES_TARBALL_URL" "$tmpFile"
    display_status $? "Download archive"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    confirm_ask "\nDo you want to store the dotfiles in '$default_dotfiles_directory'?"

    if [ "$?" == 1 ]; then
        ask_another_location "\nPlease specify another location for the configuration files (path):"
        # Expand the tilde
        default_dotfiles_directory=$(eval echo "$(get_answer)")
    fi

    # Check if the directory exists
    while [ -d "$default_dotfiles_directory" ]; do
        confirm_ask "\n'$default_dotfiles_directory' already exists, do you want to overwrite it?"
        
        if [ "$?" == 1 ]; then
            ask_another_location "\nPlease specify another location for the configuration files (path):"
            # Expand the tilde
            default_dotfiles_directory=$(eval echo "$(get_answer)")
        else
            rm -rf "$default_dotfiles_directory"
            break
        fi
    done

    mkdir -p "$default_dotfiles_directory"
    display_status $? "Create '$default_dotfiles_directory'"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Extract archive in the `dotfiles` directory.

    extract "$tmpFile" "$default_dotfiles_directory"
    display_status $? "Extract archive"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    rm -rf "$tmpFile"
    display_status $? "Remove archive"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    cd "$default_dotfiles_directory/src/os" || return 1
}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {

    # Ensure that the following actions
    # are made relative to this file's path.

    cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Load utils

    if [ -x "utils.sh" ]; then
        . "utils.sh" || exit 1
    else
        download_utils || exit 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ask_for_sudo

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Checks that the operating system is supported
    # and higher than the required version.

    check_supported_os_version

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if this script was run directly (./<path>/setup.sh),
    # and if not, it most likely means that the dotfiles were not
    # yet set up, and they will need to be downloaded.

    echo "${BASH_SOURCE[0]}" | grep "setup.sh" &> /dev/null \
    || download_dotfiles
    
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ./create_symbolic_links.sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ./create_local_config_files.sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ./installs/main.sh
    
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
}

main "$@"
