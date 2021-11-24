;;; init-elisp.el --- Emacs Lisp mode   -*- lexical-binding: t -*-

(require 'flymake)

(setq flymake-mode-line-format '(" " flymake-mode-line-counters))

(defun yet-emacs-lisp-mode ()
  (setq-local emacs-lisp-docstring-fill-column 75)

  (flymake-mode 1)

  (push '(face . nil) (get :note 'flymake-overlay-control))

  (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)

  (define-key flymake-mode-map (kbd "M-n")
    (lambda () (interactive)
      (let ((current-prefix-arg 1))
        (call-interactively #'flymake-goto-next-error))))

  (define-key flymake-mode-map (kbd "M-p")
    (lambda () (interactive)
      (let ((current-prefix-arg 1))
        (call-interactively #'flymake-goto-prev-error)))))

(add-hook 'emacs-lisp-mode-hook #'yet-emacs-lisp-mode)


(require 'rainbow-mode)

(with-eval-after-load 'rainbow-mode

  (defun yet-emacs-lisp-rainbow ()
    (let ((buffer-name (buffer-file-name)))
      (if (and buffer-name
               (string-match-p "-theme.el" buffer-name))
      (rainbow-mode 1))))

  (add-hook 'emacs-lisp-mode-hook #'yet-emacs-lisp-rainbow))

