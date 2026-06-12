#Requires AutoHotkey v2.0
#SingleInstance Force
SetKeyDelay(50, 50)
GTA_TITLE := "Grand Theft Auto V"
running := true  ; já inicia ativo

GTASend(key) {
    global GTA_TITLE
    WinActivate(GTA_TITLE)
    WinWaitActive(GTA_TITLE, , 2)
    Sleep(60)
    SendMode "Event"
    Send(key)
    SendMode "Input"
    Sleep(60)
}

GTAClick(x, y) {
    global GTA_TITLE
    WinActivate(GTA_TITLE)
    WinWaitActive(GTA_TITLE, , 2)
    MouseMove(x, y, 0)
    Sleep(100)
    SendMode "Event"
    Click(x, y)
    SendMode "Input"
    Sleep(100)
}

; Inicia o loop automaticamente
SetTimer(MainLoop, -10)

MainLoop() {
    global running, GTA_TITLE
    if !running
        return
    if !WinExist(GTA_TITLE) {
        running := false
        return
    }
    GTASend("{Escape}")
    Sleep(800)
    GTASend("d")
    Sleep(800)
    GTASend("{Enter}")
    Sleep(800)
    GTAClick(284, 490)
    Sleep(500)
    GTAClick(284, 490)
    Sleep(500)
    GTAClick(284, 490)
    Sleep(500)
    GTASend("{Enter}")
    Sleep(500)
    GTASend("{Enter}")
    Sleep(500)
    GTASend("{Enter}")
    Sleep(500)
    GTASend("{Enter}")
    Sleep(500)
    Sleep(3000)
    if !running
        return
    GTAClick(982, 130)
    Sleep(300)
    GTAClick(982, 130)
    Sleep(300)
    GTAClick(982, 130)
    Sleep(300)
    GTAClick(308, 306)
    Sleep(300)
    GTAClick(308, 306)
    Sleep(300)
    GTAClick(308, 306)
    Sleep(300)
    GTAClick(319, 196)
    Sleep(300)
    GTAClick(319, 196)
    Sleep(300)
    GTAClick(319, 196)
    Sleep(300)
    GTASend("{Enter}")
    Sleep(500)
    GTASend("{Enter}")
    Sleep(500)
    GTASend("{Enter}")
    Sleep(500)
    Sleep(46000)
    if !running
        return
    GTASend("t")
    Sleep(1000)
    if !WinExist(GTA_TITLE) {
        running := false
        return
    }
    WinActivate(GTA_TITLE)
    WinWaitActive(GTA_TITLE, , 2)
    Sleep(100)
    msg := "Precisando upar sua conta? ZAP : 15991285655 DC : arghoyes - (MELHOR LOJA + DE 60 AVALIAÇÕES)"
    Loop Parse, msg {
        if !running
            return
        SendText(A_LoopField)
        Sleep(2)
    }
    Sleep(1000)
    if !running
        return
    GTASend("{Enter}")
    Sleep(1000)
    if running
        SetTimer(MainLoop, -10)
}
