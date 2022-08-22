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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Recommended Mac OS packages ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; - $ brew install jansson
;;      - Pre-install to use faster json parser.
;;
;; - $ brew install aspell
;;      - Spell-checker called by ispell and flyspell.
;;
;; - $ brew install multimarkdown
;;      - A Markdown parser better matching Github and Gitlab styles.
;;      - Alternatively, call command `gfm-mode' from markdown-mode package.
;;
;; - $ brew install mailutils
;;     - Allows to use POP3 via TLS channel by Rmail email client.
;;     - Emacs auto-compiles with `mailutils' support if it is installed.
;;     - See more details in Info node `Movemail'.
;;
;; - $ brew install gpg
;;     - OpenGPG encryption and signing tool.
;;
;; - $ brew install librsvg
;;     - SVG images support.
;;
;; - $ brew install poppler automake
;;     - To build server for additional PDF tools.
;;     - See `yet-enable-pdf-tools' in ./examples/local-pre-init.el
;;     - $ echo export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig >> ~/.bash_profile
;;
;; - https://www.tug.org/mactex/
;;     - LaTeX installation for org-mode.
;;
;; - $ brew install minimal-racket
;; - $ raco pkg install --auto drracket
;;     - Only `racket-mode' related.
;;     - Installs Racket language environment.
