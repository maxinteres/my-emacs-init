;; -*- lexical-binding: t -*-
(add-hook 'dired-mode-hook 'dired-hide-details-mode)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

(put 'dired-find-alternate-file 'disabled nil)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file));在dired-mode下打开文件夹不会创建新缓冲区
;使用C-o在另一个文件夹打开文件

(provide 'init-dired)
