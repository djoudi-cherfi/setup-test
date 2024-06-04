#!/usr/bin/env osascript

set generalTab to 1
set internalDisks to 1
set externalDrives to 1
set cdDvdAndIosDevices to 1
set connectedServers to 1
set newFinderwindowsDisplay to 1
set openFoldersInTabs to 1

set sidebarTab to 1
set recentSidbar to 1
set airDropSidbar to 1
set applicationsSidbar to 1
set desktopSidbar to 1
set documentsSidbar to 1
set downloadsSidbar to 1
set videosSidbar to 1
set musicSidbar to 1
set imagesSidbar to 1
set homeSidbar to 1
set icloudDriveSidbar to 1
set sharedFolderSidbar to 1
set nameMacSidbar to 1
set internalDisksSidbar to 1
set externalDrivesSidbar to 1
set cdDvdAndIosDevicesSidbar to 1
set storageInICloudSidbar to 1
set computerHelloSidbar to 1
set connectedServersSidbar to 1
set recentTagsSidbar to 1

set advancedOptionsTab to 1
set showAllFileExtensions to 1
set WarnBeforeModifyingAnExtension to 1
set warnBeforeDeletingFromICloudDrive to 1
set warnBeforeEmptyingTheTrash to 1
set removeTheElementsOfTheTrashAfter30Days to 1
set leaveTheFilesAtTheTopInWindowsDuringSortingByName to 1
set inLeaveTheFilesAtTheTopOnTheDesk to 1
set newFinderwindowsDisplay to 1

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
		
		-- Settings... from the Finder menu
		try
			click menu item "Réglages…" of menu 1 of menu bar item "Finder" of menu bar 1
			delay 0.5
		on error
			error "Settings... from the Finder menu: not found"
		end try
		
		-- General tab ------------------------------------------------------
		
		try
			click button "Général" of toolbar 1 of window "Réglages du Finder"
			set generalTab to 0
		on error
			-- Log the error or handle it as needed
			set generalTab to 1
		end try
		
		-- Show these items on the desktop
		try
			if value of checkbox "Disques durs" of window "Réglages du Finder" = 1 then
				click checkbox "Disques durs" of window "Réglages du Finder"
				set internalDisks to 0
				delay 0.5
			else
				set internalDisks to 0
			end if
		on error
			-- Log the error or handle it as needed
			set internalDisks to 1
		end try
		
		try
			if value of checkbox "Disques externes" of window "Réglages du Finder" = 0 then
				click checkbox "Disques externes" of window "Réglages du Finder"
				set externalDrives to 0
				delay 0.5
			else
				set externalDrives to 0
			end if
		on error
			-- Log the error or handle it as needed
			set externalDrives to 1
		end try
		
		
		try
			if value of checkbox "CD, DVD et iPod" of window "Réglages du Finder" = 1 then
				click checkbox "CD, DVD et iPod" of window "Réglages du Finder"
				set cdDvdAndIosDevices to 0
				delay 0.5
			else
				set cdDvdAndIosDevices to 0
			end if
		on error
			-- Log the error or handle it as needed
			set cdDvdAndIosDevices to 1
		end try
		
		try
			if value of checkbox "Serveurs connectés" of window "Réglages du Finder" = 1 then
				click checkbox "Serveurs connectés" of window "Réglages du Finder"
				set connectedServers to 0
				delay 0.5
			else
				set connectedServers to 0
			end if
		on error
			-- Log the error or handle it as needed
			set connectedServers to 1
		end try
		
		try
			tell window "Réglages du Finder"
				click pop up button "Les nouvelles fenêtres du Finder affichent :"
				delay 0.5
				click menu item "Bureau" of menu 1 of pop up button "Les nouvelles fenêtres du Finder affichent :"
				set newFinderwindowsDisplay to 0
			end tell
		on error
			-- Log the error or handle it as needed
			set newFinderwindowsDisplay to 1
		end try
		
		-- "Ouvrir les dossiers dans des onglets plutôt que dans de nouvelles fenêtres"
		try
			if value of checkbox 5 of window "Réglages du Finder" = 0 then
				click checkbox 5 of window "Réglages du Finder"
				set openFoldersInTabs to 0
				delay 0.5
			else
				set openFoldersInTabs to 0
			end if
		on error
			-- Log the error or handle it as needed
			set openFoldersInTabs to 1
		end try
		
		-- Sidebar tab ------------------------------------------------------
		
		try
			click button "Barre latérale" of toolbar 1 of window "Réglages du Finder"
			set sidebarTab to 0
		on error
			-- Log the error or handle it as needed
			set sidebarTab to 1
		end try
		
		-- Favorite
		
		try
			if value of checkbox 1 of scroll area 1 of window "Réglages du Finder" = 1 then
				click checkbox 1 of scroll area 1 of window "Réglages du Finder"
				set recentSidbar to 0
				delay 0.5
			else
				set recentSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set recentSidbar to 1
		end try
		
		try
			if value of checkbox 2 of scroll area 1 of window "Réglages du Finder" = 0 then
				click checkbox 2 of scroll area 1 of window "Réglages du Finder"
				set airDropSidbar to 0
				delay 0.5
			else
				set airDropSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set airDropSidbar to 1
		end try
		
		try
			if value of checkbox 3 of scroll area 1 of window "Réglages du Finder" = 0 then
				click checkbox 3 of scroll area 1 of window "Réglages du Finder"
				set applicationsSidbar to 0
				delay 0.5
			else
				set applicationsSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set applicationsSidbar to 1
		end try
		
		try
			if value of checkbox 4 of scroll area 1 of window "Réglages du Finder" = 0 then
				click checkbox 4 of scroll area 1 of window "Réglages du Finder"
				set desktopSidbar to 0
				delay 0.5
			else
				set desktopSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set desktopSidbar to 1
		end try
		
		try
			if value of checkbox 5 of scroll area 1 of window "Réglages du Finder" = 0 then
				click checkbox 5 of scroll area 1 of window "Réglages du Finder"
				set documentsSidbar to 0
				delay 0.5
			else
				set documentsSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set documentsSidbar to 1
		end try
		
		try
			if value of checkbox 6 of scroll area 1 of window "Réglages du Finder" = 0 then
				click checkbox 6 of scroll area 1 of window "Réglages du Finder"
				set downloadsSidbar to 0
				delay 0.5
			else
				set downloadsSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set downloadsSidbar to 1
		end try
		
		try
			if value of checkbox 7 of scroll area 1 of window "Réglages du Finder" = 0 then
				click checkbox 7 of scroll area 1 of window "Réglages du Finder"
				set videosSidbar to 0
				delay 0.5
			else
				set videosSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set videosSidbar to 1
		end try
		
		try
			if value of checkbox 8 of scroll area 1 of window "Réglages du Finder" = 1 then
				click checkbox 8 of scroll area 1 of window "Réglages du Finder"
				set musicSidbar to 0
				delay 0.5
			else
				set musicSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set musicSidbar to 1
		end try
		
		try
			if value of checkbox 9 of scroll area 1 of window "Réglages du Finder" = 1 then
				click checkbox 9 of scroll area 1 of window "Réglages du Finder"
				set imagesSidbar to 0
				delay 0.5
			else
				set imagesSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set imagesSidbar to 1
		end try
		
		try
			if value of checkbox 10 of scroll area 1 of window "Réglages du Finder" = 0 then
				click checkbox 10 of scroll area 1 of window "Réglages du Finder"
				set homeSidbar to 0
				delay 0.5
			else
				set homeSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set homeSidbar to 1
		end try
		
		-- iCloud
		
		try
			if value of checkbox 11 of scroll area 1 of window "Réglages du Finder" = 0 then
				click checkbox 11 of scroll area 1 of window "Réglages du Finder"
				set icloudDriveSidbar to 0
				delay 0.5
			else
				set icloudDriveSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set icloudDriveSidbar to 1
		end try
		
		try
			if value of checkbox 12 of scroll area 1 of window "Réglages du Finder" = 0 then
				click checkbox 12 of scroll area 1 of window "Réglages du Finder"
				set sharedFolderSidbar to 0
				delay 0.5
			else
				set sharedFolderSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set sharedFolderSidbar to 1
		end try
		
		-- Locations
		
		try
			if value of checkbox 13 of scroll area 1 of window "Réglages du Finder" = 1 then
				click checkbox 13 of scroll area 1 of window "Réglages du Finder"
				set nameMacSidbar to 0
				delay 0.5
			else
				set nameMacSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set nameMacSidbar to 1
		end try
		
		try
			if value of checkbox 14 of scroll area 1 of window "Réglages du Finder" = 0 then
				click checkbox 14 of scroll area 1 of window "Réglages du Finder"
				set internalDisksSidbar to 0
				delay 0.5
			else
				set internalDisksSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set internalDisksSidbar to 1
		end try
		
		try
			if value of checkbox 15 of scroll area 1 of window "Réglages du Finder" = 0 then
				click checkbox 15 of scroll area 1 of window "Réglages du Finder"
				set externalDrivesSidbar to 0
				delay 0.5
			else
				set externalDrivesSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set externalDrivesSidbar to 1
		end try
		
		try
			if value of checkbox 16 of scroll area 1 of window "Réglages du Finder" = 0 then
				click checkbox 16 of scroll area 1 of window "Réglages du Finder"
				set cdDvdAndIosDevicesSidbar to 0
				delay 0.5
			else
				set cdDvdAndIosDevicesSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set cdDvdAndIosDevicesSidbar to 1
		end try
		
		try
			if value of checkbox 17 of scroll area 1 of window "Réglages du Finder" = 0 then
				click checkbox 17 of scroll area 1 of window "Réglages du Finder"
				set storageInICloudSidbar to 0
				delay 0.5
			else
				set storageInICloudSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set storageInICloudSidbar to 1
		end try
		
		try
			if value of checkbox 18 of scroll area 1 of window "Réglages du Finder" = 1 then
				click checkbox 18 of scroll area 1 of window "Réglages du Finder"
				set computerHelloSidbar to 0
				delay 0.5
			else
				set computerHelloSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set computerHelloSidbar to 1
		end try
		
		try
			if value of checkbox 19 of scroll area 1 of window "Réglages du Finder" = 0 then
				click checkbox 19 of scroll area 1 of window "Réglages du Finder"
				set connectedServersSidbar to 0
				delay 0.5
			else
				set connectedServersSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set connectedServersSidbar to 1
		end try
		
		-- Tags
		
		try
			if value of checkbox 20 of scroll area 1 of window "Réglages du Finder" = 0 then
				click checkbox 20 of scroll area 1 of window "Réglages du Finder"
				set recentTagsSidbar to 0
				delay 0.5
			else
				set recentTagsSidbar to 0
			end if
		on error
			-- Log the error or handle it as needed
			set recentTagsSidbar to 1
		end try
		
		-- Advanced options tab ------------------------------------------------------
		
		try
			click button "Options avancées" of toolbar 1 of window "Réglages du Finder"
			set advancedOptionsTab to 0
		on error
			-- Log the error or handle it as needed
			set advancedOptionsTab to 1
		end try
		
		try
			if value of checkbox "Afficher toutes les extensions de fichiers" of window "Réglages du Finder" = 0 then
				click checkbox "Afficher toutes les extensions de fichiers" of window "Réglages du Finder"
				set showAllFileExtensions to 0
				delay 0.5
			else
				set showAllFileExtensions to 0
			end if
		on error
			-- Log the error or handle it as needed
			set showAllFileExtensions to 1
		end try
		
		try
			if value of checkbox "Avertir avant de modifier une extension" of window "Réglages du Finder" = 1 then
				click checkbox "Avertir avant de modifier une extension" of window "Réglages du Finder"
				set WarnBeforeModifyingAnExtension to 0
				delay 0.5
			else
				set WarnBeforeModifyingAnExtension to 0
			end if
		on error
			-- Log the error or handle it as needed
			set WarnBeforeModifyingAnExtension to 1
		end try
		
		try
			if value of checkbox "Avertir avant de supprimer d’iCloud Drive" of window "Réglages du Finder" = 0 then
				click checkbox "Avertir avant de supprimer d’iCloud Drive" of window "Réglages du Finder"
				set warnBeforeDeletingFromICloudDrive to 0
				delay 0.5
			else
				set warnBeforeDeletingFromICloudDrive to 0
			end if
		on error
			-- Log the error or handle it as needed
			set warnBeforeDeletingFromICloudDrive to 1
		end try
		
		try
			if value of checkbox "Avertir avant de vider la corbeille" of window "Réglages du Finder" = 0 then
				click checkbox "Avertir avant de vider la corbeille" of window "Réglages du Finder"
				set warnBeforeEmptyingTheTrash to 0
				delay 0.5
			else
				set warnBeforeEmptyingTheTrash to 0
			end if
		on error
			-- Log the error or handle it as needed
			set warnBeforeEmptyingTheTrash to 1
		end try
		
		try
			if value of checkbox "Supprimer les éléments de la corbeille après 30 jours" of window "Réglages du Finder" = 0 then
				click checkbox "Supprimer les éléments de la corbeille après 30 jours" of window "Réglages du Finder"
				set removeTheElementsOfTheTrashAfter30Days to 0
				delay 0.5
			else
				set removeTheElementsOfTheTrashAfter30Days to 0
			end if
		on error
			-- Log the error or handle it as needed
			set removeTheElementsOfTheTrashAfter30Days to 1
		end try
		
		-- Leave the files at the top
		
		try
			if value of checkbox "Dans les fenêtres lors du tri par nom" of window "Réglages du Finder" = 0 then
				click checkbox "Dans les fenêtres lors du tri par nom" of window "Réglages du Finder"
				set leaveTheFilesAtTheTopInWindowsDuringSortingByName to 0
				delay 0.5
			else
				set leaveTheFilesAtTheTopInWindowsDuringSortingByName to 0
			end if
		on error
			-- Log the error or handle it as needed
			set leaveTheFilesAtTheTopInWindowsDuringSortingByName to 1
		end try
		
		try
			if value of checkbox "Sur le bureau" of window "Réglages du Finder" = 0 then
				click checkbox "Sur le bureau" of window "Réglages du Finder"
				set inLeaveTheFilesAtTheTopOnTheDesk to 0
				delay 0.5
			else
				set inLeaveTheFilesAtTheTopOnTheDesk to 0
			end if
		on error
			-- Log the error or handle it as needed
			set inLeaveTheFilesAtTheTopOnTheDesk to 1
		end try
		
		-- By doing a search
		
		try
			tell window "Réglages du Finder"
				click pop up button "En effectuant une recherche :"
				delay 0.5
				click menu item "Rechercher dans le dossier actuel" of menu 1 of pop up button "En effectuant une recherche :"
				set newFinderwindowsDisplay to 0
			end tell
		on error
			-- Log the error or handle it as needed
			set newFinderwindowsDisplay to 1
		end try
		
		-- Close Settings...
		click button 1 of window "Réglages du Finder"
		
	end tell
