;;; early-init.el --- Loaded before init.el (Emacs 27+)   -*- lexical-binding: t -*-

;;; The following settings are not recommended.
;;; See https://debbugs.gnu.org/cgi/bugreport.cgi?bug=50491.
;;; These settings can be safely removed from early init file,
;;; since they're here only to improve Emacs look during startup.
(load-theme 'misterioso t)
(add-to-list 'initial-frame-alist '(height . 1.0))


;; Fix native compilation on MacOS.
;; https://lists.gnu.org/archive/html/help-gnu-emacs/2021-10/msg00419.html
;; (setenv "LIBRARY_PATH"
;;         (concat
;;          "/usr/local/opt/gcc/lib/gcc/12:"
;;          "/usr/local/opt/libgccjit/lib/gcc/12:"
;;          "/usr/local/opt/gcc/lib/gcc/12/gcc/x86_64-apple-darwin22/12"))

