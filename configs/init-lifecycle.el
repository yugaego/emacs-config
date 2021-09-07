;;; init-lifecycle.el --- Emacs life cycle   -*- lexical-binding: t -*-

;;; Prevent loss of the *scratch* buffer contents accidentally.

(defun yet-prompt-on-not-empty-scratch-buffer (question)
  "Prompt if *scratch* buffer is not empty.
Appends a confirmation QUESTION to the prompt message.
If *scratch* buffer is empty, returns true without prompting."
  (let ((scratch (get-buffer "*scratch*")))
    (if (and scratch (> (buffer-size scratch) 0))
        (y-or-n-p (format (concat
                           "Warning: *scratch* buffer is not empty. "
                           question)))
      t)))

(defun yet-verify-emtpy-scratch-on-emacs-kill ()
  "Require confirmation to kill Emacs if *scratch* buffer is not empty."
  (yet-prompt-on-not-empty-scratch-buffer "Really kill Emacs?"))

(add-to-list 'kill-emacs-query-functions
             #'yet-verify-emtpy-scratch-on-emacs-kill)

(delete #'yet-verify-emtpy-scratch-on-emacs-kill kill-emacs-query-functions)

(defun yet-verify-emtpy-scratch-on-buffer-kill ()
  "Require confirmation to kill *scratch* buffer if it is not empty."
  (if (equal "*scratch*" (buffer-name))
      (yet-prompt-on-not-empty-scratch-buffer "Really kill *scratch* buffer?")
    t))

(add-to-list 'kill-buffer-query-functions
             #'yet-verify-emtpy-scratch-on-buffer-kill)


;;; Save state of Emacs between sessions.

(require 'desktop)

(desktop-save-mode 1)

;; Save state without asking.
(setq desktop-save t)

(defun yet-kill-emacs-reset-desktop-state (&optional arg)
  "Save buffers and kill Emacs without saving the state to the desktop file.
With prefix ARG, saves all file-visiting buffers without asking."
  (interactive "P")
  (desktop-save-mode -1)
  (desktop-remove)
  (save-buffers-kill-emacs arg))

;; Open files on Emacs load without desktop state file.
(defun yet-open-files ()
  "Open files listed in the variable `yet-open-files-list'."
  (when (and (boundp 'yet-open-files-list)
             yet-open-files-list)
    (dolist (file yet-open-files-list)
      (find-file file))))

(add-hook 'desktop-no-desktop-file-hook #'yet-open-files)

