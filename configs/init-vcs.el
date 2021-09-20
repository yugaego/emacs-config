;;; init-vcs.el --- Version Control System   -*- lexical-binding: t -*-

(require 'vc)

(setq vc-handled-backends '(Git) ; Disable other VCS to improve performance.
      vc-make-backup-files t)    ; Still backup files under VCS.

(require 'diff-hl)

(with-eval-after-load 'diff-hl
  (add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
  (add-hook 'prog-mode-hook 'diff-hl-flydiff-mode)
  (add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode-unless-remote)

  (define-key diff-hl-command-map (kbd "/") #'diff-hl-revert-hunk)
  (define-key diff-hl-command-map (kbd "/") #'diff-hl-show-hunk-revert-hunk)
  (define-key diff-hl-command-map (kbd "p") #'diff-hl-show-hunk-previous)
  (define-key diff-hl-command-map (kbd "n") #'diff-hl-show-hunk-next))
