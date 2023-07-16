;;; init-ui.el --- Configure user interface   -*- lexical-binding: t -*-

;; Initial (first) frame configuration.
;; Uses 0.0 to 1.0 ratio.
(setq initial-frame-alist
      `((top . 0.0)
        (left . 0.0)
        (width . 0.52)
        (height . 1.0)))

;; New frames configuration.
;; Uses 0.0 to 1.0 ratio.
(setq default-frame-alist
      `((top . 0.0)
        (left . 1.0)
        (width . 0.48)
        (height . 1.0)))

(defvar-local yet-frames-font
  (let ((font (cond
               ((boundp 'yet-font) yet-font)
               ((eq system-type 'darwin) "Monaco")
               ((memq system-type '(ms-dos windows-nt)) "Consolas")
               (t "DejaVu Sans Mono")))
        (size (if (boundp 'yet-font-size) yet-font-size "17")))
    (concat font "-" size)))

(add-to-list 'initial-frame-alist `(font . ,yet-frames-font))
(add-to-list 'default-frame-alist `(font . ,yet-frames-font))

;; Disable UI elements.
(when (display-graphic-p)
  (scroll-bar-mode -1)
  (tool-bar-mode -1))

(setq inhibit-startup-message t         ; Do not display startup message.
      initial-scratch-message nil)      ; Start with empty *scratch* buffer.

;; Show line numbers.
(setq-default display-line-numbers t)

;; Construct unique buffer names.
;; https://emacs.stackexchange.com/a/68501/28451
(setq uniquify-buffer-name-style 'forward
      uniquify-min-dir-content 2)

;; Place diff windows side by side.
(setq ediff-split-window-function 'split-window-horizontally)

;; Show column number in the mode line.
(column-number-mode 1)

;; Show typed command right away.
(setq echo-keystrokes 0.01)

;; Disable screen flashing on any events.
(setq visible-bell nil
      ring-bell-function #'ignore)

(when (fboundp 'display-fill-column-indicator-mode)
  ;; Mnemonics: `b' Buffer, `i' Indicator (of fIll).
  (global-set-key (kbd "C-c b i") #'display-fill-column-indicator-mode))

(setq-default mode-line-format
      '("%e" mode-line-front-space
        mode-line-mule-info
        mode-line-client
        mode-line-modified
        mode-line-remote
        mode-line-frame-identification
        mode-line-buffer-identification "  "
        mode-line-position
        mode-line-misc-info
        (vc-mode vc-mode) "  "
        mode-line-modes  mode-line-end-spaces))

;;; Scrolling

;; Beginner friendly.
;; Scroll up to this number of lines.
;; >100 scrolls without recentering the point.
;; (setq scroll-conservatively 101)

;; Beginner friendly.
;; (setq scroll-margin 4)

;; Toggle scroll-lock-mode.
;; Mnemonics `b' Buffer, `l' Lock Line and scroLL.
(global-set-key (kbd "C-c b l") #'scroll-lock-mode)

