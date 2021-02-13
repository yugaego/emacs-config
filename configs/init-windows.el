;;; init-windows.el --- Configure Emacs windows   -*- lexical-binding: t -*-

;;; Rotate (switch) buffers shown in the windows.
;; Based on https://github.com/banister/window-rotate-for-emacs
(defun rotate-windows-buffers-helper (wl buf1)
  (if (equal (cdr wl) nil)
      (set-window-buffer (car wl) buf1)
    (progn
      (set-window-buffer (car wl) (window-buffer (cadr wl)))
      (rotate-windows-buffers-helper (cdr wl) buf1))))

(defun rotate-windows-buffers ()
  "Rotate the buffers of the active frame windows."
  (interactive)
  (if (> (count-windows) 1)
      (let ((wl (window-list)))
        (rotate-windows-buffers-helper wl (window-buffer (car wl))))))

(global-set-key (kbd "s-r") 'rotate-windows-buffers)

