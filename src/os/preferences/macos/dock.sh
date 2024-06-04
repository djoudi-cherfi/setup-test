#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Dock"

touch "/tmp/output"

execute "./dock.applescript" "Run dock.applescript"

OUTPUT_FILE="/tmp/output"

while IFS='=' read -r key value; do
    
    case "$key" in
        sizeIcon)
            print_result "$value" "size icon"
            ;;
        automaticallyHideShowDock)
            print_result "$value" "Automatically hide show dock"
            ;;
        enlargementIcon)
            print_result "$value" "Enlargement icon"
            ;;
        ShowSuggestedAndRecentAppsInTheDock)
            print_result "$value" "Show suggested and recent apps in the dock"
            ;;
        ShowItemsOnTheDesktop)
            print_result "$value" "Show items on the desktop"
            ;;
        defaultWebBrowser)
            print_result "$value" "Default web browser"
            ;;
        *)
            echo "Unknown key: $key"
            ;;
    esac

done < "$OUTPUT_FILE"

rm -rf ""/tmp/output""
