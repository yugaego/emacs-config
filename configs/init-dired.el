;;; init-dired.el --- Dired: the Directory Editor   -*- lexical-binding: t -*-

(require 'dired)

(setq dired-auto-revert-buffer t        ; Keep Dired buffers up-to-date.
      dired-listing-switches "-alh")    ; Output human-readable sizes.

;; Auto-refresh Dired when file changes.
(add-hook 'dired-mode-hook 'auto-revert-mode)

(when (version<= "28.0.50" emacs-version)
  (setq dired-kill-when-opening-new-dired-buffer t ; No more buffers spawned!
        dired-switches-in-mode-line 'as-is))       ; Show all switches.

