#!/usr/bin/env osascript

set brightness to 1
set adjustBrightnessAutomatically to 1

tell application "System Events"
	
	-- Activate the System Settings and pane
	tell application "System Settings"
		activate
		reveal pane id "com.apple.Displays-Settings.extension"
	end tell
	
	-- Interact with the System Settings UI
	tell application process "System Settings"
		
		-- Wait until the pane id "com.apple.Displays-Settings.extension" is frontmost
		delay 2
		
		-- Brightness
		try
			set value of value indicator 1 of slider 1 of group 2 of scroll area 2 of group 1 of group 2 of splitter group 1 of group 1 of window "Moniteurs" to 0.2
			set brightness to 0
		on error
			-- Log the error or handle it as needed
			set brightness to 1
		end try
		
		-- Adjust brightness automatically
		try
			set theCheckbox to checkbox "Régler la luminosité automatiquement" of group 2 of scroll area 2 of group 1 of group 2 of splitter group 1 of group 0 of window "Moniteurs"
			if value of theCheckbox is 1 then
				click theCheckbox
				set adjustBrightnessAutomatically to 0
			else
				set adjustBrightnessAutomatically to 0
			end if
		on error
			-- Log the error or handle it as needed
			set adjustBrightnessAutomatically to 1
		end try
		
	end tell
end tell

do shell script "echo brightness=\"" & brightness & "\" >> /tmp/output"
do shell script "echo adjustBrightnessAutomatically=\"" & adjustBrightnessAutomatically & "\" >> /tmp/output"