end tell

do shell script "echo generalTab=\"" & generalTab & "\" >> /tmp/output"
do shell script "echo internalDisks=\"" & internalDisks & "\" >> /tmp/output"
do shell script "echo externalDrives=\"" & externalDrives & "\" >> /tmp/output"
do shell script "echo cdDvdAndIosDevices=\"" & cdDvdAndIosDevices & "\" >> /tmp/output"
do shell script "echo connectedServers=\"" & connectedServers & "\" >> /tmp/output"
do shell script "echo newFinderwindowsDisplay=\"" & newFinderwindowsDisplay & "\" >> /tmp/output"
do shell script "echo openFoldersInTabs=\"" & openFoldersInTabs & "\" >> /tmp/output"

do shell script "echo sidebarTab=\"" & sidebarTab & "\" >> /tmp/output"
do shell script "echo recentSidbar=\"" & recentSidbar & "\" >> /tmp/output"
do shell script "echo airDropSidbar=\"" & airDropSidbar & "\" >> /tmp/output"
do shell script "echo applicationsSidbar=\"" & applicationsSidbar & "\" >> /tmp/output"
do shell script "echo desktopSidbar=\"" & desktopSidbar & "\" >> /tmp/output"
do shell script "echo documentsSidbar=\"" & documentsSidbar & "\" >> /tmp/output"
do shell script "echo downloadsSidbar=\"" & downloadsSidbar & "\" >> /tmp/output"
do shell script "echo videosSidbar=\"" & videosSidbar & "\" >> /tmp/output"
do shell script "echo musicSidbar=\"" & musicSidbar & "\" >> /tmp/output"
do shell script "echo imagesSidbar=\"" & imagesSidbar & "\" >> /tmp/output"
do shell script "echo homeSidbar=\"" & homeSidbar & "\" >> /tmp/output"
do shell script "echo icloudDriveSidbar=\"" & icloudDriveSidbar & "\" >> /tmp/output"
do shell script "echo sharedFolderSidbar=\"" & sharedFolderSidbar & "\" >> /tmp/output"
do shell script "echo nameMacSidbar=\"" & nameMacSidbar & "\" >> /tmp/output"
do shell script "echo internalDisksSidbar=\"" & internalDisksSidbar & "\" >> /tmp/output"
do shell script "echo externalDrivesSidbar=\"" & externalDrivesSidbar & "\" >> /tmp/output"
do shell script "echo cdDvdAndIosDevicesSidbar=\"" & cdDvdAndIosDevicesSidbar & "\" >> /tmp/output"
do shell script "echo storageInICloudSidbar=\"" & storageInICloudSidbar & "\" >> /tmp/output"
do shell script "echo computerHelloSidbar=\"" & computerHelloSidbar & "\" >> /tmp/output"
do shell script "echo connectedServersSidbar=\"" & connectedServersSidbar & "\" >> /tmp/output"
do shell script "echo recentTagsSidbar=\"" & recentTagsSidbar & "\" >> /tmp/output"

