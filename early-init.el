;;; early-init.el --- Loaded before init.el (Emacs 27+)   -*- lexical-binding: t -*-

;; Use one of the default themes.
;; Remember to M-x disable-theme after M-x load-theme to get a cleaner UI.
(load-theme 'misterioso t)

;; Initial frame configuration.
;; Uses 0.0 to 1.0 ratio.
(setq initial-frame-alist
      '((top . 0.0)
        (left . 0.0)
        (width . 0.6)
        (height . 1.0)
        (font . "Monaco-15")))          ; or Menlo (DejaVu Sans Mono on Linux, Consolas on Windows).

;; New frames configuration.
;; Uses 0.0 to 1.0 ratio.
(setq default-frame-alist
      '((top . 0.0)
        (left . 1.0)
        (width . 0.4)
        (height . 1.0)
        (font . "Monaco-15")))

(setq inhibit-startup-message t
      initial-scratch-message nil)

(scroll-bar-mode -1)
(tool-bar-mode -1)

