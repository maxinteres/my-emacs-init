;; -*- lexical-binding: t -*-
(setq-default line-spacing 0.1)

(add-startup-without-opening-file-hook 'ask-to-open-todo)

(setq use-dialog-box nil)      
(setq use-short-answers t)     

(global-hl-line-mode 1);;所在行高亮

(setq inhibit-startup-message t)  ; 禁用启动消息

(setq initial-scratch-message nil) ; 清空*scratch*缓冲区初始内容

(setq inhibit-startup-screen t);关闭欢迎界面

(setq-default cursor-type 'bar);鼠标设置

(setq tab-always-indent 'complete)

(electric-pair-mode t)

(setq ring-bell-function 'ignore)

(icomplete-vertical-mode t);minibuffer提示

(windmove-default-keybindings 'meta)  ; 使用 meta+方向键进行窗口间移动
(setq windmove-wrap-around t)

(add-hook 'find-file-hook 'read-only-mode);所有文件打开先只读
(add-hook 'prog-mode-hook 'hs-minor-mode)  ; 对所有编程模式启用
(add-hook 'hs-minor-mode-hook 'hs-hide-all);初始全部折叠

(provide 'init-basic)
