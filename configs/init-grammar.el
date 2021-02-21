;;; init-grammar.el --- Natural languages utilities   -*- lexical-binding: t -*-

;;; Spell checking.
;; On Mac, install program with ~$ brew install aspell~.
;; Use M-x ispell- to request a spell checking.
(setq ispell-program-name "aspell")

(when (executable-find "aspell")
  ;; Spell check on-the-fly in text modes.
  (add-hook 'text-mode-hook 'flyspell-mode)
  ;; Spell check comments on-the-fly in programming modes.
  (add-hook 'prog-mode-hook 'flyspell-prog-mode))


(when *is-a-mac*

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
    (yet/mac-open-dictionary (current-word)))

  ;; Call Dictionary for the current word.
  (global-set-key (kbd "C-c s-d") 'yet/mac-open-dictionary-current-word)


  (defun yet/browse-grammarly ()
    "Open Grammarly document in a default browser.

Configure variable `yet/browse-grammarly-doc-id` to use this function.
For example, you may add `(defconst yet/browse-grammarly-doc-id \"URL-DOCUMENT-ID\")`
to your `private-init.el`.

Before opening a browser, if the buffer has an active region, its content is copied.
Otherwise, the content of the whole buffer is copied."
    (interactive)
    (if mark-active
        (kill-new (buffer-substring-no-properties (region-beginning) (region-end)))
      (kill-new (buffer-string)))
    (browse-url (concat "https://app.grammarly.com/ddocs/" yet/browse-grammarly-doc-id)))

  ;; Open Grammarly, copying the region or buffer before-hand.
  (global-set-key (kbd "C-c s-g") 'yet/browse-grammarly))

