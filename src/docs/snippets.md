# Snippets

## Get UI Elements "Finder" "App Store" macos

Version 1

```applescript
tell application "System Events"
	tell application process "Finder"
		tell (first window whose subrole is "AXStandardWindow")
			set uiElems to entire contents
		end tell
	end tell
end tell
```

Version 2

```applescript
tell application "System Events"
	tell front window of process "App Store"
		set uiElems to entire contents
	end tell
end tell
```

## Get Pane macos

Version 1

```applescript
tell application "System Settings"
	get every anchor of current pane
end tell
```

## Get Process macos

Version 1

```applescript
tell application "System Events"
	get every process
end tell
```

## Get Properties macos

Version 1

```applescript
tell application "System Events"
	get properties
end tell
```

## Get menu bar "Finder" macos

Version 1

```applescript
tell application "System Events"
	tell process "Finder"
		get every menu bar
		
		tell menu bar 1
			get every menu bar item
			
			get every menu of every menu bar item
			
			get every menu item of every menu of every menu bar item
			
			get every menu of every menu item of every menu of every menu bar item
			
			get every menu item of every menu of every menu item of every menu of every menu bar item
		end tell
	end tell
end tell
```

## Get menu bar "App Store" macos

Version 1

```applescript
tell application "System Events"
	tell process "App Store"
		get every menu bar
		tell menu bar 1
			
			get every menu bar item
			
			get every menu of every menu bar item
			
			get every menu item of every menu of every menu bar item
			
			get every menu of every menu item of every menu of every menu bar item
			
			get every menu item of every menu of every menu item of every menu of every menu bar item
		end tell
	end tell
end tell
```

## Get attribute of every UI element macos

Version 1

```applescript
get attribute of every button of UI element 1
	of scroll area 2 of group 1 of group 2 of splitter group 1 of group 1 of window 1
```

## Get UI element macos

Version 1

```applescript
tell application "System Events"
	tell application process "Notes"
	
		get UI element of group 1 of window "Réglages"
		
	end tell
end tell
```

Version 2

```applescript
tell application "System Events"
	tell application process "Notes"
	
		click menu item 24 of menu 1 of menu bar item 5 of menu bar 1
		get UI element of group 1 of window "desktop"

	end tell
end tell
```

## Closing the current space macos

Version 1

```applescript
tell application "Mission Control" to launch
delay 0.25
tell application "System Events"
	tell list 1 of group 2 of group 1 of group 1 of process "Dock"
		set countSpaces to count of buttons
		if countSpaces is greater than 1 then
			perform action "AXRemoveDesktop" of button countSpaces
		end if
	end tell
	delay 0.6
	key code 53 --  # Esc key on US English Keyboard
end tell
```

## Creating a new space macos

Version 1

```applescript
do shell script "open -b 'com.apple.exposelauncher'"
delay 0.2
tell application id "com.apple.systemevents"
	tell (every application process ¬
		whose bundle identifier = "com.apple.dock") to ¬
		click (button 1 of group 2 of group 1 of group 1)
	delay 0.2
	key code 53 -- esc key
end tell
```
