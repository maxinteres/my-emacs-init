;; -*- lexical-binding: t -*-
(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8)
(setq system-time-locale "C");编码设置

(setq gc-cons-threshold most-positive-fixnum)

;;让鼠标滚动更好用
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(add-to-list 'default-frame-alist '(width . 150))
(add-to-list 'default-frame-alist '(height . 45))
(add-to-list 'default-frame-alist '(font . "Hack-9"))
(add-to-list 'initial-frame-alist '(width . 150))
(add-to-list 'initial-frame-alist '(height . 45))
(add-to-list 'initial-frame-alist '(font . "Hack-9"))
