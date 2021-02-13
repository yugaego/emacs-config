;;; init.el --- Main configuration file   -*- lexical-binding: t -*-

(when (< emacs-major-version 27)
  (package-initialize))

;; Make more executables available to Emacs.
(add-to-list 'exec-path "/usr/local/bin")

(defconst *is-a-mac* (eq system-type 'darwin))

;; Load private settings.
(let ((private-init (expand-file-name "private-init.el" user-emacs-directory)))
  (when (file-exists-p private-init)
    (load private-init)))

;; Load additional configuration files matching the name pattern.
;; If needed, rename a file to disable (enable) its load on Emacs startup.
(mapc 'load (file-expand-wildcards (concat user-emacs-directory "configs/init-*.el")))

;;; Session
(setq-default history-length 1000) ; size of command history
(savehist-mode t) ; save command history between sessions
(setq-default default-directory "~/")
(desktop-save-mode 1) ; save session automatically
(setq desktop-save t) ; do not ask, always save

(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ; fallback to M-x

(require 'ido)
(ido-mode t)

(require 'geiser)
(setq geiser-active-implementations '(mit))
(setq geiser-repl-query-on-kill-p nil)

;; Org Mode
(setq
 org-startup-truncated nil
 org-startup-folded nil ; open org file with the items expanded
 org-support-shift-select 'always) ; force enable shift-selection

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

