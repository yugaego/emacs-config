;;; early-init.el

;; Supported since Emacs 27.

;;; Appearance
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq
 inhibit-startup-message t
 uniquify-buffer-name-style 'forward ; prepend dirs to identically-named files
 initial-scratch-message nil
 initial-frame-alist
 '((top . 1) (left . 1) (width . 95) (height . 65))
 default-frame-alist
 '((top . 1) (left . 980) (width . 90) (height . 65) (font . "Menlo-16")))
(set-face-font 'default "Menlo-16")

