;;; early-init.el --- Loaded before init.el (Emacs 27+)   -*- lexical-binding: t -*-

;; Consistent look right from the start.
(load-theme 'misterioso t)

(defconst yet/font
  (cond ((eq system-type 'darwin) "Monaco-17")
        ((memq system-type '(ms-dos windows-nt)) "Consolas-17")
        (t "DejaVu Sans Mono-17")))

;; New frames configuration.
;; Uses 0.0 to 1.0 ratio.
(setq default-frame-alist
      `((top . 0.0)
        (left . 1.0)
        (width . 0.48)
        (height . 1.0)
        (font . ,yet/font)))

;; Initial (first) frame configuration.
;; Uses 0.0 to 1.0 ratio.
(setq initial-frame-alist
      `((top . 0.0)
        (left . 0.0)
        (width . 0.52)
        (height . 1.0)
        (font . ,yet/font)))

(setq inhibit-startup-message t         ; Do not display startup message.
      initial-scratch-message nil)      ; Start with empty *scratch* buffer.

;; Disable UI elements.
(scroll-bar-mode -1)
(tool-bar-mode -1)

