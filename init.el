;;; init.el --- Main configuration file   -*- lexical-binding: t -*-

;; ===================================
;; Installed Mac OS packages
;; ===================================
;;
;; Pre-installed `$ brew install jansson` for better performance.
;; `$ brew install pandoc` for markdown-mode.
;; `$ brew install aspell` for ispell and flyspell.
;; `$ brew install trash` to improve performance of osx-trash.
;; `$ brew install mit-scheme` for MIT/GNU Scheme REPL by geiser.

;; ===================================
;; Backward Compatibility
;; ===================================

(when (< emacs-major-version 27)
  (package-initialize))


;; ===================================
;; Basics
;; ===================================

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

(setq dired-auto-revert-buffer t        ; Keep Dired buffers up-to-date.
      dired-listing-switches "-alh")    ; Output human-readable sizes.

(add-hook 'dired-mode-hook 'auto-revert-mode) ; Auto-refresh Dired when file changes.

;;; Spell Checking
(setq ispell-program-name "aspell")


;; ===================================
;; Packages
;; ===================================

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


;; ===================================
;; Custom
;; ===================================

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

