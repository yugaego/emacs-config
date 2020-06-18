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

;;; Minibuffer
(setq
 minibuffer-eldef-shorten-default t
 insert-default-directory "~/" ; minibuffer default path
 resize-mini-windows t ; decrease size when lines are removed
 suggest-key-bindings 5 ; show shortcut of the command for n seconds
 extended-command-suggest-shorter t)

;;; Session
;(setq initial-buffer-choice "~/Documents/TODO.md")
(setq-default history-length 1000) ; size of command history
(savehist-mode t) ; save command history between sessions
(global-linum-mode t) ; M-x -linu
;(filesets-init)

;;; Backups
(setq
 backup-directory-alist `(("." . "~/.emacs.d/.backups/"))
 backup-by-copying t ; don't clobber symlinks
 version-control t ; save numbered files
 delete-old-versions t ; delete files silently
 kept-new-versions 20
 kept-old-versions 2
 vc-make-backup-files t) ; backup version controlled files
;; Backup on each save
;; https://www.emacswiki.org/emacs/ForceBackups
(defun force-buffer-backup ()
  (let ((buffer-backed-up nil))
    (backup-buffer)))
(add-hook 'before-save-hook 'force-buffer-backup)
(add-hook 'auto-save-hook 'force-buffer-backup)

;;; Auto-saving
(setq
 auto-save-interval 200 ; characters
 delete-auto-save-files nil) ; do not delete on buffer saving

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


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;'(custom-enabled-themes (quote (tango-dark))))
;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;)
