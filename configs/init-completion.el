;;; init-completion.el --- Configure auto-completions   -*- lexical-binding: t -*-

;; (setq tab-always-indent t)

(setq completion-styles '(basic substring partial-completion))

(require 'company)
(require 'company-dabbrev)
(require 'company-dabbrev-code)
(require 'company-files)
(require 'company-capf)

;; https://github.com/company-mode/company-mode/discussions/1214
(with-eval-after-load 'company

  ;;; Configure standard settings.

  (setq company-minimum-prefix-length 1
        company-idle-delay 0
        company-tooltip-idle-delay 100   ; Raise tooltip manually with TAB.
        company-frontends
        '(company-pseudo-tooltip-unless-just-one-frontend-with-delay
          company-preview-frontend
          company-echo-metadata-frontend)
        company-backends
        '((company-dabbrev company-keywords company-capf))
        company-transformers '(delete-consecutive-dups
                               company-sort-by-occurrence
                               company-sort-prefer-same-case-prefix)
        company-lighter-base "C"
        company-format-margin-function nil
        company-require-match nil
        company-show-quick-access 'left
        company-tooltip-align-annotations t
        company-dabbrev-ignore-case nil
        company-dabbrev-downcase nil
        company-dabbrev-other-buffers t
        company-dabbrev-minimum-length 2
        company-dabbrev-code-everywhere t
        company-files-exclusions '(".git/" ".DS_Store")
        company-files-chop-trailing-slash nil)


  ;;; Configure per major mode.

  (defun yet-org-mode-company ()
    (setq-local company-backends '(company-dabbrev company-files)
                company-frontends
                '(company-pseudo-tooltip-unless-just-one-frontend-with-delay
                  company-preview-frontend))
    (company-mode 1))

  (add-hook 'org-mode-hook 'yet-org-mode-company)


  (defun yet-prog-mode-company ()
    (company-mode 1))

  (add-hook 'prog-mode-hook 'yet-prog-mode-company)


  (defun yet-c-mode-company ()
    (setq-local
     company-backends
     '((company-clang company-keywords company-dabbrev-code)
       company-dabbrev
       company-files)))

  (add-hook 'c-mode-common-hook 'yet-c-mode-company)


  (defun yet-php-mode-company ()
   (setq-local company-backends
                '((company-dabbrev-code company-keywords company-capf))))

  (add-hook 'php-mode-hook 'yet-php-mode-company -50)


  (defun yet-texinfo-mode-company ()
    (setq-local company-backends '(company-dabbrev))
    (company-mode 1))

  (add-hook 'texinfo-mode-hook 'yet-texinfo-mode-company)


  ;;; Custom bindings

  ;; Enable C-n/C-p (select-next/previous) key bindings
  ;; only when a tooltip is displayed.
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


  ;; Switch to the next backend.
  (global-set-key (kbd "C-c c /") #'company-other-backend)

  ;; Switch to the company-files backend.
  (global-set-key (kbd "C-c c f") #'company-files)

  ;; Switch to the company-dabbrev backend.
  (global-set-key (kbd "C-c c d") #'company-dabbrev)

  ;; Switch to the company-capf backend.
  (global-set-key (kbd "C-c c c") #'company-capf)

  ;; A more mnemonic binding (same as for xref-find-definitions)
  ;; to pop-up buffer with the candidate's definition.
  (define-key company-active-map (kbd "M-.") #'company-show-location)

  (define-key company-active-map (kbd "<tab>")
              #'company-complete-common-or-show-delayed-tooltip))

