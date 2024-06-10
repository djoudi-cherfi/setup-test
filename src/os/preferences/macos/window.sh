#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Window"

window_open_folder() {

    local folder_path="$1"

    ./window_open_folder.applescript "$folder_path"
}

window_close_folder() {

    ./window_close_folder.applescript
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

window_by_column() {

    ./window_by_column.applescript
}

window_presentation_options_by_column() {
    
    local folder_path="$1"

    OUTPUT_FILE="/tmp/output"

    touch "$OUTPUT_FILE"

    window_open_folder "$folder_path"

    window_by_column

    execute "./window_presentation_options_by_column.applescript" \
        "Shows presentation options by column: $folder_path"

    window_close_folder

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

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

window_add_to_the_sidebar() {

    local folder_path="$1"

    window_open_folder "$folder_path"

    execute "./window_add_to_the_sidebar.applescript" \
        "Add to the sidebar: $folder_path"
    
    window_close_folder
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

window_presentation_display_the_status_bar() {

    window_open_folder "$HOME/Desktop"

    execute "./window_presentation_display_the_status_bar.applescript" \
        "Display the status bar"
    
    window_close_folder
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

window_presentation_options_by_column "/Applications"
window_presentation_options_by_column "$HOME"
window_presentation_options_by_column "$HOME/Desktop"
window_presentation_options_by_column "$HOME/Documents"
window_presentation_options_by_column "$HOME/Downloads"
window_presentation_options_by_column "$HOME/Library"
window_presentation_options_by_column "$HOME/Movies"
window_presentation_options_by_column "$HOME/Music"
window_presentation_options_by_column "$HOME/Pictures"
window_presentation_options_by_column "$HOME/Public"
window_presentation_options_by_column "$HOME/VirtualBox\ VMs"
window_presentation_options_by_column "/tmp"

window_add_to_the_sidebar "$HOME/Library"
window_add_to_the_sidebar "$HOME/Projects"
window_add_to_the_sidebar "$HOME/Screenshots"

window_presentation_display_the_status_bar
