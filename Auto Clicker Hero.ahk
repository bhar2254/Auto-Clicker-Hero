#Requires AutoHotkey v2.0
#SingleInstance Force ; Replaces old instance automatically

clicking := false
windowMode := false
debugMode := false
activeWindow := false

staticX := 0
staticY := 0
staticSet := false

defaultWinX := 860
defaultWinY := 375

CoordMode("Mouse", "Screen")

; ==============================
; Shift+F1 → Screen static mode
; ==============================
+F1::
{
    global clicking, windowMode, staticSet, secondaryActive, activeWindow

    windowMode := false
    secondaryActive := false

    if !staticSet
    {
        MsgBox("No static screen position saved! Press Shift+F8 first.")
        return
    }

    clicking := true

    ; If a window was selected, activate it before clicking
    if activeWindow
        WinActivate("ahk_id " activeWindow)

    SetTimer(AutoClickWindow, 10)
    SetTimer(SecondaryClick, 0)
}

; ==============================
; Shift+F2 → Stop everything
; ==============================
+F2::
{
    global clicking
    clicking := false

    SetTimer(AutoClickScreen, 0)
    SetTimer(AutoClickWindow, 0)
    SetTimer(SecondaryClick, 0)
}

+F7::
{
    global activeWindow

    MsgBox("Click the window you want to set as the active frame.")
    KeyWait("LButton", "D")

    MouseGetPos(,, &hwnd)

    if !hwnd
    {
        MsgBox("No window detected.")
        return
    }

    activeWindow := hwnd
    title := WinGetTitle("ahk_id " hwnd)

    MsgBox("Active window set to:`n" title)
}

; ==============================
; Shift+F8 → Save window-relative position
; ==============================
+F8::
{
    global staticX, staticY, staticSet, activeWindow

    ; If activeWindow isn't set, capture the window under the cursor
    if !activeWindow
    {
        MouseGetPos(,, &hwnd)
        if hwnd
        {
            activeWindow := hwnd
        }
    }

    CoordMode("Mouse", "Window")
    MouseGetPos(&staticX, &staticY)

    staticSet := true

    title := activeWindow ? WinGetTitle("ahk_id " activeWindow) : "Unknown Window"

    MsgBox(
        "Window-relative position saved:`n"
        "X: " staticX "`n"
        "Y: " staticY "`n`n"
        "Active Window:`n" title
    )
}

; ==============================
; Shift+F9 → Debug overlay
; ==============================

+F9::
{
    global debugMode
    debugMode := !debugMode
    
    if debugMode
        SetTimer(ShowDebug, 50)
    else
    {
        SetTimer(ShowDebug, 0)
        ToolTip()
    }
}

; ==============================
; Screen static click mode
; ==============================
AutoClickScreen()
{
    global clicking, staticX, staticY
    if clicking
        Click(staticX, staticY)
}

; ==============================
; Window relative click mode
; ==============================
AutoClickWindow()
{
    global clicking, staticSet, staticX, staticY, secondaryActive

    if (!clicking || secondaryActive)
        return

    CoordMode("Mouse", "Window")

    if staticSet
    {
        Click staticX, staticY
    }
    else
    {
        Click 860, 375
    }
}

; ==============================
; Secondary timed click
; ==============================
SecondaryClick()
{
    global clicking, windowMode, secondaryActive

    if !(clicking && windowMode)
        return

    CoordMode("Mouse", "Window")

    secondaryActive := true

    ; Small delay before firing (prevents ghost overlap)
    Sleep 75

    Click 915, 75

    ; Buffer delay after secondary click
    Sleep 75

    secondaryActive := false
}

; ==============================
; Debug display
; ==============================
ShowDebug()
{
    global clicking, windowMode, staticX, staticY, staticSet

    CoordMode("Mouse", "Screen")
    MouseGetPos(&screenX, &screenY)

    CoordMode("Mouse", "Window")
    MouseGetPos(&relX, &relY)

    mode := windowMode ? "WINDOW MODE" : "SCREEN MODE"
    status := clicking ? "RUNNING" : "STOPPED"
    saved := staticSet ? staticX ", " staticY : "Not Set"

    ToolTip(
    "Status: " status "`n"
    "Mode: " mode "`n`n"
    "Screen: " screenX ", " screenY "`n"
    "Window: " relX ", " relY "`n`n"
    "Saved Pos: " saved "`n"
    "10s Click: 900, 75"
    )
}
