;; -*- lexical-binding: t -*-
(add-to-list 'load-path (expand-file-name "LISP" user-emacs-directory))
;;镜像源
(require 'init-packages)
;; 界面以及光标设置
(setq custom-file "~/.emacs.d/LISP/init-custom.el")
(load custom-file)
;;
(require 'init-funcs) 
;;基础设置
(require 'init-basic)
;;all-tools
(require 'init-tools)
;;dired设置
(require 'init-dired)
;;快捷键
(require 'init-keybindings)
;;org
(require 'init-org)

(dolist (charset '(kana han cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family "微软雅黑" :size 15)))
