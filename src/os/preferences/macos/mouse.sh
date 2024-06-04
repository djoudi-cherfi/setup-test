#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Mouse"

touch "/tmp/output"

execute "./mouse.applescript" "Run mouse.applescript"

OUTPUT_FILE="/tmp/output"

while IFS='=' read -r key value; do
    
    case "$key" in
        movementSpeed)
            print_result "$value" "Movement speed"
            ;;
        naturalScrolling)
            print_result "$value" "Natural scrolling"
            ;;
        doubleClickSpeed)
            print_result "$value" "Double-click speed"
            ;;
        scrollingSpeed)
            print_result "$value" "Scrolling speed"
            ;;
        *)
            echo "Unknown key: $key"
            ;;
    esac

done < "$OUTPUT_FILE"

rm -rf ""/tmp/output""
