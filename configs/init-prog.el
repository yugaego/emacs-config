;;; init-prog.el --- Programming languages   -*- lexical-binding: t -*-

(defun yet-prog-mode ()
  (goto-address-prog-mode 1))

(add-hook 'prog-mode-hook 'yet-prog-mode)


(require 'flymake)

(defun yet-flymake-mode ()
  (setq-local flymake-mode-line-format '("")
              mode-line-misc-info
              '((global-mode-string ("" global-mode-string))
                flymake-mode-line-counters)))

(add-hook 'flymake-mode-hook 'yet-flymake-mode)

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

(define-key flymake-mode-map (kbd "M-n") 'yet-flymake-goto-next-error)
(define-key flymake-mode-map (kbd "M-p") 'yet-flymake-goto-prev-error)


;;; Makefile

(defun yet-makefile-mode ()
  (setq-local indent-tabs-mode t))

(add-hook 'makefile-mode-hook 'yet-makefile-mode)


;;; PHP

(defun yet-php-mode ()
  (subword-mode 1)
  (abbrev-mode -1))

(add-hook 'php-mode-hook 'yet-php-mode)
(add-hook 'web-mode-hook 'yet-php-mode)
