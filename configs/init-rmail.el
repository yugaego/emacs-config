;;; init-rmail.el --- Configure Rmail email client   -*- lexical-binding: t -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; IMAP Server Authentication ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; *Basic*
;; - $ cp -n ~/.emacs.d/example/local-pre-init.el ~/.emacs.d/local-pre-init.el
;; - Fill in 'init-rmail' section in '~/.emacs.d/local-pre-init.el'
;; - Restart or `M-x eval-buffer' on 'local-pre-init.el' and this file.
;; - Call `M-x rmail' to retrieve emails.
;; - Enter password when asked and store it to one of the `auth-sources'.
;; Example authentication lines:
;; machine imap.xmpl.tld login user%40xmpl.tld port 993 password ***

;;; Troubleshoot
;; - $ movemail -p imaps://user%40xmpl.tld:PWD@xmpl.tld:993 Test.mbox
;;
;;; *Secure*
;; Consult (info "(auth) Help for users").
;; - Encrypt '~/.authinfo' to '~/.authinfo.gpg'
;;   - In 'dired-mode': go to '~/.authinfo' and type `:e' (`epa-dired-do-encrypt').
;; - Remove '~/.authinfo'.
;;
;; Optionally, configure 'yet-auth-sources' (see '../examples/local-pre-init.el').
;;
;;; Troubleshoot
;; (setq auth-source-debug t)
;; (setq auth-source-do-cache nil)
;;
;; Error: "gpg problem with the agent: Inappropriate ioctl for device:".
;; Fix: https://d.sb/B5N.
;; 1. $ printf "use-agent\npinentry-mode loopback\n" >> ~/.gnupg/gpg.conf
;; 2. $ printf "allow-loopback-pinentry\n" >> ~/.gnupg/gpg-agent.conf
;; 3. Restart the agent:
;;    - $ echo RELOADAGENT | gpg-connect-agent


(require 'rmail)
(require 'rmailsum)
(require 'rmailmm)
(require 'rmailout)

;;; *WARNING*
;; Set this value to `t'
;; for keeping emails on the server.
(setq rmail-preserve-inbox nil)

(setq rmail-movemail-program nil        ; See ../install-packages.el
      rmail-remote-password-required t
      rmail-delete-after-output t       ; See `M-x rmail-output'.
      rmail-confirm-expunge nil
      rmail-display-summary nil
      rmail-redisplay-summary nil
      rmail-summary-line-count-flag nil        ; Show number of lines in email.
      rmail-mime-show-images 10485760          ; Show images smaller than 10 MB.
      rmail-mime-prefer-html nil               ; Show text version of email.
      rmail-output-reset-deleted-flag t)

;; Store inbox in this file.
(if (boundp 'yet-rmail-file-name)
    (setq rmail-file-name yet-rmail-file-name))

;; See '~/.emacs.d/examples/local-pre-init.el'.
(if (boundp 'yet-rmail-primary-inbox-list)
    (setq rmail-primary-inbox-list yet-rmail-primary-inbox-list))

;; Default path for `M-x rmail-output'.
(if (boundp 'yet-rmail-default-file)
    (setq rmail-default-file yet-rmail-default-file))


(defun yet-message-mode ()
  (when (fboundp 'display-fill-column-indicator-mode)
    (display-fill-column-indicator-mode 1))
  (auto-fill-mode 1))

(add-hook 'message-mode-hook 'yet-message-mode)


(defun yet-rmail-mode ()
  (goto-address-mode 1)
  (rmail-sort-by-date nil)
  (rmail-sort-by-subject t)
  (rmail-show-message 1))

(add-hook 'rmail-mode-hook 'yet-rmail-mode)


(defun yet-rmail-quit ()
  (if rmail-buffer (kill-buffer rmail-buffer)))

(add-hook 'rmail-quit-hook 'yet-rmail-quit)

