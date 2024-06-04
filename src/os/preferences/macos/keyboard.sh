#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Keyboard"

touch "/tmp/output"

execute "./keyboard.applescript" "Run keyboard.applescript"

OUTPUT_FILE="/tmp/output"

while IFS='=' read -r key value; do
    
    case "$key" in
        keyRepeatSpeed)
            print_result "$value" "Key repeat speed"
            ;;
        breakBeforeRehearsal)
            print_result "$value" "Break before rehearsal"
            ;;
        *)
            echo "Unknown key: $key"
            ;;
    esac

done < "$OUTPUT_FILE"

rm -rf ""/tmp/output""
