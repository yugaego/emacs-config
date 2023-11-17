;;; init-dired.el --- Dired: the Directory Editor   -*- lexical-binding: t -*-

(require 'dired)

(setq dired-auto-revert-buffer t        ; Keep Dired buffers up-to-date.
      dired-listing-switches "-alh")    ; Output human-readable sizes.

;; Auto-refresh Dired when file changes.
(add-hook 'dired-mode-hook 'auto-revert-mode)

;; No more buffers spawned!
(when (boundp 'dired-kill-when-opening-new-dired-buffer)
  (setq dired-kill-when-opening-new-dired-buffer t))

;; Show all switches.
(when (boundp 'dired-switches-in-mode-line)
  (setq dired-switches-in-mode-line 'as-is))


(defun yet-dired-display-next (&optional arg)
  "Move down lines and display the file or directory in another window.
Optional prefix ARG says how many lines to move; default is one line."
  (interactive "p")
  (dired-next-line (or arg 1))
  (dired-display-file))

(defun yet-dired-display-previous (&optional arg)
  "Move up lines and display the file or directory in another window.
Optional prefix ARG says how many lines to move; default is one line."
  (interactive "p")
  (dired-previous-line (or arg 1))
  (dired-display-file))

(define-key dired-mode-map (kbd "n") 'yet-dired-display-next)
(define-key dired-mode-map (kbd "p") 'yet-dired-display-previous)
