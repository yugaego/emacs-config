;;; init-navigation.el --- Move around   -*- lexical-binding: t -*-

(require 'bookmark)

(if (boundp 'yet-bookmark-default-file)
    (setq bookmark-default-file yet-bookmark-default-file))


(require 'windmove)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings 'super))


;; Recenter displayed line.
;; Affects occur-mode display of occurrences in source.
(setq next-error-recenter '(4))


;; Do not require repeated `C-u' hit
;; when moving back in mark-ring.
;; Example: `C-u C-SPC ... C-SPC'
;; instead of `C-u C-SPC ... C-u C-SPC'.
(setq set-mark-command-repeat-pop t)


(require 'xref)

(when (executable-find "rg")
  (setq xref-search-program 'ripgrep))

(defun yet-xref-goto-xref-same-window ()
  "Open definition in the current window."
  (interactive)
  (same-window-prefix)
  (xref-goto-xref))

(define-key xref--xref-buffer-mode-map
  (kbd "f")
  'yet-xref-goto-xref-same-window)

;; For uniformity with 'xref' goto command (see above).
(define-key occur-mode-map (kbd "f") #'occur-mode-goto-occurrence)


(require 'pulse)

(setq pulse-iterations 12
      pulse-delay 0.1)


(require 'recentf)

(recentf-mode 1)

(setq recentf-auto-cleanup 'never)

;; Prioritize files that are switched to often.
(add-hook 'buffer-list-update-hook #'recentf-track-opened-file)


(require 'imenu-list)

;; Mnemonics: `i' Imenu, `s' Start/Stop.
(global-set-key (kbd "C-c i s") #'imenu-list-smart-toggle)

(setq imenu-list-focus-after-activation t
      imenu-list-idle-update-delay 0.1
      imenu-list-position 'below)
