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

