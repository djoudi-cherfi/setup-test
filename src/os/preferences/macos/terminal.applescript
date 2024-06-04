#!/usr/bin/env osascript

set profileTab to 1
set importingTheTheme to 1
set setDefaultProfile to 1

tell application "System Events"
	
	-- Activate the Terminal application
	tell application "Terminal"
		activate
	end tell
	
	-- Interact with the Terminal UI
	tell application process "Terminal"
		
		-- Wait until the Terminal process is frontmost
		repeat until frontmost
			delay 0.5
		end repeat
		
		-- Settings... from the Terminal menu
		try
			click menu item "Réglages…" of menu "Terminal" of menu bar 1
			delay 0.5
		on error
			error "Menu to open the Settings window"
		end try
		
		-- Profile tab
		try
			click button "Profils" of toolbar 1 of window "Général"
			set profileTab to 0
			delay 0.5
		on error
			set profileTab to 1
		end try
		
		-- Importing the theme
		try
			do shell script "open ~/desktop/Monokai_Night.terminal"
			set importingTheTheme to 0
			delay 0.5
		on error
			set importingTheTheme to 1
		end try
		
		-- Select the theme in the Profiles tab
		try
			repeat with i from 1 to count of rows of table 1 of scroll area 1 of group 1 of window "Profils"
				set cellValue to value of text field 1 of row i of table 1 of scroll area 1 of group 1 of window "Profils"
				if cellValue contains "Monokai_Night" then
					select row i of table 1 of scroll area 1 of group 1 of window "Profils"
					exit repeat
				end if
			end repeat
			delay 0.5
		on error
			error "Select the theme in the Profiles tab"
		end try
		
		-- Set default profile
		try
			click button "Par défaut" of group 1 of window "Profils"
			set setDefaultProfile to 0
			delay 0.5
		on error
			set setDefaultProfile to 1
		end try
		
		-- Button to close the Settings window
		try
			click button 1 of window "Profils"
		on error
			error "Button to close the Settings window"
		end try
		
	end tell
end tell

do shell script "echo profileTab=\"" & profileTab & "\" >> /tmp/output"
do shell script "echo importingTheTheme=\"" & importingTheTheme & "\" >> /tmp/output"
do shell script "echo setDefaultProfile=\"" & setDefaultProfile & "\" >> /tmp/output"
