;;; init-rmail.el --- Configure Rmail   -*- lexical-binding: t -*-

;; Basic configuration to fetch emails with Rmail.
(setq rmail-preserve-inbox t
      rmail-mime-prefer-html nil
      rmail-file-name "~/Maildir/Rmail/Gmail"
      rmail-inbox-list '("imaps://user%40gmail.com:***@imap.gmail.com:993"))

