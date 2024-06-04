#!/usr/bin/env osascript

set addApicture to 1
set showOnAllSpaces to 1

tell application "System Events"
	
	-- Activate the System Preferences and pane Wallpaper
	tell application "System Settings"
		activate
		reveal pane id "com.apple.Wallpaper-Settings.extension"
	end tell
	
	-- Add a picture
	try
		tell desktop 1
			set currentPicture to "/System/Library/Desktop Pictures/Solid Colors/Black.png"
			set picture to currentPicture
			set addApicture to 0
		end tell
	on error
		-- Log the error or handle it as needed
		set addApicture to 1
	end try
	
	-- Interact with the System Settings UI
	tell application process "System Settings"
		
		-- Wait until the pane is frontmost
		delay 2
		
		-- Show on all spaces
		try
			set theCheckbox to checkbox "Afficher sur tous les espaces" of group 2 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Fond d’écran"
			if value of theCheckbox is 0 then
				click theCheckbox
				set showOnAllSpaces to 0
			else
				set showOnAllSpaces to 0
			end if
		on error
			-- Log the error or handle it as needed
			set showOnAllSpaces to 1
		end try
		
	end tell
end tell

do shell script "echo addApicture=\"" & addApicture & "\" >> /tmp/output"
do shell script "echo showOnAllSpaces=\"" & showOnAllSpaces & "\" >> /tmp/output"
