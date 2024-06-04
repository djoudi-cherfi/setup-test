#!/usr/bin/env osascript

set regionFr to 1
set measuringSystem to 1

tell application "System Events"
	
	-- Activate the System Settings and pane Localization
	tell application "System Settings"
		activate
		reveal pane id "com.apple.Localization-Settings.extension"
	end tell
	
	-- Interact with the System Settings UI
	tell application process "System Settings"
		
		-- Wait until the pane is frontmost
		delay 2
		
		-- Region Fr
		try
			tell group 2 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Langue et région"
				click pop up button 1
				delay 1
				click menu item "Europe" of menu 1 of pop up button 1
				delay 1
				click menu item "France" of menu 1 of menu item "Europe" of menu 1 of pop up button 1
				set regionFr to 0
			end tell
		on error
			-- Log the error or handle it as needed
			set regionFr to 1
		end try
		
		delay 0.5
		
		-- Measuring system
		try
			click radio button "Système de mesure" of radio group 2 of group 2 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Langue et région"
			set measuringSystem to 0
		on error
			-- Log the error or handle it as needed
			set measuringSystem to 1
		end try
		
	end tell
end tell

do shell script "echo regionFr=\"" & regionFr & "\" >> /tmp/output"
do shell script "echo measuringSystem=\"" & measuringSystem & "\" >> /tmp/output"
