;;; init.el --- Main configuration file   -*- lexical-binding: t -*-

;; ===================================
;; Installed Mac OS packages
;; ===================================
;;
;; Pre-installed `$ brew install jansson` for better performance
;; `$ brew install pandoc` for markdown-mode
;; `$ brew install aspell` for ispell and flyspell
;; `$ brew install trash` for osx-trash


;; ===================================
;; Backward Compatibility
;; ===================================

(when (< emacs-major-version 27)
  (package-initialize))


;; ===================================
;; Basics
;; ===================================

(add-to-list 'exec-path "/usr/local/bin")

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-windows)

;;; Appearance
(global-linum-mode t) ; on huge files use display-line-numbers-mode instead
(setq uniquify-buffer-name-style 'forward) ; prepend dirs to identically-named files

;;; Text
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq blink-cursor-blinks -1) ; blink forever
(setq sentence-end-double-space nil)

;;; Modes
(setq-default major-mode 'text-mode)
(global-auto-revert-mode 1)
(setq auto-save-visited-mode t) ; save file-visiting buffers in 5 seconds

;;; Minibuffer
(setq
 minibuffer-eldef-shorten-default t
 insert-default-directory "~/" ; minibuffer default path
 resize-mini-windows t ; decrease size when lines are removed
 suggest-key-bindings 5 ; show shortcut of the command for n seconds
 extended-command-suggest-shorter t
 read-answer t) ; accepts short answers to the questions (y vs yes)

;;; Session
(setq-default history-length 1000) ; size of command history
(savehist-mode t) ; save command history between sessions
(setq default-directory "~/")
(desktop-save-mode 1) ; save session automatically
(setq desktop-save t) ; do not ask, always save

;;; Version Control
(setq
 vc-handled-backends '(Git) ; disables other VC systems to improve performance
 vc-make-backup-files 1 ; backup files under VC system
 vc-command-messages 1) ; output shell commands vc executes

;;; Backups and Auto-saving
(setq
 backup-directory-alist `(("." . ,(concat user-emacs-directory ".backups")))
 backup-by-copying t ; don't clobber symlinks
 version-control t ; save numbered files
 delete-old-versions t ; delete files silently
 kept-new-versions 10
 kept-old-versions 4)
(setq
 auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
 auto-save-default t
 auto-save-interval 200 ; characters between auto-saves
 auto-save-timeout 600 ; save after N seconds of idleness
 delete-auto-save-files nil) ; do not delete on buffer saving
;; Backup on each save
;; https://www.emacswiki.org/emacs/ForceBackups
(defun force-buffer-backup ()
  (let ((buffer-backed-up nil))
    (backup-buffer)))
(add-hook 'after-save-hook 'force-buffer-backup)
(add-hook 'auto-save-hook 'force-buffer-backup)

;;; Mark region
(setq highlight-nonselected-windows t)
(setq mark-even-if-inactive nil) ; inactive region accepts commands
(delete-selection-mode 1) ; active region removed on typing
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;;; Edit
(setq kill-whole-line t) ; C-k kills newline character too
(setq
 undo-limit 8000000 ; 8 MB
 undo-strong-limit 12000000 ; 12 MB
 undo-outer-limit 20000000) ; 20 MB

;;; Scrolling
(setq scroll-step 1)

;;; Files
(setq delete-by-moving-to-trash t)

;;; Directory Listing
(setq
 directory-free-space-args "-kh" ; df options
 list-directory-brief-switches "-aFh" ; ls options
 list-directory-verbose-switches "-ahl") ; ls options

;;; Dired
(setq dired-auto-revert-buffer t) ; keep the buffer up-to-date
(add-hook 'dired-mode-hook 'auto-revert-mode) ; auto refresh dired when file changes

;;; Ediff
(setq ediff-split-window-function 'split-window-horizontally)

;;; Calendar
(setq calendar-week-start-day 1 ; on Monday
      calendar-date-style "iso"
      calendar-time-display-form
      '(24-hours ":" minutes
                 (if time-zone " (")
                 time-zone
                 (if time-zone ")")))

;;; Spell Checking
(setq ispell-program-name "aspell")


;; ===================================
;; Key Bindings
;; ===================================

;;; Mac Dictionary
;; from https://gist.github.com/Superbil/5113974
(defun mac-open-dictionary (the-word)
  "Open Dictionary.app for the-word"
  (interactive "Dictionary Lookup: ")
  (shell-command
   (concat
    "open \"dict:///"
    (replace-regexp-in-string "\"" "\\\\\"" the-word)
    "\"")))

(global-set-key (kbd "C-c d")
                '(lambda ()
                   (interactive)
                   (mac-open-dictionary (current-word))))

;;; Alternative to M-d
(global-set-key (kbd "M-<delete>") 'kill-word)

;; Use more advanced ibuffer in place of default buffers list
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

;; ===================================
;; Language Specific
;; ===================================

;; https://www.emacswiki.org/emacs/AutoModeAlist
(add-to-list 'auto-mode-alist '("\\.rkt\\'" . scheme-mode))
(add-hook 'find-file-hook
          (lambda ()
            (when (string= (file-name-extension buffer-file-name) "rkt")
              (whitespace-mode +1))))


;; ===================================
;; Packages
;; ===================================

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ; fallback to M-x

(require 'ido)
(ido-mode t)

(require 'osx-trash)
(when (eq system-type 'darwin)
  (osx-trash-setup))


;; ===================================
;; Custom
;; ===================================

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load-file custom-file)
