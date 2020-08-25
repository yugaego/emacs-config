;; ===================================
;; Basic Customization
;; ===================================

;;; Workarounds
;; Emacs 26 TLS connection problem
;; https://lists.gnu.org/archive/html/help-gnu-emacs/2019-02/msg00144.html
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;;; Appearance
(load-theme 'tango-dark t)
(setq
 inhibit-startup-message t
 uniquify-buffer-name-style 'forward) ; prepend dirs to identically-named files
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq
 initial-frame-alist
      '((top . 1) (left . 1) (width . 95) (height . 65))
 default-frame-alist
       '((top . 1) (left . 980) (width . 90) (height . 65) (font . "Menlo-16")))
(set-face-font 'default "Menlo-16")

;;; Ediff
(setq ediff-split-window-function 'split-window-horizontally)
;; https://www.emacswiki.org/emacs/EdiffMode
;; Usage: emacs -diff file1 file2
;; TODO: ADD RELATIVE PATHS SUPPORT
(defun command-line-diff (switch)
      (let ((file1 (pop command-line-args-left))
            (file2 (pop command-line-args-left)))
        (ediff file1 file2)))
(add-to-list 'command-switch-alist '("diff" . command-line-diff))

;;; Modes
(setq-default major-mode 'text-mode)
(setq auto-save-visited-mode t) ; save file-visiting buffers in 5 seconds
(auto-save-visited-mode +1)
;; https://www.emacswiki.org/emacs/AutoModeAlist
(add-to-list 'auto-mode-alist '("\\.rkt\\'" . scheme-mode))
(add-hook 'find-file-hook
          (lambda ()
            (when (string= (file-name-extension buffer-file-name) "rkt")
              (whitespace-mode +1))))

;;; Parentheses
(setq show-paren-delay 0)
(show-paren-mode 1)

;;; Minibuffer
(setq
 minibuffer-eldef-shorten-default t
 insert-default-directory "~/" ; minibuffer default path
 resize-mini-windows t ; decrease size when lines are removed
 suggest-key-bindings 5 ; show shortcut of the command for n seconds
 extended-command-suggest-shorter t)

;;; Session
(setq-default history-length 1000) ; size of command history
(savehist-mode t) ; save command history between sessions
(global-linum-mode t) ; M-x -linu
(setq default-directory "~/")
(desktop-save-mode 1)
(setq desktop-save t) ; always save

;;; Version Control
(setq
 vc-handled-backends '(Git) ; disables other VC systems
 vc-make-backup-files 1 ; backup files under VC system
 vc-command-messages 1) ; output shell commands vc executes
 ;vc-suppress-confirm 1)

;;; Backups
(setq
 backup-directory-alist `(("." . ,(concat user-emacs-directory ".backups")))
 backup-by-copying t ; don't clobber symlinks
 version-control t ; save numbered files
 delete-old-versions t ; delete files silently
 kept-new-versions 20
 kept-old-versions 2)
;; Backup on each save
;; https://www.emacswiki.org/emacs/ForceBackups
(defun force-buffer-backup ()
  (let ((buffer-backed-up nil))
    (backup-buffer)))
(add-hook 'before-save-hook 'force-buffer-backup)
(add-hook 'auto-save-hook 'force-buffer-backup)

;;; Auto-saving
(setq
 auto-save-interval 100 ; characters
 auto-save-timeout 20) ; seconds
; delete-auto-save-files nil) ; do not delete on buffer saving

;;; Mark region
(setq highlight-nonselected-windows t)
(setq mark-even-if-inactive nil) ; inactive region accepts commands
(delete-selection-mode 1) ; active region removed on typing
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;;; Edit
;(setq create-lockfiles nil)
(setq kill-whole-line t) ; C-k kills newline character too
(setq
 undo-limit 8000000 ; 8 MB
 undo-strong-limit 12000000 ; 12 MB
 undo-outer-limit 20000000) ; 20 MB

;;; Navigation
;(setq sentence-end-double-space nil) ; affects M-e behavior
;(global-set-key (kbd "M-e") 'forward-sentence)

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

;;; Calendar
(setq calendar-week-start-day 1 ; on Monday
      calendar-date-style "iso"
      calendar-time-display-form '(24-hours ":" minutes
               (if time-zone " (") time-zone (if time-zone ")")))

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



;; User-Defined init.el ends here


