#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

APP_STORE_FILE="${APP_STORE_FILE:-apps}"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

download_app_store() {

    local app_id="$@"
    
    execute "osascript "./download_app.applescript" "$app_id"" \
        "Run download_app.applescript"

    return $?
}

install_app() {

    local app_name
    local formatted_app_name

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    while IFS= read -r line; do
    
        app_name=$(echo "$line" | sed -n 's/^"\([^"]*\)".*/\1/p')
        app_id=$(echo "$line" | sed -n 's/.*id: \([0-9]*\).*/\1/p')

        if [ ! -d "/Applications/$app_name.app" ]; then
            execute "download_app_store \"${app_id}\"" "Installation of $app_name in /Applications."
        else
            print_result 0 "Application $app_name found in /Applications."
        fi

    done < "$APP_STORE_FILE"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "nstall applications from app store"

install_app
