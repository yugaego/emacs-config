;;; local-pre-init.el --- LOCAL EXAMPLE configurations   -*- lexical-binding: t -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EACH OF THE FOLLOWING EXAMPLE DEFINITIONS IS OPTIONAL. ;;
;; To use an option, add it to ../local-pre-init.el file  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; init
(defconst yet-exec-path '("/usr/local/bin" "~/.cargo/bin")
  "A list of paths to add to variable `exec-path'.
This makes OS installed executables available to Emacs.")

(defconst yet-source-directory "~/Sources/emacs"
  "Point explicitly to the directory with Emacs source code.
Sets variable `source-directory'.  This is expected to be needed only for
pre-built Emacs packages: to get acces to C definitions when calling such
commands as `help-view-source' or `xref-find-definition'.")

(defconst yet-auth-sources '(macos-keychain-generic
                             "~/.config/emacs/.authinfo.gpg")
  "Configure variable `auth-sources'.")


;;; init-file
(defconst yet-backup-directory-alist '(("." . "~/.emacs.d/backups"))
  "Configure variable 'backup-directory-alist'.")

(defconst yet-bookmark-default-file "~/path/to/emacs-bookmarks"
  "Configure variable 'bookmark-default-file'.")


;;; init-grammar
(defconst yet-browse-grammarly-doc-id "11111111"
  "Enable command 'yet-browse-grammarly', which see.")


;;; init-lifecycle
(defconst yet-open-files-list
  '("~/path/to/file.org"
    "~/path/to/file.el")
  "A list of files to open on Emacs load.")


;;; init-lsp
(defconst yet-eglot-php-server
  '("php"
    "-d"
    "memory_limit=1024M"
    "/Users/user/Sources/phpactor/bin/phpactor"
    ;; "-vvv"
    "language-server")
  "Set value of 'eglot-server-programs' in php-mode buffers.")

(defconst yet-eglot-rust-server '("rust-analyzer")
  "Set value of 'eglot-server-programs' in rust-mode buffers.")


;;; init-pdf
;; Requires poppler server installation.
;; See https://github.com/politza/pdf-tools.
(defconst yet-enable-pdf-tools nil
  "Enable to initialize and configure 'pdf-tools' package.")


;;; init-rmail
(defconst yet-rmail-file-name "~/Mail/Rmail/YourFile"
  "Configure variable 'rmail-file-name'.
Rmail stores retrieved emails to this file.")

(defconst yet-rmail-primary-inbox-list
  '("imaps://some%40xmpl.tld@imap.xmpl.tld")
  "Configure variable 'rmail-primary-inbox-list'.

Rmail retrieves emails from the listed servers / files.

Example format for IMAP connection *tests*:
'imaps://some%40xmpl.tld:PWD@imap.xmpl.tld:993'.

For more details, see '../configs/init-rmail.el' 'IMAP Server
Authentication' comments section.")

(defconst yet-rmail-default-file "~/Mail/Rmail/Output"
  "Configure variable 'rmail-default-file'.
Export (store, output) email to this file by default.
For more details, see `rmail-output'.")


;;; init-shell
(defconst yet-explicit-shell-file-name
  (when (executable-find "fish") "fish")
  "Configure variable 'explicit-shell-file-name'.")


;;; init-smtp
(defconst yet-smtpmail-smtp-server "smtp.xmpl.tld"
  "Configure variable 'smtpmail-smtp-server'.")

(defconst yet-smtpmail-smtp-user "user@xmpl.tld"
    "Configure variable 'smtpmail-smtp-user'.")

(defconst yet-user-mail-address "user@xmpl.tld"
  "Configure variable 'user-mail-address'.")

(defconst yet-user-full-name "Your Name"
  "Configure variable 'user-full-name'.")

(defconst yet-message-default-mail-headers
  (concat "From: Your Name <name@xmpl.tld>\n"
          "Reply-To: Your Name <name@xmpl.tld>\n"
          "Fcc: ~/Mail/sent\n")
  "Configure variable 'message-default-mail-headers'.")

(defconst yet-mail-personal-alias-file "~/.config/emacs/.mailrc"
  "Configure variable 'mail-personal-alias-file'.
Package 'Mailabbrev' expands aliases defined in this file to email addresses.")


;;;; Working with a third-party package source.
;;; Beware of the compiled ('.elc') and natively compiled files ('eln-cache/').

;;; Load source of the package.
;; git clone some-package
;; (defconst local-<package> "/path/to/<package>")

;;; Optionally: Install (with compilation) a package
;;; to the default location ~/.emacs.d/elpa/
;; (package-install-file local-<package>)

;;; Load package from its source.
;; (add-to-list 'load-path local-<package>)
;; (require '<package> "<package>.el" t)

