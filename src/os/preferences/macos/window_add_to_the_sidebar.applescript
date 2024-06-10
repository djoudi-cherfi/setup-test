#!/usr/bin/env osascript

tell application "System Events"
	tell application process "Finder"
		-- Ensure the window is active
		set frontmost to true
		
		-- Add to the sidebar
		click menu item "Ajouter à la barre latérale" of menu "Fichier" of menu bar 1
		
	end tell
end tell