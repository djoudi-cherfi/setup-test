#!/usr/bin/env osascript

set accentColor to 1
set appearanceMode to 1

tell application "System Events"
	
	-- Activate the System Settings and pane Appearance
	tell application "System Settings"
		activate
		reveal pane id "com.apple.Appearance-Settings.extension"
	end tell
	
	-- Interact with the System Settings UI
	tell application process "System Settings"
		
		-- Wait until the pane is frontmost
		delay 2
		
		-- Appearance mode
		try
			click button 2 of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Apparence"
			set appearanceMode to 0
		on error
			-- Log the error or handle it as needed
			set appearanceMode to 1
		end try
		
		delay 0.5
		
		-- Accent color
		try
			click button 8 of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Apparence"
			set accentColor to 0
		on error
			-- Log the error or handle it as needed
			set accentColor to 1
		end try
		
	end tell
end tell

do shell script "echo accentColor=\"" & accentColor & "\" >> /tmp/output"
do shell script "echo appearanceMode=\"" & appearanceMode & "\" >> /tmp/output"
