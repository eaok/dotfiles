all: wsl windows ubuntu

.PHONY: ubuntu
ubuntu:
	cp ~/.bashrc ubuntu
	cp ~/.gitconfig ubuntu
	cp ~/.tmux.conf ubuntu
	cp ~/.vimrc ubuntu

.PHONY: windows
windows:
	cp /mnt/c/Users/Administrator/.wslconfig windows
	cp /mnt/c/Users/Administrator/.gitconfig windows
	cp /mnt/c/Users/Administrator/.config/custom/cmd_auto.bat windows
	cp /mnt/c/Users/Administrator/.config/custom/docker-compose.yml windows
	cp /mnt/c/Users/Administrator/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup/Ubuntu-20.04.vbs windows
	cp /mnt/c/Users/Administrator/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup/hotkey.ahk windows

.PHONY: wsl
wsl:
	cp --parents /etc/init.d/wsl wsl
	cp ~/.bashrc wsl
	cp ~/.gitconfig wsl
	cp ~/.tmux.conf wsl
	cp ~/.vimrc wsl

