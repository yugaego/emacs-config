;;; init-pdf.el --- PDF related settings   -*- lexical-binding: t -*-

;;; PDF tools

(require 'pdf-loader)
(require 'pdf-view)

(with-eval-after-load 'pdf-loader

  (when (and (boundp 'yet-enable-pdf-tools) yet-enable-pdf-tools)

    (pdf-loader-install)

    (defun yet-enabled-theme-dark-p ()
      "Return non-nil if the current theme has a dark background."
      (let* ((theme (car custom-enabled-themes))
             (bg (face-background 'default nil theme)))
        (when (stringp bg)
          (let* ((rgb (color-name-to-rgb bg))
                 (lum (apply #'+ (mapcar (lambda (c) (* c 0.3)) rgb))))
            (< lum 0.5)))))

    (defun yet-pdf-view-mode ()
      (setq-local display-line-numbers nil)
      (when (yet-enabled-theme-dark-p)
        (pdf-view-midnight-minor-mode 1))
      (setq-default pdf-view-display-size 'fit-height
                    ;; pdf-view-max-image-width 4800
                    pdf-view-resize-factor 1.05
                    pdf-view-bounding-box-margin 0
                    ;; Fixes contrast on Mac OS Retina
                    ;; by displaying 2x images.
                    pdf-view-use-scaling t
                    pdf-view-use-unicode-ligther nil))

    (add-hook 'pdf-view-mode-hook 'yet-pdf-view-mode)))
