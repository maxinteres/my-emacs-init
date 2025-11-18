;; -*- lexical-binding: t -*-

;;c/c++
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
  
  (add-to-list 'eglot-server-programs
               '(python-mode . ("python" "-m" "pylsp"))))

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

;;markdown
(setq markdown-command "D:/home/pandoc-3.7.0.2/pandoc.exe")

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

;;magit
(use-package magit
  :ensure t)

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

;;projectile
(setq projectile-dir "~/proj/")
(use-package projectile
  :ensure t
  :config
  (add-to-list 'projectile-project-search-path projectile-dir)
  (projectile-cleanup-known-projects)
  (projectile-mode t)
  (add-to-list 'projectile-project-root-files "makefile" ".project")
  :bind (("C-x p" . projectile-command-map)))
(when (package-installed-p 'projectile)
  (setq dashboard-projects-backend 'projectile))

;;pdf支持
(use-package pdf-tools
  :ensure t
  :init
  (pdf-loader-install)
  (add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1))))

(provide 'init-tools)

