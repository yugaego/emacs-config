;;; init-shell.el --- Shell configuration   -*- lexical-binding: t -*-

;; Show current dir in shell command prompt.
(setq shell-command-prompt-show-cwd t)

;; To load =bash= $PATH, aliases and functions:
;; 1. Put them to an auto-read file, f.i. to ~/.bash_profile.
;; 2. Add line `source ~/.bash_profile' to `~/.bashrc'.
;; 3. Add `-i' interactive switch to shell commands.
;;    - it enables loading of the `~/.bashrc'.
;; https://stackoverflow.com/a/68634101/1319821
;; https://stackoverflow.com/a/903213/1319821
(setq shell-command-switch "-ic")

