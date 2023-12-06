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


(require 'shell)

(when (boundp 'yet-explicit-shell-file-name)
  (setq explicit-shell-file-name yet-explicit-shell-file-name))


(require 'term)

(setq term-completion-autolist t
      term-completion-recexact t)

;;; Usability Tips
;; To call `M-x' commands, prefix them with `C-x'.
;; For scrolling and other Emacs's commands,
;; switch to `term-line-mode' with `C-x C-j'.
;; Switch back to `term-char-mode' with `C-c C-k'.
;; Or use custom bindings (see below).
(defun yet-start-term ()
  "Start terminal emulator with pre-defined user shell.
Creates new buffer on each call."
  (interactive)
  (let ((switch-to-buffer-obey-display-actions t))
    (ansi-term (or explicit-shell-file-name
				   (getenv "ESHELL")
				   shell-file-name))))

(defun yet-term-mode ()
  ;; https://github.com/fish-shell/fish-shell/issues/1411#issuecomment-40859080
  (toggle-truncate-lines 1))
  ;; (term-set-escape-char ?\C-x))

(add-hook 'term-mode-hook 'yet-term-mode)

(global-set-key (kbd "C-c t s") 'yet-start-term)

(define-key term-raw-escape-map (kbd "t l") #'term-line-mode)
(define-key term-mode-map (kbd "C-c t c") #'term-char-mode)

(require 'shell)

(define-key shell-mode-map "\t" 'term-dynamic-complete)
(define-key shell-mode-map "\M-?"
  'term-dynamic-list-filename-completions)

