;;; init-datetime.el --- Date and time   -*- lexical-binding: t -*-


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

