;;; init-file.el --- Configure files handling   -*- lexical-binding: t -*-

;;; Backups.
;; Emacs saves one one backup by default,
;; so we use 'auto-save-hook to force backups.
(setq make-backup-files t         ; Backup a file the first time it is saved.
      backup-directory-alist
      `(("." . ,(concat user-emacs-directory ".backups"))) ; Save to this directory.
      backup-by-copying t         ; Preserve file owner and group.
      version-control t           ; Save numbered files.
      delete-old-versions t       ; Delete old versions silently.
      kept-new-versions 20        ; Number of newest versions to keep.
      kept-old-versions 10)       ; Number of oldest versions to keep.


;;; Auto-saving.
;; Configured to be used for its 'auto-save-hook.
;; To force auto-save at a given moment, use M-x do-auto-save.
(setq auto-save-default t          ; Turn on auto-saving.
      auto-save-interval 2000      ; Save after N characters typed.
      auto-save-timeout 86400)     ; Save after N seconds of idleness.

;; Auto-save current file-visiting buffer, after 5 sec by default.
(auto-save-visited-mode)

;; Save to a temporary directory.
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))


;;; Force backup on each auto-save.
;; https://www.emacswiki.org/emacs/ForceBackups
(defun yet/force-buffer-backup ()
  (let ((buffer-backed-up nil))
    (backup-buffer)))
(add-hook 'after-save-hook 'yet/force-buffer-backup)
(add-hook 'auto-save-hook 'yet/force-buffer-backup)


;;; Built-in vc (version control) package configuration.
(setq vc-handled-backends '(Git) ; Disable other VC systems to improve performance.
      vc-make-backup-files t     ; Backup files under VC system.
      vc-command-messages t)     ; Output shell commands vc package executes.

;; Move deleted files to trash.
(setq delete-by-moving-to-trash t)

(when (eq system-type 'darwin)

  ;;; Better integration with Mac OS Trash

  ;;; https://github.com/emacsorphanage/osx-trash/issues/4
  (defun yet/ns-move-file-to-trash (path)
    (ns-do-applescript
     (format
      "tell application \"Finder\" to move {the POSIX file \"%s\"} to trash"
      (replace-regexp-in-string (rx (group (any ?\\ ?\")))
                                "\\\\\\1"
                                (expand-file-name path)))))

  (if (not (fboundp 'system-move-file-to-trash))
      (defalias 'system-move-file-to-trash #'yet/ns-move-file-to-trash))

  ;; Or alternatively, if `Place Back' feature by Finder is not needed,
  ;; comment-out the lines above and un-comment the following one:
  ;; (setq trash-directory "~/.Trash"))


  ;;; Open Finder from Emacs

  ;; Inspired by https://github.com/rejeep/emacs/blob/master/osx.el
  ;; Open Finder for a directory.
  (defun yet/mac-open-finder (dir)
    "Open Mac Finder for a given directory."
    (interactive "DEnter directory name: ")
    (shell-command
     (format "%s %s"
             (executable-find "open")
             dir)))

  ;; Open Finder for the current file directory.
  (defun yet/mac-open-finder-current-file ()
    "Open Mac Finder for the current file-visiting buffer."
    (interactive)
    (let ((file (buffer-file-name)))
      (if file
          (yet/mac-open-finder (file-name-directory (buffer-file-name)))
        (error "This buffer is not visiting a file."))))

  ;; Open Finder for the current file.
  (global-set-key (kbd "C-c s-f") 'yet/mac-open-finder-current-file))

