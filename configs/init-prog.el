;;; init-prog.el --- Programming languages   -*- lexical-binding: t -*-

;;; Flymake: syntax checker

(require 'flymake)

(defun yet-flymake-mode ()
  (setq-local flymake-mode-line-format '("")
              mode-line-misc-info
              '((global-mode-string ("" global-mode-string))
                flymake-mode-line-counters)))

(add-hook 'flymake-mode-hook 'yet-flymake-mode)

(remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)

(defun yet-flymake-goto-next-error ()
  "Go to the next error found by Flymake."
  (interactive)
  (let ((current-prefix-arg 1))
    (call-interactively #'flymake-goto-next-error)))

(defun yet-flymake-goto-prev-error ()
  "Go to the previous error found by Flymake."
  (interactive)
  (let ((current-prefix-arg 1))
    (call-interactively #'flymake-goto-prev-error)))

(define-key flymake-mode-map (kbd "M-n") 'yet-flymake-goto-next-error)
(define-key flymake-mode-map (kbd "M-p") 'yet-flymake-goto-prev-error)


;;; Hideshow: blocks folding

(require 'hideshow)

(defun ttn-hs-hide-level-1 ()
  (when (hs-looking-at-block-start-p)
    (hs-hide-level 1))
  (forward-sexp 1))

(defun yet-hs-hide-level-1-and-comments ()
  "Hide all comments and the second-level blocks.
For more details, see command `hs-hide-all'."
  (interactive)
  (setq hs-allow-nesting t)
  ;; Fold all comments first.
  (setq hs-hide-all-non-comment-function #'ignore)
  (hs-hide-all)
  ;; Fold the second-level blocks.
  (setq hs-hide-all-non-comment-function 'ttn-hs-hide-level-1)
  (hs-hide-all))

(defun yet-hs-hide-comments ()
  "Hide all comments."
  (interactive)
  (setq hs-allow-nesting nil)
  ;; Fold all comments.
  (setq hs-hide-all-non-comment-function #'ignore)
  (hs-hide-all))

(defun yet-prog-mode ()
  (goto-address-prog-mode 1)
  (hs-minor-mode 1)
  (yet-hs-hide-comments))

(add-hook 'prog-mode-hook 'yet-prog-mode)

;; Mnemonics: `f' fold, `c' comments.
(define-key hs-minor-mode-map (kbd "C-c f c") 'yet-hs-hide-comments)
;; Mnemonics: `f' fold, `s' start.
(define-key hs-minor-mode-map (kbd "C-c f s")
            'yet-hs-hide-level-1-and-comments)
;; Mnemonics: `f' fold, `d' disable.
(define-key hs-minor-mode-map (kbd "C-c f d") #'hs-show-all)
;; Mnemonics: `f' fold, `t' toggle the current block or level.
(define-key hs-minor-mode-map (kbd "C-c f t") #'hs-toggle-hiding)


;;; Makefile

(defun yet-makefile-mode ()
  (setq-local indent-tabs-mode t))

(add-hook 'makefile-mode-hook 'yet-makefile-mode)


;;; PHP

(require 'php-mode)

;; (add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

;; Mnemonics: `o' Open, ` Documentation.
(define-key php-mode-map (kbd "C-c o d") #'php-search-documentation)

(defun yet-php-mode ()
  (subword-mode 1)
  (abbrev-mode -1))

(add-hook 'php-mode-hook 'yet-php-mode)

(add-to-list 'hs-special-modes-alist '(php-mode "{" "}" "/[*/]" nil nil))


;;; Web Mode

(require 'web-mode)

(with-eval-after-load 'web-mode

  ;; (add-to-list
  ;;  'auto-mode-alist
  ;;  '("/\\(?:views\\|html\\|templates\\)/\\..*\\.php\\'"
  ;;    . web-mode))

  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

  (defun yet-web-mode ()
    (subword-mode 1)
    (abbrev-mode -1)
    (setq web-mode-enable-comment-interpolation t
          web-mode-enable-comment-annotation t
          web-mode-enable-auto-indentation nil
          web-mode-enable-auto-expanding t
          web-mode-enable-current-element-highlight t
          web-mode-enable-current-column-highlight t
          web-mode-enable-sql-detection t))

  (add-hook 'web-mode-hook 'yet-web-mode))


;;; SQL

;; See https://truongtx.me/2014/08/23/setup-emacs-as-an-sql-database-client

(setq sql-postgres-login-params
      '((user :default "postgres")
        (database :default "postgres")
        (server :default "localhost")
        (port :default 5432)))

(defun yet-sql-interactive-mode ()
  (toggle-truncate-lines 1))

(add-hook 'sql-interactive-mode-hook 'yet-sql-interactive-mode)
