;;evil-collection
(unless (package-installed-p 'evil-collection)
  (add-to-list 'load-path "~/src/evil-collection/") ;;set evil-collection location
  (require 'evil-collection)
  (evil-collection-init))

;;xclip/wl-clipboard
(use-package xclip			;
  :ensure t
  :config
  (xclip-mode 1))

;;conda
(use-package conda
  :ensure t
  :config
  (setq conda-anaconda-home "~/miniconda3/"))
  
;;aider
(use-package aidermacs
  :ensure t
  :bind (("C-c a" . aidermacs-transient-menu))
  :config
  ; Set API_KEY in .bashrc, that will automatically picked up by aider or in elisp
  (setenv "ANTHROPIC_API_KEY" "sk-...")
  ; defun my-get-openrouter-api-key yourself elsewhere for security reasons
  (setenv "OPENROUTER_API_KEY" (my-get-openrouter-api-key))
  :custom
  ; See the Configuration section below
  (aidermacs-default-chat-mode 'architect)
  (aidermacs-default-model "sonnet"))
(provide 'init-external)
