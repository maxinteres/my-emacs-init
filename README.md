# 如何使用
下载后直接复制到"~/.emacs.d/"下即可

# requirements 
## xclip
```bash
sudo dnf install xclip
```
或者wayland下
```bash
sudo dnf install wl-clipboard
```
## sbcl配置
官网下载sbcl并加入环境变量，之后可以使用slime

## evil-collection
在无法正常下载evil-collection时
```bash
cd ~/src/
git clone https://github.com/emacs-evil/evil-collection.git
```

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
注意每个python虚拟环境中都要安装pylsp，代码如下：
```elisp
(add-to-list 'eglot-server-programs
               '(python-mode . ("python" "-m" "pylsp")))
```
原配置自动关掉了一些无意义warning

## conda & aider
首先到官网下载miniconda

然后创建python3.12环境，安装aider
```bash
conda create -n aider-py312 python=3.12
conda activate aider-py312
pip install aider-chat
aider --version
```
## 字体
记得下载字体:
Hack
微软雅黑
