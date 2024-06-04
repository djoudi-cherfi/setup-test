#!/usr/bin/env osascript

set sortNotesBy to 1
set newNotesStartWith to 1
set defaultAccount to 1
set groupNotesByDate to 1
set alwaysPickUpTheLastQuickNote to 1
set automaticallySortCompletedTasks to 1
set allowMentionNotifications to 1
set enableOnMyMacAccount to 1
set defaultTextSize to 1
set useDarkBackgroundsForNotes to 1

tell application "System Events"
	
	-- Activate the Notes application
	tell application "Notes"
		activate
	end tell
	
	-- Interact with the Notes UI
	tell application process "Notes"
		
		-- Wait until the Notes process is frontmost
		repeat until frontmost
			delay 0.5
		end repeat
		
		-- Settings... from the Notes menu
		try
			click menu item "Réglages…" of menu 1 of menu bar item "Notes" of menu bar 1
			delay 0.5
		on error
			error "Menu to open the Settings window"
		end try
		
		-- Sort notes by
		try
			tell window "Réglages"
				click pop up button 3 of group 1
				delay 0.5
				click menu item "Titre" of menu 1 of pop up button 3 of group 1
				set sortNotesBy to 0
				delay 0.5
			end tell
		on error
			-- Log the error or handle it as needed
			set sortNotesBy to 1
		end try
		
		-- New notes start with
		try
			tell window "Réglages"
				click pop up button 1 of group 1
				delay 0.5
				click menu item "Titre" of menu 1 of pop up button 1 of group 1
				set newNotesStartWith to 0
				delay 0.5
			end tell
		on error
			-- Log the error or handle it as needed
			set newNotesStartWith to 1
		end try
		
		-- Default account
		try
			tell window "Réglages"
				click pop up button 2 of group 1
				delay 0.5
				click menu item "iCloud" of menu 1 of pop up button 2 of group 1
				set defaultAccount to 0
				delay 0.5
			end tell
		on error
			-- Log the error or handle it as needed
			set defaultAccount to 1
		end try
		
		-- Group notes by date
		try
			if value of checkbox "Grouper les notes par date" of group 1 of window "Réglages" = 1 then
				click checkbox "Grouper les notes par date" of group 1 of window "Réglages"
				set groupNotesByDate to 0
				delay 0.2
			else
				set groupNotesByDate to 0
			end if
		on error
			-- Log the error or handle it as needed
			set groupNotesByDate to 1
		end try
		
		-- Always pick up the last quick note
		try
			if value of checkbox "Toujours reprendre la dernière note rapide" of group 1 of window "Réglages" = 0 then
				click checkbox "Toujours reprendre la dernière note rapide" of group 1 of window "Réglages"
				set alwaysPickUpTheLastQuickNote to 0
				delay 0.2
			else
				set alwaysPickUpTheLastQuickNote to 0
			end if
		on error
			-- Log the error or handle it as needed
			set alwaysPickUpTheLastQuickNote to 1
		end try
		
		-- Automatically sort completed tasks
		try
			if value of checkbox "Trier automatiquement les tâches terminées" of group 1 of window "Réglages" = 0 then
				click checkbox "Trier automatiquement les tâches terminées" of group 1 of window "Réglages"
				set automaticallySortCompletedTasks to 0
				delay 0.2
			else
				set automaticallySortCompletedTasks to 0
			end if
		on error
			-- Log the error or handle it as needed
			set automaticallySortCompletedTasks to 1
		end try
		
		-- Allow mention notifications
		try
			if value of checkbox "Autoriser les notifications de mention" of group 1 of window "Réglages" = 0 then
				click checkbox "Autoriser les notifications de mention" of group 1 of window "Réglages"
				set allowMentionNotifications to 0
				delay 0.2
			else
				set allowMentionNotifications to 0
			end if
		on error
			-- Log the error or handle it as needed
			set allowMentionNotifications to 1
		end try
		
		-- Enable “On My Mac” account
		try
			if value of checkbox "Activer le compte « Sur mon Mac »" of group 1 of window "Réglages" = 1 then
				click checkbox "Activer le compte « Sur mon Mac »" of group 1 of window "Réglages"
				set enableOnMyMacAccount to 0
				delay 0.2
			else
				set enableOnMyMacAccount to 0
			end if
		on error
			-- Log the error or handle it as needed
			set enableOnMyMacAccount to 1
		end try
		
		-- Default text size
		try
			set value of value indicator 1 of slider 1 of group 1 of window "Réglages" to 2
			set defaultTextSize to 0
			delay 0.5
		on error
			-- Log the error or handle it as needed
			set defaultTextSize to 1
		end try
		
		
		-- Use dark backgrounds for notes
		try
			if value of checkbox "Utiliser des arrière-plans foncés pour les notes" of group 1 of window "Réglages" = 0 then
				click checkbox "Utiliser des arrière-plans foncés pour les notes" of group 1 of window "Réglages"
				set useDarkBackgroundsForNotes to 0
				delay 0.2
			else
				set useDarkBackgroundsForNotes to 0
			end if
		on error
			-- Log the error or handle it as needed
			set useDarkBackgroundsForNotes to 1
		end try
		
		-- Close Settings...
		click button 2 of window "Réglages"
		
		delay 1
		
		-- Exit Notes
		click menu item "Quitter Notes" of menu 1 of menu bar item "Notes" of menu bar 1
		
	end tell
end tell

do shell script "echo sortNotesBy=\"" & sortNotesBy & "\" >> /tmp/output"
do shell script "echo newNotesStartWith=\"" & newNotesStartWith & "\" >> /tmp/output"
do shell script "echo defaultAccount=\"" & defaultAccount & "\" >> /tmp/output"
do shell script "echo groupNotesByDate=\"" & groupNotesByDate & "\" >> /tmp/output"
do shell script "echo alwaysPickUpTheLastQuickNote=\"" & alwaysPickUpTheLastQuickNote & "\" >> /tmp/output"
do shell script "echo automaticallySortCompletedTasks=\"" & automaticallySortCompletedTasks & "\" >> /tmp/output"
do shell script "echo allowMentionNotifications=\"" & allowMentionNotifications & "\" >> /tmp/output"
do shell script "echo enableOnMyMacAccount=\"" & enableOnMyMacAccount & "\" >> /tmp/output"
do shell script "echo defaultTextSize=\"" & defaultTextSize & "\" >> /tmp/output"
do shell script "echo useDarkBackgroundsForNotes=\"" & useDarkBackgroundsForNotes & "\" >> /tmp/output"
