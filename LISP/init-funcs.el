;; -*- lexical-binding: t -*-
;; 快速打开配置文件
(defmacro run-with-delay (time &rest body)
  `(run-with-timer ,time nil
    (lambda ()
      (progn   
        ,@body))))

(defmacro run-with-idle-delay (time &rest body)
  `(run-with-idle-timer ,time nil
    (lambda ()
      (progn   
        ,@body))))

(defmacro run-with-idle-repeat (time &rest body)
  `(run-with-idle-timer ,time t
    (lambda ()
      (progn   
        ,@body))))

(defun insert-empty (times)
  "Insert 10 empty lines in default condition."
  (interactive (list (read-number "number of empty lines:" 10)))
  (cl-dotimes (- times)
    (newline)))

(defun ask-to-open-todo ()
  (cd "~/")
  (yorn-auto-n 10.0)
  (if (y-or-n-p "open todo-list?")
      (run-with-delay 1
       (find-file "~/todo.org"))
    (message nil)))

(defun yorn-auto-n (time)
  (run-with-delay time
		  (let ((original-buffer (current-buffer)))
		    (if (not (minibufferp original-buffer))
			(run-with-delay 0.01 (switch-to-buffer original-buffer)))
		    (switch-to-minibuffer)
		    (y-or-n-p-insert-n))))

(defun dashboard-restart-emacs-buttom ()
  (insert "\n  ")
  (insert-button "REBOOT"
                 'action (lambda (&rest _) (restart-emacs))
		 'face 'custom-button))

(defun add-startup-without-opening-file-hook (&rest symbols)
  (when (< (length command-line-args) 2) ;; Assume no file name passed
    (dolist (symbol symbols)
      (add-hook 'emacs-startup-hook symbol))))

(defun where-am-i ()
  (interactive)
  (message buffer-file-name))

(defun py-hide-all ()
  "通过逐行遍历隐藏 Python 所有顶层块（适配标准 hide-show 模式）。"
  (when (derived-mode-p 'python-mode)
    (hs-life-goes-on
     (save-excursion
       (goto-char (point-min))
       (syntax-propertize (point-max))
       (let ((progress (make-progress-reporter "hiding all python blocks..."
                                               (point-min) (point-max))))
         ;; 遍历所有行，直到文件末尾
         (while (< (point) (point-max))
           (let* ((line-start (line-beginning-position))
                  (indent (current-indentation))  ; 顶层块缩进为 0
                  (syntax (syntax-ppss line-start))
                  (in-string? (nth 3 syntax))
                  (in-comment? (nth 4 syntax))
                  ;; 匹配 Python 块起始行（关键字+冒号）
                  (is-block-start (save-excursion
                                    (goto-char line-start)
                                    (looking-at "^\\s-*\\(def\\|class\\|if\\|elif\\|else\\|for\\|while\\|try\\|except\\|finally\\|with\\)\\b.*:"))))
             ;; 仅处理顶层、非字符串/注释中的真实块
             (when (and (zerop indent)
                        is-block-start
                        (not in-string?)
                        (not in-comment?))
               (goto-char line-start)
               (hs-hide-block-at-point t)  ; 隐藏当前块
               ;; 关键修正：通过缩进定位块结束（避免依赖 hs-end-of-block）
               (let ((current-level indent))
                 ;; 向下移动，直到找到缩进 <= 当前顶层块的行（跳出嵌套）
                 (while (and (< (forward-line 1) 0)  ; 移动到下一行，失败则退出
                             (> (current-indentation) current-level)))
                 (goto-char (line-beginning-position))))  ; 定位到块结束后的行
             ;; 未匹配则移动到下一行
             (forward-line 1))
           (progress-reporter-update progress (point)))
         (progress-reporter-done progress)))
     (beginning-of-line))))


(add-hook 'python-mode-hook 'py-hide-all)

(provide 'init-funcs)
