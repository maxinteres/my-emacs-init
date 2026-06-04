;; -*- lexical-binding: t -*-
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (remove-hook 'find-file-hook 'read-only-mode))

(use-package evil-collection
  :ensure t
  :config
  (evil-collection-init))

(unless (package-installed-p 'evil-collection)
  (add-to-list 'load-path "~/src/evil-collection/") ;;set evil-collection location
  (require 'evil-collection)
  (evil-collection-init))

;;eglot cc & python
(use-package eglot
  :ensure nil
  :hook              
  (c-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (python-mode . eglot-ensure)
  (python-mode . pyvenv-mode)
  :config             ; 包加载后的配置
  (add-to-list 'eglot-server-programs
	       '((c++-mode c-mode) . ("clangd")))
  (setq eglot-ignored-server-capabilities '(:documentOnTypeFormattingProvider))
  
  (add-to-list 'eglot-server-programs
               '(python-mode . ("python" "-m" "pylsp"))))

(setq-default c-default-style "linux")
;;cl
(use-package slime
  :ensure t
  :after lisp-mode 
  :init
  (setq inferior-lisp-program "sbcl")
  (require 'slime-autoloads))

;;undo-tree
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history nil))

;;company icompany
(use-package company
  :ensure t
  :init
  (global-company-mode t)
  (setq company-global-modes '(not org-mode)) 
  :config
  (setq company-minimum-prefix-length 3)
  (setq company-idle-delay 0))

(use-package marginalia
  :ensure t
  :hook (after-init . marginalia-mode));C-h v/f时，显示各个变量/函数的详细信息

;;项目文件夹边栏
(use-package dired-subtree
  :ensure t
  :after dired
  :bind (:map dired-mode-map
              ("<tab>" . dired-subtree-toggle)))

(use-package dired-sidebar
  :ensure t
  :after prog-mode 
  :bind (("C-c d" . dired-sidebar-toggle-sidebar)))

;;开始界面设置
(defcustom dashboard-banner-logo-title "Welcome to Emacs! "
  "Specify the startup banner."
  :type 'string
  :group 'dashboard)
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-navigation-cycle t)
  (dashboard-setup-startup-hook)
  (setq dashboard-projects-backend 'project-el)
  (setq dashboard-bookmarks-item-format "%s")
  (setq dashboard-items '((projects . 5)
			  (recents   . 7)
			  (bookmarks . 3)))
  (setq dashboard-set-init-info t)
  (setq dashboard-center-content t)
  (set-face-attribute 'dashboard-banner-logo-title-face nil :height 1.6 :weight 'bold :slant 'italic)
  (set-face-attribute 'dashboard-heading nil :height 100 :weight 'semibold)
  (set-face-attribute 'dashboard-items-face nil :height 100)
  (setq dashboard-startupify-list
	'(
	  dashboard-restart-emacs-buttom
	  dashboard-insert-banner
	  dashboard-insert-newline
	  dashboard-insert-banner-title
	  dashboard-insert-newline
	  dashboard-insert-init-info
    	  dashboard-insert-items
	  dashboard-insert-newline
	  dashboard-insert-footer
	  )))
(setq dashboard-projects-backend 'project-el)
;; xclip
(use-package xclip			;
  :ensure t
  :config
  (xclip-mode 1))

;;theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-nord-aurora t))

(provide 'init-tools)

