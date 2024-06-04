#!/usr/bin/env osascript

tell application "System Events"
	tell application process "Finder"
		
		-- Close folder window if it exists
		if exists button 1 of window 1 then
			click button 1 of window 1
		end if
	
	end tell
end tell
