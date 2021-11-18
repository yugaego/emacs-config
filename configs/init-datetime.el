;;; init-datetime.el --- Date and time   -*- lexical-binding: t -*-

;;; World Clock

(require 'time)

(when (version<= "28.0.50" emacs-version)
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

(when (version<= "28.0.50" emacs-version)
  (setq calendar-time-zone-style 'numeric))
