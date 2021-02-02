;;; init-gnus.el --- Configure Gnus - mail and news reader   -*- lexical-binding: t -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; IMAP Server authentication ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 1. For a quick start, use file ~/.authinfo with this line:
;; machine imap.domain.com login ***  password *** port 993
;; 2. Then encrypt ~/.authinfo as ~/.authinfo.gpg
;;    - For example, in Dired encrypt ~/.authinfo by pressing :e

;; Basic configuration to fetch emails.
(setq gnus-select-method
 '(nnimap "gmail"
          (nnimap-address "imap.gmail.com")
          (nnimap-server-port 993)
          (nnimap-stream ssl)))

