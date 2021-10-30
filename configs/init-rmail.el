;;; init-rmail.el --- Configure Rmail email client   -*- lexical-binding: t -*-

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
      rmail-display-summary t
      rmail-redisplay-summary t
      rmail-summary-line-count-flag nil        ; Show number of lines in email.
      rmail-mime-show-images 2097152           ; Show images smaller than N.
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
  (when (version<= "28.0.50" emacs-version)
    (display-fill-column-indicator-mode 1))
  (auto-fill-mode 1))

(add-hook 'message-mode-hook #'yet-message-mode)


(defun yet-rmail-mode ()
  (rmail-sort-by-subject nil))

(add-hook 'rmail-mode-hook #'yet-rmail-mode)

