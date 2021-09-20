;;; init-dvorak.el --- Dvorak (and Kinesis) usability    -*- lexical-binding: t -*-

;; Alternative to `C-x' prefix key,
;; often more convenient for a split keyboard.
(global-set-key (kbd "C-z") ctl-x-map)

(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

