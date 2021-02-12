;;; early-init.el --- Loaded before init.el (Emacs 27+)   -*- lexical-binding: t -*-

(load-theme 'tango-dark t)

(setq initial-frame-alist
      '((top . 0) (left . 0)
        (width . 118) (height . 65)
        (font . "Monaco-15"))) ; or Menlo (close to DejaVu Sans Mono).

(setq default-frame-alist
      '((top . 0) (left . 1090)
        (width . 90) (height . 65)
        (vertical-scroll-bars)
        (font . "Monaco-15")))

(setq inhibit-startup-message t
      initial-scratch-message nil)

(scroll-bar-mode -1)
(tool-bar-mode -1)

