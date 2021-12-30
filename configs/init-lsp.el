;;; init-lsp.el --- Language Server Protocol client   -*- lexical-binding: t -*-

;;; Eglot (Emacs poliGLOT)

(require 'eglot)

(with-eval-after-load 'eglot

  (setq eldoc-idle-delay 0.2
        eldoc-echo-area-prefer-doc-buffer 'maybe)

  (when yet-is-emacs-28
    (setq eldoc-echo-area-display-truncation-message nil
          eldoc-echo-area-use-multiline-p nil))

  (setq eglot-events-buffer-size 0
        eglot-autoreconnect 5)


  ;;; Custom key bindings

  ;; Mnemonic `l': Language Server Protocol.

  (global-set-key (kbd "C-c l e") #'eglot)

  (define-key eglot-mode-map (kbd "C-c l s") #'eglot-shutdown)

  (define-key eglot-mode-map (kbd "C-c l r") #'eglot-rename)


  (defun yet-texinfo-mode-eglot ()
    (setq eglot-stay-out-of '(company))
    (setq-local company-backends '((company-capf :with company-dabbrev)))
    (eglot-ensure))

  (add-hook 'texinfo-mode-hook #'yet-texinfo-mode-eglot)


  (defun yet-php-mode-eglot ()
    (when (boundp 'yet-eglot-php-server)
      (setq-local eglot-server-programs
                  `(((php-mode phps-mode) . ,yet-eglot-php-server))))
    (setq eglot-stay-out-of '(company))
    (setq-local company-backends
                '((:separate company-abbrev company-capf company-keywords
                             :with company-dabbrev-code
                  company-files))
                company-transformers '())
    ;; Enable manually instead.
    ;; (eglot-ensure)
    )

  (add-hook 'php-mode-hook #'yet-php-mode-eglot 50))

