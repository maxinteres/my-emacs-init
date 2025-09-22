;; -*- lexical-binding: t -*
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-x x r") 'rename-visited-file)

(global-set-key (kbd "C-~") 'scratch-buffer)
(global-set-key (kbd "C-`") 'dashboard-open)
(global-set-key (kbd "C-;") 'embark-act)

(global-set-key (kbd "C-c w") 'where-am-i)
(global-set-key (kbd "C-c z") 'shell)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)

(global-set-key (kbd "C-c i s") 'insert-src)
(global-set-key (kbd "C-c i e") 'insert-empty)
(with-eval-after-load 'hideshow
  (define-key hs-minor-mode-map (kbd "C-<tab>") 'fold-switch))

(provide 'init-keybindings)
