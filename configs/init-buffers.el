;;; init-buffers.el --- Configure Emacs buffers/windows   -*- lexical-binding: t -*-

;;; Ibuffer
;;; List and operate on buffers.

(require 'ibuffer)

;; Rebind to ibuffer instead of using older list-buffers command.
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

(setq ibuffer-default-shrink-to-minimum-size t
      ibuffer-expert t)


;;; Help

(setq help-window-select t)


;;; Specifically configured buffers

(customize-set-variable
 'display-buffer-alist
 '(("\\*Ido Completions\\*"
    (display-buffer-reuse-window display-buffer-at-bottom)
    (window-height . fit-window-to-buffer))
   ("\\*Help\\*"
    (display-buffer-reuse-window display-buffer-below-selected)
    (window-height . fit-window-to-buffer))))


;;; Keybindings

;; Default Nextstep binding `s-^' didn't work in my setup.
;; {emacs-dir}/lisp/term/ns-win.el
(global-set-key (kbd "s-6") #'kill-some-buffers)


;;; Rotate (exchange) buffers shown in the windows.
;;; Based on https://github.com/banister/window-rotate-for-emacs.

(defun yet-rotate-windows-buffers--helper (windows initial-buffer)
  "Recursively change buffers displayed in the WINDOWS list.
After the change, the last window on the list displays the INITIAL-BUFFER."
  (if (equal (cdr windows) nil)
      (set-window-buffer (car windows) initial-buffer)
    (progn
      (set-window-buffer (car windows) (window-buffer (cadr windows)))
      (yet-rotate-windows-buffers--helper (cdr windows) initial-buffer))))

(defun yet-rotate-windows-buffers ()
  "Rotate the buffers of the active frame windows."
  (interactive)
  (if (> (count-windows) 1)
      (let ((windows (window-list)))
        (yet-rotate-windows-buffers--helper windows
                                            (window-buffer (car windows))))))

(global-set-key (kbd "C-c r") 'yet-rotate-windows-buffers)

