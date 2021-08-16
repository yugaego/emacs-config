;;; init-encrypt.el --- Encryption related   -*- lexical-binding: t -*-

;; Query passphrase through the minibuffer.
;; Useful for signing commits.
(require 'epg)
(setq epg-pinentry-mode 'loopback)

