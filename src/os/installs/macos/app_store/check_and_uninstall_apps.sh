#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

APP_STORE_FILE="${APP_STORE_FILE:-apps}"
TRASH_DIR="${TRASH_DIR:-$HOME/.Trash}"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

move_to_trash() {

    local search_path="$1"
    local app_name="$2"
    local formatted_app_name="$3"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Capture the results of find into an array variable
    IFS=$'\n' read -d '' -r -a files <<< "$(find "$search_path" -path "$TRASH_DIR"\* -prune -o \
        \( -name "$app_name" -o -name "$formatted_app_name" \) -print)"

    for file in "${files[@]}"; do

        # Remove existing file in Trash if it exists
        if [ -e "$TRASH_DIR/$(basename "$file")" ]; then
            rm -rf "$TRASH_DIR/$(basename "$file")"
        fi

        mv "$file" "$TRASH_DIR"
    done
}

uninstall_app() {
    
    local app_name
    local formatted_app_name

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    
    while IFS= read -r line; do
    
        app_name=$(echo "$line" | sed -n 's/^"\([^"]*\)".*/\1/p')
        formatted_app_name="$(echo "$app_name" | tr -d ' ')"

        if [ -d "/Applications/$app_name.app" ]; then
            execute "move_to_trash \"/Applications\" \"${app_name}.app\" \"\"" "Uninstallation of $app_name in /Applications."
            execute "move_to_trash \"/private\" \"*${app_name}*\" \"*${formatted_app_name}*\"" "Uninstallation of $app_name in /private."
            execute "move_to_trash \"$HOME\" \"*${app_name}*\" \"*${formatted_app_name}*\"" "Uninstallation of $formatted_app_name in $HOME."
        else
            print_result 1 "Application $app_name not found in /Applications."
        fi
    done < "$APP_STORE_FILE"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Uninstall applications from app store"

uninstall_app
