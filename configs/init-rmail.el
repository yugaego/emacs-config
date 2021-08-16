;;; init-rmail.el --- Configure Rmail email client   -*- lexical-binding: t -*-

(require 'rmail)

(setq rmail-display-summary t
      rmail-summary-line-count-flag nil
      rmail-movemail-variant-in-use 'mailutils ; See ../install-packages.el
      rmail-mime-prefer-html nil               ; Show text version of email.
      rmail-preserve-inbox nil          ; WARNING: use 't to keep server emails.
      rmail-delete-after-output t       ; See `M-x rmail-output'.
      rmail-output-reset-deleted-flag t)

;; Store inbox in this file.
(if (boundp 'yet/rmail-file-name)
    (setq rmail-file-name yet/rmail-file-name))

;; '("imaps://some%40domain.tld:pwd@imap.domain.tld:993"))
(if (boundp 'yet/rmail-primary-inbox-list)
    (setq rmail-primary-inbox-list yet/rmail-primary-inbox-list))

;; Default path for `M-x rmail-output'.
(if (boundp 'yet/rmail-default-file)
    (setq rmail-default-file yet/rmail-default-file))

