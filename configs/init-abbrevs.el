;;; init-abbrevs.el --- Set abbreviations (templates)  -*- lexical-binding: t -*-

(setq abbrev-file-name (locate-user-emacs-file "yet-abbrev-defs"))

(defconst yet-abbrev-cursor-marker "POINT")
(defconst yet-abbrev-user-name (upcase user-login-name))

(defun yet-abbrev-cursor ()
  (search-backward yet-abbrev-cursor-marker)
  (delete-char (length yet-abbrev-cursor-marker)))

(defconst yet-rust-abbrevs
  `(("p" ,(concat "println!(\"{"
                  yet-abbrev-cursor-marker
                  "}\");")
     yet-abbrev-cursor)
    ("wip" "#![allow(unused_variables,dead_code)]")
    ("td" ,(concat "// TODO::" yet-abbrev-user-name " "))))

(defconst yet-php-abbrevs
  `(("e" ,(concat "echo \""
                  yet-abbrev-cursor-marker
                  "\"; exit();")
     yet-abbrev-cursor)
    ("td" ,(concat "// TODO::" yet-abbrev-user-name " "))
    ("p" ,(concat "echo \"<pre>\";print_r($"
                  yet-abbrev-cursor-marker
                  ");echo \"</pre>\";exit();")
     yet-abbrev-cursor)
    ("v" ,(concat "echo \"<pre>\";var_dump($"
                  yet-abbrev-cursor-marker
                  ");echo \"</pre>\";exit();")
     yet-abbrev-cursor)
    ("if" ,(concat
            "if ($" yet-abbrev-cursor-marker ") {
        }")
     yet-abbrev-cursor)
    ("ife" ,(concat
             "if ($" yet-abbrev-cursor-marker ") {
        } else {
        }")
     yet-abbrev-cursor)
    ("for" ,(concat
             "for ($" yet-abbrev-cursor-marker ") {
        }")
     yet-abbrev-cursor)
    ("fore" ,(concat
              "foreach ($" yet-abbrev-cursor-marker ") {
        }")
     yet-abbrev-cursor)
    ("sw" ,(concat
            "switch ($"
            yet-abbrev-cursor-marker
            ") {
            case label1:
                // code block;
                break;
            default:
                // code block;
        }")
     yet-abbrev-cursor)))

;; Expand with `C-x a e'.
(define-abbrev-table 'rust-mode-abbrev-table yet-rust-abbrevs)
(define-abbrev-table 'php-mode-abbrev-table yet-php-abbrevs)
(define-abbrev-table 'web-mode-abbrev-table yet-php-abbrevs)
(define-abbrev-table 'emacs-lisp-mode-abbrev-table
  `(("td" ,(concat ";; TODO::" yet-abbrev-user-name " "))))

