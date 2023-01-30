#NoEnv
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse

version := "v1.0.0b"
sendToGuild := "Server"
sendToChannel := "memes"
MsgBox, 64, Meme Stealer 9000,
(
Controls:
F12 - Steal Meme
Ctrl+F12 - Dry run (does everything F12 does except sending it)
Shift+F12 - Send to different server or channel
Shift+Alt+F12 - Closes The Meme Stealer 9000
)

F12::
	stealMeme(sendToGuild, sendToChannel)
	Sleep, 1500
	SendInput, { Enter }
	SendInput, { Enter }
	SplashTextOff
	SplashTextOn,,, Meme Stolen
	Sleep, 1500
	SplashTextOff
return

+F12::
	Gui, sendToGui:New, -Caption
	Gui, Add, Edit, x42 y29 w130 h20 vnewGuild, %sendToGuild%
	Gui, Add, Edit, x42 y89 w130 h20 vnewChannel, %sendToChannel%
	Gui, Add, Text, x42 y9 w130 h20, Server Name
	Gui, Add, Text, x42 y69 w130 h20, Channel Name
	Gui, Add, Button, gSubmitSendTo x52 y129 w110 h30, Done
	Gui, Show, h177 w211
Return

^F12::
	stealMeme(sendToGuild, sendToChannel)
	SplashTextOff
	SplashTextOn,,, Meme Stolen
	Sleep, 1500
	SplashTextOff

return

!+F12::
ExitApp

stealMeme(sendToGuild, sendToChannel) {
	SendMode Event
	MouseGetPos, oldX, oldY
	SplashTextOff
	BlockInput, MouseMove
	SplashTextOn,,, Stealing Meme...
	MouseMove, (A_ScreenWidth // 2), (A_ScreenHeight // 2)
	SendInput, { RButton }
	MouseMove, (A_ScreenWidth // 2 + 20), (A_ScreenHeight // 2 + 30)
	SendInput, { LButton }
	SendMode Input
	SendInput, { Esc }
	SendInput, ^k
	SendInput, *%sendToGuild%
	Sleep, 100
	SendInput, { Enter }
	Sleep, 100
	SendInput, { Esc }
	SendInput, { Esc }
	Sleep, 200
	SendInput, ^k
	SendRaw, #%sendToChannel%
	Sleep, 100
	SendInput, { Enter }
	Sleep, 500
	SendInput, ^v
	BlockInput, MouseMoveOff
	MouseMove, oldX, oldY
}

SubmitSendTo:
Gui, Submit
sendToGuild := newGuild
sendToChannel := newChannel
Gui, sendToGui:Destroy
return
