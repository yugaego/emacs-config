;;; init-rust.el --- Configure Rust Mode   -*- lexical-binding: t -*-

(require 'rust-mode)

(with-eval-after-load 'rust-mode

  (setq rust-format-on-save nil
        rust-rustfmt-switches '("--edition" "2021"))

  (defun yet-rustup-doc (&optional switches)
    "Open locally installed documentation.
With optional SWITCHES, opens specific pieces of documentation."
    (interactive "sEnter command (default --help): rustup doc ")
    (when (string-empty-p switches)
      (setq switches "--help"))
    (shell-command
     (format "rustup doc %s" switches)))

  ;; C-c C-f defined by rust-mode runs 'rust-format-buffer.
  (define-key rust-mode-map (kbd "C-c C-r") #'rust-run)
  (define-key rust-mode-map (kbd "C-c C-t") #'rust-test)
  (define-key rust-mode-map (kbd "C-c C-c") #'rust-check)
  ;; Mnemonic `b': Binary.
  (define-key rust-mode-map (kbd "C-c C-b") #'rust-compile)
  ;; Mnemonic `l': Lints.
  (define-key rust-mode-map (kbd "C-c C-l") #'rust-run-clippy)
  ;; Mnemonics: `o' Open, ` Documentation.
  (define-key rust-mode-map (kbd "C-c o d") 'yet-rustup-doc)
  ;; Mnemonics: `t' Toggle, `m' mut.
  (define-key rust-mode-map (kbd "C-c t m") #'rust-toggle-mutability)
  ;; (define-key rust-mode-map (kbd "C-c C-d") nil)
  ;; Mnemonics: `t' Toggle, `d' dbg!.
  (define-key rust-mode-map (kbd "C-c t d") #'rust-dbg-wrap-or-unwrap))
