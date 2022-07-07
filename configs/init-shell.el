;;; init-shell.el --- Shell configuration   -*- lexical-binding: t -*-

(require 'simple)

;; Show current dir in shell command prompt.
(setq shell-command-prompt-show-cwd t)

;; To load =bash= $PATH, aliases and functions:
;; 1. Put them to an auto-read file, f.i. to ~/.bash_profile.
;; 2. Add line `source ~/.bash_profile' to `~/.bashrc'.
;; 3. Add `-i' interactive switch to shell commands.
;;    - it enables loading of the `~/.bashrc'.
;; https://stackoverflow.com/a/68634101/1319821
;; https://stackoverflow.com/a/903213/1319821
(setq shell-command-switch "-ic")


(require 'term)

(setq term-completion-autolist t
      term-completion-recexact t)

(defun yet-term-mode ()
  (term-set-escape-char ?\C-x)
  (define-key term-raw-map "\C-y" (lambda ()
                                    (interactive)
                                    (term-line-mode)
                                    (yank)))
  (define-key term-raw-map "\M-y" (lambda ()
                                    (interactive)
                                    (term-line-mode)
                                    (yank-pop)))
  (define-key term-raw-map "\M-w" #'kill-ring-save)
  (define-key term-raw-map "\M-:" #'eval-expression))

(add-hook 'term-mode-hook 'yet-term-mode)

(defun yet-start-term ()
  "Start terminal emulator running 'bash'."
  (interactive)
  (term "bash"))

(global-set-key (kbd "C-c t") 'yet-start-term)


(require 'shell)

(define-key shell-mode-map "\t" 'term-dynamic-complete)
(define-key shell-mode-map "\M-?"
  'term-dynamic-list-filename-completions)

