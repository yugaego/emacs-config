;;; init-editing.el --- Configure editing   -*- lexical-binding: t -*-

;; Use this major-mode when not specified by a file
;; and for new buffers created with C-x b.
(setq-default major-mode 'text-mode)

;; Auto-refresh file-visiting buffers contents.
(global-auto-revert-mode 1)

;; Highlight search term matches.
(global-hi-lock-mode t)

;; Highlight matching parenthesis.
(show-paren-mode 1)
(setq show-paren-delay 0)

;; How many times cursor blinks.
;; <1 means blink forever.
(setq blink-cursor-blinks 0)

;; Identify sentences ended by one of [.?!]
;; with the following *one* space.
;; Fixes sentences movements, such as M-a and M-e.
(setq sentence-end-double-space nil)

;; Use soft word-wrapping with words boundaries respected.
;; To apply line commands to visual (not logical) lines,
;; use visual-line-mode.
(setq-default word-wrap t)

