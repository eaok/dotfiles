.PHONY: default winwsl windows wsl ubuntu

default: winwsl

winwsl: windows wsl

windows:
	cp /mnt/c/Users/Administrator/.wslconfig windows
	cp /mnt/c/Users/Administrator/.gitconfig windows
	cp --parents /mnt/c/Users/Administrator/.config/custom/* windows
	cp --parents /mnt/c/Users/Administrator/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup/* windows
	cp --parents /mnt/c/Users/Administrator/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json windows

wsl:
	cp --parents /etc/init.d/wsl wsl
	cp ~/.bashrc wsl
	cp ~/.gitconfig wsl
	cp ~/.tmux.conf wsl
	cp ~/.vimrc wsl

ubuntu:
	cp ~/.bashrc ubuntu
	cp ~/.gitconfig ubuntu
	cp ~/.tmux.conf ubuntu
	cp ~/.vimrc ubuntu

