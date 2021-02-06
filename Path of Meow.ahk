icon = %A_ScriptDir%\icon\icon.ico
IfExist, %icon%
Menu, Tray, Icon, %icon%
;return

Gui, Add, Text, x20 y16 w234 h24, Path of Meow: detecting and meowing
Gui, Add, Text, x174 y48 w72 h12 vstatus,
Gui, Add, Button, x20 y64 w108 h30, Detect
Gui, Add, Button, x134 y64 w108 h30, Stop
Gui, Margin, 12, 16
Gui, Show

isMacroStart := false

return

ButtonDetect:
{
    isMacroStart := true
    GuiControl, , status, Detecting...

    Loop {
        search()

        if (isMacroStart = false)
            break
    }
}
return

search() {
    Loop, Files, %A_ScriptDir%\images\*.png 
        imageSearch(A_LoopFileName)
}

imageSearch(image) {
    ImageSearch, foundX, foundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *20 %A_ScriptDir%\images\%image%
    
    if (ErrorLevel = 0)
        SoundPlay, %A_ScriptDir%\sound\meow.mp3, 1
}

ButtonStop:
{
    isMacroStart := false
    GuiControl, , status, 
}
return
