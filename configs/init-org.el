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


;;; Org Export

(require 'ox-html)

(setq org-html-doctype "html5"
      org-html-html5-fancy t
      org-html-metadata-timestamp-format "%e %B %Y"
      org-html-preamble nil
      org-html-postamble t
      org-html-postamble-format '(("en"
                                  "<p class=\"date\">Created: %d</p>
                                  <p class=\"date\">Last Modified: %C</p>"
                                  )))

(setq org-export-headline-levels 5
      org-export-with-section-numbers nil
      org-export-with-toc nil)


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

(add-hook 'org-mode-hook #'yet-org-mode)

