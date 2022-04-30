;;; init-rust.el --- Configure Rust Mode   -*- lexical-binding: t -*-

(require 'rust-mode)

(with-eval-after-load 'rust-mode

  (setq rust-format-on-save nil
        rust-rustfmt-switches '("--edition" "2021"))

  ;; C-c C-f defined by rust-mode runs 'rust-format-buffer.
  (define-key rust-mode-map (kbd "C-c C-c") 'rust-check)
  (define-key rust-mode-map (kbd "C-c C-b") 'rust-compile)
  (define-key rust-mode-map (kbd "C-c C-r") 'rust-run)
  (define-key rust-mode-map (kbd "C-c C-t") 'rust-test))

