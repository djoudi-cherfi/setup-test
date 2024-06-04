#!/usr/bin/env osascript

on run {folderPath}
    try
        tell application "Finder"
            -- Open a new Finder window
            set newFinderWindow to make new Finder window
            set target of newFinderWindow to POSIX file folderPath
            
            -- Wait for the window to be ready
            delay 1
            
            -- Add the folder to the sidebar
            tell application "System Events"
                tell process "Finder"
                    set frontmost to true
                    -- Select the "File" menu
                    click menu item "Add to Sidebar" of menu 1 of menu bar item "File" of menu bar 1
                end tell
            end tell
            
            -- Close the new Finder window
            close newFinderWindow
        end tell
    on error errMsg
        display dialog "Error: " & errMsg
    end try
end run
