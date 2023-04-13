;;; local-pre-init.el --- LOCAL EXAMPLE configurations   -*- lexical-binding: t -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EACH OF THE FOLLOWING EXAMPLE DEFINITIONS IS OPTIONAL. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; init
(defconst yet-exec-path '("/usr/local/bin" "~/.cargo/bin"))
(defconst yet-source-directory "~/Sources/emacs"
  "Point explicitly to the directory with Emacs source code.
This is expected to be needed only for pre-built Emacs packages,
for getting acces to C definitions when calling such commands
as `help-view-source' or `xref-find-definition'")

;;; init-file
(defconst yet-backup-directory-alist '(("." . "~/.backups-emacs")))
(defconst yet-bookmark-default-file "~/path/to/emacs-bookmarks")

;;; init-grammar
(defconst yet-browse-grammarly-doc-id "11111111")

;;; init-lifecycle
(defconst yet-open-files-list
  '("~/path/to/file.org"
    "~/path/to/file.el"))

;;; init-lsp
(defconst yet-eglot-php-server
  '("php"
    "-d"
    "memory_limit=1024M"
    "/Users/path/to/phpactor/bin/phpactor"
    ;; "-vvv"
    "language-server"))

(defconst yet-eglot-rust-server '("rust-analyzer"))

;;; init-pdf
;; Requires poppler server installation.
;; See https://github.com/politza/pdf-tools.
(defconst yet-enable-pdf-tools nil)

;;; init-rmail
(defconst yet-rmail-file-name "~/path/to/file")
(defconst yet-rmail-primary-inbox-list
  "imaps://some%40domain.tld:pwd@imap.domain.tld:993")
(defconst yet-rmail-default-file "~/path/to/file")

;;; init-shell
(defconst yet-explicit-shell-file-name
  (when (executable-find "fish") "fish"))

;;; init-smtp
(defconst yet-smtpmail-default-smtp-server "smtp.domain.tld")
(defconst yet-smtpmail-smtp-user "user@domain.tld")
(defconst yet-user-mail-address "user@domain.tld")
(defconst yet-user-full-name "Your Name")
(defconst yet-message-default-mail-headers
  "From: Name <name@xmpl.tld>\nReply-To: Name <name@xmpl.tld>\nFcc: ~/Mail/sent\n")


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

