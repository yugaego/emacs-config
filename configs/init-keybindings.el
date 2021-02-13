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

;; Duplicate current line.
;; https://stackoverflow.com/a/88828/1319821
(defun duplicate-line()
  "Duplicate current line"
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  ;; (newline)
  (yank))

(global-set-key (kbd "C-c C-d") 'duplicate-line)

