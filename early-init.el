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

;; Fix native compilation on MacOS.
;; https://lists.gnu.org/archive/html/help-gnu-emacs/2021-10/msg00419.html
(setenv "LIBRARY_PATH"
         (concat
          "/opt/local/lib/gcc14:"
          "/opt/local/lib/libgcc:"
          "/opt/local/lib/gcc14/gcc/aarch64-apple-darwin24/14.2.0:"))
