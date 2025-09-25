;; -*- lexical-binding: t -*-
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(add-hook 'org-mode-hook (lambda () (company-mode -1)))
(require 'org-tempo)
(setq org-startup-folded t)
(setq org-hide-block-startup t) 
(setq org-todo-keywords '((sequence "TODO(t)" "WAIT(w)" "BUG(g)" "TRY(y)" "SUS(s)""|" "FIXED(f)" "FAILED(l)" "DONE(d)")))
(setq org-todo-keyword-faces '(("BUG" . "tomato")
			       ("WAIT" . "cornflower blue")
			       ("TRY" . "royal blue")
			       ("FAILED" . "chocolate")
			       ("SUS" . "CHOColate")))

(defun insert-src ()
  "Insert org-mode source block and prepare for editing."
  (interactive)
  (org-insert-structure-template "src")
  (when (looking-at "#+BEGIN_SRC");looking-at:当前行以"..."开头？
    (end-of-line)
    (insert " ")))
    
(provide 'init-org)
