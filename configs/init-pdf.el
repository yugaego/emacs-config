;;; init-pdf.el --- PDF related settings   -*- lexical-binding: t -*-

;;; PDF tools

(when (and (boundp 'yet-enable-pdf-tools) yet-enable-pdf-tools)

  (with-eval-after-load 'pdf-tools

    (pdf-loader-install)

    (setq-default pdf-view-display-size 'fit-width
                  ;; pdf-view-max-image-width 4800
                  pdf-view-resize-factor 1.05
                  pdf-view-bounding-box-margin 0
                  ;; Fixes contrast on Mac OS Retina
                  ;; by displaying 2x images.
                  pdf-view-use-scaling t
                  pdf-view-use-unicode-ligther nil)

    (defun yet-pdf-view-mode ()
      (pdf-view-midnight-minor-mode 1))

    (add-hook 'pdf-view-mode-hook #'yet-pdf-view-mode)))

