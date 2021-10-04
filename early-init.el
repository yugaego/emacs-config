;;; early-init.el --- Loaded before init.el (Emacs 27+)   -*- lexical-binding: t -*-

;;; The following settings are not really "recommended"
;;; to be put in here, but I'd like to take the "risks"
;;; in favor of getting a nice-looking Emacs on startup.
;;; http://debbugs.gnu.org/cgi/bugreport.cgi?bug=50491

(load-theme 'misterioso t)

;; Choose font by an operating system.
(defconst yet-font
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
        (font . ,yet-font)))

;; Initial (first) frame configuration.
;; Uses 0.0 to 1.0 ratio.
(setq initial-frame-alist
      `((top . 0.0)
        (left . 0.0)
        (width . 0.52)
        (height . 1.0)
        (font . ,yet-font)))

;; Disable UI elements.
(scroll-bar-mode -1)
(tool-bar-mode -1)

