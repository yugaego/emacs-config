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

(require 'rainbow-mode)

(with-eval-after-load 'rainbow-mode

  (defun yet-emacs-lisp-rainbow ()
    (let ((buffer-name (buffer-file-name)))
      (if (and buffer-name
               (string-match-p "-theme.el" buffer-name))
      (rainbow-mode 1))))

  (add-hook 'emacs-lisp-mode-hook 'yet-emacs-lisp-rainbow))

