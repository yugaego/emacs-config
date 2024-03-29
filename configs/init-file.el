;;; init-file.el --- Configure files handling   -*- lexical-binding: t -*-

(setq safe-local-variable-values
      '((project-vc-merge-submodules . nil)
        (auto-fill-mode . 1)
        (company-dabbrev-other-buffers . nil)
        (eval . (load (expand-file-name "yet-publish.el") t t t))))

(when (fboundp 'rename-visited-file)    ; Since Emacs 29.1
  (keymap-global-set "C-c f r" #'rename-visited-file))

;;; Backups

;; Emacs saves only one backup by default,
;; so we use 'auto-save-hook to force backups.
(setq make-backup-files t         ; Backup a file the first time it is saved.
      backup-by-copying t         ; Preserve file owner and group.
      version-control t           ; Save numbered files.
      delete-old-versions t       ; Delete old versions silently.
      kept-new-versions 20        ; Number of newest versions to keep.
      kept-old-versions 10)       ; Number of oldest versions to keep.

;; Save backups to this folder(s).
(setq backup-directory-alist
      (if (boundp 'yet-backup-directory-alist)
          yet-backup-directory-alist
        `(("." . ,(concat user-emacs-directory ".backups")))))


;;; Auto-saving

;; Configured to be used for its 'auto-save-hook.
;; To force auto-save at a given moment, use M-x do-auto-save.
(setq auto-save-default t          ; Turn on auto-saving.
      auto-save-interval 2000      ; Save after N characters typed.
      auto-save-timeout 86400)     ; Save after N seconds of idleness.

;; Auto-save current file-visiting buffer.
(auto-save-visited-mode 1)
(setq auto-save-visited-interval 300)

;; Save to a temporary directory.
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
;; Do not create '~/.emacs.d/auto-save-list/' directory.
(setq auto-save-list-file-prefix nil)

;;; Force backup on each auto-save.
;; https://www.emacswiki.org/emacs/ForceBackups
(defun yet-force-buffer-backup ()
  (let ((buffer-backed-up nil))
    (backup-buffer)))
(add-hook 'after-save-hook 'yet-force-buffer-backup)
(add-hook 'auto-save-hook 'yet-force-buffer-backup)


;; Move deleted files to trash.
(setq delete-by-moving-to-trash t)

(when (eq system-type 'darwin)

  ;;; Better integration with Mac OS Trash

  ;;; https://github.com/emacsorphanage/osx-trash/issues/4
  (defun yet-ns-move-file-to-trash (path)
    (ns-do-applescript
     (format
      "tell application \"Finder\" to move {the POSIX file \"%s\"} to trash"
      (replace-regexp-in-string (rx (group (any ?\\ ?\")))
                                "\\\\\\1"
                                (expand-file-name path)))))

  (if (not (fboundp 'system-move-file-to-trash))
      (defalias 'system-move-file-to-trash 'yet-ns-move-file-to-trash))

  ;; Or alternatively, if `Place Back' feature by Finder is not needed,
  ;; comment-out the lines above and un-comment the following one:
  ;; (setq trash-directory "~/.Trash"))


  ;;; Open Finder from Emacs

  ;; Inspired by https://github.com/rejeep/emacs/blob/master/osx.el
  ;; Open Finder for a directory.
  (defun yet-mac-open-finder (dir)
    "Open Mac Finder for a given directory."
    (interactive "DEnter directory name: ")
    (shell-command
     (format "%s %s"
             (executable-find "open")
             dir)))

  ;; Open Finder for the current file directory.
  (defun yet-mac-open-finder-current-file ()
    "Open Mac Finder for the current file-visiting buffer."
    (interactive)
    (let ((file (buffer-file-name)))
      (if file
          (yet-mac-open-finder (file-name-directory (buffer-file-name)))
        (error "This buffer is not visiting a file."))))

  ;; Open Finder for the current file.
  (global-set-key (kbd "C-c s-f") 'yet-mac-open-finder-current-file))

