;;; init-completion.el --- Configure auto-completions   -*- lexical-binding: t -*-

(setq tab-always-indent 'complete)      ; Suggest completions on indented lines.

(add-to-list 'completion-styles 'initials t) ; Suggest completions by initials too.


(require 'company)

;; https://github.com/company-mode/company-mode/discussions/1214
(with-eval-after-load 'company

  ;;; Configure standard settings.

  (setq company-minimum-prefix-length 1
        company-idle-delay 0
        company-tooltip-idle-delay 10   ; Raise tooltip manually `C-c c'
        company-frontends
        '(company-pseudo-tooltip-unless-just-one-frontend-with-delay
          company-preview-frontend
          company-echo-metadata-frontend)
        company-backends
        '((company-capf company-keywords company-dabbrev-code company-files)
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


  ;;; Configure per major mode.

  (defun yet-org-mode-company ()
    (setq-local company-backends '(company-dabbrev)
                company-frontends
                '(company-pseudo-tooltip-unless-just-one-frontend-with-delay
                  company-preview-frontend))
    (company-mode 1))

  (add-hook 'org-mode-hook #'yet-org-mode-company)


  (defun yet-prog-mode-company ()
    (company-mode 1))

  (add-hook 'prog-mode-hook #'yet-prog-mode-company)


  (defun yet-c-mode-company ()
    (setq-local
     company-backends
     '((company-clang company-keywords company-dabbrev-code company-files)
       company-dabbrev)))

  (add-hook 'c-mode-common-hook #'yet-c-mode-company)


  (defun yet-php-mode-company ()
    (setq-local
     company-backends
     '((company-capf company-keywords company-dabbrev-code company-files)
       company-dabbrev)))

  (add-hook 'php-mode-hook #'yet-php-mode-company)


  (defun yet-texinfo-mode-company ()
    (setq-local company-backends '(company-dabbrev))
    (company-mode 1))

  (add-hook 'texinfo-mode-hook #'yet-texinfo-mode-company)


  ;;; Enable C-n/C-p navigation bindings only for tooltip.

  (defun yet-company-keymap--filter-by-tooltip (command)
    "Return a COMMAND if a tooltip is shown; otherwise return nil."
    (when (and (boundp 'company-pseudo-tooltip-overlay)
               (overlayp company-pseudo-tooltip-overlay))
      command))

  (define-key company-active-map (kbd "C-n")
    '(menu-item ""
                company-select-next-or-abort
                :filter yet-company-keymap--filter-by-tooltip))

  (define-key company-active-map (kbd "C-p")
    '(menu-item ""
                company-select-previous-or-abort
                :filter yet-company-keymap--filter-by-tooltip))


  ;;; Force show delayed tooltip.

  (defun yet-company-complete-common-or-show-delayed-tooltip ()
    "Either insert the common part of all the candidates or show a tooltip."
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

  (global-set-key (kbd "C-c c") #'yet-company-complete-common-or-show-delayed-tooltip))

