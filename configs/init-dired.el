;;; init-dired.el --- Configure Dired, the Directory Editor   -*- lexical-binding: t -*-

(setq dired-auto-revert-buffer t        ; Keep Dired buffers up-to-date.
      dired-listing-switches "-alh")    ; Output human-readable sizes.

;; Auto-refresh Dired when file changes.
(add-hook 'dired-mode-hook 'auto-revert-mode)

;;; Experimental: Key bindings to open favorite directories in Dired.
(global-set-key (kbd "C-c s-H") (lambda() (interactive) (dired "~/")))

(global-set-key (kbd "C-c s-D") (lambda() (interactive) (dired "~/Documents")))

(global-set-key (kbd "C-c s-P") (lambda() (interactive) (dired "~/Programs")))

(global-set-key (kbd "C-c s-S") (lambda() (interactive) (dired "~/Sites")))

