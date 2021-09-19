;;; init-buffers.el --- Configure Emacs buffers/windows   -*- lexical-binding: t -*-

;;; Ibuffer
;;; List and operate on buffers.

(require 'ibuffer)

;; Rebind to ibuffer instead of using older list-buffers command.
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

(setq ibuffer-default-shrink-to-minimum-size t
      ibuffer-expert t)


;;; Rotate (switch) buffers shown in the windows.
;; Based on https://github.com/banister/window-rotate-for-emacs
(defun yet-rotate-windows-buffers--helper (wl buf1)
  (if (equal (cdr wl) nil)
      (set-window-buffer (car wl) buf1)
    (progn
      (set-window-buffer (car wl) (window-buffer (cadr wl)))
      (yet-rotate-windows-buffers--helper (cdr wl) buf1))))

(defun yet-rotate-windows-buffers ()
  "Rotate the buffers of the active frame windows."
  (interactive)
  (if (> (count-windows) 1)
      (let ((wl (window-list)))
        (yet-rotate-windows-buffers--helper wl (window-buffer (car wl))))))

(global-set-key (kbd "s-r") 'yet-rotate-windows-buffers)

