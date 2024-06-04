#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Displays"

if confirm_ask "Do you want to auto arrange screens and resolutions?"; then
    execute "$(displayplacer "\
        id:54601C9F-E8FE-19CC-57B3-5BE1FFE0EF95 \
        res:2560x1440 color_depth:8 enabled:true scaling:on origin:(0,0) degree:0" \
        "id:27C8C49A-3237-99D6-A2CF-940319F6A7AE \
        res:2560x1440 hz:60 color_depth:8 enabled:true scaling:on origin:(2560,-70) degree:0" \
        "id:9CAED750-4AB5-A360-D326-A874D6282695 \
        res:2560x1440 hz:60 color_depth:8 enabled:true scaling:off origin:(-2560,0) degree:0")" \
    "Arrangement of screens and resolutions"
else
    print_result 1 "Auto arrange screens and resolutions canceled."
fi

touch "/tmp/output"

execute "./displays.applescript" "Run displays.applescript"

OUTPUT_FILE="/tmp/output"

while IFS='=' read -r key value; do
    
    case "$key" in
        brightness)
            print_result "$value" "Brightness"
            ;;
        adjustBrightnessAutomatically)
            print_result "$value" "Adjust brightness automatically"
            ;;
        *)
            echo "Unknown key: $key"
            ;;
    esac

done < "$OUTPUT_FILE"

rm -rf ""/tmp/output""
