;;; init-abbrevs.el --- Set abbreviations (templates)  -*- lexical-binding: t -*-

(setq abbrev-file-name (locate-user-emacs-file "yet-abbrev-defs"))

(defun yet-abbrev-cursor ()
  (search-backward "POINT")
  (kill-word 1))

(define-abbrev-table 'php-mode-abbrev-table
  '(("e" "echo \"POINT\"; exit();" yet-abbrev-cursor)
    ("p" "echo \"<pre>\";print_r(POINT);echo \"</pre>\";exit();"
     yet-abbrev-cursor)
    ("vd" "echo \"<pre>\";var_dump(POINT);echo \"</pre>\";exit();"
     yet-abbrev-cursor)))

