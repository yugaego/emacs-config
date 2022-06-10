;;; init-prog.el --- Programming languages   -*- lexical-binding: t -*-

;;; Makefile

(defun yet-makefile-mode-hook ()
  (setq-local indent-tabs-mode t))

(add-hook 'makefile-mode-hook #'yet-makefile-mode-hook)

;;; PHP

(defun yet-php-mode-hook ()
  (abbrev-mode -1)
  (setq-local mode-line-misc-info
              '((global-mode-string ("" global-mode-string))
                flymake-mode-line-counters)))

(add-hook 'php-mode-hook #'yet-php-mode-hook)
(add-hook 'web-mode-hook #'yet-php-mode-hook)
