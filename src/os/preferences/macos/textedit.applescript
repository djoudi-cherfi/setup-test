#!/usr/bin/env osascript

set newDocumentTab to 1
set formatText to 1
set fitToPage to 1
set policeText to 1
set policeRtf to 1
set showRule to 1
set checkSpellingWhenTyping to 1
set checkGrammarAndSpelling to 1
set correctSpellingAutomatically to 1
set smartQuotes to 1
set smartHyphens to 1
set smartLinks to 1
set textReplacement to 1
set dataDetection to 1
set smartCopyAndPaste to 1
set smartQuotesAndHyphensOnlyInRTFDocuments to 1
set checkAndCorrectSpellingOnlyInRTFDocuments to 1
set openingAndRegisteringTab to 1
set showRTFFilesAsRTFCodeAndNotFormattedText to 1
set showHTMLFilesAsHTMLCodeNotFormattedText to 1
set addAnExtension to 1
set whenOpeningFiles to 1
set whenSavingFiles to 1
set documentType to 1
set stylesheet to 1
set encoding to 1
set preserveSpaces to 1

tell application "System Events"
	
	-- Activate the TextEdit application
	tell application "TextEdit"
		activate
	end tell
	
	-- Interact with the TextEdit UI
	tell application process "TextEdit"
		
		-- Wait until the TextEdit process is frontmost
		repeat until frontmost
			delay 0.5
		end repeat
		
		-- Settings... from the TextEdit menu
		try
			click menu item "Réglages…" of menu 1 of menu bar item "TextEdit" of menu bar 1
			delay 0.5
		on error
			error "Menu to open the Settings window"
		end try
		
		-- New document
		try
			click radio button "Nouveau document" of tab group 1 of window "Réglages"
			set newDocumentTab to 0
			delay 0.5
		on error
			-- Log the error or handle it as needed
			set newDocumentTab to 1
		end try
		
		-- Format Text
		try
			click radio button "Format Texte" of radio group 1 of tab group 1 of window "Réglages"
			set formatText to 0
		on error
			-- Log the error or handle it as needed
			set formatText to 1
		end try
		
		-- Fit to page
		try
			if value of checkbox "Adapter à la page" of tab group 1 of window "Réglages" = 1 then
				click checkbox "Adapter à la page" of tab group 1 of window "Réglages"
				set fitToPage to 0
				delay 0.2
			else
				set fitToPage to 0
			end if
		on error
			-- Log the error or handle it as needed
			set fitToPage to 1
		end try
		
		-- Police Text
		try
			click button 1 of tab group 1 of window "Réglages"
			set value of value indicator 1 of slider 1 of group 1 of group 1 of splitter group 1 of window "Polices" to 18
			delay 0.5
			click button 1 of window "Polices"
			set policeText to 0
			delay 0.5
		on error
			-- Log the error or handle it as needed
			set policeText to 1
		end try
		
		-- Police RTF
		try
			click button 2 of tab group 1 of window "Réglages"
			set value of value indicator 1 of slider 1 of group 1 of group 1 of splitter group 1 of window "Polices" to 18
			delay 0.5
			click button 1 of window "Polices"
			set policeRtf to 0
			delay 0.5
		on error
			-- Log the error or handle it as needed
			set policeRtf to 1
		end try
		
		-- Check spelling when typing
		try
			if value of checkbox "Vérifier l’orthographe lors de la saisie" of tab group 1 of window "Réglages" = 0 then
				click checkbox "Vérifier l’orthographe lors de la saisie" of tab group 1 of window "Réglages"
				set checkSpellingWhenTyping to 0
				delay 0.2
			else
				set checkSpellingWhenTyping to 0
			end if
		on error
			-- Log the error or handle it as needed
			set checkSpellingWhenTyping to 1
		end try
		
		-- Check grammar and spelling
		try
			if value of checkbox "Vérifier la grammaire et l’orthographe " of tab group 1 of window "Réglages" = 0 then
				click checkbox "Vérifier la grammaire et l’orthographe " of tab group 1 of window "Réglages"
				set checkGrammarAndSpelling to 0
				delay 0.2
			else
				set checkGrammarAndSpelling to 0
			end if
		on error
			-- Log the error or handle it as needed
			set checkGrammarAndSpelling to 1
		end try
		
		-- Correct spelling automatically
		try
			if value of checkbox "Corriger l’orthographe automatiquement" of tab group 1 of window "Réglages" = 0 then
				click checkbox "Corriger l’orthographe automatiquement" of tab group 1 of window "Réglages"
				set correctSpellingAutomatically to 0
				delay 0.2
			else
				set correctSpellingAutomatically to 0
			end if
		on error
			-- Log the error or handle it as needed
			set correctSpellingAutomatically to 1
		end try
		
		-- Show rule
		try
			if value of checkbox "Afficher la règle" of tab group 1 of window "Réglages" = 0 then
				click checkbox "Afficher la règle" of tab group 1 of window "Réglages"
				set showRule to 0
				delay 0.2
			else
				set showRule to 0
			end if
		on error
			-- Log the error or handle it as needed
			set showRule to 1
		end try
		
		-- Data detection
		try
			if value of checkbox "Détection de données" of tab group 1 of window "Réglages" = 0 then
				click checkbox "Détection de données" of tab group 1 of window "Réglages"
				set dataDetection to 0
				delay 0.2
			else
				set dataDetection to 0
			end if
		on error
			-- Log the error or handle it as needed
			set dataDetection to 1
		end try
		
		-- Smart quotes and hyphens only in RTF documents
		try
			if value of checkbox "Guillemets intelligents et tirets uniquement dans les documents RTF" of tab group 1 of window "Réglages" = 0 then
				click checkbox "Guillemets intelligents et tirets uniquement dans les documents RTF" of tab group 1 of window "Réglages"
				set smartQuotesAndHyphensOnlyInRTFDocuments to 0
				delay 0.2
			else
				set smartQuotesAndHyphensOnlyInRTFDocuments to 0
			end if
		on error
			-- Log the error or handle it as needed
			set smartQuotesAndHyphensOnlyInRTFDocuments to 1
		end try
		
		-- Check and correct spelling only in RTF documents
		try
			if value of checkbox "Vérifier et corriger l’orthographe uniquement dans les documents RTF" of tab group 1 of window "Réglages" = 1 then
				click checkbox "Vérifier et corriger l’orthographe uniquement dans les documents RTF" of tab group 1 of window "Réglages"
				set checkAndCorrectSpellingOnlyInRTFDocuments to 0
				delay 0.2
			else
				set checkAndCorrectSpellingOnlyInRTFDocuments to 0
			end if
		on error
			-- Log the error or handle it as needed
			set checkAndCorrectSpellingOnlyInRTFDocuments to 1
		end try
		
		-- Smart copy and paste
		try
			if value of checkbox "Copier-coller intelligent" of tab group 1 of window "Réglages" = 0 then
				click checkbox "Copier-coller intelligent" of tab group 1 of window "Réglages"
				set smartCopyAndPaste to 0
				delay 0.2
			else
				set smartCopyAndPaste to 0
			end if
		on error
			-- Log the error or handle it as needed
			set smartCopyAndPaste to 1
		end try
		
		-- Smart quotes
		try
			if value of checkbox "Guillemets intelligents" of tab group 1 of window "Réglages" = 0 then
				click checkbox "Guillemets intelligents" of tab group 1 of window "Réglages"
				set smartQuotes to 0
				delay 0.2
			else
				set smartQuotes to 0
			end if
		on error
			-- Log the error or handle it as needed
			set smartQuotes to 1
		end try
		
		-- Smart hyphens
		try
			if value of checkbox "Tirets intelligents" of tab group 1 of window "Réglages" = 0 then
				click checkbox "Tirets intelligents" of tab group 1 of window "Réglages"
				set smartHyphens to 0
				delay 0.2
			else
				set smartHyphens to 0
			end if
		on error
			-- Log the error or handle it as needed
			set smartHyphens to 1
		end try
		
		-- Smart Links
		try
			if value of checkbox "Liens intelligents" of tab group 1 of window "Réglages" = 1 then
				click checkbox "Liens intelligents" of tab group 1 of window "Réglages"
				set smartLinks to 0
				delay 0.2
			else
				set smartLinks to 0
			end if
		on error
			-- Log the error or handle it as needed
			set smartLinks to 1
		end try
		
		-- Text replacement
		try
			if value of checkbox "Remplacement de texte" of tab group 1 of window "Réglages" = 0 then
				click checkbox "Remplacement de texte" of tab group 1 of window "Réglages"
				set textReplacement to 0
				delay 0.2
			else
				set textReplacement to 0
			end if
		on error
			-- Log the error or handle it as needed
			set textReplacement to 1
		end try
		
		-- Opening and registering
		try
			click radio button "Ouverture et enregistrement" of tab group 1 of window "Réglages"
			set openingAndRegisteringTab to 0
			delay 0.5
		on error
			-- Log the error or handle it as needed
			set openingAndRegisteringTab to 1
		end try
		
		-- Show RTF files as RTF code and not formatted text
		try
			if value of checkbox "Afficher les fichiers RTF sous forme de code RTF et non de texte formaté" of tab group 1 of window "Réglages" = 0 then
				click checkbox "Afficher les fichiers RTF sous forme de code RTF et non de texte formaté" of tab group 1 of window "Réglages"
				set showRTFFilesAsRTFCodeAndNotFormattedText to 0
				delay 0.2
			else
				set showRTFFilesAsRTFCodeAndNotFormattedText to 0
			end if
		on error
			-- Log the error or handle it as needed
			set showRTFFilesAsRTFCodeAndNotFormattedText to 1
		end try
		
		-- Show HTML files as HTML code, not formatted text
		try
			if value of checkbox "Afficher les fichiers HTML sous forme de code HTML et non de texte formaté" of tab group 1 of window "Réglages" = 0 then
				click checkbox "Afficher les fichiers HTML sous forme de code HTML et non de texte formaté" of tab group 1 of window "Réglages"
				set showHTMLFilesAsHTMLCodeNotFormattedText to 0
				delay 0.2
			else
				set showHTMLFilesAsHTMLCodeNotFormattedText to 0
			end if
		on error
			-- Log the error or handle it as needed
			set showHTMLFilesAsHTMLCodeNotFormattedText to 1
		end try
		
		-- Add a “.txt” extension
		try
			if value of checkbox "Ajouter une extension « .txt » aux fichiers au format Texte" of tab group 1 of window "Réglages" = 0 then
				click checkbox "Ajouter une extension « .txt » aux fichiers au format Texte" of tab group 1 of window "Réglages"
				set addAnExtension to 0
				delay 0.2
			else
				set addAnExtension to 0
			end if
		on error
			-- Log the error or handle it as needed
			set addAnExtension to 1
		end try
		
		-- When opening files
		try
			tell window "Réglages"
				click pop up button "À l’ouverture des fichiers :" of tab group 1
				delay 0.5
				click menu item "Automatique" of menu 1 of pop up button "À l’ouverture des fichiers :" of tab group 1
				set whenOpeningFiles to 0
				delay 0.5
			end tell
		on error
			-- Log the error or handle it as needed
			set whenOpeningFiles to 1
		end try
		
		-- When saving files
		try
			tell window "Réglages"
				click pop up button "À l’enregistrement des fichiers :" of tab group 1
				delay 0.5
				click menu item "Automatique" of menu 1 of pop up button "À l’enregistrement des fichiers :" of tab group 1
				set whenSavingFiles to 0
				delay 0.5
			end tell
		on error
			-- Log the error or handle it as needed
			set whenSavingFiles to 1
		end try
		
		-- Document type
		try
			tell window "Réglages"
				click pop up button "Type de document :" of tab group 1
				delay 0.5
				click menu item "HTML 4.01 Strict" of menu 1 of pop up button "Type de document :" of tab group 1
				set documentType to 0
				delay 0.5
			end tell
		on error
			-- Log the error or handle it as needed
			set documentType to 1
		end try
		
		-- Stylesheet
		try
			tell window "Réglages"
				click pop up button "Style :" of tab group 1
				delay 0.5
				click menu item "Feuille de style interne" of menu 1 of pop up button "Style :" of tab group 1
				set stylesheet to 0
				delay 0.5
			end tell
		on error
			-- Log the error or handle it as needed
			set stylesheet to 1
		end try
		
		-- Encoding
		try
			tell window "Réglages"
				click pop up button "Encodage :" of tab group 1
				delay 0.5
				click menu item "Unicode (UTF-8)" of menu 1 of pop up button "Encodage :" of tab group 1
				set encoding to 0
				delay 0.5
			end tell
		on error
			-- Log the error or handle it as needed
			set encoding to 1
		end try
		
		-- Preserve spaces
		try
			if value of checkbox "Conserver les espaces" of tab group 1 of window "Réglages" = 0 then
				click checkbox "Conserver les espaces" of tab group 1 of window "Réglages"
				set preserveSpaces to 0
				delay 0.2
			else
				set preserveSpaces to 0
			end if
		on error
			-- Log the error or handle it as needed
			set preserveSpaces to 1
		end try
		
		-- Close Settings...
		click button 2 of window "Réglages"
		
		delay 1
		
		-- Exit TextEdit
		click menu item "Quitter TextEdit" of menu 1 of menu bar item "TextEdit" of menu bar 1
		
	end tell
