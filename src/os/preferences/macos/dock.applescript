#!/usr/bin/env osascript

set sizeIcon to 1
set automaticallyHideShowDock to 1
set enlargementIcon to 1
set ShowSuggestedAndRecentAppsInTheDock to 1
set ShowItemsOnTheDesktop to 1
set defaultWebBrowser to 1

tell application "System Events"
	
	-- Activate the System Settings and pane
	tell application "System Settings"
		activate
		reveal pane id "com.apple.Desktop-Settings.extension"
	end tell
	
	-- Interact with the System Settings UI
	tell application process "System Settings"
		
		-- Wait until the pane is frontmost
		delay 2
		
		-- Size icon
		try
			set theSlider to slider 1 of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Bureau et Dock"
			set targetValue to 0.314285716414
			set currentValue to value of theSlider
			if currentValue ≠ targetValue then
				if currentValue > targetValue then
					repeat until currentValue ≤ targetValue
						perform action "AXDecrement" of theSlider
						set currentValue to value of theSlider
					end repeat
				else
					repeat until currentValue ≥ targetValue
						perform action "AXIncrement" of theSlider
						set currentValue to value of theSlider
					end repeat
				end if
				set sizeIcon to 0
				delay 0.5
			end if
		on error
			-- Log the error or handle it as needed
			set sizeIcon to 1
		end try
		
		-- Enlargement icon
		try
			set theSlider to slider 2 of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Bureau et Dock"
			set targetValue to 0.919642865658
			set currentValue to value of theSlider
			if currentValue ≠ targetValue then
				if currentValue > targetValue then
					repeat until currentValue ≤ targetValue
						perform action "AXDecrement" of theSlider
						set currentValue to value of theSlider
					end repeat
				else
					repeat until currentValue ≥ targetValue
						perform action "AXIncrement" of theSlider
						set currentValue to value of theSlider
					end repeat
				end if
				set enlargementIcon to 0
				delay 0.5
			end if
		on error
			-- Log the error or handle it as needed
			set enlargementIcon to 1
		end try
		
		-- Automatically hide/show Dock
		try
			set theCheckbox to checkbox "Masquer/afficher automatiquement le Dock" of group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Bureau et Dock"
			if value of theCheckbox is 0 then
				click theCheckbox
				set automaticallyHideShowDock to 0
			else
				set automaticallyHideShowDock to 0
			end if
		on error
			-- Log the error or handle it as needed
			set automaticallyHideShowDock to 1
		end try
		
		-- Show suggested and recent apps in the Dock
		set theCheckbox to checkbox "Afficher les apps suggérées et récentes dans le Dock" of group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Bureau et Dock"
		try
			if value of theCheckbox is 1 then
				click theCheckbox
				set ShowSuggestedAndRecentAppsInTheDock to 0
			else
				set ShowSuggestedAndRecentAppsInTheDock to 0
			end if
		on error
			-- Log the error or handle it as needed
			set ShowSuggestedAndRecentAppsInTheDock to 1
		end try
		
		-- Show items on the desktop
		set theCheckbox to checkbox "Afficher les éléments" of group 4 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Bureau et Dock"
		try
			if value of theCheckbox is 1 then
				click theCheckbox
				set ShowItemsOnTheDesktop to 0
			else
				set ShowItemsOnTheDesktop to 0
			end if
		on error
			-- Log the error or handle it as needed
			set ShowItemsOnTheDesktop to 1
		end try
		
		-- Automatically rearrange Spaces based on your most recent usage
		set theCheckbox to checkbox "Réarranger automatiquement les Spaces en fonction de votre utilisation la plus récente" of group 9 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Bureau et Dock"
		try
			if value of theCheckbox is 1 then
				click theCheckbox
				set automaticallyRearrangeSpacesBasedOnYourMostRecentUsage to 0
			else
				set automaticallyRearrangeSpacesBasedOnYourMostRecentUsage to 0
			end if
		on error
			-- Log the error or handle it as needed
			set automaticallyRearrangeSpacesBasedOnYourMostRecentUsage to 1
		end try
		
		-- Default web browser
		try
			tell group 7 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Bureau et Dock"
				click pop up button "Navigateur web par défaut"
				delay 1
				click menu item "Brave Browser.app" of menu 1 of pop up button "Navigateur web par défaut"
				set defaultWebBrowser to 0
			end tell
		on error
			-- Log the error or handle it as needed
			set defaultWebBrowser to 1
		end try
		
	end tell
end tell

do shell script "echo automaticallyHideShowDock=\"" & automaticallyHideShowDock & "\" >> /tmp/output"
do shell script "echo sizeIcon=\"" & sizeIcon & "\" >> /tmp/output"
do shell script "echo enlargementIcon=\"" & enlargementIcon & "\" >> /tmp/output"
do shell script "echo ShowSuggestedAndRecentAppsInTheDock=\"" & ShowSuggestedAndRecentAppsInTheDock & "\" >> /tmp/output"
do shell script "echo ShowItemsOnTheDesktop=\"" & ShowItemsOnTheDesktop & "\" >> /tmp/output"
do shell script "echo defaultWebBrowser=\"" & defaultWebBrowser & "\" >> /tmp/output"
