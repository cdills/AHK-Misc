#Persistent

SetTimer, Chronos, 500
return

Chronos:
FormatTime, WorkHour,,HHmm

If (WorkHour = 800) {

	Loop {

	Winactivate, ahk_exe chrome.exe
	send, {Browser_Refresh}
	Sleep, 6000
	click 1420, 700
	Sleep, 3600000

	If (WorkHour = 1700)
		break


}

}

