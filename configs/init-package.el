;;; init-package.el --- Configure package archives   -*- lexical-binding: t -*-

(require 'package)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("gnu-devel" . "https://elpa.gnu.org/devel/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))

(setq package-archive-priorities
      '(("gnu-devel" . 10)
        ("gnu" . 8)
        ("nongnu" . 6)
        ("melpa" . 4)))

;; Modify 'M-x list-packages' user interface.
(when (and (boundp 'package-name-column-width)
           (boundp 'package-version-column-width)
           (boundp 'package-status-column-width))
  (setq package-name-column-width 24
        package-version-column-width 20
        package-status-column-width 10))

