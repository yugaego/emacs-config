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

(enable-theme 'misterioso)

