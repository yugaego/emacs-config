;;; init-theme.el --- Configure a theme   -*- lexical-binding: t -*-

;; Use one of the default themes.
;; Note: after `M-x load-theme <new-theme>'
;; do `M-x disable-theme <old-theme>'.
(load-theme 'misterioso t)

(let ((class '((class color) (min-colors 4096))))

  (custom-theme-set-faces
   'misterioso
   `(cursor ((,class (:background "SteelBlue3"))) t)
   `(header-line
     ((,class (:foreground "LightSteelBlue" :background "#354555"))) t)
   `(mode-line
     ((,class
       (:foreground "#354558" :background "LightSkyBlue4" :font "Monospace")
       )) t)
   `(mode-line-buffer-id
     ((,class (:weight bold :slant italic :font ,yet-font))) t)
   `(mode-line-highlight ((,class (:foreground "LightSkyBlue"))) t)
   `(mode-line-inactive
     ((,class
       (:foreground "LightSkyBlue4" :background "#304050" :font "Monospace")
       )) t)
   `(mode-line-emphasis ((,class (:foreground "#74af68"))) t)

   `(diff-added ((,class (:background "#334433"))) t)
   `(diff-removed ((,class (:background "#443333"))) t)
   `(diff-changed ((,class (:background "#444433"))) t)
   `(diff-refine-added ((,class (:background "#336633"))) t)
   `(diff-refine-removed ((,class (:background "#663333"))) t)
   `(diff-refine-changed ((,class (:background "#666633"))) t)
   `(diff-hl-change ((,class (:foreground "#666633" :background "#444433"))) t)
   `(diff-hl-dired-change
     ((,class (:foreground "#666633" :background "#2d3743"))) t)

   `(show-paren-match ((,class (:background "SkyBlue4"))) t)
   `(show-paren-mismatch ((,class (:background "#ff4242"))) t)

   `(compilation-error ((,class (:foreground "#ff4242"))) t)
   `(compilation-info ((,class (:foreground "#74af68"))) t)
   `(compilation-warning ((,class (:foreground "#ffad29"))) t)

   `(line-number ((,class (:foreground "LightSteelBlue4"))) t)
   `(line-number-current-line
     ((,class (:foreground "LightSteelBlue1" :background "#405060"))) t))

  (when (version<= "28.0.50" emacs-version)
    (custom-theme-set-faces
     'misterioso
     `(bookmark-face
       ((,class (:background "#2d3743" :foreground "#ffad29")))))))

(enable-theme 'misterioso)

;;; *Palette*

;; See also `$emacsSourceDir/etc/themes/misterioso-theme.el'.

;; SlateGray4 SlateGray3 SlateGray2 SlateGray1 SlateGray

;; LightSlateGray

;; LightSteelBlue4 LightSteelBlue3 LightSteelBlue2 LightSteelBlue1 LightSteelBlue

;; LightBlue4 LightBlue3 LightBlue2 LightBlue1 LightBlue

;; LightSkyBlue4 LightSkyBlue3 LightSkyBlue2 LightSkyBlue1 LightSkyBlue

;; SteelBlue4 SteelBlue3 SteelBlue2 SteelBlue1 SteelBlue

;; #212933 #2d3743 #304050 #354555 #3a4a5a #405060 #e1e1e0

;; #334433 #336633

;; #444433 #666633

;; #443333 #663333

;; #ff4242 #ffad29 #dbdb95 #74af68

