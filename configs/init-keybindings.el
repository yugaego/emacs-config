;;; init-keybindings.el --- Custom keymap   -*- lexical-binding: t -*-

;; Alternative to C-x o.
(global-set-key (kbd "C-<tab>") 'other-window)

;; Alternative to M-d.
(global-set-key (kbd "M-<delete>") 'kill-word)

;; Use more advanced ibuffer in place of default buffers list.
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

;; Dvorak / Kinesis usability.
(global-set-key (kbd "C-z") ctl-x-map) ; alternative to C-x prefix key.
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

