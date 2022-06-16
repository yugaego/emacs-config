;;; init-lsp.el --- Language Server Protocol client   -*- lexical-binding: t -*-

;;; Eglot (Emacs poliGLOT)

(require 'eglot)

(with-eval-after-load 'eglot

  (setq eldoc-idle-delay 1
        eldoc-documentation-strategy #'eldoc-documentation-default
        eldoc-echo-area-prefer-doc-buffer 'maybe
        eldoc-echo-area-use-multiline-p nil)

  (when (boundp eldoc-echo-area-display-truncation-message)
    (setq eldoc-echo-area-display-truncation-message nil))

  ;; TEST
  (setq eglot-stay-out-of '(company)
        eglot-send-changes-idle-time 0.5)


  ;;; Custom key bindings

  ;; Mnemonic `l': Language Server Protocol.

  (global-set-key (kbd "C-c l e") #'eglot)

  (define-key eglot-mode-map (kbd "C-c l s") #'eglot-shutdown)

  (define-key eglot-mode-map (kbd "C-c l r") #'eglot-rename)

  (advice-add 'project-kill-buffers
              :before
              (lambda ()
                (ignore-errors (eglot-shutdown-all)))
              '((name . "yet-project-kill-buffers")))


  (defun yet-rust-mode-eglot ()
    (when (boundp 'yet-eglot-rust-server)
      (setq-local eglot-server-programs
                  `((rust-mode . ,yet-eglot-rust-server))))
    (eglot-ensure))

  (add-hook 'rust-mode-hook 'yet-rust-mode-eglot)


  (defun yet-texinfo-mode-eglot ()
    (setq-local company-backends
                '((company-capf :with company-dabbrev)))
    (eglot-ensure))

  (add-hook 'texinfo-mode-hook 'yet-texinfo-mode-eglot)


  (defun yet-php-mode-eglot ()
    (when (boundp 'yet-eglot-php-server)
      (setq-local eglot-server-programs
                  `(((php-mode phps-mode web-mode) . ,yet-eglot-php-server))))
    (eglot-ensure))

  (add-hook 'php-mode-hook 'yet-php-mode-eglot)
  (add-hook 'web-mode-hook 'yet-php-mode-eglot))

