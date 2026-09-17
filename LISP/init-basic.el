;; -*- lexical-binding: t -*-
(prefer-coding-system 'gbk)
(prefer-coding-system 'utf-8) ; coding-system settings
(setq default-input-method "TeX")

;;font-set if graphic
(when (display-graphic-p)
  (add-to-list 'initial-frame-alist '(font . "Hack-13"))
  (add-to-list 'default-frame-alist '(font . "Hack-13")))

(setq-default line-spacing 0.1)

(when (fboundp 'tool-bar-mode)
   (tool-bar-mode -1))

(setq warning-minimum-level :emergency)

(setq use-dialog-box nil)      
(setq use-short-answers t)     

(setq inhibit-startup-message t)  ; 禁用启动消息

(setq initial-scratch-message nil) ; 清空*scratch*缓冲区初始内容

(setq inhibit-startup-screen t);关闭欢迎界面

(electric-pair-mode t)

(setq ring-bell-function 'ignore)

(icomplete-vertical-mode t);minibuffer提示

(add-hook 'find-file-hook 'read-only-mode);which will be removed after evil-mode
(add-hook 'prog-mode-hook 'hs-minor-mode)  ; 对所有编程模式启用
(add-hook 'hs-minor-mode-hook 'hs-hide-all);初始全部折叠

(setq auto-save-interval 30)

;;dired settings
(add-hook 'dired-mode-hook 'dired-hide-details-mode)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

(put 'dired-find-alternate-file 'disabled nil)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;;settings for org-mode
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(add-hook 'org-mode-hook (lambda () (company-mode -1)))

(setq org-startup-folded t)
(setq org-todo-keywords '((sequence "TODO(t)" "WAIT(w)" "BUG(g)" "TRY(y)" "SUS(s)""|" "FIXED(f)" "FAILED(l)" "DONE(d)")))

(setq org-todo-keyword-faces '(("BUG" . "tomato")
			       ("WAIT" . "cornflower blue")
			       ("TRY" . "royal blue")
			       ("FAILED" . "chocolate")
			       ("SUS" . "CHOColate")))
 
(provide 'init-basic)
