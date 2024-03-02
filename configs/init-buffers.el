;;; init-buffers.el --- Configure Emacs buffers/windows   -*- lexical-binding: t -*-

(winner-mode 1)

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
 '(("\\*Ido Completions\\*\\|\\*vc-git"
    (display-buffer-reuse-window
     display-buffer-in-previous-window
     display-buffer-at-bottom)
    (window-height . fit-window-to-buffer)
    (reusable-frames . 0))
   ("\\*vc-log\\*"
    (display-buffer-at-bottom)
    (window-height . 10)
    (inhibit-same-window . t)
    (reusable-frames . 0))
   ("\\*Help\\*\\|\\*eldoc\\*\\|\\*info\\*"
    (display-buffer-reuse-window
     display-buffer-in-previous-window
     display-buffer-below-selected
     display-buffer-at-bottom)
    ;; (window-height . fit-window-to-buffer)
    (reusable-frames . 0))
   ("\\*ansi-term"
    (display-buffer-reuse-window
     display-buffer-in-previous-window
     display-buffer-below-selected
     display-buffer-at-bottom)
    (inhibit-same-window . t))
   ("\\*compilation\\*\\|\\*xref\\*"
    (display-buffer-in-previous-window)
     ;; display-buffer-use-some-frame)
     ;; display-buffer-pop-up-frame)
    (inhibit-same-window . t)
    (reusable-frames . 0))
   ("\\*vc-dir\\*\\|\\*vc-diff\\*\\|\\*vc-change-log\\*"
    (display-buffer-same-window))))


(with-eval-after-load 'comp
  (when (boundp 'native-comp-async-report-warnings-errors)
    (setq native-comp-async-report-warnings-errors 'silent)))

;;; Keybindings

;; Default Nextstep binding `s-^' didn't work in my setup.
;; {emacs-dir}/lisp/term/ns-win.el
(global-set-key (kbd "C-c b k") #'kill-some-buffers)


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

;; Mnemonics: `b' Buffer, `r' Rotate.
(global-set-key (kbd "C-c b r") 'yet-rotate-windows-buffers)


;;; Toggle two windows split type (horizontal or vertical).
;;; Based on https://emacs.stackexchange.com/a/5372/28451
;;; and https://www.emacswiki.org/emacs/ToggleWindowSplit

(defun yet-toggle-window-split ()
  "Toggle between horizontal and vertical split with two windows."
  (interactive)
  (if (> (length (window-list)) 2)
      (error "Can toggle split of only 2 windows!")
    (let ((func (if (window-combined-p)
                    #'split-window-horizontally
                  #'split-window-vertically)))
      (delete-other-windows)
      (funcall func)
      (save-selected-window
        (other-window 1)
        (switch-to-buffer (other-buffer))))))

;; Mnemonics: `b' Buffer, `s' Split.
(global-set-key (kbd "C-c b s") 'yet-toggle-window-split)
