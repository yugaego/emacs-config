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
;;      - pre-install to use faster json parser.
;;
;; - $ brew install aspell
;;      - spell checker called by ispell and flyspell.
;;
;; - $ brew install trash
;;      - improves performance of osx-trash.
;;
;; - $ brew install multimarkdown
;;      - a Markdown parser better matching Github and Gitlab styles.
;;      - alternatively, use M-x gfm-mode included into the markdown-mode package.

