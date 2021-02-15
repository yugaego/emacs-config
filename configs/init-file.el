;;; init-file.el --- Configure files handling   -*- lexical-binding: t -*-

;; Move deleted files to trash.
(setq delete-by-moving-to-trash t)

;; Fix Mac trashing.
(when *is-a-mac*
  ;; To improve performance, ~$ brew install trash~.
  (require 'osx-trash)
  (osx-trash-setup))


;;; Backups.
;; Emacs saves one one backup by default,
;; so we use 'auto-save-hook to force backups.
(setq make-backup-files t         ; Backup a file the first time it is saved.
      backup-directory-alist `(("." . ,(concat user-emacs-directory ".backups"))) ; Save to this directory.
      backup-by-copying t         ; Preserve file owner and group.
      version-control t           ; Save numbered files.
      delete-old-versions t       ; Delete old versions silently.
      kept-new-versions 10        ; Number of newest versions to keep.
      kept-old-versions 10)       ; Number of oldest versions to keep.


;;; Auto-saving.
;; Configured to be used for it 'auto-save-hook.
;; To force auto-save at a given moment, use M-x do-auto-save.
(setq auto-save-default t          ; Turn on auto-saving.
      auto-save-visited-mode t     ; Auto-save current file-visiting buffer, after 5 sec by default.
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)) ; Save to a temporary directory.
      auto-save-interval 200       ; Save after N characters typed.
      auto-save-timeout 600)       ; Save after N seconds of idleness.


;;; Force backup on each auto-save.
;; https://www.emacswiki.org/emacs/ForceBackups
(defun force-buffer-backup ()
  (let ((buffer-backed-up nil))
    (backup-buffer)))
(add-hook 'after-save-hook 'force-buffer-backup)
(add-hook 'auto-save-hook 'force-buffer-backup)


;;; Built-in vc (version control) package configuration.
(setq vc-handled-backends '(Git) ; Disable other VC systems to improve performance.
      vc-make-backup-files t     ; Backup files under VC system.
      vc-command-messages t)     ; Output shell commands vc package executes.


;;; Use Mac Finder.
;; Inspired by https://github.com/rejeep/emacs/blob/master/osx.el
(when *is-a-mac*

  ;; Open Finder for a directory.
  (defun mac-open-finder (dir)
    "Open Mac Finder.app for a given directory."
    (interactive "DEnter directory name: ")
    (shell-command
     (format "%s %s"
             (executable-find "open")
             dir)))
  
  ;; Open Finder for the current file.
  (global-set-key
   (kbd "C-c s-f")
   (lambda()
     (interactive)
     (let ((file (buffer-file-name)))
       (if file
           (mac-open-finder (file-name-directory (buffer-file-name)))
         (error "This buffer is not visiting a file."))))))

