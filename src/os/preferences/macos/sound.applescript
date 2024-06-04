#!/usr/bin/env osascript

set makeAsoundAtStartup to 1
set playAsoundWhenTheVolumeIsChanged to 1

tell application "System Events"
	
	-- Activate the System Settings and pane Sound
	tell application "System Settings"
		activate
		reveal pane id "com.apple.Sound-Settings.extension"
	end tell
	
	-- Interact with the System Settings UI
	tell application process "System Settings"
		
		-- Wait until the pane id "com.apple.Sound-Settings.extension" is frontmost
		delay 2
		
		-- Make a sound at startup
		set theCheckbox to checkbox "Émettre un son au démarrage" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Son"
		try
			if exists theCheckbox then
				if value of theCheckbox = 1 then
					click theCheckbox
					set makeAsoundAtStartup to 0
				else
					set makeAsoundAtStartup to 0
				end if
			end if
		on error
			-- Log the error or handle it as needed
			set makeAsoundAtStartup to 1
		end try
		
		delay 0.5
		
		-- Play a sound when the volume is changed
		set theCheckbox to checkbox "Émettre un son lorsque le volume est modifié" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Son"
		try
			if exists theCheckbox then
				if value of theCheckbox = 1 then
					click theCheckbox
					set playAsoundWhenTheVolumeIsChanged to 0
				else
					set playAsoundWhenTheVolumeIsChanged to 0
				end if
			end if
		on error
			-- Log the error or handle it as needed
			set playAsoundWhenTheVolumeIsChanged to 1
		end try
		
	end tell
end tell

do shell script "echo playAsoundWhenTheVolumeIsChanged=\"" & playAsoundWhenTheVolumeIsChanged & "\" >> /tmp/output"
do shell script "echo makeAsoundAtStartup=\"" & makeAsoundAtStartup & "\" >> /tmp/output"
