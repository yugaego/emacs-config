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


;;; Use Mac Dictionary.
;; Based on https://gist.github.com/Superbil/5113974.
(when *is-a-mac*

  ;; Open Dictionary.
  (defun mac-open-dictionary (word)
    "Open Mac OS Dictionary for a given word."
    (interactive "sEnter a word: ")
    (shell-command
     (format "%s \"%s%s\""
             (executable-find "open")
             "dict:///"
             (replace-regexp-in-string "\"" "'" word))))

  ;; Open Dictionary for the word at a point.
  (defun mac-open-dictionary-current-word ()
    "Open Mac Dictionary for the word at a point."
    (interactive)
    (mac-open-dictionary (current-word)))
  
  ;; Call Dictionary for the current word.
  (global-set-key (kbd "C-c s-d") 'mac-open-dictionary-current-word))

