@echo off
doskey ls=dir /b $*
doskey admin=cd C:\Users\Administrator
doskey config=cd C:\Users\Administrator\.config
doskey gogo=cd C:\Users\Administrator\Documents\gogo
doskey dogo=cd C:\Users\Administrator\Documents\dogo

doskey dd=docker run --rm -it ^
-e GOPROXY=https://goproxy.cn,direct ^
-v /C/Users/Administrator/Documents/dogo:/home/dogo ^
-w /home/dogo ^
golang $*

::doskey act=activate tensorflow-gpu $*
::doskey tb=tensorboard --logdir $*
::doskey pi=pip install $*