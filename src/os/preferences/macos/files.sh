#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_subtitle "Files"

# Get the default app id for .sh files
# defaults read ~/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist
# duti -x sh

# https
execute "duti -s com.brave.browser .https all" \
    "duti -s com.brave.browser .https all"

# .http
execute "duti -s com.brave.browser .http all" \
    "duti -s com.brave.browser .http all"

# .html
execute "duti -s com.microsoft.VSCode .html all" \
    "duti -s com.microsoft.VSCode .html all"

# .jpeg
execute "duti -s com.adobe.Photoshop .jpeg all" \
    "duti -s com.adobe.Photoshop .jpeg all"

# .json
execute "duti -s com.microsoft.VSCode .json all" \
    "duti -s com.microsoft.VSCode .json all"

# .md
execute "duti -s com.microsoft.VSCode .md all" \
    "duti -s com.microsoft.VSCode .md all"

# .pdf
execute "duti -s com.adobe.Acrobat.Pro .pdf all" \
    "duti -s com.adobe.Acrobat.Pro .pdf all"

# .php
execute "duti -s com.microsoft.VSCode .php all" \
    "duti -s com.microsoft.VSCode .php all"

# .png
execute "duti -s com.adobe.Photoshop .png all" \
    "duti -s com.adobe.Photoshop .png all"

# .sh
execute "duti -s com.microsoft.VSCode .sh all" \
    "duti -s com.microsoft.VSCode .sh all"

# .txt
execute "duti -s com.apple.textedit .txt all" \
    "duti -s com.apple.textedit .txt all"

# .xhtml
execute "duti -s com.microsoft.VSCode .xhtml all" \
    "duti -s com.microsoft.VSCode .xhtml all"

# .yaml
execute "duti -s com.microsoft.VSCode .yaml all" \
    "duti -s com.microsoft.VSCode .yaml all"
