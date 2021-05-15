; AutoHotkey配置脚本
; 快捷键说明
; # Win
; ! alt
; ^ control
; + shift


; 仅允许运行一个
#SingleInstance


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 设置定时任务
; lastNow 保证必然执行
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#Persistent
lastNow = 0
SetTimer, autoTimer, 1000
Return
autoTimer:
{
    FormatTime, now,, yyyyMMdd HH:mm
    FormatTime, HHmm,, HH:mm
    if (lastNow == now)
        Return
    lastNow = %now%
    if (HHmm = "05:40")
    {
        ; Msgbox hello hhmm
    }
    if (now = "20210505 09:00")
    {
        ; MsgBox hello now
    }
}
Return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 设置循环任务
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; [win+k]开关键
#k::
{
    iCount := 0
    loop
    {
        ; 前台模拟按键
        ; if WinExist("ahk_exe hadesstar.exe")
        ; {
        ;     WinActivate
        ;     WinWaitActive
        ;     WinMaximize

        ;     ; 每20*4min移动一下战舰
        ;     if (0 = Mod(iCount, 20))
        ;     {
        ;         SetKeyDelay, 100, 100
        ;         Send, {Tab}move{Enter}{Tab}
        ;         Send, 22
        ;         Click, 694, 448, right
        ;         Click, 694, 448, right
        ;         Sleep, 1000
        ;         Click, 937, 460, right
        ;         Sleep, 10000
        ;     }
        ;     else
        ;     {
        ;         SetKeyDelay, 100, 100
        ;         Send, {Tab}%iCount%{Enter}{Tab}
        ;         Send, 1^w
        ;         Sleep, 1000 * 2 * 60
        ;         Send, 2^w
        ;         Sleep, 1000 * 2 * 60
        ;     }

        ;     iCount += 1
        ;     ; WinMinimize
        ; }
        ; else
        ; {
        ;     Return
        ; }

        ; 后台模拟按键
        if WinExist("ahk_exe hadesstar.exe")
        {
            if (0 = Mod(iCount, 20))
            {
                ; SetKeyDelay, 100, 100
                ; ControlSend, ahk_parent, {Tab}move{Enter}{Tab}, Hades' Star
                ControlSend, ahk_parent, 22, Hades' Star

                ; 鼠标点击位置无效
                ; Sleep, 1000
                ; ControlClick, x689 y480, Hades' Star, , right, 2
                ; Sleep, 1000
                ; ControlClick, x940, y493, ahk_pid %pid%, , right
                ; Sleep, 5000
            }
            else
            {
                ; SetKeyDelay, 100, 100
                ; ControlSend, ahk_parent, {Tab}%iCount%{Enter}{Tab}, Hades' Star
                
                Sleep, 1000
                SetKeyDelay, 100, 100
                ControlSend, , 1^w, Hades' Star
                Sleep, 1000 * 2 * 60
                Sleep, 1000
                SetKeyDelay, 100, 100
                ControlSend, , 2^w, Hades' Star
                Sleep, 1000 * 2 * 60
            }
        }
        else
        {
            Return
        }
        iCount += 1
    }

    Return
}

#g::
{
    Loop, 1
    {
        ; if WinExist("ahk_exe hadesstar.exe")
        ;     WinActivate, ahk_exe hadesstar.exe
        ; else
        ;     Run, hadesstar.exe
        ; hwnd := WinExist("Hades' Star") 
        if WinExist("ahk_exe hadesstar.exe")
        {
            id := WinExist("ahk_exe hadesstar.exe")
            WinGet, pid, PID, Hades' Star
            ControlGet, hwnd, Hwnd,,, Hades' Star
            Msgbox, %hwnd% %pid% %id%
        }


        

        ; Run, Notepad,, Min, PID  ; Run Notepad minimized.
        ; WinWait, ahk_pid %PID%  ; Wait for it to appear.
        ; ; Send the text to the inactive Notepad edit control.
        ; ; The third parameter is omitted so the last found window is used.
        ; ControlSend, Edit1, This is a line of text in the notepad window.{Enter}
        ; ControlSendRaw, Edit1, Notice that {Enter} is not sent as an Enter keystroke with ControlSendRaw.

        ; MsgBox, Press OK to activate the window to see the result.
        ; WinActivate, ahk_pid %PID%  ; Show the result.

    }
    Return
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 设置快捷键
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ctrl+Alt+w 运行Windows Terminal
^!w::
Run wt
Return

; Ctrl+Alt+t 运行cmd
^!t::
Run cmd
Return

; z键失灵，改键
; !CapsLock::
; Send, z
; Return


^!r::Reload  ; Assign Ctrl-Alt-R as a hotkey to restart the script.
^!p::Pause
