;;; init-completion.el --- Configure auto-completions   -*- lexical-binding: t -*-

(setq tab-always-indent 'complete)      ; Suggest completions on indented lines.

(add-to-list 'completion-styles 'initials t) ; Suggest completions by initials too.


(require 'company)

;; https://github.com/company-mode/company-mode/discussions/1214
(with-eval-after-load 'company

  (setq company-minimum-prefix-length 1
        company-idle-delay 0
        company-tooltip-idle-delay 10   ; Raise tooltip manually `C-c c'
        company-frontends
        '(company-pseudo-tooltip-unless-just-one-frontend-with-delay
          company-preview-frontend
          company-echo-metadata-frontend)
        company-backends '((company-capf company-dabbrev-code company-files)
                           company-dabbrev)
        company-transformers '(delete-consecutive-dups
                               company-sort-by-occurrence
                               company-sort-prefer-same-case-prefix)
        company-format-margin-function nil
        company-require-match nil
        company-show-quick-access 'left
        company-tooltip-align-annotations t
        company-dabbrev-downcase nil
        company-dabbrev-other-buffers t
        company-dabbrev-minimum-length 2
        company-dabbrev-code-modes t
        company-dabbrev-code-everywhere t)

  (define-key company-active-map (kbd "M-n") #'company-select-next)
  (define-key company-active-map (kbd "M-p") #'company-select-previous)
  (define-key company-active-map (kbd "C-n") nil)
  (define-key company-active-map (kbd "C-p") nil)

  (global-set-key (kbd "C-c c")
                  (lambda ()
                    (interactive)
                    (let ((company-tooltip-idle-delay 0.0))
                      ;; Workaround to lookup completions from inside a word.
                      (if (looking-at "\\S-")
                          (save-excursion (insert " ")))
                      (company-complete)
                      (and company-candidates
                           (company-call-frontends 'post-command)))))


  (defun yet-prog-mode-company ()
    (company-mode 1))

  (add-hook 'prog-mode-hook #'yet-prog-mode-company)


  (defun yet-c-mode-company ()
    (setq-local company-backends
                '((company-clang company-dabbrev-code company-files)
                  company-dabbrev)))

  (add-hook 'c-mode-common-hook #'yet-c-mode-company))

