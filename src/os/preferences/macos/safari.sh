#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Safari"

touch "/tmp/output"

execute "./safari.applescript" "Run safari.applescript"

OUTPUT_FILE="/tmp/output"

while IFS='=' read -r key value; do
    
    case "$key" in
        generalTab)
            print_result "$value" "General tab"
            ;;
        homepage)
            print_result "$value" "Homepage"
            ;;
        automaticallyTrustFiles)
            print_result "$value" "Automatically open “trusted” files"
            ;;
        advancedTab)
            print_result "$value" "Advanced tab"
            ;;
        showFeaturesDevelopWeb)
            print_result "$value" "Show features for web developers"
            ;;
        *)
            echo "Unknown key: $key"
            ;;
    esac

done < "$OUTPUT_FILE"

rm -rf ""/tmp/output""
