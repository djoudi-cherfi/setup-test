#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

APP_STORE_FILE="${APP_STORE_FILE:-apps}"
APPLESCRIPT_FILE="${APPLESCRIPT_FILE:-download_app.applescript}"

download_app_store() {

    local app_id="$@"
    
    osascript "$APPLESCRIPT_FILE" "$app_id" &>/dev/null

    return $?
}

install_app() {

    local app_name
    local formatted_app_name

    while IFS= read -r line; do
    
        app_name=$(echo "$line" | sed -n 's/^"\([^"]*\)".*/\1/p')
        app_id=$(echo "$line" | sed -n 's/.*id: \([0-9]*\).*/\1/p')

        if [ ! -d "/Applications/$app_name.app" ]; then
            execute "download_app_store \"${app_id}\"" "Installation of $app_name in /Applications."
        else
            display_status 0 "Application $app_name found in /Applications."
        fi

    done < "$APP_STORE_FILE"
}

echo -e "\n• Install applications from app store"

install_app
