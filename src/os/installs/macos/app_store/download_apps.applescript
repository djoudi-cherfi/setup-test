on run argv
    -- Get the app ID from the arguments
    set appID to item 1 of argv
    
    tell application "System Events"
        -- Activate the App Store application
        tell application "App Store" to activate
        delay 0.5

        -- Open the App Store with the specified URL
        open location "macappstores://itunes.apple.com/app/id" & appID
        delay 2 -- Increase delay to ensure the page loads completely

        -- Interact with the App Store UI
        tell process "App Store"
            -- Wait until the "Télécharger", "Obtenir", or "Retélécharger" button is available
            repeat until (exists button "Télécharger" of group 2 of splitter group 1 of window 1) or (exists button "Obtenir" of group 2 of splitter group 1 of window 1) or (exists button "Retélécharger" of group 2 of splitter group 1 of window 1)
                delay 0.5
            end repeat

            -- Click the appropriate button
            if (exists button "Télécharger" of group 2 of splitter group 1 of window 1) then
                click button "Télécharger" of group 2 of splitter group 1 of window 1
            else if (exists button "Obtenir" of group 2 of splitter group 1 of window 1) then
                click button "Obtenir" of group 2 of splitter group 1 of window 1
            else if (exists button "Retélécharger" of group 2 of splitter group 1 of window 1) then
                click button "Retélécharger" of group 2 of splitter group 1 of window 1
            end if
        end tell
    end tell
end run
