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
    (setq org-export-with-broken-links 'mark))

  (when (boundp 'org-export-headline-levels)
    ;; org-html-toplevel-hlevel is 2 by default.
    (setq org-export-headline-levels 5))

  (defun yet-org-export-to-tmp-dir
      (orig-fun extension &optional subtreep pub-dir)
    "A piece of advice for function `org-export-output-file-name'.
Sets PUB-DIR to a directory for temporary files."
    (unless pub-dir
      (setq pub-dir (temporary-file-directory)))
    (apply orig-fun extension subtreep pub-dir nil))

  (advice-add
   'org-export-output-file-name
   :around
   'yet-org-export-to-tmp-dir))

(with-eval-after-load 'ox-html
  (when (boundp 'org-html-prefer-user-labels)
    (setq org-html-prefer-user-labels t))

  (when (boundp 'org-html-validation-link)
    (setq org-html-validation-link nil)))

(with-eval-after-load 'org-id
  (when (boundp 'org-id-link-to-org-use-id)
    (setq org-id-link-to-org-use-id 'use-existing))

  (define-key org-mode-map (kbd "C-c o l") #'org-store-link))


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

(when (and (boundp 'yet-org-noob) yet-org-noob)
  (define-key org-mode-map (kbd "M-<left>") #'left-word)
  (define-key org-mode-map (kbd "M-<right>") #'right-word)
  (define-key org-mode-map (kbd "M-<up>") nil)
  (define-key org-mode-map (kbd "M-<down>") nil))
