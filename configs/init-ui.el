;;; init-ui.el --- Configure user interface   -*- lexical-binding: t -*-

;; Show line numbers.
(setq-default display-line-numbers t)

;; Construct unique buffer name for identically named files.
;; 'forward prepends directory name.
(setq uniquify-buffer-name-style 'forward)

;; Scroll up to this number of lines.
;; >100 scrolls without recentering the point.
;(setq scroll-conservatively 101)

;(setq scroll-margin 4)

;; Place diff windows side by side.
(setq ediff-split-window-function 'split-window-horizontally)

;; Save state of Emacs between sessions.
(desktop-save-mode)

;; Save state of Emacs without asking.
;; ~$ rm ~/.emacs.d/.emacs.desktop~ to force refresh.
(setq desktop-save t)

;; Show column number in the mode line.
(column-number-mode)


;;; Calendar.
(setq calendar-week-start-day 1         ; Start week on Monday.
      calendar-date-style "iso"
      calendar-time-display-form
      '(24-hours ":" minutes
                 (if time-zone " (")
                 time-zone
                 (if time-zone ")")))

