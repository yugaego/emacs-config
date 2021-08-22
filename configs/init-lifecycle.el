;;; init-lifecycle.el --- Emacs life cycle   -*- lexical-binding: t -*-

;;; Prevent loss of the *scratch* buffer contents accidentally.

(defun yet/prompt-on-not-empty-scratch-buffer (question)
  "Prompt if *scratch* buffer is not empty.
Appends a confirmation QUESTION to the prompt message.
If *scratch* buffer is empty, returns true without prompting."
  (let ((scratch (get-buffer "*scratch*")))
    (if (and scratch (> (buffer-size scratch) 0))
        (y-or-n-p (format (concat
                           "Warning: *scratch* buffer is not empty. "
                           question)))
      t)))

(defun yet/verify-emtpy-scratch-on-emacs-kill ()
  "Require confirmation to kill Emacs if *scratch* buffer is not empty."
  (yet/prompt-on-not-empty-scratch-buffer "Really kill Emacs?"))

(add-to-list 'kill-emacs-query-functions
             #'yet/verify-emtpy-scratch-on-emacs-kill)

(defun yet/verify-emtpy-scratch-on-buffer-kill ()
  "Require confirmation to kill *scratch* buffer if it is not empty."
  (if (equal "*scratch*" (buffer-name))
      (yet/prompt-on-not-empty-scratch-buffer "Really kill *scratch* buffer?")
    t))

(add-to-list 'kill-buffer-query-functions
             #'yet/verify-emtpy-scratch-on-buffer-kill)

