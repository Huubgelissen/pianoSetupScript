set outputBT to 2
set outputUSB to 4

tell application "System Preferences"
	activate
	set current pane to pane "com.apple.preference.sound"
end tell

tell application "System Events"
	tell application process "System Preferences"
		repeat until exists tab group 1 of window "Sound"
		end repeat
		tell tab group 1 of window "Sound"
			set selected of row outputUSB of table 1 of scroll area 1 to true
		end tell
	end tell
end tell

tell application "System Preferences"
	quit
end tell

tell application "Audio MIDI Setup"
	activate
end tell



tell application "System Events"
	tell process "Audio MIDI Setup"
		#set itemList to name of every menu item of menu 1 of menu bar item "MIDI Studio" of menu bar 1
		#set itemList to name of menu item 13 of menu 1 of menu bar item "MIDI Studio" of menu bar 1
		tell menu item 13 of menu 1 of menu bar item "MIDI Studio" of menu bar 1
			if name is "Open Bluetooth Configuration�" then click
		end tell
		
		if (click button "Connect" of UI element 3 of row 1 of table 1 of scroll area 1 of window "Bluetooth Configuration") exists then
			click button "Connect" of UI element 3 of row 1 of table 1 of scroll area 1 of window "Bluetooth Configuration"
		end if
		
		
		#set itemList to entire contents of scroll area 1 of window "Bluetooth configuration"
		#set itemList to entire contents of window "Bluetooth Configuration"
		
	end tell
end tell

tell application "CFX Concert Grand"
	activate
end tell

tell application "System Events"
	tell process "CFX Concert Grand"
		#set itemList to entire contents of window "Garritan CFX Concert Grand"
		
		#set itemList to name of every menu item of menu 1 of menu bar item 2 of menu bar 1
		#set itemList to name of menu item 4 of menu 1 of menu bar item 2 of menu bar 1
		repeat until exists of menu item 4 of menu 1 of menu bar item 2 of menu bar 1
			delay 0.1
		end repeat
		click menu item 4 of menu 1 of menu bar item 2 of menu bar 1
		
		#set itemList to entire contents of window "Preferences"
		#set itemList to entire contents of table 1 of scroll area 1 of window "Preferences"
		set midiInputCheckbox to checkbox "Bluetooth Kawai Musical Instruments Manufacturing Co., Ltd. Kawai Piano(in)" of row 1 of table 1 of scroll area 1 of window "Preferences"
		tell midiInputCheckbox
			set checkboxStatus to value of midiInputCheckbox as boolean
			if checkboxStatus is false then click midiInputCheckbox
		end tell
		
		#set itemList to entire contents of window "Preferences"
		click pop up button 1 of window "Preferences" of application process "CFX Concert Grand" of application "System Events"
		click menu item "D50s " of menu 1 of pop up button 1 of window "Preferences" of application process "CFX Concert Grand" of application "System Events"
		click button "OK" of window "Preferences" of application process "CFX Concert Grand" of application "System Events"
	end tell
end tell