;;; init-lsp.el --- Language Server Protocol client   -*- lexical-binding: t -*-

;;; Eglot (Emacs poliGLOT)

(require 'eglot)

(with-eval-after-load 'eglot

  (setq eldoc-idle-delay 0.2
        eldoc-echo-area-prefer-doc-buffer 'maybe)

  (when yet-is-emacs-28
    (setq eldoc-echo-area-display-truncation-message nil
          eldoc-echo-area-use-multiline-p nil))

  (global-set-key (kbd "C-c e r") #'eglot-rename)


  (defun yet-php-mode-eglot ()
    (when (boundp 'yet-eglot-php-server)
      (setq-local eglot-server-programs
                  `(((php-mode phps-mode) . ,yet-eglot-php-server))))
    (eglot-ensure))

  (add-hook 'php-mode-hook #'yet-php-mode-eglot))

