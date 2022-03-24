;;; init-prog.el --- Programming languages   -*- lexical-binding: t -*-

;;; Makefile

(defun yet-makefile-mode-hook ()
  (setq-local indent-tabs-mode t))

(add-hook 'makefile-mode-hook #'yet-makefile-mode-hook)

;;; PHP

(defun yet-php-mode-hook ()
  (abbrev-mode -1)
  (when (boundp 'electric-pair-skip-self)
    (setq electric-pair-skip-self 'electric-pair-default-skip-self)))

(add-hook 'php-mode-hook #'yet-php-mode-hook)
