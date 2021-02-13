;;; init-scheme.el --- Configure Scheme interaction   -*- lexical-binding: t -*-

(require 'geiser)

(setq geiser-active-implementations '(mit))

(setq geiser-repl-query-on-kill-p nil)

