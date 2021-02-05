icon = %A_ScriptDir%\icon\icon.ico
IfExist, %icon%
Menu, Tray, Icon, %icon%
;return


Gui, Add, Text, x30 y16 w208 h24, Ex-meow: detecting Exalted Orb and meowing
Gui, Add, Text, x156 y48 w72 h12 vstatus,
Gui, Add, Button, x20 y64 w100 h30, Detect
Gui, Add, Button, x128 y64 w100 h30, Stop
Gui, Margin, 12, 16
Gui, Show

global isMacroStart := false

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

