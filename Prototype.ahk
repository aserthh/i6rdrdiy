#Requires AutoHotkey v2.0
#SingleInstance Force
SetKeyDelay(50, 50)
GTA_TITLE := "Grand Theft Auto V"
running := false
wasActive := false

; === Monitor de foco da janela do GTA ===
SetTimer(CheckGTAFocus, 500)

CheckGTAFocus() {
    global running, wasActive, GTA_TITLE

    ; Pega a janela que está com o mouse/foco ativo (foreground)
    activeHwnd := WinGetID("A")
    gtaHwnd := WinExist(GTA_TITLE)

    isActive := (activeHwnd = gtaHwnd) && gtaHwnd

    ; GTA acabou de receber foco
    if isActive && !wasActive && !running {
        wasActive := true
        Sleep(2500)
        ; Confirma que ainda está focado depois dos 2.5s
        activeHwnd2 := WinGetID("A")
        if (activeHwnd2 = gtaHwnd) {
            running := true
            SetTimer(MainLoop, -10)
        }
    }
    ; GTA perdeu foco — pausa o loop
    else if !isActive && wasActive {
        wasActive := false
        running := false
    }
}

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

; Tecla K ainda funciona como toggle manual
k:: {
    global running
    running := !running
    if running
        SetTimer(MainLoop, -10)
}

MainLoop() {
    global running, GTA_TITLE
    if !running
        return
    if !WinExist(GTA_TITLE) {
        running := false
        return
    }
    ; === ESC para abrir menu ===
    GTASend("{Escape}")
    Sleep(800)
    ; === D para ir na aba GTA Online ===
    GTASend("d")
    Sleep(800)
    ; === Enter para confirmar ===
    GTASend("{Enter}")
    Sleep(800)
    ; === Clica 3x em "Encontrar nova sessão" ===
    GTAClick(284, 490)
    Sleep(500)
    GTAClick(284, 490)
    Sleep(500)
    GTAClick(284, 490)
    Sleep(500)
    ; === 4 Enters ===
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
    ; === Cliques em X:982 Y:130 ===
    GTAClick(982, 130)
    Sleep(300)
    GTAClick(982, 130)
    Sleep(300)
    GTAClick(982, 130)
    Sleep(300)
    ; === Cliques em X:308 Y:306 ===
    GTAClick(308, 306)
    Sleep(300)
    GTAClick(308, 306)
    Sleep(300)
    GTAClick(308, 306)
    Sleep(300)
    ; === Cliques em X:319 Y:196 ===
    GTAClick(319, 196)
    Sleep(300)
    GTAClick(319, 196)
    Sleep(300)
    GTAClick(319, 196)
    Sleep(300)
    ; === 3 Enters ===
    GTASend("{Enter}")
    Sleep(500)
    GTASend("{Enter}")
    Sleep(500)
    GTASend("{Enter}")
    Sleep(500)
    Sleep(46000)
    if !running
        return
    ; === Abre o chat ===
    GTASend("t")
    Sleep(1000)
    if !WinExist(GTA_TITLE) {
        running := false
        return
    }
    WinActivate(GTA_TITLE)
    WinWaitActive(GTA_TITLE, , 2)
    Sleep(100)
    msg := "Bom dia pessoal Deus abencoe vcs do meu servidor de FiveM, adm ama vcs"
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
