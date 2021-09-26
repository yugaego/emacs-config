;;; init-prog.el --- Programming languages   -*- lexical-binding: t -*-

;;; Makefile

(defun yet-makefile-mode-hook ()
  (setq-local indent-tabs-mode t))

(add-hook 'makefile-mode-hook #'yet-makefile-mode-hook)


;;; Completion

(with-eval-after-load 'company

  (defun yet-prog-mode-company ()
    (company-mode 1))

  (add-hook 'prog-mode-hook #'yet-prog-mode-company)


  (defun yet-c-mode-company ()
    (setq-local company-backends
                '((company-clang company-dabbrev-code company-files)
                  company-dabbrev)))

  (add-hook 'c-mode-common-hook #'yet-c-mode-company))

