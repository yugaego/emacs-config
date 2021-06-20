;;; init-completion.el --- Configure auto-completions   -*- lexical-binding: t -*-

(setq tab-always-indent 'complete)      ; Suggest completions on indented lines.

(add-to-list 'completion-styles 'initials t) ; Suggest completions by initials too.

