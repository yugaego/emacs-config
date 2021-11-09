;;; init-ui.el --- Configure user interface   -*- lexical-binding: t -*-

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

(when (version<= "28.0.50" emacs-version)
  (global-set-key (kbd "C-c i") #'display-fill-column-indicator-mode))


;;; Scrolling

;; Beginner friendly.
;; Scroll up to this number of lines.
;; >100 scrolls without recentering the point.
;; (setq scroll-conservatively 101)

;; Beginner friendly.
;; (setq scroll-margin 4)

;; Toggle scroll-lock-mode.
;; `l' mnemonic: Lock Line and scroLL.
(global-set-key (kbd "C-c l") #'scroll-lock-mode)

