;;; init-keybindings.el --- Custom keymap   -*- lexical-binding: t -*-

;; Alternative to M-d.
(global-set-key (kbd "M-<delete>") 'kill-word)

;; Dvorak / Kinesis usability.
(global-set-key (kbd "C-z") ctl-x-map) ; alternative to C-x prefix key.
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

;; Toggle scroll-lock-mode.
;; `l' mnemonic: Lock Line and scroLL.
(global-set-key (kbd "C-c l") #'scroll-lock-mode)

