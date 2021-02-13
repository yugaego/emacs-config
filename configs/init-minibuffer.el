;;; init-minibuffer.el --- Configure minibuffer   -*- lexical-binding: t -*-

(setq minibuffer-eldef-shorten-default t ; Shorten prompt.
      insert-default-directory "~/"      ; Default path.
      resize-mini-windows t              ; Resize to fit the text.
      extended-command-suggest-shorter t ; Show a shorter M-x command.
      suggest-key-bindings 5)            ; Show key binding for N sec.

(setq-default default-directory "~/")

;; Accept one-letter answers.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Maximum length of a minibuffer history lists:
;; file, buffer, command, and argument names.
(setq-default history-length 1000)

;; Save minibuffer history between sessions.
(savehist-mode t)

(require 'ido)
(ido-mode t)

(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ; Fallback to M-x.

