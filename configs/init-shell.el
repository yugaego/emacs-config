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

;; For scrolling and more Emacs' commands,
;; switch to `term-line-mode' with `C-x C-j'.
;; Switch back to `term-char-mode' with `C-c C-k'.
(defun yet-start-term ()
  "Start terminal emulator running 'bash'."
  (interactive)
  (ansi-term "bash"))

(global-set-key (kbd "C-c t s") 'yet-start-term)

(define-key term-raw-map (kbd "C-c t l") #'term-line-mode)
(define-key term-mode-map (kbd "C-c t c") #'term-char-mode)

(require 'shell)

(define-key shell-mode-map "\t" 'term-dynamic-complete)
(define-key shell-mode-map "\M-?"
  'term-dynamic-list-filename-completions)

