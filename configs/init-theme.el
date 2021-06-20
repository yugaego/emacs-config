;;; init-theme.el --- Configure a theme   -*- lexical-binding: t -*-

(when (custom-theme-p 'misterioso)
  (custom-theme-set-faces
   'misterioso
   '(cursor ((t (:background "SteelBlue3"))) t)
   '(mode-line ((t (:background "SlateGray4"))) t)
   '(mode-line-buffer-id ((t (:background "SkyBlue4"))) t)
   '(mode-line-emphasis ((t (:foreground "green4"))) t)
   '(mode-line-highlight ((t (:background "SteelBlue4"))) t)
   '(mode-line-inactive ((t (:background "#212933"))) t))
  (enable-theme 'misterioso))

