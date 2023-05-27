;;; init-pdf.el --- PDF related settings   -*- lexical-binding: t -*-

;;; PDF tools

(require 'pdf-loader)
(require 'pdf-view)

(with-eval-after-load 'pdf-loader

  (when (and (boundp 'yet-enable-pdf-tools) yet-enable-pdf-tools)

    (pdf-loader-install)

    (defun yet-pdf-view-mode ()
      (setq-local display-line-numbers nil)
      ;; (pdf-view-midnight-minor-mode 1)
      (setq-default pdf-view-display-size 'fit-height
                    ;; pdf-view-max-image-width 4800
                    pdf-view-resize-factor 1.05
                    pdf-view-bounding-box-margin 0
                    ;; Fixes contrast on Mac OS Retina
                    ;; by displaying 2x images.
                    pdf-view-use-scaling t
                    pdf-view-use-unicode-ligther nil))

    (add-hook 'pdf-view-mode-hook 'yet-pdf-view-mode)))
