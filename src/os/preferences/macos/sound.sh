#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Sound"

touch "/tmp/output"

execute "./sound.applescript" "Run sound.applescript"

OUTPUT_FILE="/tmp/output"

while IFS='=' read -r key value; do
    
    case "$key" in
        makeAsoundAtStartup)
            print_result "$value" "Make a sound at startup"
            ;;
        playAsoundWhenTheVolumeIsChanged)
            print_result "$value" "Play a sound when the volume is changed"
            ;;
        *)
            echo "Unknown key: $key"
            ;;
    esac

done < "$OUTPUT_FILE"

rm -rf ""/tmp/output""
