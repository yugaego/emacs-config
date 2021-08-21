;;; init-grammar.el --- Natural languages utilities   -*- lexical-binding: t -*-

;;; Spell checking

;; Emacs uses available CLI spell-checker by default.
;; (setq ispell-program-name "aspell")

(require 'ispell)

;; Several convenient spell-checker commands:
;; - `C-.' corrects the word under cursor.
;; - `M-$' suggests spelling variants.
;; - `M-x ispell-buffer' calls spell checking manually.

;; The following lines enable automatic spell checking.
(when (executable-find ispell-program-name)

  ;; Spell check on-the-fly in text modes.
  (add-hook 'text-mode-hook 'flyspell-mode)

  ;; Spell check comments on-the-fly in programming modes.
  (add-hook 'prog-mode-hook 'flyspell-prog-mode))


(when (eq system-type 'darwin)

  ;; Based on https://gist.github.com/Superbil/5113974.
  (defun yet/mac-open-dictionary (word)
    "Open Mac OS Dictionary for a given word."
    (interactive "sEnter a word: ")
    (shell-command
     (format "%s \"%s%s\""
             (executable-find "open")
             "dict:///"
             (replace-regexp-in-string "\"" "'" word))))

  (defun yet/mac-open-dictionary-current-word ()
    "Open Mac Dictionary for the word at a point."
    (interactive)
    (if (fboundp 'yet/mac-open-dictionary)
        (yet/mac-open-dictionary (current-word))
      (error "Function `yet/mac-open-dictionary' is not defined")))

  ;; Call Dictionary for the current word.
  (global-set-key (kbd "C-c s-d") 'yet/mac-open-dictionary-current-word)


  (defun yet/browse-grammarly ()
    "Open predefined Grammarly document in a default browser.

Configure variable `yet/browse-grammarly-doc-id' to use this function.
For example, configure with:
(defconst yet/browse-grammarly-doc-id \"URL-DOCUMENT-ID\")

Before opening a browser, an active region or the whole buffer contents
is copied."
    (interactive)
    (if mark-active
        (kill-new
         (buffer-substring-no-properties (region-beginning) (region-end)))
      (kill-new (buffer-string)))
    (browse-url
     (concat "https://app.grammarly.com/ddocs/"
             (if (boundp 'yet/browse-grammarly-doc-id)
                 yet/browse-grammarly-doc-id
               (error "Variable `yet/browse-grammarly-doc-id' is not defined")))))

  ;; Open Grammarly, copying the region or buffer before-hand.
  (global-set-key (kbd "C-c s-g") 'yet/browse-grammarly))

