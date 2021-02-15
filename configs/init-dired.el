;;; init-dired.el --- Configure Dired, the Directory Editor   -*- lexical-binding: t -*-

(setq dired-auto-revert-buffer t        ; Keep Dired buffers up-to-date.
      dired-listing-switches "-alh")    ; Output human-readable sizes.

;; Auto-refresh Dired when file changes.
(add-hook 'dired-mode-hook 'auto-revert-mode)

