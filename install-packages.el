;;; install-packages.el --- Install configured packages   -*- lexical-binding: t -*-

;; Run once after cloning the repo into ~/.emacs.d:
;;   - Open this file ~/.emacs.d/install-packages.el in Emacs.
;;   - Run command M-x eval-buffer.
;;   - Confirm to install the listed packages.
;;   - Wait untill the load and installation are finished.

;; Fill variable package-selected-packages.
(load-file "custom.el")

;; Use configured package archives.
(load-file "configs/init-package.el")

;; Refresh descriptions of the packages.
(package-refresh-contents)

;; Install packages listed in the variable package-selected-packages.
(package-install-selected-packages)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MacOS Optional Packages ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Macports
;;
;; - mailutils +gnutls
;; - gnupg2 [+openldap +pinentry_mac]
;; - gmake
;; - aspell aspell-dict-<LANG>
;;
;;
;;; Homebrew
;;
;; - jansson
;;      - Pre-install to use faster json parser.
;; - aspell
;;      - Spell-checker called by ispell and flyspell.
;; - multimarkdown
;;      - A Markdown parser better matching Github and Gitlab styles.
;;      - Alternatively, call command `gfm-mode' from markdown-mode package.
;; - mailutils
;;     - Allows to use POP3 via TLS channel by Rmail email client.
;;     - Emacs auto-compiles with `mailutils' support if it is installed.
;;     - See more details in Info node `Movemail'.
;; - gpg
;;     - OpenGPG encryption and signing tool.
;; - librsvg
;;     - SVG images support.
;; - pkg-config poppler autoconf automake
;;     - To build server for additional PDF tools.
;;     - See `yet-enable-pdf-tools' in ./examples/local-pre-init.el
;;     - $ echo export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig >> ~/.bash_profile
;; - https://www.tug.org/mactex/
;;     - LaTeX installation for org-mode.
;; - minimal-racket
;;   - $ raco pkg install --auto drracket
;;       - Only `racket-mode' related.
;;       - Installs Racket language environment.
