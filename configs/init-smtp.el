;;; init-smtp.el --- Configure mail sending via SMTP   -*- lexical-binding: t -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SMTP Server authentication ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; *Basic*
;; 1. $ cp ~/.emacs.d/example/local-pre-init.el ~/.emacs.d/local-pre-init.el
;; 2. Fill in 'init-smtp' section in '~/.emacs.d/local-pre-init.el'
;; 3. Restart or `M-x eval-buffer' on local-pre-init.el and this file.
;; 3. Call `C-x m' (`M-x compose-mail'), fill it, then `C-c C-c' to send it.
;; 4. Enter password when asked and choose to save '~/.authinfo'.
;; The following line will be written to the file:
;; machine smtp.domain.tld login user@domain.tld password *** port 465
;;
;;; Troubleshooting
;; Error: "movemail: could not create mailbox ... Requested item not found"
;; Make sure 'mailutils' was compiled with support for TLS.
;;
;;; *Secure*
;; 5. Encrypt ~/.authinfo as ~/.authinfo.gpg
;;    - For example, in Dired encrypt ~/.authinfo by pressing :e
;;
;;; Troubleshooting
;; Error: "gpg problem with the agent: Inappropriate ioctl for device:".
;; Fix: https://d.sb/B5N.
;; 1. $ printf "use-agent\npinentry-mode loopback\n" >> ~/.gnupg/gpg.conf
;; 2. $ printf "allow-loopback-pinentry\n" >> ~/.gnupg/gpg-agent.conf
;; 3. Restart the agent:
;;    - $ echo RELOADAGENT | gpg-connect-agent

(require 'smtpmail)
(require 'message)

;; Usage: `M-x compose-mail' or `C-x m'.
(setq smtpmail-stream-type 'ssl            ; Resolves to TLS connection.
      smtpmail-smtp-service 465            ; or 587 for 'starttls.
      ;; smtpmail-debug-info t
      send-mail-function 'smtpmail-send-it)

;; SMTP server name.
(if (boundp 'yet-smtpmail-smtp-server)
  (setq smtpmail-smtp-server yet-smtpmail-smtp-server))

;; SMTP server login.
(if (boundp 'yet-smtpmail-smtp-user)
  (setq smtpmail-smtp-user yet-smtpmail-smtp-user))

;; Email From address.
(if (boundp 'yet-user-mail-address)
  (setq user-mail-address yet-user-mail-address))

;; Email From name.
(if (boundp 'yet-user-full-name)
  (setq user-full-name yet-user-full-name))

;; Additional default headers.
(if (boundp 'yet-message-default-mail-headers)
    (setq message-default-mail-headers
          yet-message-default-mail-headers))

