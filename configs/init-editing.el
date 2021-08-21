;;; init-editing.el --- Configure editing   -*- lexical-binding: t -*-

;; Kill newline character at the end of line.
(setq kill-whole-line t)

;; Use this major-mode when not specified by a file
;; and for new buffers created with C-x b.
(setq-default major-mode 'text-mode)

;; Auto-refresh file-visiting buffers contents.
(require 'autorevert)
(global-auto-revert-mode)
(setq auto-revert-verbose nil)

;; Highlight matching parenthesis.
(require 'paren)
(show-paren-mode)
(setq show-paren-delay 0)

;; Auto-insert closing parenthesis.
(require 'elec-pair)
(electric-pair-mode)
(setq electric-pair-skip-self t)

;; How many times cursor blinks.
;; <1 means blink forever.
(setq blink-cursor-blinks 1)

;; Identify sentences ended by one of [.?!]
;; with the following *one* space.
;; Fixes sentences movements, such as M-a and M-e.
(setq sentence-end-double-space nil)

;; Use soft word-wrapping with words boundaries respected.
;; To apply line commands to visual (not logical) lines,
;; use visual-line-mode.
(setq-default word-wrap t)


;;; Search

;; Highlight matches.
(global-hi-lock-mode)

(setq isearch-allow-scroll t            ; Continue on scrolling.
      isearch-lazy-count t)             ; Since Emacs 27.1


;;; Indentation

;; Do not insert tabs.
(setq-default indent-tabs-mode nil)

;; Use 4 spaces for indentation.
(setq-default tab-width 4)


;;; Highlight Trailing Whitespaces

;; Make sure highlighting disabled by default.
(setq-default show-trailing-whitespace nil)

(defun yet/show-trailing-whitespace ()
  "Highlight trailing whitespaces in the buffer."
  (setq-local show-trailing-whitespace t))

;; Highlight trailing whitespaces only in these modes.
(dolist (hook '(prog-mode-hook text-mode-hook conf-mode-hook))
  (add-hook hook 'yet/show-trailing-whitespace))


;;; Duplicate line or region N times.
;; https://rejeep.github.io/emacs/elisp/2010/03/11/duplicate-current-line-or-region-in-emacs.html
(defun yet/duplicate-current-line-or-region (&optional arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))

(global-set-key (kbd "C-c d") 'yet/duplicate-current-line-or-region)


;;; Marked region (selection).
(setq highlight-nonselected-windows t   ; Always highlight selection.
      mark-even-if-inactive nil) ; Do not perform actions on inactive regions.

(delete-selection-mode)                 ; Delete marked region on typing.

(put 'downcase-region 'disabled nil)    ; Enable this command.
(put 'upcase-region 'disabled nil)      ; Enable this command.


;;; Undo.
(setq undo-limit 8000000                ; 8 MB
      undo-strong-limit 12000000        ; 12 MB
      undo-outer-limit 20000000)        ; 20 MB

