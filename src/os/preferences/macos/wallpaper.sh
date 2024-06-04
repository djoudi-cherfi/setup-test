#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Wallpaper"

touch "/tmp/output"

execute "./wallpaper.applescript" "Run wallpaper.applescript"

OUTPUT_FILE="/tmp/output"

while IFS='=' read -r key value; do
    
    case "$key" in
        addApicture)
            print_result "$value" "Add a picture"
            ;;
        showOnAllSpaces)
            print_result "$value" "Show on all spaces"
            ;;
        *)
            echo "Unknown key: $key"
            ;;
    esac

done < "$OUTPUT_FILE"

rm -rf ""/tmp/output""
