;;; init-org.el --- Org: mode for text markup and planning   -*- lexical-binding: t -*-

(require 'org)

(setq org-startup-truncated nil        ; Show lines in full.
      org-startup-folded nil           ; Open org files with the items expanded.
      org-support-shift-select 'always); Force enable shift-selection.

(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (js . t)
     (latex . t)
     (shell . t))))

;; Enlarge LaTeX preview.
(plist-put org-format-latex-options :scale 1.5)

(defun yet-org-mode ()
  (electric-indent-local-mode -1)
  (goto-address-mode 1)
  (auto-fill-mode 1))

(add-hook 'org-mode-hook 'yet-org-mode)

(with-eval-after-load 'ox
  (when (boundp 'org-export-with-broken-links)
    (setq org-export-with-broken-links 'mark)))

(with-eval-after-load 'ox-html
  (when (boundp 'org-html-prefer-user-labels)
    (setq org-html-prefer-user-labels t)))


;;; Indentation

;; Do not indent after headlines.
(setq org-adapt-indentation nil)

;; Remap to work closer to the programming modes indentation.
;; In the lists ('electric-indent-mode' disabled by 'org-mode-hook'):
;; - `C-j' starts a new line.
;; - `RET' adds a child item.
;; - `M-RET' adds a sibling.
(define-key org-mode-map (kbd "RET") #'org-return-and-maybe-indent)
(define-key org-mode-map (kbd "C-j") #'org-return)

;;; Default indentation

;; With 'electric-indent-mode' DISABLED, in the lists:
;; - `RET' starts a new line.
;; - `C-j' adds a child item.
;; - `M-RET' adds a sibling.

;; With 'electric-indent-mode' ENABLED, in the lists:
;; - `C-j' starts a new line.
;; - `RET' adds a child item.
;; - `M-RET' adds a sibling.


;; Do not insert unexpected newlines.
(setq org-blank-before-new-entry '(((heading . nil)
                                    (plain-list-item . nil))))


;;; Disable confusing org-mode keybindings

(define-key org-mode-map (kbd "M-<left>") #'left-word)
(define-key org-mode-map (kbd "M-<right>") #'right-word)
(define-key org-mode-map (kbd "M-<up>") nil)
(define-key org-mode-map (kbd "M-<down>") nil)
