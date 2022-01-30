;;; init-prog.el --- Programming languages   -*- lexical-binding: t -*-

;;; Makefile

(defun yet-makefile-mode-hook ()
  (setq-local indent-tabs-mode t))

(add-hook 'makefile-mode-hook #'yet-makefile-mode-hook)

;;; PHP

(defun yet-php-mode-hook ()
  (when (fboundp 'c-toggle-electric-state)
    (c-toggle-electric-state -1)))

(add-hook 'php-mode-hook #'yet-php-mode-hook)
