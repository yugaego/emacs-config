;; ===================================
;; Basic Customization
;; ===================================
 
(load-theme 'tango-dark t)

;(setq inhibit-startup-message t)

;;; Minibuffer
(setq minibuffer-eldef-shorten-default t)
(setq insert-default-directory nil) ; minibuffer default path
;(setq initial-buffer-choice "~/Programs/file.c")
(setq resize-mini-windows t) ; decrease size when lines are removed
(setq suggest-key-bindings 5) ; show shortcut of the command for n seconds
(setq extended-command-suggest-shorter t)

;;; Session
(setq-default history-length 1000) ; size of command history
(savehist-mode t) ; save command history between sessions
(global-linum-mode t) ; M-x -linu

;;; Mark region
(setq highlight-nonselected-windows t)
(setq mark-even-if-inactive nil) ; inactive region accepts commands
(delete-selection-mode 1) ; active region removed on typing
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;;; Edit
(setq kill-whole-line t) ; C-k kills newline character too

;;; Mac Dictionary
;; from https://gist.github.com/Superbil/5113974
(defun mac-open-dictionary (the-word)
    "Open Dictionary.app for the-word"
    (interactive "Dictionary Lookup: ")
    (shell-command
             (concat "open \"dict:///" (replace-regexp-in-string "\"" "\\\\\"" the-word) "\"")))

(global-set-key (kbd "C-c d")
		'(lambda ()
		   (interactive)
                     (mac-open-dictionary (current-word))))



;; User-Defined init.el ends here


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;'(custom-enabled-themes (quote (tango-dark))))
;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;)
