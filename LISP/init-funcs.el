;; -*- lexical-binding: t -*-
;; 快速打开配置文件
(defun fold-switch ()
  "In hs-mode if present block is hidden show it ;if it is shown do the opposite"
  (interactive)
  (if (hs-already-hidden-p)
      (hs-show-block)
    (hs-hide-block)))

(defun insert-empty (times)
  "Insert 10 empty lines in default condition."
  (interactive (list (read-number "number of empty lines:" 10)))
  (cl-dotimes (- times)
    (newline)))

(defun ask-to-open-todo ()
  (if (y-or-n-p "open todo-list?")
      (run-with-idle-timer
       1 nil
       (lambda ()
	 (progn
	   (cd "~/.emacs.d/") 
	   (find-file "~/todo.org")))))
  (message nil))

(defun dashboard-restart-emacs-buttom ()
  (insert "\n  ")
  (insert-button "REBOOT"
                 'action (lambda (&rest _) (restart-emacs))
		 'face 'custom-button))

(defun add-startup-without-opening-file-hook (symbol)
  (when (< (length command-line-args) 2) ;; Assume no file name passed)
    (add-hook 'emacs-startup-hook symbol)))

(defun where-am-i ()
  (interactive)
  (message buffer-file-name))

(provide 'init-funcs)
