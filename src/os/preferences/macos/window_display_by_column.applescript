#!/usr/bin/env osascript

tell application "System Events"
	-- Activate the Finder application
	tell application "Finder"
		activate
	end tell
	
	-- Interact with the Finder UI
	tell application process "Finder"
		
		-- Wait until the Finder process is frontmost
		repeat until frontmost
			delay 0.5
		end repeat
		
		-- Column view style
		try
			click menu item "Par colonnes" of menu 1 of menu bar item "Présentation" of menu bar 1
			delay 0.5
		on error
			error "Column view style: not found"
		end try
		
	end tell
end tell
