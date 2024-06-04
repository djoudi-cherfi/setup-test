#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "TextEdit"

touch "/tmp/output"

execute "./textedit.applescript" "Run textedit.applescript"

OUTPUT_FILE="/tmp/output"

while IFS='=' read -r key value; do
    
    case "$key" in
        newDocumentTab)
            print_result "$value" "New document tab"
            ;;
        formatText)
            print_result "$value" "Format text"
            ;;
        fitToPage)
            print_result "$value" "Fit to page"
            ;;
        policeText)
            print_result "$value" "Police text"
            ;;
        policeRtf)
            print_result "$value" "Police rtf"
            ;;
        showRule)
            print_result "$value" "Show rule"
            ;;
        checkSpellingWhenTyping)
            print_result "$value" "Check spelling when typing"
            ;;
        checkGrammarAndSpelling)
            print_result "$value" "Check grammar and spelling"
            ;;
        correctSpellingAutomatically)
            print_result "$value" "Correct spelling automatically"
            ;;
        smartQuotes)
            print_result "$value" "Smart quotes"
            ;;
        smartHyphens)
            print_result "$value" "Smart hyphens"
            ;;
        smartLinks)
            print_result "$value" "Smart links"
            ;;
        textReplacement)
            print_result "$value" "Text replacement"
            ;;
        dataDetection)
            print_result "$value" "Data detection"
            ;;
        smartCopyAndPaste)
            print_result "$value" "Smart copy and paste"
            ;;
        smartQuotesAndHyphensOnlyInRTFDocuments)
            print_result "$value" "Smart quotes and hyphens only in rtf documents"
            ;;
        checkAndCorrectSpellingOnlyInRTFDocuments)
            print_result "$value" "Check and correct spelling only in rtf documents"
            ;;
        openingAndRegisteringTab)
            print_result "$value" "Opening and registering tab"
            ;;
        addAnExtension)
            print_result "$value" "Add an extension"
            ;;
        showRTFFilesAsRTFCodeAndNotFormattedText)
            print_result "$value" "Show rtf files as rtf code and not formatted text"
            ;;
        showHTMLFilesAsHTMLCodeNotFormattedText)
            print_result "$value" "Show html files as html code not formatted text"
            ;;
        whenOpeningFiles)
            print_result "$value" "When opening files"
            ;;
        whenSavingFiles)
            print_result "$value" "When saving files"
            ;;
        documentType)
            print_result "$value" "Document type"
            ;;
        stylesheet)
            print_result "$value" "Stylesheet"
            ;;
        encoding)
            print_result "$value" "Encoding"
            ;;
        preserveSpaces)
            print_result "$value" "Preserve spaces"
            ;;
        *)
            echo "Unknown key: $key"
            ;;
    esac

done < "$OUTPUT_FILE"

rm -rf ""/tmp/output""
