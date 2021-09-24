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

