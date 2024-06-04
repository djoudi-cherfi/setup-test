#!/usr/bin/env osascript

set keyRepeatSpeed to 1
set breakBeforeRehearsal to 1

tell application "System Events"
	
	-- Activate the System Settings and pane Keyboard
	tell application "System Settings"
		activate
		reveal pane id "com.apple.Keyboard-Settings.extension"
	end tell
	
	-- Interact with the System Settings UI
	tell application process "System Settings"
		
		-- Wait until the pane is frontmost
		delay 2
		
		-- Key repeat speed
		try
			set theSlider to slider 1 of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Clavier"
			set currentValue to value of theSlider
			if currentValue > 7 then
				repeat until currentValue is 7
					perform action "AXDecrement" of theSlider
					set currentValue to value of theSlider
				end repeat
				set keyRepeatSpeed to 0
				delay 0.5
			else
				repeat until currentValue is 7
					perform action "AXIncrement" of theSlider
					set currentValue to value of theSlider
				end repeat
				set keyRepeatSpeed to 0
				delay 0.5
			end if
		on error
			-- Log the error or handle it as needed
			set keyRepeatSpeed to 1
		end try
		
		-- Break before rehearsal
		try
			set theSlider to slider 2 of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Clavier"
			set currentValue to value of theSlider
			if currentValue > 6 then
				repeat until currentValue is 6
					perform action "AXDecrement" of theSlider
					set currentValue to value of theSlider
				end repeat
				set breakBeforeRehearsal to 0
				delay 0.5
			else
				repeat until currentValue is 6
					perform action "AXIncrement" of theSlider
					set currentValue to value of theSlider
				end repeat
				set breakBeforeRehearsal to 0
				delay 0.5
			end if
		on error
			-- Log the error or handle it as needed
			set breakBeforeRehearsal to 1
		end try
		
	end tell
end tell

do shell script "echo keyRepeatSpeed=\"" & keyRepeatSpeed & "\" >> /tmp/output"
do shell script "echo breakBeforeRehearsal=\"" & breakBeforeRehearsal & "\" >> /tmp/output"

