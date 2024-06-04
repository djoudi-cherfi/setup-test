#!/usr/bin/env osascript

set movementSpeed to 1
set naturalScrolling to 1
set doubleClickSpeed to 1
set scrollingSpeed to 1

tell application "System Events"
	
	-- Activate the System Settings and pane Mouse
	tell application "System Settings"
		activate
		reveal pane id "com.apple.Mouse-Settings.extension"
	end tell
	
	-- Interact with the System Settings UI
	tell application process "System Settings"
		
		-- Wait until the pane id "com.apple.Mouse-Settings.extension" is frontmost
		delay 3
		
		-- Movement speed
		try
			set theSlider to slider "Vitesse de déplacement" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
			set currentValue to value of theSlider
			if currentValue > 8 then
				repeat until currentValue is 8
					perform action "AXDecrement" of theSlider
					set currentValue to value of theSlider
				end repeat
				set movementSpeed to 0
				delay 0.5
			else
				repeat until currentValue is 8
					perform action "AXIncrement" of theSlider
					set currentValue to value of theSlider
				end repeat
				set movementSpeed to 0
				delay 0.5
			end if
		on error
			-- Log the error or handle it as needed
			set movementSpeed to 1
		end try
		
		-- Natural scrolling
		try
			if value of checkbox 1 of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1 = 0 then
				click checkbox 1 of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
				set naturalScrolling to 0
				delay 0.5
			else
				set naturalScrolling to 0
			end if
		on error
			-- Log the error or handle it as needed
			set naturalScrolling to 1
		end try
		
		-- Double-click speed
		try
			set theSlider to slider "Vitesse de double-clic" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
			set currentValue to value of theSlider
			if currentValue > 3 then
				repeat until currentValue is 3
					perform action "AXDecrement" of theSlider
					set currentValue to value of theSlider
				end repeat
				set doubleClickSpeed to 0
				delay 0.5
			else
				repeat until currentValue is 3
					perform action "AXIncrement" of theSlider
					set currentValue to value of theSlider
				end repeat
				set doubleClickSpeed to 0
				delay 0.5
			end if
		on error
			-- Log the error or handle it as needed
			set doubleClickSpeed to 1
		end try
		
		-- Scrolling speed
		try
			set theSlider to slider "Vitesse de défilement" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
			set currentValue to value of theSlider
			if currentValue > 5 then
				repeat until currentValue is 5
					perform action "AXDecrement" of theSlider
					set currentValue to value of theSlider
				end repeat
				set scrollingSpeed to 0
				delay 0.5
			else
				repeat until currentValue is 5
					perform action "AXIncrement" of theSlider
					set currentValue to value of theSlider
				end repeat
				set scrollingSpeed to 0
				delay 0.5
			end if
		on error
			-- Log the error or handle it as needed
			set scrollingSpeed to 1
		end try
		
	end tell
end tell

do shell script "echo movementSpeed=\"" & movementSpeed & "\" >> /tmp/output"
do shell script "echo naturalScrolling=\"" & naturalScrolling & "\" >> /tmp/output"
do shell script "echo doubleClickSpeed=\"" & doubleClickSpeed & "\" >> /tmp/output"
do shell script "echo scrollingSpeed=\"" & scrollingSpeed & "\" >> /tmp/output"
