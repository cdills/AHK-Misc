#Persistent
#NoTrayIcon
GetSelectedText() { ;Handles collection of highlighted text

tmp = %ClipboardAll% 

Clipboard := "" 

Send, ^c 

ClipWait, 1 

selection = %Clipboard% 

Clipboard = %tmp% 

return (selection = "" ? Clipboard : selection)

}


FirstOpen() { ; Prompts for preffered hotkey and saves it to .ini
	global
	Gui, Add, Text, x17 y8 w120 h20, Hotkey for Google:
	Gui, Add, Edit, x157 y8 w100 h20 vshotkey, CapsLock
	Gui, Add, Button, x27 y68 w70 h20, OK
	Gui, Add, Button, x177 y68 w70 h20, Cancel
	Gui, Show, w277 h98, Google Button
	Return
	ButtonCancel:
	GuiClose:
	return

	ButtonOk:
	Gui, submit
	Msgbox, Confirmed! Press %shotkey% to Google!
	Hotkey, %shotkey%, BindAction
	IniWrite, 1, hotkey.ini, SavedVariables, firsttime
	IniWrite, %shotkey%, hotkey.ini, SavedVariables, shotkey
	return
}


BindAction() { ;Launches default browser and googles input from select text
	global
	Run % "http://www.google.com/search?q=" . GetSelectedText()
}

AllOpen() { ;Reads .ini to rebind hotkeys after reboot or script exit
	global
	IniRead, shotkey, hotkey.ini, SavedVariables, shotkey
	HotKey, %shotkey%, BindAction
}

IniRead, firsttime, hotkey.ini, SavedVariables, firsttime, firsttime ;Determines launch status

if (firsttime != 1)
	{
		FirstOpen()
	}


Else 
	{
		Allopen()
	}










