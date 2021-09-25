;;; init-prog.el --- Programming languages   -*- lexical-binding: t -*-

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

