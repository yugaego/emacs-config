;;; init-shell.el --- Shell configuration   -*- lexical-binding: t -*-

(require 'simple)

;; Show current dir in shell command prompt.
(setq shell-command-prompt-show-cwd t)

(require 'shell)

(when (and (boundp 'yet-explicit-shell-file-name) yet-explicit-shell-file-name)
  (setq explicit-shell-file-name yet-explicit-shell-file-name)
  (setq shell-file-name yet-explicit-shell-file-name))

(defun yet-start-term ()
  "Start terminal emulator with pre-defined user shell.
Creates new buffer on each call."
  (interactive)
  (vterm (generate-new-buffer-name "vterm")))

(global-set-key (kbd "C-c t s") 'yet-start-term)


(require 'exec-path-from-shell)

(when (display-graphic-p)
  (exec-path-from-shell-initialize))
