;; -*- lexical-binding: t -*-
(add-to-list 'load-path (expand-file-name "LISP" user-emacs-directory))
;;镜像源
(require 'init-src)
;; 界面以及光标设置
(setq custom-file (expand-file-name "LISP/init-custom.el" user-emacs-directory))
(load custom-file)

;; init .env
(require 'init-env)
;;
(require 'init-funcs) 
;;基础设置
(require 'init-basic)
;;keybindings
(require 'init-keybindings)
;;all-tools
(require 'init-packages)

