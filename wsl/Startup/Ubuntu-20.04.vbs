Set ws = CreateObject("Wscript.Shell")
ws.run "wsl -d Ubuntu-20.04 -u root /etc/init.d/wsl start", vbhide