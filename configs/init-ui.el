;;; init-ui.el --- Configure user interface   -*- lexical-binding: t -*-

;; Show line numbers.
(setq-default display-line-numbers t)

;; Construct unique buffer name for identically named files.
;; 'forward prepends directory name.
(setq uniquify-buffer-name-style 'forward)

;; Scroll up to this number of lines.
;; >100 scrolls without recentering the point.
(setq scroll-conservatively 101)

(setq scroll-margin 4)

;; Place diff windows side by side.
(setq ediff-split-window-function 'split-window-horizontally)


;;; Minibuffer.
(setq minibuffer-eldef-shorten-default t ; Shorten prompt.
      insert-default-directory "~/"      ; Default path.
      resize-mini-windows t              ; Resize to fit the text.
      extended-command-suggest-shorter t ; Show a shorter M-x command.
      suggest-key-bindings 5)            ; Show key binding for N sec.

(defalias 'yes-or-no-p 'y-or-n-p)       ; Accept one-letter answers.


;;; Calendar.
(setq calendar-week-start-day 1         ; Start week on Monday.
      calendar-date-style "iso"
      calendar-time-display-form
      '(24-hours ":" minutes
                 (if time-zone " (")
                 time-zone
                 (if time-zone ")")))

