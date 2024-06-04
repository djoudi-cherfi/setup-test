#!/usr/bin/env osascript

set askSiri to 1

tell application "System Events"
	
	-- Activate the System Settings and pane Siri
	tell application "System Settings"
		activate
		reveal pane id "com.apple.Siri-Settings.extension"
	end tell
	
	-- Interact with the System Settings UI
	tell application process "System Settings"
		
		-- Wait until the pane id "com.apple.Siri-Settings.extension" is frontmost
		delay 2
		
		-- Ask Siri
		try
			if exists checkbox "Demander à Siri" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1 then
				if value of checkbox "Demander à Siri" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1 = 1 then
					click checkbox "Demander à Siri" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
					set askSiri to 0
				else
					set askSiri to 0
				end if
			end if
		on error
			-- Log the error or handle it as needed
			set askSiri to 1
		end try
		
	end tell
end tell

do shell script "echo askSiri=\"" & askSiri & "\" >> /tmp/output"