end tell

do shell script "echo newDocumentTab=\"" & newDocumentTab & "\" >> /tmp/output"
do shell script "echo formatText=\"" & formatText & "\" >> /tmp/output"
do shell script "echo fitToPage=\"" & fitToPage & "\" >> /tmp/output"
do shell script "echo policeText=\"" & policeText & "\" >> /tmp/output"
do shell script "echo policeRtf=\"" & policeRtf & "\" >> /tmp/output"
do shell script "echo showRule=\"" & showRule & "\" >> /tmp/output"
do shell script "echo checkSpellingWhenTyping=\"" & checkSpellingWhenTyping & "\" >> /tmp/output"
do shell script "echo checkGrammarAndSpelling=\"" & checkGrammarAndSpelling & "\" >> /tmp/output"
do shell script "echo correctSpellingAutomatically=\"" & correctSpellingAutomatically & "\" >> /tmp/output"
do shell script "echo smartQuotes=\"" & smartQuotes & "\" >> /tmp/output"
do shell script "echo smartHyphens=\"" & smartHyphens & "\" >> /tmp/output"
do shell script "echo smartLinks=\"" & smartLinks & "\" >> /tmp/output"
do shell script "echo textReplacement=\"" & textReplacement & "\" >> /tmp/output"
do shell script "echo dataDetection=\"" & dataDetection & "\" >> /tmp/output"
do shell script "echo smartCopyAndPaste=\"" & smartCopyAndPaste & "\" >> /tmp/output"
do shell script "echo smartQuotesAndHyphensOnlyInRTFDocuments=\"" & smartQuotesAndHyphensOnlyInRTFDocuments & "\" >> /tmp/output"
do shell script "echo checkAndCorrectSpellingOnlyInRTFDocuments=\"" & checkAndCorrectSpellingOnlyInRTFDocuments & "\" >> /tmp/output"
do shell script "echo openingAndRegisteringTab=\"" & openingAndRegisteringTab & "\" >> /tmp/output"
do shell script "echo showRTFFilesAsRTFCodeAndNotFormattedText=\"" & showRTFFilesAsRTFCodeAndNotFormattedText & "\" >> /tmp/output"
do shell script "echo showHTMLFilesAsHTMLCodeNotFormattedText=\"" & showHTMLFilesAsHTMLCodeNotFormattedText & "\" >> /tmp/output"
do shell script "echo addAnExtension=\"" & addAnExtension & "\" >> /tmp/output"
do shell script "echo whenOpeningFiles=\"" & whenOpeningFiles & "\" >> /tmp/output"
do shell script "echo whenSavingFiles=\"" & whenSavingFiles & "\" >> /tmp/output"
do shell script "echo documentType=\"" & documentType & "\" >> /tmp/output"
do shell script "echo stylesheet=\"" & stylesheet & "\" >> /tmp/output"
do shell script "echo encoding=\"" & encoding & "\" >> /tmp/output"
do shell script "echo preserveSpaces=\"" & preserveSpaces & "\" >> /tmp/output"
