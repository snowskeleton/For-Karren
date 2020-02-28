#SingleInstance force

!+s::
send ^f
send Send Callfire
send {ESC}
send {TAB}{SHIFTDOWN}{TAB}{SHIFTUP}
send {SPACE}
return

f2:: ; search phone number # url bar
If WinActive("Ticket Search") {
	send ^c
	send ^t
	x := "https://secure.kwinternational.com/nsp/ticket/search/ticketlist.aspx?mode=C&searchkey="
	clipboard := RegExReplace(clipboard, "\D")
	y := clipboard
	z := x y
	clipboard := z
	send ^a
	send ^v
	clipboard := y
	send {RETURN}
	}

Else If WinActive("Max - Google Chrome") {
	send ^c
	send ^t
	x := "https://secure.kwinternational.com/nsp/ticket/search/ticketlist.aspx?mode=C&searchkey="
	clipboard := RegExReplace(clipboard, "\D")
	y := clipboard
	z := x y
	clipboard := z
	send ^a
	send ^v
	clipboard := y
	send {RETURN}
	}

Else {
	x := "https://secure.kwinternational.com/nsp/ticket/search/ticketlist.aspx?mode=C&searchkey="
	clipboard := RegExReplace(clipboard, "\D")
	y := clipboard
	z := x y
	clipboard := z
	send ^l
	send ^a
	send ^v
	clipboard := y
	send {RETURN}
	}
return