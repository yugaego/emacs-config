;;; init-rmail.el --- Configure Rmail email client   -*- lexical-binding: t -*-

;;; Hint: use Mailabbrev or BBDB to insert addresses.
;; Mailabbrev is straightforward: create ~/.mailrc with, f.i.:
;; alias me "My Name <my@example.com>"
;; alias others "Another Name <they@example.com>" "Other <she@example.com>"
;; Then use <RET> or <TAB> to complete "me" or "others" in message-mode.
;; BBDB is more sophisticated and can be configured to auto-collect addresses.

(require 'rmail)
(require 'rmailsum)
(require 'rmailmm)
(require 'rmailout)

;;; *WARNING*
;; Set this value to 't
;; to keep emails on the server.
(setq rmail-preserve-inbox nil)

(setq rmail-movemail-program nil        ; See ../install-packages.el
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

;; '("imaps://some%40domain.tld:pwd@imap.domain.tld:993"))
(if (boundp 'yet-rmail-primary-inbox-list)
    (setq rmail-primary-inbox-list yet-rmail-primary-inbox-list))

;; Default path for `M-x rmail-output'.
(if (boundp 'yet-rmail-default-file)
    (setq rmail-default-file yet-rmail-default-file))


(defun yet-message-mode ()
  (when (fboundp 'display-fill-column-indicator-mode)
    (display-fill-column-indicator-mode 1))
  (auto-fill-mode 1))

(add-hook 'message-mode-hook #'yet-message-mode)


(defun yet-rmail-mode ()
  (rmail-sort-by-date nil)
  (rmail-sort-by-subject t)
  (rmail-show-message 1))

(add-hook 'rmail-mode-hook #'yet-rmail-mode)


(defun yet-rmail-quit ()
  (if rmail-buffer (kill-buffer rmail-buffer)))

(add-hook 'rmail-quit-hook #'yet-rmail-quit)

