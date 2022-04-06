;;; init-lsp.el --- Language Server Protocol client   -*- lexical-binding: t -*-

;;; Eglot (Emacs poliGLOT)

(require 'eglot)

(with-eval-after-load 'eglot

  (setq eldoc-idle-delay 0.2
        eldoc-echo-area-prefer-doc-buffer 'maybe
        eldoc-echo-area-use-multiline-p nil)

  (when (boundp eldoc-echo-area-display-truncation-message)
    (setq eldoc-echo-area-display-truncation-message nil))

  (setq eglot-events-buffer-size 0
        eglot-autoreconnect 5
        eglot-autoshutdown nil)


  ;;; Custom key bindings

  ;; Mnemonic `l': Language Server Protocol.

  (global-set-key (kbd "C-c l e") #'eglot)

  (define-key eglot-mode-map (kbd "C-c l s") #'eglot-shutdown)

  (define-key eglot-mode-map (kbd "C-c l r") #'eglot-rename)

  (advice-add 'project-kill-buffers
              :before
              (lambda ()
                (ignore-errors (eglot-shutdown (eglot-current-server))))
              '((name . "yet-project-kill-buffers")))

  (defun yet-texinfo-mode-eglot ()
    (setq eglot-stay-out-of '(company))
    (setq-local company-backends '((company-capf :with company-dabbrev)))
    (eglot-ensure))

  (add-hook 'texinfo-mode-hook #'yet-texinfo-mode-eglot)

  ;; Emacs used to freeze with auto-save-visited-mode enabled.
  ;; If this happens again:
  ;; 1. Consult `*EGLOT (www/php-mode) ...' buffers contents.
  ;; - To instruct `ido' show these buffers, click `C-x b C-a'.
  ;;
  ;; 2. In ~/.config/phpactor:
  ;; language_server.diagnostics_on_save: false
  ;; logging.enabled: true
  ;; logging.level: DEBUG
  ;; logging.path: phpactor.log
  ;; # use with $ phpactor rpc --replay
  ;; rpc.store_replay: true
  ;;
  ;; 3. As the last resort,
  ;; (setq-local auto-save-visited-mode nil)
  (defun yet-php-mode-eglot ()
    (when (boundp 'yet-eglot-php-server)
      (setq-local eglot-server-programs
                  `(((php-mode phps-mode) . ,yet-eglot-php-server))))
    (setq eglot-stay-out-of '(company))
    (setq-local company-backends
                '((:separate company-abbrev company-capf company-keywords
                             :with company-dabbrev-code
                  company-files))
                company-transformers '()))
    ;; (eglot-ensure))

  (add-hook 'php-mode-hook #'yet-php-mode-eglot 50))

