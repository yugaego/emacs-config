;;; init-minibuffer.el --- Configure minibuffer   -*- lexical-binding: t -*-

(require 'minibuf-eldef)
(setq minibuffer-eldef-shorten-default t) ; Shorten prompt.

(setq insert-default-directory "~/"      ; Default path.
      resize-mini-windows t              ; Resize to fit the text.
      extended-command-suggest-shorter t ; Show a shorter M-x command.
      suggest-key-bindings 5             ; Show key binding for N sec.
      minibuffer-message-timeout 5)      ; Show echo-ed messages for N sec.

(setq-default default-directory "~/")

;; Accept one-letter answers.
(if (boundp 'use-short-answers)
    (setq use-short-answers t)
  (defalias 'yes-or-no-p 'y-or-n-p))

;; Stick minibuffer to its frame.
(when (boundp 'minibuffer-follows-selected-frame)
  (setq minibuffer-follows-selected-frame nil))

;; Maximum length of a minibuffer history lists:
;; file, buffer, command, and argument names.
(setq-default history-length 1000)

;; Save minibuffer history between sessions.
(savehist-mode 1)
(setopt savehist-additional-variables
        '(log-edit-comment-ring kill-ring))

(defun yet-savehist-save-hook ()
  "Sanitize 'kill-ring' before saving."
  (setq kill-ring (mapcan (lambda (item)
                            (when (and (stringp item)
                                       (< (length item) 100000))
                              (list (substring-no-properties item))))
                          kill-ring)))

(add-hook 'savehist-save-hook 'yet-savehist-save-hook)

;; File and buffer name completion.
;; Switch to default M-x find-file and M-x switch-buffer with C-f and C-b.
(require 'ido)

(ido-mode 1)
(setq ido-default-file-method 'selected-window ; Where to show a file.
      ido-default-buffer-method 'selected-window ; Where to show a buffer.
      ido-enable-flex-matching t
      ido-all-frames t
      ido-ignore-buffers '("\\` " "\\`*EGLOT")
      ido-auto-merge-delay-time 3)      ; Seconds before looking in other paths.

;; Do not ping network when looking for a file at point.
(setq ffap-machine-p-known 'reject)

;; M-x command name completion.
(fido-mode 1)

