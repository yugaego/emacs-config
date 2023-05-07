;;; init-smtp.el --- Configure mail sending via SMTP   -*- lexical-binding: t -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SMTP Server Authentication ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; *Basic*
;; - $ cp -n ~/.emacs.d/example/local-pre-init.el ~/.emacs.d/local-pre-init.el
;; - Fill in 'init-smtp' section in '~/.emacs.d/local-pre-init.el'
;; - Restart or `M-x eval-buffer' on 'local-pre-init.el' and this file.
;; - Call `C-x m' (`M-x compose-mail'), fill it, then `C-c C-c' to send it.
;; - Enter password when asked and store it to one of the `auth-sources'.
;; Example authentication line:
;; machine smtp.xmpl.tld login user@xmpl.tld password *** port 465
;;
;;; Troubleshoot
;; Error: "movemail: could not create mailbox ... Requested item not found"
;; Make sure 'mailutils' was compiled with support for TLS.
;;
;; For more details, see 'init-rmail.el' *Secure* section.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Email addresses management ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Use packages 'Mailabbrev' or 'BBDB'.
;; 'Mailabbrev' is straightforward: create `~/.mailrc' with, f.i.:
;; alias me "My Name <my@example.com>"
;; alias others "Another Name <they@example.com>" "Other <she@example.com>"
;; Then hit `RET' or `TAB' to complete "me" or "others" in 'message-mode'.
;; 'BBDB' is more sophisticated and can be configured to auto-collect addresses.

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

;; Path to the file with addresses aliases.
(if (boundp 'yet-mail-personal-alias-file)
  (setq mail-personal-alias-file yet-mail-personal-alias-file))

