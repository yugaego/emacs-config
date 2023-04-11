;;; init.el --- Main configuration file   -*- lexical-binding: t -*-

;; Tweak performance.
;; https://emacs-lsp.github.io/lsp-mode/page/performance/
(setq read-process-output-max (* 1024 1024) ; try 1-3 Mb.
      gc-cons-threshold (* 8 800000)          ; multiply initial 800 Kb by 2.
      garbage-collection-messages nil)

;; Pre-load optional local settings.
(let ((local-pre-init (expand-file-name
                       "local-pre-init.el"
                       user-emacs-directory)))
  (when (file-exists-p local-pre-init)
    (load local-pre-init)))

;; Make OS installed executables available to Emacs.
(when (boundp 'yet-exec-path)
  (dolist (path yet-exec-path)
    (add-to-list 'exec-path path)))

(when (boundp 'yet-source-directory)
  (setq source-directory yet-source-directory))

;; Load additional configuration files matching the name pattern.
;; If needed, rename a file to disable (enable) its load on Emacs startup.
(mapc 'load (file-expand-wildcards
             (concat user-emacs-directory "configs/init-*.el")))

;; Post-load optional local settings.
(let ((local-post-init (expand-file-name
                        "local-post-init.el"
                        user-emacs-directory)))
  (when (file-exists-p local-post-init)
    (load local-post-init)))

;;; Load configuration file handled by Emacs Customization.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

