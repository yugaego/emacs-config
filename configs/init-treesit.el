;;; init-treesit.el --- Tree-sitter configs  -*- lexical-binding: t -*-

;;; Dockerfile

;; A temporary workaround to provide a recipe for the Dockerfile grammar
;; installation with the function `treesit-install-language-grammar'.
;; By the next Emacs release (30.2 or 31.1) the variable
;; `treesit-language-source-alist' is expected to include this recipe.
;; See commit 3d3be6dd0eb320e73d59ad6958e7c6e2c1b6a434 in Emacs repo.
(when (and (boundp 'treesit-language-source-alist)
           (not (assoc 'dockerfile treesit-language-source-alist)))
  (add-to-list
   'treesit-language-source-alist
   '(dockerfile "https://github.com/camdencheek/tree-sitter-dockerfile")))
