;;; init-smtp.el --- Configure mail sending via SMTP   -*- lexical-binding: t -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SMTP Server authentication ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 1. For a quick start, use file ~/.authinfo with this line:
;; machine smtp.domain.com login *** password *** port 587
;; 2. Then encrypt ~/.authinfo as ~/.authinfo.gpg
;;    - For example, in Dired encrypt ~/.authinfo by pressing :e
;;
;; Error: "gpg problem with the agent: Inappropriate ioctl for device:".
;; Fix: https://d.sb/B5N.

;; Usage: M-x compose-mail or C-x m.
(setq send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'ssl
      smtpmail-debug-info t
      ;;; Configured in private-init.el
      ;; smtpmail-smtp-server "smtp.domain.com"
      ;; smtpmail-default-smtp-server "smtp.domain.com"
      ;; smtpmail-smtp-service 587 ; 465 legacy
      ;; smtpmail-smtp-user "user"
      ;; user-mail-address "user@domain.com"
      ;; user-full-name "Your Name"
      )

