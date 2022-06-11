;;; init-org.el --- Org: mode for text markup and planning   -*- lexical-binding: t -*-

(require 'org)

(setq org-startup-truncated nil        ; Show lines in full.
      org-startup-folded nil           ; Open org files with the items expanded.
      org-support-shift-select 'always); Force enable shift-selection.

(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (latex . t)
     (js . t))))

;; Enlarge LaTeX preview.
(plist-put org-format-latex-options :scale 1.5)

(require 'ox)

(setq org-export-with-broken-links 'mark)

;;; Indentation

;; Do not indent after headlines.
(setq org-adapt-indentation nil)

;; With electric indent ENABLED, use in the lists:
;; - `C-j' to start a new line.
;; - `RET' to add a child item.
;; - `M-RET' to add a sibling.

;; With electric indent DISABLED, use in the lists:
;; - `RET' to start a new line.
;; - `C-j' to add a child item.
;; - `M-RET' to add a sibling.

(defun yet-org-mode ()
  (electric-indent-local-mode -1)
  (auto-fill-mode 1))

(add-hook 'org-mode-hook 'yet-org-mode)

