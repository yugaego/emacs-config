;;; init-smtp.el --- Configure mail sending via SMTP   -*- lexical-binding: t -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SMTP Server authentication ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 1. For a quick start, use file ~/.authinfo with this line:
;; machine smtp.domain.tld login *** password *** port 465
;; 2. Then encrypt ~/.authinfo as ~/.authinfo.gpg
;;    - For example, in Dired encrypt ~/.authinfo by pressing :e
;;
;; Error: "gpg problem with the agent: Inappropriate ioctl for device:".
;; Fix: https://d.sb/B5N.
;; 1. $ printf "use-agent\npinentry-mode loopback\n" >> ~/.gnupg/gpg.conf
;; 2. $ printf "allow-loopback-pinentry\n" >> ~/.gnupg/gpg-agent.conf
;; 3. Restart the agent:
;;    - $ echo RELOADAGENT | gpg-connect-agent

;;; Configure in ./local-pre-init.el or another pre-loaded file.
;; (defconst yet/smtpmail-default-smtp-server "smtp.domain.tld")
;; (defconst yet/smtpmail-smtp-user "user@domain.tld")
;; (defconst yet/user-mail-address "user@domain.tld")
;; (defconst yet/user-full-name "Your Name")

(require 'smtpmail)

;; Usage: M-x compose-mail or C-x m.
(setq smtpmail-stream-type 'ssl            ; Resolves to TLS connection.
      smtpmail-smtp-service 465            ; or 587 for 'starttls.
      ;; smtpmail-debug-info t
      send-mail-function 'smtpmail-send-it)

;; SMTP server name.
(if (boundp 'yet/smtpmail-smtp-server)
  (setq smtpmail-smtp-server yet/smtpmail-smtp-server))

;; SMTP server login.
(if (boundp 'yet/smtpmail-smtp-user)
  (setq smtpmail-smtp-user yet/smtpmail-smtp-user))

;; Email From address.
(if (boundp 'yet/user-mail-address)
  (setq user-mail-address yet/user-mail-address))

;; Email From name.
(if (boundp 'yet/user-full-name)
  (setq user-full-name yet/user-full-name))

