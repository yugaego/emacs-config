;;; local-pre-init.el --- LOCAL EXAMPLE configurations   -*- lexical-binding: t -*-

;;; Each of the following example definitions is optional.

;;; init
(defconst yet-exec-path '("/usr/local/bin"))

;;; init-file
(defconst yet-backup-directory-alist '(("." . "~/.backups-emacs")))
(defconst yet-bookmark-default-file "~/path/to/emacs-bookmarks")

;;; init-grammar
(defconst yet-browse-grammarly-doc-id "11111111")

;;; init-lifecycle
(defconst yet-open-files-list
  '("~/path/to/file.org"
    "~/path/to/file.el"))

;;; init-lsp
(defconst yet-eglot-php-server
  '("php"
    "-d"
    "memory_limit=1024M"
    "/Users/path/to/phpactor/bin/phpactor"
    "language-server"))

;;; init-rmail
(defconst yet-rmail-file-name "~/path/to/file")
(defconst yet-rmail-primary-inbox-list
  "imaps://some%40domain.tld:pwd@imap.domain.tld:993")
(defconst yet-rmail-default-file "~/path/to/file")

;;; init-smtp
(defconst yet-smtpmail-default-smtp-server "smtp.domain.tld")
(defconst yet-smtpmail-smtp-user "user@domain.tld")
(defconst yet-user-mail-address "user@domain.tld")
(defconst yet-user-full-name "Your Name")
(defconst yet-message-default-mail-headers
  "From: Name <name@xmpl.tld>\nReply-To: Name <name@xmpl.tld>\nFcc: ~/Mail/sent\n")

;;; Pre-load Emacs package for development.
;; git clone package DIR
;; (require 'package "DIR/package.el")

