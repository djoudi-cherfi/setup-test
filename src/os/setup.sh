#!/usr/bin/env bash

echo "download and run the setup file"

declare -r GITHUB_REPOSITORY="djoudi-cherfi/setup-test"

declare -r DOTFILES_ORIGIN="git@github.com:$GITHUB_REPOSITORY.git"
declare -r DOTFILES_TARBALL_URL="https://github.com/$GITHUB_REPOSITORY/tarball/main"
declare -r DOTFILES_UTILS_URL="https://raw.githubusercontent.com/$GITHUB_REPOSITORY/main/src/os/utils.sh"

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

download_dotfiles() {

    local tmpFile=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    echo "• Download and extract archive"

    tmpFile="$(mktemp /tmp/XXXXX)"

    download "$DOTFILES_TARBALL_URL" "$tmpFile"
    print_result $? "Download archive"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # if ! $skipQuestions; then

    #     ask_for_confirmation "Do you want to store the dotfiles in '$default_dotfiles_directory'?"

    #     if ! answer_is_yes; then
    #         default_dotfiles_directory=""
    #         while [ -z "$default_dotfiles_directory" ]; do
    #             ask "Please specify another location for the dotfiles (path): "
    #             default_dotfiles_directory="$(get_answer)"
    #         done
    #     fi

    #     # Ensure the `dotfiles` directory is available

    #     while [ -e "$default_dotfiles_directory" ]; do
    #         ask_for_confirmation "'$default_dotfiles_directory' already exists, do you want to overwrite it?"
    #         if answer_is_yes; then
    #             rm -rf "$default_dotfiles_directory"
    #             break
    #         else
    #             default_dotfiles_directory=""
    #             while [ -z "$default_dotfiles_directory" ]; do
    #                 ask "Please specify another location for the dotfiles (path): "
    #                 default_dotfiles_directory="$(get_answer)"
    #             done
    #         fi
    #     done

    #     printf "\n"

    # else

    #     rm -rf "$default_dotfiles_directory" &> /dev/null

    # fi

    # mkdir -p "$default_dotfiles_directory"
    # print_result $? "Create '$default_dotfiles_directory'" "true"

    # # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # # Extract archive in the `dotfiles` directory.

    # extract "$tmpFile" "$default_dotfiles_directory"
    # print_result $? "Extract archive" "true"

    # # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # rm -rf "$tmpFile"
    # print_result $? "Remove archive"

    # # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # cd "$default_dotfiles_directory/src/os" \
    #     || return 1

}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {

    # Ensure that the following actions
    # are made relative to this file's path.

    cd "$(dirname "${BASH_SOURCE[0]}")" \
        || exit 1

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

    check_supported_os_version || exit 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if this script was run directly (./<path>/setup.sh),
    # and if not, it most likely means that the dotfiles were not
    # yet set up, and they will need to be downloaded.

    echo "${BASH_SOURCE[0]}" | grep "setup.sh" &> /dev/null \
    || download_dotfiles
}

main "$@"
