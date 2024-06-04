#!/usr/bin/env osascript

set generalTab to 1
set homepage to 1
set automaticallyTrustFiles to 1
set advancedTab to 1
set showFeaturesDevelopWeb to 1

tell application "System Events"
	
	-- Activate the Safari application
	tell application "Safari"
        activate
    end tell
	
	-- Interact with the Safari UI
	tell application process "Safari"
		
		-- Wait until the Safari process is frontmost
		repeat until frontmost
			delay 0.5
		end repeat
		
		-- Settings... from the Safari menu
		try
			click menu item "Réglages…" of menu "Safari" of menu bar 1
			delay 0.5
		on error
			error "Settings... from the Safari menu: not found"
		end try

		-- General tab
		try
			if exists button "Général" of toolbar 1 of window 1 then
				click button "Général" of toolbar 1 of window 1
				set generalTab to 0
				delay 0.5
			end if
			
			-- Homepage
			try
				if exists text field 1 of group 1 of group 1 of window 1 then
					set value of text field 1 of group 1 of group 1 of window 1 to "https://start.me/"
					set homepage to 0
					delay 0.5
				end if
			on error
				-- Log the error or handle it as needed
				set homepage to 1
			end try
			
			-- -- Automatically open “trusted” files
			try
				if exists checkbox "Ouvrir automatiquement les fichiers « fiables »" of group 1 of group 1 of window 1 then
					if value of checkbox "Ouvrir automatiquement les fichiers « fiables »" of group 1 of group 1 of window 1 is 1 then
						click checkbox "Ouvrir automatiquement les fichiers « fiables »" of group 1 of group 1 of window 1
						set automaticallyTrustFiles to 0
						delay 0.5
					else
						set automaticallyTrustFiles to 0
						delay 0.5
					end if
				end if
			on error
				-- Log the error or handle it as needed
				set automaticallyTrustFiles to 1
			end try
		on error
			-- Log the error or handle it as needed
			-- This will skip the Homepage and Automatically open “trusted” files sections
			set generalTab to 1
		end try
		
		-- Advanced tab
		try
			if exists button "Avancés" of toolbar 1 of window 1 then
				click button "Avancés" of toolbar 1 of window 1
				set advancedTab to 0
				delay 0.5
			end if
			
			-- Show features for web developers
			try
				if exists checkbox "Afficher les fonctionnalités pour les développeurs web" of group 1 of group 1 of window 1 then
					if value of checkbox "Afficher les fonctionnalités pour les développeurs web" of group 1 of group 1 of window 1 is 0 then
						click checkbox "Afficher les fonctionnalités pour les développeurs web" of group 1 of group 1 of window 1
						set showFeaturesDevelopWeb to 0
						delay 0.5
					else
						set showFeaturesDevelopWeb to 0
						delay 0.5
					end if
				end if
			on error
				-- Log the error or handle it as needed
				set showFeaturesDevelopWeb to 1
			end try
		on error
			-- Log the error or handle it as needed
			-- This will skip the Show features for web developers
			set advancedTab to 1
		end try
		
	end tell
end tell

-- Quit the Safari application
tell application "Safari" to quit

do shell script "echo generalTab=\"" & generalTab & "\" >> /tmp/output"
do shell script "echo homepage=\"" & homepage & "\" >> /tmp/output"
do shell script "echo automaticallyTrustFiles=\"" & automaticallyTrustFiles & "\" >> /tmp/output"
do shell script "echo advancedTab=\"" & advancedTab & "\" >> /tmp/output"
do shell script "echo showFeaturesDevelopWeb=\"" & showFeaturesDevelopWeb & "\" >> /tmp/output"
