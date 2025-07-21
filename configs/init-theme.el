;;; init-theme.el --- Configure a theme   -*- lexical-binding: t -*-

;; Use a theme defined by `yet-enable-theme'.
;; Note: after `M-x load-theme <new-theme>'
;; do `M-x disable-theme <old-theme>'.

(unless (and (boundp 'yet-enable-theme) yet-enable-theme)
  (setq yet-enable-theme 'misterioso))

(load-theme yet-enable-theme t)

(when (eq yet-enable-theme 'misterioso)
  (let ((class '((class color) (min-colors 4096)))
        (modeline-font (concat "Monospace-"
                               (if (boundp 'yet-font-size)
                                   yet-font-size "17"))))
    (custom-theme-set-faces
     'misterioso
     `(cursor ((,class (:background "#fff"))))
     `(header-line
       ((,class (:foreground "SlateGray3" :background "#354555"))))
     `(mode-line
       ((,class
         (:foreground "SkyBlue2" :background "#455565" :font ,modeline-font))))
     `(mode-line-buffer-id
       ((,class (:weight bold :slant italic))))
     `(mode-line-highlight ((,class (:foreground "SkyBlue3"))))
     `(mode-line-inactive
       ((,class
         (:foreground "SkyBlue4" :background "#304050" :font ,modeline-font))))
     `(mode-line-emphasis ((,class (:foreground "#74af68"))))

     `(diff-file-header ((,class (:background "#455565"))))
     `(diff-header ((,class (:background "#304050"))))
     `(diff-hunk-header ((,class (:background "#3a4a5a"))))
     `(diff-added ((,class (:background "#334433"))))
     `(diff-removed ((,class (:background "#443333"))))
     `(diff-changed ((,class (:background "#444433"))))
     `(diff-refine-added ((,class (:background "#336633"))))
     `(diff-refine-removed ((,class (:background "#663333"))))
     `(diff-refine-changed ((,class (:background "#666633"))))
     `(diff-hl-change ((,class (:foreground "#666633" :background "#444433"))))
     `(diff-hl-dired-change
       ((,class (:foreground "#666633" :background "#2d3743"))))

     `(show-paren-match ((,class (:background "SkyBlue4"))))
     `(show-paren-mismatch ((,class (:background "#ff4242"))))

     `(compilation-error ((,class (:foreground "#ff4242"))))
     `(compilation-info ((,class (:foreground "#74af68"))))
     `(compilation-warning ((,class (:foreground "#ffad29"))))

     `(line-number ((,class (:foreground "LightSteelBlue4"))))
     `(line-number-current-line
       ((,class (:foreground "LightSteelBlue1" :background "#405060")))))

    (when (facep 'bookmark-face)
      (custom-theme-set-faces
       'misterioso
       `(bookmark-face
         ((,class (:background "#2d3743" :foreground "#ffad29"))))))

    (when (facep 'rust-ampersand-face)
      (custom-theme-set-faces
       'misterioso
       `(rust-ampersand-face
         ((,class (:foreground "#dcdcb4"))))))

    (when (facep 'eglot-highlight-symbol-face)
      (custom-theme-set-faces
       'misterioso
       `(eglot-highlight-symbol-face
         ((,class (:background "#405060"))))))))

(enable-theme yet-enable-theme)

;;; *Palette*

;; SlateGray4 SlateGray3 SlateGray2 SlateGray1 SlateGray

;; LightSlateGray

;; LightSteelBlue4 LightSteelBlue3 LightSteelBlue2 LightSteelBlue1 LightSteelBlue

;; LightBlue4 LightBlue3 LightBlue2 LightBlue1 LightBlue

;; LightSkyBlue4 LightSkyBlue3 LightSkyBlue2 LightSkyBlue1 LightSkyBlue

;; SkyBlue4 SkyBlue3 SkyBlue2 SkyBlue1 SkyBlue

;; SteelBlue4 SteelBlue3 SteelBlue2 SteelBlue1 SteelBlue

;; #212933 #203040 #2d3743 #304050 #354555 #3a4a5a #405060 #455565

;; #e1e1e0 #dcdcb4

;; #334433 #336633

;; #444433 #666633

;; #443333 #663333 #cf5555

;;; misterioso font-lock colors

;; #ff4242 #e67128 #ffad29 #dbdb95 #74af68

;; #008b8b #23d7d7 #00ede1 #34cae2

;;; See also `$emacsSourceDir/etc/themes/misterioso-theme.el'.

