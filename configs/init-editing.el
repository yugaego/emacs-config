;;; init-editing.el --- Configure editing   -*- lexical-binding: t -*-

;; Kill newline character at the end of line.
(setq kill-whole-line t)

;; Set default width to 80 columns.
(setq-default fill-column 80)

;; Handle EOL (end of lines).
(setq-default require-final-newline 'ask)

;; Use this major-mode when not specified by a file
;; and for new buffers created with C-x b.
(setq-default major-mode 'text-mode)

;; Auto-refresh file-visiting buffers contents.
(require 'autorevert)
(global-auto-revert-mode 1)
(setq auto-revert-verbose nil)

;; Highlight matching parenthesis.
(require 'paren)
(show-paren-mode 1)
(setq show-paren-delay 0
      show-paren-when-point-inside-paren t)

;; Auto-insert closing parenthesis.
(require 'elec-pair)
(electric-pair-mode 1)
(setq electric-pair-skip-self #'electric-pair-default-skip-self)

;; How many times cursor blinks.
;; <1 means blink forever.
(setq blink-cursor-blinks 2)

(setq-default cursor-type 'bar)

;; Identify sentences ended by one of [.?!]
;; with the following *one* space.
;; Fixes sentences movements, such as M-a and M-e.
(setq sentence-end-double-space nil)

;; Use soft word-wrapping with words boundaries respected.
;; To apply line commands to visual (not logical) lines,
;; use visual-line-mode.
(setq-default word-wrap t)

;; Alternative to M-d.
(global-set-key (kbd "M-<delete>") 'kill-word)


;;; Search

;; Highlight matches.
(global-hi-lock-mode 1)

(setq isearch-allow-scroll t            ; Continue on scrolling.
      isearch-lazy-count t)             ; Since Emacs 27.1

;; Move between matches with M-<, M->, C-v, M-v.
(when (boundp 'isearch-allow-motion)
  (setq isearch-allow-motion t))

(global-set-key (kbd "M-s M-s") #'isearch-forward-thing-at-point)

;;; Indentation

;; Do not insert tabs.
(setq-default indent-tabs-mode nil)

;; Use 4 spaces for indentation.
(setq-default tab-width 4)


;;; Whitespaces

(require 'whitespace)

(setq whitespace-style '(face tabs spaces trailing lines-tail space-before-tab
                              newline indentation empty space-after-tab
                              space-mark tab-mark newline-mark
                              missing-newline-at-eof))

(global-set-key (kbd "C-c b w") #'whitespace-mode)


;;; Trailing whitespaces

;; Make sure highlighting disabled by default.
(setq-default show-trailing-whitespace nil)

(defun yet-show-trailing-whitespace ()
  "Highlight trailing whitespaces in the buffer."
  (setq-local show-trailing-whitespace t))

;; Highlight trailing whitespaces only in these modes.
(dolist (hook '(prog-mode-hook text-mode-hook conf-mode-hook))
  (add-hook hook 'yet-show-trailing-whitespace))


;;; Duplicate line or region N times.
;; https://rejeep.github.io/emacs/elisp/2010/03/11/duplicate-current-line-or-region-in-emacs.html
(defun yet-duplicate-current-line-or-region (&optional arg)
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

(require 'misc)

(when (boundp 'duplicate-line-final-position) ; Since Emacs 29.1
  (setq duplicate-line-final-position 1))

(defvar-local yet-duplicate-fun (if (fboundp 'duplicate-dwim)
                                    'duplicate-dwim ; Since Emacs 29.1
                                  'yet-duplicate-current-line-or-region))

(global-set-key (kbd "C-c d") yet-duplicate-fun)


;;; Marked region (selection).
(setq highlight-nonselected-windows nil
      mark-even-if-inactive nil) ; Do not perform actions on inactive regions.

(delete-selection-mode 1)                 ; Delete marked region on typing.

(put 'downcase-region 'disabled nil)    ; Enable this command.
(put 'upcase-region 'disabled nil)      ; Enable this command.
(put 'narrow-to-region 'disabled nil)   ; Enable narrowing.
(put 'narrow-to-page 'disabled nil)     ; Enable Texinfo page narrowing.

(setq widen-automatically nil)

;;; Undo.
(setq undo-limit 8000000                ; 8 MB
      undo-strong-limit 12000000        ; 12 MB
      undo-outer-limit 20000000)        ; 20 MB


;;; Teach `C-a' to respect indentation.
;;; https://prelude.emacsredux.com/en/latest
(defun prelude-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first. If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(global-set-key [remap move-beginning-of-line]
                'prelude-move-beginning-of-line)

