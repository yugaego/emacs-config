;;; init-mu4e.el --- Configure e-mail client Mu4e   -*- lexical-binding: t -*-

;;;;;;;;;;;;;;;;;;;;;;;;;
;; Install OS Packages ;;
;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Mbsync
;; https://isync.sourceforge.io/mbsync.html
;; https://wiki.archlinux.org/index.php/Isync
;; - $ brew install isync
;; - Configure ~/.mbsyncrc
;; - $ mbsync -a
;;
;;; Mu
;; https://www.djcbsoftware.nl/code/mu/
;; https://www.djcbsoftware.nl/code/mu/mu4e/
;; - $ brew install mu
;; - $ mu init --maildir=~/Maildir
;; - $ mu index


;; Load mu4e mail client library.
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")

(require 'mu4e)

;; Basic configuration to fetch emails with Mu4e.
(setq mu4e-get-mail-command "mbsync -a"
      mu4e-sent-folder   "/Gmail/[Gmail]/Sent Mail"
      mu4e-drafts-folder "/Gmail/[Gmail]/Drafts"
      mu4e-trash-folder  "/Gmail/[Gmail]/Trash"
      mu4e-change-filenames-when-moving t
      mail-user-agent 'mu4e-user-agent)

;; Gmail/IMAP recommended.
(setq mu4e-sent-messages-behavior 'delete)

