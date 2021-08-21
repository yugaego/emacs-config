;;; init-org.el --- Org: mode for text markup and planning   -*- lexical-binding: t -*-

(require 'org)

(setq org-startup-truncated nil        ; Show lines in full.
      org-startup-folded nil           ; Open org files with the items expanded.
      org-support-shift-select 'always); Force enable shift-selection.


;;; Indentation

;; Do not indent after headlines.
(setq org-adapt-indentation nil)

;; With electric indent enabled, use in the lists:
;; - `C-j' to start a new line.
;; - `RET' to add a child item.
;; - `M-RET' to add a sibling.

;; Disable electric indent.
;; (add-hook 'org-mode-hook (lambda () (electric-indent-local-mode -1)))

