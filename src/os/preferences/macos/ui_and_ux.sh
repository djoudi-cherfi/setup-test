#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "UI & UX"

touch "/tmp/output"

execute "./ui_and_ux.applescript" "Run ui_and_ux.applescript"

OUTPUT_FILE="/tmp/output"

while IFS='=' read -r key value; do
    
    case "$key" in
        appearanceMode)
            print_result "$value" "Appearance mode"
            ;;
        accentColor)
            print_result "$value" "Accent color"
            ;;
        *)
            echo "Unknown key: $key"
            ;;
    esac

done < "$OUTPUT_FILE"

rm -rf ""/tmp/output""