do shell script "echo advancedOptionsTab=\"" & advancedOptionsTab & "\" >> /tmp/output"
do shell script "echo showAllFileExtensions=\"" & showAllFileExtensions & "\" >> /tmp/output"
do shell script "echo WarnBeforeModifyingAnExtension=\"" & WarnBeforeModifyingAnExtension & "\" >> /tmp/output"
do shell script "echo warnBeforeDeletingFromICloudDrive=\"" & warnBeforeDeletingFromICloudDrive & "\" >> /tmp/output"
do shell script "echo warnBeforeEmptyingTheTrash=\"" & warnBeforeEmptyingTheTrash & "\" >> /tmp/output"
do shell script "echo removeTheElementsOfTheTrashAfter30Days=\"" & removeTheElementsOfTheTrashAfter30Days & "\" >> /tmp/output"
do shell script "echo leaveTheFilesAtTheTopInWindowsDuringSortingByName=\"" & leaveTheFilesAtTheTopInWindowsDuringSortingByName & "\" >> /tmp/output"
do shell script "echo inLeaveTheFilesAtTheTopOnTheDesk=\"" & inLeaveTheFilesAtTheTopOnTheDesk & "\" >> /tmp/output"
do shell script "echo newFinderwindowsDisplay=\"" & newFinderwindowsDisplay & "\" >> /tmp/output"
