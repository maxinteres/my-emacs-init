# 如何使用
下载后直接复制到"~/.emacs.d/"下即可

# requirements 
## markdown配置
到官网下载pandoc，然后到init-tools.el配置markdown-command变量，指向pandoc.exe

## sbcl配置
去官网下载sbcl并加入环境变量，之后可以使用slime

## g++/gcc配置
去 https://www.msys2.org/ 下载msys2
打开 MSYS2 MinGW x64
```bash
pacman -Syu 
#更新数据库
pacman -S mingw-w64-x86_64-gcc mingw-w64-x86_64-gdb make mingw-w64-x86_64-clang mingw-w64-x86_64-clang-tools-extra
#下载工具
```
下载后设置环境变量，两个：
```
\msys64\mingw64\bin
\msys64\usr\bin
#自己找对应的位置
```
打开cmd，检验是否下载成功
```bash
gcc --version
g++ --version
clang --version
clangd --version
#服务器负责补全
gdb --version
```
重启emacs，写一个hello_world.cpp注意会有补全.
```
M-x compile ret 
g++ hello_world.cpp -o hello_world.exe
```
即可编译，注意compile默认命令是make，也可以写一个makefile来利用.

25.9.1 
基本放弃使用g++在windows中编译cpp了.
配置wsl后，使用```wsl g++```进行编译，运行时使用```wsl ./main.exe```（如果main.exe在当前文件夹下）
## python配置
### python
去官网下载python并加入环境变量，elpy会自动通过环境变量找到python.exe.

### pylsp
和lsp结合，进行补全、查找定义等操作.

首先下载pylsp
```bash
pip install python-lsp-server[all]
```
确认安装成功
```bash
pip show python-lsp-server
```
然后找到你使用的python.exe的位置，替换到这个地方
```elisp
(setq lsp-pylsp-server-command 
       '("d:/Program Files/python3.13.4-64bit/python" "-m" "pylsp"))
```
原配置自动关掉了一些无意义warning

## 字体
记得下载字体:
Hack
微软雅黑

## pdf支持
主要使用了pdf-tools
### windows
在mingw64.exe的命令行中输入
```bash
pacman -S mingw-w64-x86_64-emacs-pdf-tools-server
```
确保 \msys64\mingw64\bin 中有epdfinfo即可
然后就可以正常打开pdf了

## 最后当前配置下依赖的包
自带：
eglot
icompany
需要下载：
lsp-mode
slime
company
marginalia
dired-subtree
dired-sidebar
magit
dashboard
projectile
pdf-tools
undo-tree
