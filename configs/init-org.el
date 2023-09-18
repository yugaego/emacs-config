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

  (defun yet-org-export-output-file-name-toggle (&optional arg)
    "Toggles advice `yet-org-export-to-tmp-dir'.
When added, `org-export-output-file-name' uses directory for temporary files.
With prefix ARG, the advice is always enabled."
    (interactive "P")
    (if (or arg (not (advice-member-p
                      'yet-org-export-to-tmp-dir
                      'org-export-output-file-name)))
        (progn
          (message "Advice `yet-org-export-to-tmp-dir' enabled.")
          (advice-add
           'org-export-output-file-name
           :around
           'yet-org-export-to-tmp-dir))
      (progn
        (message "Advice `yet-org-export-to-tmp-dir' disabled.")
        (advice-remove
         'org-export-output-file-name
         'yet-org-export-to-tmp-dir))))

  (yet-org-export-output-file-name-toggle 1)

  (define-key org-mode-map
              (kbd "C-c o e")
              'yet-org-export-output-file-name-toggle))


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


(defun yet-org-unfill (&optional region)
  "Unfill element at point or elements of active region.

This function only applies to comment blocks, comments, example blocks and
paragraphs.

The REGION argument is non-nil, unfill each of the elements in the active
region.

For more details, see function `org-fill-paragraph'."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max)))
    (org-fill-paragraph nil region)))

(define-key global-map (kbd "C-M-q") 'yet-org-unfill)


;;; Disable confusing org-mode keybindings

(when (and (boundp 'yet-org-noob) yet-org-noob)
  (define-key org-mode-map (kbd "M-<left>") #'left-word)
  (define-key org-mode-map (kbd "M-<right>") #'right-word)
  (define-key org-mode-map (kbd "M-<up>") nil)
  (define-key org-mode-map (kbd "M-<down>") nil))
