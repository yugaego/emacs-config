;;; init-navigation.el --- Move around   -*- lexical-binding: t -*-

(require 'bookmark)

(if (boundp 'yet-bookmark-default-file)
    (setq bookmark-default-file yet-bookmark-default-file))


(require 'windmove)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings 'super))


;; Load URL at point.
(global-goto-address-mode 1)


;; Do not require repeated `C-u' hit
;; when moving back in mark-ring.
;; Example: `C-u C-SPC ... C-SPC'
;; instead of `C-u C-SPC ... C-u C-SPC'.
(setq set-mark-command-repeat-pop t)

