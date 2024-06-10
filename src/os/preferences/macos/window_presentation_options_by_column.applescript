#!/usr/bin/env osascript

set alwaysPresentInColumns to 1
set navigateInColumnView to 1
set groupBy to 1
set sortBy to 1
set textSize to 1
set showIcons to 1
set useAnOverviewAsIcon to 1
set showPreviewColumn to 1

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
		
		-- Always present in columns ------------------------------------------------------
		try
			if value of checkbox "Toujours présenter par colonnes" of window 1 = 0 then
				click checkbox "Toujours présenter par colonnes" of window 1
				set alwaysPresentInColumns to 0
				delay 0.5
			else
				set alwaysPresentInColumns to 0
			end if
		on error
			-- Log the error or handle it as needed
			set alwaysPresentInColumns to 1
		end try
		
		-- Navigate in column view ------------------------------------------------------
		try
			if value of checkbox "Naviguer en présentation par colonnes" of window 1 = 0 then
				click checkbox "Naviguer en présentation par colonnes" of window 1
				set navigateInColumnView to 0
				delay 0.5
			else
				set navigateInColumnView to 0
			end if
		on error
			-- Log the error or handle it as needed
			set navigateInColumnView to 1
		end try
		
		-- Group by ------------------------------------------------------
		try
			tell window 1
				click pop up button 1
				delay 0.5
				click menu item "Aucun" of menu 1 of pop up button 1
				set groupBy to 0
				delay 0.5
			end tell
		on error
			-- Log the error or handle it as needed
			set groupBy to 1
		end try
		
		-- Sort by ------------------------------------------------------
		try
			tell window 1
				click pop up button 2
				delay 0.5
				click menu item "Nom" of menu 1 of pop up button 2
				set sortBy to 0
				delay 0.5
			end tell
		on error
			-- Log the error or handle it as needed
			set sortBy to 1
		end try
		
		-- Text size ------------------------------------------------------
		try
			tell group 1 of window 1
				click pop up button 1
				delay 0.5
				click menu item "13" of menu 1 of pop up button 1
				set textSize to 0
				delay 0.5
			end tell
		on error
			-- Log the error or handle it as needed
			set textSize to 1
		end try
		
		-- Show icons ------------------------------------------------------
		try
			if value of checkbox "Afficher les icônes" of group 1 of window 1 = 0 then
				click checkbox "Afficher les icônes" of group 1 of window 1
				set showIcons to 0
				delay 0.5
			else
				set showIcons to 0
			end if
		on error
			-- Log the error or handle it as needed
			set showIcons to 1
		end try
		
		-- Use an overview as icon ------------------------------------------------------
		try
			if value of checkbox "Utiliser un aperçu comme icône" of group 1 of window 1 = 0 then
				click checkbox "Utiliser un aperçu comme icône" of group 1 of window 1
				set useAnOverviewAsIcon to 0
				delay 0.5
			else
				set useAnOverviewAsIcon to 0
			end if
		on error
			-- Log the error or handle it as needed
			set useAnOverviewAsIcon to 1
		end try
		
		-- Show preview column ------------------------------------------------------
		try
			if value of checkbox "Afficher la colonne d’aperçu" of group 1 of window 1 = 0 then
				click checkbox "Afficher la colonne d’aperçu" of group 1 of window 1
				set showPreviewColumn to 0
				delay 0.5
			else
				set showPreviewColumn to 0
			end if
		on error
			-- Log the error or handle it as needed
			set showPreviewColumn to 1
		end try
		
		-- Show library folder ------------------------------------------------------
		if exists checkbox "Afficher le dossier Bibliothèque" of group 1 of window 1 then
			try
				if value of checkbox "Afficher le dossier Bibliothèque" of group 1 of window 1 = 1 then
					click checkbox "Afficher le dossier Bibliothèque" of group 1 of window 1
					set showLibraryFolder to 0
					delay 0.5
				else
					set showLibraryFolder to 0
				end if
			on error
				-- Log the error or handle it as needed
				set showLibraryFolder to 1
			end try
			do shell script "echo showLibraryFolder=\"" & showLibraryFolder & "\" >> /tmp/output"
		end if
		
		-- Close show presentation options
		click button 1 of window 1
		
	end tell
end tell

do shell script "echo alwaysPresentInColumns=\"" & alwaysPresentInColumns & "\" >> /tmp/output"
do shell script "echo navigateInColumnView=\"" & navigateInColumnView & "\" >> /tmp/output"
do shell script "echo groupBy=\"" & groupBy & "\" >> /tmp/output"
do shell script "echo sortBy=\"" & sortBy & "\" >> /tmp/output"
do shell script "echo textSize=\"" & textSize & "\" >> /tmp/output"
do shell script "echo showIcons=\"" & showIcons & "\" >> /tmp/output"
do shell script "echo useAnOverviewAsIcon=\"" & useAnOverviewAsIcon & "\" >> /tmp/output"
do shell script "echo showPreviewColumn=\"" & showPreviewColumn & "\" >> /tmp/output"
