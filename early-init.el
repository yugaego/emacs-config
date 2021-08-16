;;; early-init.el --- Loaded before init.el (Emacs 27+)   -*- lexical-binding: t -*-

;; Initial frame configuration.
;; Uses 0.0 to 1.0 ratio.
(setq initial-frame-alist
      '((top . 0.0)
        (left . 0.0)
        (width . 0.52)
        (height . 1.0)
        (font . "Monaco-15")))          ; or Menlo (DejaVu Sans Mono on Linux, Consolas on Windows).

;; New frames configuration.
;; Uses 0.0 to 1.0 ratio.
(setq default-frame-alist
      '((top . 0.0)
        (left . 1.0)
        (width . 0.48)
        (height . 1.0)
        (font . "Monaco-15")))

(setq inhibit-startup-message t         ; Do not display startup message.
      initial-scratch-message nil)      ; Start with empty *scratch* buffer.

;; Disable UI elements.
(scroll-bar-mode -1)
(tool-bar-mode -1)

