;;; init-prog.el --- Programming languages   -*- lexical-binding: t -*-

(require 'flymake)

(remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)

(defun yet-flymake-goto-next-error ()
  "Go to the next error found by Flymake."
    (interactive)
  (let ((current-prefix-arg 1))
    (call-interactively #'flymake-goto-next-error)))

(defun yet-flymake-goto-prev-error ()
  "Go to the previous error found by Flymake."
    (interactive)
  (let ((current-prefix-arg 1))
    (call-interactively #'flymake-goto-prev-error)))

(define-key flymake-mode-map (kbd "M-n") #'yet-flymake-goto-next-error)
(define-key flymake-mode-map (kbd "M-p") #'yet-flymake-goto-prev-error)


;;; Makefile

(defun yet-makefile-mode-hook ()
  (setq-local indent-tabs-mode t))

(add-hook 'makefile-mode-hook #'yet-makefile-mode-hook)


;;; PHP

(defun yet-php-mode-hook ()
  (abbrev-mode -1)
  (setq-local mode-line-misc-info
              '((global-mode-string ("" global-mode-string))
                flymake-mode-line-counters)))

(add-hook 'php-mode-hook #'yet-php-mode-hook)
(add-hook 'web-mode-hook #'yet-php-mode-hook)
