;;; init-tex.el --- TeX related settings   -*- lexical-binding: t -*-

;;; Texinfo

(defun yet-texinfo-mode ()
  (setq-local fill-column 70
              sentence-end-double-space t)
  (auto-fill-mode 1)
  (display-fill-column-indicator-mode 1))

(add-hook 'texinfo-mode-hook #'yet-texinfo-mode)

(with-eval-after-load 'company

  (defun yet-texinfo-company ()
    (setq-local company-backends '(company-dabbrev))
    (company-mode 1))

  (add-hook 'texinfo-mode-hook #'yet-texinfo-company))

