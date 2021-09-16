;;; init-theme.el --- Configure a theme   -*- lexical-binding: t -*-

;; Use one of the default themes.
;; Note: after `M-x load-theme <new-theme>'
;; do `M-x disable-theme <old-theme>'.
(load-theme 'misterioso t)

(custom-theme-set-faces
 'misterioso
 ;; Optional colors for misterioso theme:
 ;; LightBlue4, LightSkyBlue4, LightSteelBlue4,
 ;; SlateGray4, LightSlateGray
 '(cursor ((t (:background "SteelBlue3"))) t)
 '(header-line ((t (:background "#3a4a5a"))) t)
 '(mode-line ((t (:background "SlateGray"))) t)
 '(mode-line-buffer-id ((t (:background "SkyBlue4"))) t)
 '(mode-line-emphasis ((t (:foreground "green4"))) t)
 '(mode-line-highlight ((t (:background "SteelBlue4"))) t)
 '(mode-line-inactive ((t (:background "#212933"))) t)
 '(diff-added ((t (:background "#334433"))) t)
 '(diff-removed ((t (:background "#443333"))) t)
 '(diff-refine-added ((t (:background "#336633"))) t)
 '(diff-refine-removed ((t (:background "#663333"))) t)
 '(show-paren-match ((t (:background "SkyBlue4"))) t)
 '(line-number-current-line ((t (:background "#405060"))) t))

(when (version<= "28.0.50" emacs-version)
  (custom-theme-set-faces
   'misterioso
   '(bookmark-face ((t (:background "#2d3743" :foreground "#ffad29"))))))

(enable-theme 'misterioso)

;;; *Palette*

;; See also `$emacsSourceDir/etc/themes/misterioso-theme.el'.

;; SlateGray4 SlateGray3 SlateGray2 SlateGray1 SlateGray

;; LightSlateGray

;; LightSteelBlue4 LightSteelBlue3 LightSteelBlue2 LightSteelBlue1 LightSteelBlue

;; LightBlue4 LightBlue3 LightBlue2 LightBlue1 LightBlue

;; LightSkyBlue4 LightSkyBlue3 LightSkyBlue2 LightSkyBlue1 LightSkyBlue

;; SteelBlue4 SteelBlue3 SteelBlue2 SteelBlue1 SteelBlue

;; #212933 #2d3743 #3a4a5a #405060

;; #334433 #336633

;; #443333 #663333

;; #ffad29

