#!/usr/bin/env osascript

on run {folderPath}
	
	tell application "System Events"
		-- Activate the Finder application
		tell application "Finder"
			activate
			
			-- Open folder window
			try
				open folderPath as POSIX file
				delay 0.5
			on error
				error "Open folder window " & folderPath & " : not found"
			end try
		
        end tell
	end tell

end run
