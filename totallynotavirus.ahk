!+^n::
loop, parse, clipboard, `n, `r
	lines:=a_index

Loop %lines% {
		RegExMatch(clipboard, "[\w]+[-]?[\w]*", foo)
		send ^t
		ReleaseKeys()
		send ^l
		ReleaseKeys()
		SwitchNPaste("https://secure.kwinternational.com/nsp/ticket/ticketView.aspx?TicketNo=", foo)
		send {RETURN}
		clipboard := RegExReplace(clipboard, "[\w]+[-]?[\w]*" , Replacement := "", OutputVarCount := "", Limit := 1, StartingPosition := 1)
		sleep 10
	}
return

f2:: ; search phone number # url bar
If WinActive("Ticket Search") || If WinActive("MAX") {
	send ^c
	ReleaseKeys()
	send ^t
	ReleaseKeys()
	LeaveOnlyNumbers()
	send ^l
	ReleaseKeys()
	send ^a
	ReleaseKeys()
	SwitchNPaste("https://secure.kwinternational.com/nsp/ticket/search/ticketlist.aspx?mode=C&searchkey=", clipboard)
}
Else {
	LeaveOnlyNumbers()
	send ^l
	ReleaseKeys()
	send ^a
	ReleaseKeys()
	SwitchNPaste("https://secure.kwinternational.com/nsp/ticket/search/ticketlist.aspx?mode=C&searchkey=", clipboard)
}
If clipboard != 
		send {RETURN}
return

; Methods

SwitchNPaste(new_board, y:="") {
	switch_temp := clipboard
	clipboard := new_board y
	sleep 1
	send ^v
	ReleaseKeys()
	clipboard := switch_temp
}

ReleaseKeys() {
	KeyList := "Shift|Alt|Ctrl|Win"

	Loop, Parse, KeyList, |
	{
		SendInput % "{" A_Loopfield " Up}"
	}
}
LeaveOnlyNumbers() { ; uses RegEx to take out all non-number characters from the clipboard. Also makes a backup of the unadulturated clipboard for convenience
	temp := clipboard
	clipboard := RegExReplace(clipboard, "\D")
}