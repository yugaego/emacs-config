;;; early-init.el --- Loaded before init.el (Emacs 27+)   -*- lexical-binding: t -*-

;;; The following settings are not recommended.
;;; See https://debbugs.gnu.org/cgi/bugreport.cgi?bug=50491.
;;; These settings can be safely removed from early init file,
;;; since they're here only to improve Emacs look during startup.
(load-theme 'misterioso t)

(setq initial-frame-alist
      `((left . 0.0)
        (height . 1.0)))

(when initial-window-system
  (scroll-bar-mode -1)
  (tool-bar-mode -1))
