#Requires AutoHotkey v2.0
#SingleInstance Force
SetKeyDelay(50, 50)
GTA_TITLE := "Grand Theft Auto V"
running := false
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
k::
{
    global running
    ToolTip("Aguardando 2.5s...")
    Sleep(2500)
    running := !running
    ToolTip(running ? "ATIVADO" : "DESATIVADO")
    SetTimer(() => ToolTip(), -2000)
    if running
        SetTimer(MainLoop, -10)
}
MainLoop()
{
    global running, GTA_TITLE
    if !running
        return
    if !WinExist(GTA_TITLE) {
        ToolTip("GTA 5 nao encontrado!")
        SetTimer(() => ToolTip(), -3000)
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
    ; === 4 Enters com delay de 500ms ===
    GTASend("{Enter}")
    Sleep(500)
    GTASend("{Enter}")
    Sleep(500)
    GTASend("{Enter}")
    Sleep(500)
    GTASend("{Enter}")
    Sleep(500)

    ; === Aguarda 3 segundos antes de fazer os cliques extras ===
    Sleep(3000)

    if !running
        return

    ; === Cliques em X:982 Y:130 (3x) ===
    GTAClick(982, 130)
    Sleep(300)
    GTAClick(982, 130)
    Sleep(300)
    GTAClick(982, 130)
    Sleep(300)

    ; === Cliques em X:308 Y:306 (3x) ===
    GTAClick(308, 306)
    Sleep(300)
    GTAClick(308, 306)
    Sleep(300)
    GTAClick(308, 306)
    Sleep(300)

    ; === Cliques em X:319 Y:196 (3x) ===
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

    ; === Aguarda o restante dos 55 segundos (55000 - 3000 - tempo dos cliques ~6s) ===
    Sleep(46000)

    if !running
        return
    ; === Abre o chat ===
    GTASend("t")
    Sleep(1000)
    ; === Digita a mensagem ===
    if !WinExist(GTA_TITLE) {
        running := false
        return
    }
    WinActivate(GTA_TITLE)
    WinWaitActive(GTA_TITLE, , 2)
    Sleep(100)
    msg := "Precisando de Dinheiro, Level e Desbloqueios? Me chama no ZAP 15991285655 Ou no DC ozarkontop - WinstreakModz"
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
