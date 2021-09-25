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

  (defun yet-company-complete-common-or-raise-tooltip ()
    "Either insert the common part of all the candidates or pop-up a tooltip."
    (interactive)
    ;; Workaround to lookup completions from inside a word.
    (when (looking-at "\\S-")
      (save-excursion (insert " ")))
    (when (company-manual-begin)
      (let ((tick (buffer-chars-modified-tick)))
        (call-interactively 'company-complete-common)
        (when (eq tick (buffer-chars-modified-tick))
          (let ((company-tooltip-idle-delay 0.0))
            (company-complete)
            (and company-candidates
                 (company-call-frontends 'post-command)))))))

  (global-set-key (kbd "C-c c") #'yet-company-complete-common-or-raise-tooltip))

