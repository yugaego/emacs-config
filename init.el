;;; init.el --- Main configuration file   -*- lexical-binding: t -*-

;; Make more executables available to Emacs.
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(defconst *is-a-mac* (eq system-type 'darwin))

;; Pre-load optional local settings.
(let ((local-pre-init (expand-file-name "local-pre-init.el" user-emacs-directory)))
  (when (file-exists-p local-pre-init)
    (load local-pre-init)))

;; Load additional configuration files matching the name pattern.
;; If needed, rename a file to disable (enable) its load on Emacs startup.
(mapc 'load (file-expand-wildcards (concat user-emacs-directory "configs/init-*.el")))

;;; Load configuration file handled by Emacs Customization.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

