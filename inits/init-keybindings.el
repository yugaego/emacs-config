;;; init-keybindings.el --- Custom keymap   -*- lexical-binding: t -*-

;; Alternative to M-d.
(global-set-key (kbd "M-<delete>") 'kill-word)

;; Use more advanced ibuffer in place of default buffers list.
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

;; Dvorak / Kinesis usability.
(global-set-key (kbd "C-z") ctl-x-map) ; alternative to C-x prefix key.
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

;; Open Mac Dictionary.
;; Based on https://gist.github.com/Superbil/5113974.
(defun mac-open-dictionary (the-word)
  "Open Dictionary.app for the-word"
  (interactive "Dictionary Lookup: ")
  (shell-command
   (concat
    "open \"dict:///"
    (replace-regexp-in-string "\"" "\\\\\"" the-word)
    "\"")))

(global-set-key (kbd "C-c d")
                '(lambda ()
                   (interactive)
                   (mac-open-dictionary (current-word))))

(provide 'init-keybindings)
