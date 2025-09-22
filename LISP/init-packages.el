;; -*- lexical-binding: t -*-
;;镜像源
(setq package-archives '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) ;; You might already have this line
(when (not package-archive-contents)
  (package-refresh-contents))
(setq package-check-signature nil) 
(provide 'init-packages) 
