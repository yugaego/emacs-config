;;; init-encrypt.el --- Encryption related   -*- lexical-binding: t -*-

;; Query passphrase through the minibuffer.
;; Useful for signing commits.
(require 'epg)
(setq epg-pinentry-mode 'loopback)


(defun yet-generate-string ()
  "Generate a pseudo-random string."
  (interactive)
  (princ (base64-encode-string (format "%s" (random t)))))

