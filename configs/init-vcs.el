;;; init-vcs.el --- Version Control System   -*- lexical-binding: t -*-

(require 'vc)

(setq vc-handled-backends '(Git) ; Disable other VCS to improve performance.
      vc-make-backup-files t)    ; Still backup files under VCS.

(setq vc-revert-show-diff 'kill)


;; With vc-git, we write a commit message
;; in *vc-log* buffer.
(defun yet-log-edit-mode ()
  (setq-local fill-column 72)
  (auto-fill-mode 1))

(add-hook 'log-edit-mode-hook 'yet-log-edit-mode)


(require 'diff-hl)

(with-eval-after-load 'diff-hl
  (dolist (hook '(prog-mode-hook conf-mode-hook text-mode-hook))
    (add-hook hook 'turn-on-diff-hl-mode)
    (add-hook hook 'diff-hl-flydiff-mode))
  (add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode-unless-remote)

  (define-key diff-hl-command-map (kbd "/") #'diff-hl-revert-hunk)
  (define-key diff-hl-command-map (kbd "p") #'diff-hl-show-hunk-previous)
  (define-key diff-hl-command-map (kbd "n") #'diff-hl-show-hunk-next))

