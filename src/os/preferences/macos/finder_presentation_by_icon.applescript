#!/usr/bin/env osascript

set stackBy to 1
set sortBy to 1
set iconsSize to 1
set gridSpacing to 1
set textSize to 1
set textPositionAtBottom to 1
set showInformation to 1
set useAnOverviewAsIcon to 1

tell application "System Events"
	
	-- Activate the Finder application
	tell application "Finder"
		activate
	end tell
	
	-- Interact with the Finder UI
	tell application process "Finder"
		
		-- Wait until the Finder process is frontmost
		repeat until frontmost
			delay 0.5
		end repeat
		
		-- Show presentation options
		try
			if exists menu item "Afficher les options de présentation" of menu 1 of menu bar item "Présentation" of menu bar 1 then
				click menu item "Afficher les options de présentation" of menu 1 of menu bar item "Présentation" of menu bar 1
				delay 0.5
			else
				click menu item "Masquer les options de présentation" of menu 1 of menu bar item "Présentation" of menu bar 1
				delay 1
				click menu item "Afficher les options de présentation" of menu 1 of menu bar item "Présentation" of menu bar 1
				delay 0.5
			end if
		on error
			error "Show presentation options: not found"
		end try
		
		-- Stack by ------------------------------------------------------
		try
			tell window "Bureau"
				click pop up button 1
				delay 0.5
				click menu item "Aucun" of menu 1 of pop up button 1
				set stackBy to 0
				delay 0.5
			end tell
		on error
			-- Log the error or handle it as needed
			set stackBy to 1
		end try
		
		-- Sort by ------------------------------------------------------
		try
			tell window "Bureau"
				click pop up button 2
				delay 0.5
				click menu item "Aligner sur la grille" of menu 1 of pop up button 2
				set sortBy to 0
				delay 0.5
			end tell
		on error
			-- Log the error or handle it as needed
			set sortBy to 1
		end try
		
		-- Icons size ------------------------------------------------------
		try
			set value of value indicator 1 of slider 1 of group 1 of window "Bureau" to 60
			set iconsSize to 0
			delay 0.5
		on error
			-- Log the error or handle it as needed
			set iconsSize to 1
		end try
		
		-- Grid spacing ------------------------------------------------------
		try
			set value of value indicator 1 of slider 2 of group 1 of window "Bureau" to 28
			set gridSpacing to 0
			delay 0.5
		on error
			-- Log the error or handle it as needed
			set gridSpacing to 1
		end try
		
		-- Text size ------------------------------------------------------
		try
			tell group 1 of window "Bureau"
				click pop up button 1
				delay 0.5
				click menu item "15" of menu 1 of pop up button 1
				set textSize to 0
				delay 0.5
			end tell
		on error
			-- Log the error or handle it as needed
			set textSize to 1
		end try
		
		-- Text position at bottom ------------------------------------------------------
		try
			click radio button "En bas" of group 1 of window "Bureau"
			set textPositionAtBottom to 0
			delay 0.5
		on error
			-- Log the error or handle it as needed
			set textPositionAtBottom to 1
		end try
		
		-- Show information ------------------------------------------------------
		try
			if value of checkbox "Afficher les informations" of group 1 of window "Bureau" = 1 then
				click checkbox "Afficher les informations" of group 1 of window "Bureau"
				set showInformation to 0
				delay 0.5
			else
				set showInformation to 0
			end if
		on error
			-- Log the error or handle it as needed
			set showInformation to 1
		end try
		
		-- Use an overview as icon ------------------------------------------------------
		try
			if value of checkbox "Utiliser un aperçu comme icône" of group 1 of window "Bureau" = 0 then
				click checkbox "Utiliser un aperçu comme icône" of group 1 of window "Bureau"
				set useAnOverviewAsIcon to 0
				delay 0.5
			else
				set useAnOverviewAsIcon to 0
			end if
		on error
			-- Log the error or handle it as needed
			set useAnOverviewAsIcon to 1
		end try
		
		-- Close show presentation options
		click button 1 of window "Bureau"
		
	end tell
end tell

do shell script "echo stackBy=\"" & stackBy & "\" >> /tmp/output"
do shell script "echo sortBy=\"" & sortBy & "\" >> /tmp/output"
do shell script "echo iconsSize=\"" & iconsSize & "\" >> /tmp/output"
do shell script "echo gridSpacing=\"" & gridSpacing & "\" >> /tmp/output"
do shell script "echo textSize=\"" & textSize & "\" >> /tmp/output"
do shell script "echo textPositionAtBottom=\"" & textPositionAtBottom & "\" >> /tmp/output"
do shell script "echo showInformation=\"" & showInformation & "\" >> /tmp/output"
do shell script "echo useAnOverviewAsIcon=\"" & useAnOverviewAsIcon & "\" >> /tmp/output"
