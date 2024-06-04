#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Finder"

finder_settings() {

    OUTPUT_FILE="/tmp/output"

    touch "$OUTPUT_FILE"

    execute "./finder_settings.applescript" "Run finder_settings.applescript"

    while IFS='=' read -r key value; do
        
        case "$key" in
            generalTab)
                print_result "$value" "General tab"
                ;;
            internalDisks)
                print_result "$value" "Internal disks"
                ;;
            externalDrives)
                print_result "$value" "External drives"
                ;;
            cdDvdAndIosDevices)
                print_result "$value" "CD DVD and IOS devices"
                ;;
            connectedServers)
                print_result "$value" "Connected servers"
                ;;
            newFinderwindowsDisplay)
                print_result "$value" "New finder windows display"
                ;;
            openFoldersInTabs)
                print_result "$value" "Open folders in tabs"
                ;;
            sidebarTab)
                print_result "$value" "Sidebar tab"
                ;;
            recentSidbar)
                print_result "$value" "Recent sidbar"
                ;;
            airDropSidbar)
                print_result "$value" "Airdrop sidbar"
                ;;
            applicationsSidbar)
                print_result "$value" "Applications sidbar"
                ;;
            desktopSidbar)
                print_result "$value" "Desktop sidbar"
                ;;
            documentsSidbar)
                print_result "$value" "Documents sidbar"
                ;;
            downloadsSidbar)
                print_result "$value" "Downloads sidbar"
                ;;
            videosSidbar)
                print_result "$value" "Videos sidbar"
                ;;
            musicSidbar)
                print_result "$value" "Music sidbar"
                ;;
            imagesSidbar)
                print_result "$value" "Images sidbar"
                ;;
            homeSidbar)
                print_result "$value" "Home sidbar"
                ;;
            icloudDriveSidbar)
                print_result "$value" "Icloud drive sidbar"
                ;;
            sharedFolderSidbar)
                print_result "$value" "Shared folder sidbar"
                ;;
            nameMacSidbar)
                print_result "$value" "Namemac sidbar"
                ;;
            internalDisksSidbar)
                print_result "$value" "Internal disks sidbar"
                ;;
            externalDrivesSidbar)
                print_result "$value" "External drives sidbar"
                ;;
            cdDvdAndIosDevicesSidbar)
                print_result "$value" "CD DVD and IOS devices sidbar"
                ;;
            storageInICloudSidbar)
                print_result "$value" "Storage in icloud sidbar"
                ;;
            computerHelloSidbar)
                print_result "$value" "Computer hello sidbar"
                ;;
            connectedServersSidbar)
                print_result "$value" "Connected server ssidbar"
                ;;
            recentTagsSidbar)
                print_result "$value" "Recent tags sidbar"
                ;;
            advancedOptionsTab)
                print_result "$value" "Advanced options tab"
                ;;
            showAllFileExtensions)
                print_result "$value" "Show all file extensions"
                ;;
            WarnBeforeModifyingAnExtension)
                print_result "$value" "Warn before modifying an extension"
                ;;
            warnBeforeDeletingFromICloudDrive)
                print_result "$value" "Warn before deleting from icloud drive"
                ;;
            warnBeforeEmptyingTheTrash)
                print_result "$value" "Warn before emptying the trash"
                ;;
            removeTheElementsOfTheTrashAfter30Days)
                print_result "$value" "Remove the element sof the trash after 30 days"
                ;;
            leaveTheFilesAtTheTopInWindowsDuringSortingByName)
                print_result "$value" "Leave the files at the top in windows during sorting by name"
                ;;
            inLeaveTheFilesAtTheTopOnTheDesk)
                print_result "$value" "In leave the files at the top on the desk"
                ;;
            newFinderwindowsDisplay)
                print_result "$value" "New finder windows display"
                ;;
            *)
                echo "Unknown key: $key"
                ;;
        esac

    done < "$OUTPUT_FILE"

    rm -rf "$OUTPUT_FILE"
}

finder_presentation_by_icon() {

    OUTPUT_FILE="/tmp/output"

    touch "$OUTPUT_FILE"

    execute "./finder_presentation_by_icon.applescript" "Run finder_presentation_by_icon.applescript"

    while IFS='=' read -r key value; do
        
        case "$key" in
            stackBy)
                print_result "$value" "Stack by"
                ;;
            sortBy)
                print_result "$value" "Sort by"
                ;;
            iconsSize)
                print_result "$value" "Icons size"
                ;;
            gridSpacing)
                print_result "$value" "Grid spacing"
                ;;
            textSize)
                print_result "$value" "Text size"
                ;;
            textPositionAtBottom)
                print_result "$value" "Text position at bottom"
                ;;
            showInformation)
                print_result "$value" "Show information"
                ;;
            useAnOverviewAsIcon)
                print_result "$value" "Use an over view as icon"
                ;;
            *)
                echo "Unknown key: $key"
                ;;
        esac

    done < "$OUTPUT_FILE"

    rm -rf "$OUTPUT_FILE"
}

finder_settings

finder_presentation_by_icon
