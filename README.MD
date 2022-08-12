# dotfiles

#### 默认备份winwsl
```shell
make
```

#### 备份windows的文件
```shell
make windows
```

#### 备份wsl的文件
```shell
make wsl
```

#### 备份ubuntu的文件
```shell
make ubuntu
```

#### 安装apt文件夹中的软件
```shell
cat apt/base | xargs sudo apt install
bash apt/goget
```
