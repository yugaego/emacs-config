;;; init-ui.el --- Configure user interface   -*- lexical-binding: t -*-

;; Show line numbers.
(setq-default display-line-numbers t)

;; Construct unique buffer names.
;; https://emacs.stackexchange.com/a/68501/28451
(setq uniquify-buffer-name-style 'forward
      uniquify-min-dir-content 1)

;; Place diff windows side by side.
(setq ediff-split-window-function 'split-window-horizontally)

;; Show column number in the mode line.
(column-number-mode)

;; Show typed command right away.
(setq echo-keystrokes 0.01)


;;; Scrolling

;; Beginner friendly.
;; Scroll up to this number of lines.
;; >100 scrolls without recentering the point.
;; (setq scroll-conservatively 101)

;; Beginner friendly.
;; (setq scroll-margin 4)


;;; Calendar
(setq calendar-week-start-day 1         ; Start week on Monday.
      calendar-date-style "iso"
      calendar-time-display-form
      '(24-hours ":" minutes
                 (if time-zone " (")
                 time-zone
                 (if time-zone ")")))

