;;; init-datetime.el --- Date and time   -*- lexical-binding: t -*-

;;; World Clock

(require 'time)

(setq display-time-day-and-date t
      display-time-24hr-format t
      display-time-default-load-average nil)

;; (display-time-mode 1)

(when (boundp 'world-clock-list)
  (setq world-clock-list '(("Asia/Bangkok" "Bangkok")
                           ("Europe/Sofia" "Sofia")
                           ("Europe/London" "London")
                           ("America/New_York" "New York")
                           ("America/Los_Angeles" "Los Angeles"))
        world-clock-time-format "%R %z %Z [ %a %d %b ] [ %FT%T%z ]"))


;;; Calendar

(require 'calendar)
(require 'solar)

(setq calendar-week-start-day 1         ; Start week on Monday.
      calendar-date-style "iso"
      calendar-time-display-form
      '(24-hours ":" minutes
                 (if time-zone " (")
                 time-zone
                 (if time-zone ")")))

(when (boundp 'calendar-time-zone-style)
  (setq calendar-time-zone-style 'numeric))

