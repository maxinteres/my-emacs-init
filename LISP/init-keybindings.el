;; -*- lexical-binding: t -*
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-x x r") 'rename-visited-file)

(global-set-key (kbd "C-c ~") 'scratch-buffer)
(global-set-key (kbd "C-c `") 'dashboard-open)
(global-set-key (kbd "C-;") 'embark-act)

(global-set-key (kbd "C-c w") 'where-am-i)
(global-set-key (kbd "C-c z") 'eshell)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)

(global-set-key (kbd "C-c i s") 'insert-src)
(global-set-key (kbd "C-c i e") 'insert-empty)
(global-set-key (kbd "C-c i <left>") 'insert-left-arrow)
(global-set-key (kbd "C-c i <right>") 'insert-right-arrow)
(global-set-key (kbd "C-c i <up>") 'insert-up-arrow)
(global-set-key (kbd "C-c i <down>") 'insert-down-arrow)

(global-set-key (kbd "C-c M t") 'tex-mode)
(global-set-key (kbd "C-c M o") 'org-mode)

(add-hook 'flymake-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c ?") 'flymake-show-buffer-diagnostics)))

(provide 'init-keybindings)
