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


;;; diff-mode

(require 'diff-mode)
(require 'whitespace)

(setq diff-font-lock-prettify t)

(defun yet-diff-hunk-next ()
  (interactive)
  (when (fboundp 'diff-hunk-next)
    (diff-hunk-next)
    (recenter 0 t)))

(defun yet-diff-hunk-prev ()
  (interactive)
  (when (fboundp 'diff-hunk-prev)
    (diff-hunk-prev)
    (recenter 0 t)))

(defun yet-diff-file-next ()
  (interactive)
  (when (fboundp 'diff-file-next)
    (diff-file-next)
    (recenter 0 t)))

(defun yet-diff-file-prev ()
  (interactive)
  (when (fboundp 'diff-file-prev)
    (diff-file-prev)
    (recenter 0 t)))

(define-key diff-mode-map (kbd "M-n") 'yet-diff-hunk-next)
(define-key diff-mode-map (kbd "M-p") 'yet-diff-hunk-prev)
(define-key diff-mode-map (kbd "M-N") 'yet-diff-file-next)
(define-key diff-mode-map (kbd "M-P") 'yet-diff-file-prev)

(defun yet-diff-whitespace ()
  "Toggle whitespace visualization with local `whitespace-style'."
  (interactive)
  (setq-local whitespace-style
                '(face tabs tab-mark spaces space-mark trailing lines-tail
                       newline newline-mark missing-newline-at-eof))
  (whitespace-mode 'toggle))

(define-key diff-mode-map (kbd "C-c b w") 'yet-diff-whitespace)


;;; diff-hl

(require 'diff-hl)
(require 'diff-hl-show-hunk)

(with-eval-after-load 'diff-hl
  (dolist (hook '(prog-mode-hook conf-mode-hook text-mode-hook))
    (add-hook hook 'turn-on-diff-hl-mode)
    (add-hook hook 'diff-hl-flydiff-mode))
  (add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode-unless-remote)

  (define-key diff-hl-command-map (kbd "/") #'diff-hl-revert-hunk)
  (define-key diff-hl-command-map (kbd "p") #'diff-hl-show-hunk-previous)
  (define-key diff-hl-command-map (kbd "n") #'diff-hl-show-hunk-next))

