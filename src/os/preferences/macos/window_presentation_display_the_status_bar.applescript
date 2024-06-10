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
		
		-- Display the status bar
		try
			if exists menu item "Afficher la barre d’état" of menu "Présentation" of menu bar item "Présentation" of menu bar 1 then
				click menu item "Afficher la barre d’état" of menu "Présentation" of menu bar item "Présentation" of menu bar 1
				delay 0.5
			else
				click menu item "Masquer la barre d’état" of menu "Présentation" of menu bar item "Présentation" of menu bar 1
				delay 1
				click menu item "Afficher la barre d’état" of menu "Présentation" of menu bar item "Présentation" of menu bar 1
				delay 0.5
			end if
		on error
			error "Display the status bar: not found"
		end try
		
	end tell
end tell
