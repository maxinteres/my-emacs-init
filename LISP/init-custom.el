;; -*- lexical-binding: t -*-
;;界面设置
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist nil)
 '(custom-enabled-themes '(zenburn))
 '(custom-safe-themes
   '("71ff2f817f051ea43c04d2d0f209c2445d06355243fe94d7e00007539fbc471b"
     default))
 '(global-display-line-numbers-mode t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(org-pretty-entities t)
 '(org-todo-keyword-faces '(("BUG" . "DeepYellow") ("WAIT" . "brown")))
 '(package-selected-packages
   '(aidermacs buffer-move company conda dashboard dired-sidebar
	       doom-themes evil-collection go-mode marginalia
	       org-fragtog slime undo-tree xclip zenburn-theme)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:extend t :background "ivory2"))))
 '(org-done ((t (:foreground "#008A00")))))

