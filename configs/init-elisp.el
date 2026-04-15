;;; init-elisp.el --- Emacs Lisp mode   -*- lexical-binding: t -*-

(require 'flymake)

(setq elisp-flymake-byte-compile-load-path
      (cons "./elpa" load-path))

(defun yet-emacs-lisp-mode ()
  (setq-local emacs-lisp-docstring-fill-column 75)
  (flymake-mode 1)
  (push '(face . nil) (get :note 'flymake-overlay-control)))

(add-hook 'emacs-lisp-mode-hook 'yet-emacs-lisp-mode)

(when (boundp 'help-fns-describe-function-functions)
  (add-hook 'help-fns-describe-function-functions
            #'shortdoc-help-fns-examples-function))

;; Simplify syntax escaping in 're-builder'.
(setq reb-re-syntax 'string)
