;; ===================================
;; Backward Compatibility
;; ===================================

(when (< emacs-major-version 27)
  (package-initialize))


;; ===================================
;; Basics
;; ===================================

;;; Appearance
(load-theme 'tango-dark t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(global-linum-mode t) ; M-x -linu
(setq
 inhibit-startup-message t
 uniquify-buffer-name-style 'forward ; prepend dirs to identically-named files
 initial-scratch-message nil
 initial-frame-alist
      '((top . 1) (left . 1) (width . 95) (height . 65))
 default-frame-alist
       '((top . 1) (left . 980) (width . 90) (height . 65) (font . "Menlo-16")))
(set-face-font 'default "Menlo-16")
(show-paren-mode 1)
(setq show-paren-delay 0)

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
(setq delete-by-moving-to-trash t) ; use Trash on deletion

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
      calendar-time-display-form '(24-hours ":" minutes
               (if time-zone " (") time-zone (if time-zone ")")))


;; ===================================
;; Key Bindings
;; ===================================

;;; Mac Dictionary
;; from https://gist.github.com/Superbil/5113974
(defun mac-open-dictionary (the-word)
    "Open Dictionary.app for the-word"
    (interactive "Dictionary Lookup: ")
    (shell-command
             (concat "open \"dict:///" (replace-regexp-in-string "\"" "\\\\\"" the-word) "\"")))

(global-set-key (kbd "C-c d")
		'(lambda ()
		   (interactive)
                     (mac-open-dictionary (current-word))))


;; ===================================
;; Language Specific
;; ===================================

;; https://www.emacswiki.org/emacs/AutoModeAlist
(add-to-list 'auto-mode-alist '("\\.rkt\\'" . scheme-mode))
(add-hook 'find-file-hook
          (lambda ()
            (when (string= (file-name-extension buffer-file-name) "rkt")
              (whitespace-mode +1))))


