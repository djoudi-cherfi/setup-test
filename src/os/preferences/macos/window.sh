#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Window"


add_folder_to_window_sidebar() {
    local folderPath="$1"

    osascript "./window_sidebar.applescript" "$folderPath"
}

execute "add_folder_to_window_sidebar "$HOME/Library"" \
    "Add the user library to the sidebar"

execute "add_folder_to_window_sidebar "$HOME/Projects"" \
    "Add the projects to the sidebar"

execute "add_folder_to_window_sidebar "$HOME/Screenshots"" \
    "Add the Screenshots to the sidebar"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

window_open_folder() {

    local folder_path="$1"

    osascript "./window_open_folder.applescript" "$folder_path"
}

window_display_by_column() {

    osascript "./window_display_by_column.applescript"
}

window_presentation_by_column() {
    
    local folder_path="$1"

    OUTPUT_FILE="/tmp/output"

    touch "$OUTPUT_FILE"

    execute "window_open_folder $folder_path" \
        "Window open folder $folder_path"

    execute "window_display_by_column" \
        "window display by column"

    execute "./window_presentation_by_column.applescript" \
        "Run window_presentation_by_column.applescript"

    execute "./window_close_folder.applescript" \
        "Close folder window if it exists"

    while IFS='=' read -r key value; do
        
        case "$key" in
            alwaysPresentInColumns)
                print_result "$value" "Always present in columns"
                ;;
            navigateInColumnView)
                print_result "$value" "Navigate in column view"
                ;;
            groupBy)
                print_result "$value" "Group by"
                ;;
            sortBy)
                print_result "$value" "Sort by"
                ;;
            textSize)
                print_result "$value" "Text size"
                ;;
            showIcons)
                print_result "$value" "Show icons"
                ;;
            useAnOverviewAsIcon)
                print_result "$value" "Use an over view as icon"
                ;;
            showPreviewColumn)
                print_result "$value" "Show preview column"
                ;;
            showLibraryFolder)
                print_result "$value" "Show library folder"
                ;;
            *)
                echo "Unknown key: $key"
                ;;
        esac

    done < "$OUTPUT_FILE"

    rm -rf "$OUTPUT_FILE"
}

window_presentation_by_column "/Applications"
window_presentation_by_column "$HOME"
window_presentation_by_column "$HOME/Desktop"
window_presentation_by_column "$HOME/Documents"
window_presentation_by_column "$HOME/Downloads"
window_presentation_by_column "$HOME/Library"
window_presentation_by_column "$HOME/Movies"
window_presentation_by_column "$HOME/Music"
window_presentation_by_column "$HOME/Pictures"
window_presentation_by_column "$HOME/Public"
window_presentation_by_column "$HOME/VirtualBox\ VMs"
window_presentation_by_column "/tmp"
