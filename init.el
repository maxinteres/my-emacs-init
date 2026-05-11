;; -*- lexical-binding: t -*-
(add-to-list 'load-path (expand-file-name "LISP" user-emacs-directory))
;;镜像源
(require 'init-packages)
;; 界面以及光标设置
(setq custom-file "~/.emacs.d/LISP/init-custom.el")
(load custom-file)
;;font-set if graphic
(when (display-graphic-p)
  (add-to-list 'initial-frame-alist '(font . "Hack-9"))
  (add-to-list 'default-frame-alist '(font . "Hack-9")))
;;
(require 'init-funcs) 
;;基础设置
(require 'init-basic)
;;keybindings
(require 'init-keybindings)
;;all-tools
(require 'init-tools)
;;org
(require 'init-org)


