;;; init-abbrevs.el --- Set abbreviations (templates)  -*- lexical-binding: t -*-

(setq abbrev-file-name (locate-user-emacs-file "yet-abbrev-defs"))

(defconst yet-abbrev-cursor-marker "POINT")

(defun yet-abbrev-cursor ()
  (search-backward yet-abbrev-cursor-marker)
  (delete-char (length yet-abbrev-cursor-marker)))

(defconst yet-php-abbrevs
  `(("e" ,(concat "echo \""
                  yet-abbrev-cursor-marker
                  "\"; exit();")
     yet-abbrev-cursor)
    ("t" ,(concat "// TODO::"
                  (upcase user-login-name)
                  " ")
     yet-abbrev-cursor)
    ("p" ,(concat "echo \"<pre>\";print_r("
                  yet-abbrev-cursor-marker
                  ");echo \"</pre>\";exit();")
     yet-abbrev-cursor)
    ("v" ,(concat "echo \"<pre>\";var_dump("
                   yet-abbrev-cursor-marker
                   ");echo \"</pre>\";exit();")
     yet-abbrev-cursor)))

;; Expand with `C-x a e'.
(define-abbrev-table 'php-mode-abbrev-table yet-php-abbrevs)
(define-abbrev-table 'web-mode-abbrev-table yet-php-abbrevs)

