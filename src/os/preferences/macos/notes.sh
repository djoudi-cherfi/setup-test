#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Notes"

touch "/tmp/output"

execute "./notes.applescript" "Run notes.applescript"

OUTPUT_FILE="/tmp/output"

while IFS='=' read -r key value; do
    
    case "$key" in
        sortNotesBy)
            print_result "$value" "Sort notesby"
            ;;
        newNotesStartWith)
            print_result "$value" "New notes start with"
            ;;
        defaultAccount)
            print_result "$value" "Default account"
            ;;
        groupNotesByDate)
            print_result "$value" "Group notes by date"
            ;;
        alwaysPickUpTheLastQuickNote)
            print_result "$value" "Always pick up the last quick note"
            ;;
        automaticallySortCompletedTasks)
            print_result "$value" "Automatically sort completed tasks"
            ;;
        allowMentionNotifications)
            print_result "$value" "Allow mention notifications"
            ;;
        enableOnMyMacAccount)
            print_result "$value" "Enable on my mac account"
            ;;
        defaultTextSize)
            print_result "$value" "Default text size"
            ;;
        useDarkBackgroundsForNotes)
            print_result "$value" "Use dark backgrounds for notes"
            ;;
        *)
            echo "Unknown key: $key"
            ;;
    esac

done < "$OUTPUT_FILE"

rm -rf ""/tmp/output""
