;;; init-prog.el --- Programming languages   -*- lexical-binding: t -*-

;;; Makefile

(defun yet-makefile-mode-hook ()
  (setq-local indent-tabs-mode t))

(add-hook 'makefile-mode-hook #'yet-makefile-mode-hook)

