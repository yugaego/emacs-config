;;; init-gnus.el --- Gnus: news (mailing lists) reader   -*- lexical-binding: t -*-

(with-eval-after-load 'gnus

   ;;; Gnus
  (setq gnus-select-method '(nntp "news.gmane.io")
        gnus-inhibit-startup-message t
        gnus-always-read-dribble-file t
        gnus-interactive-exit nil)

  ;;; Servers
  (setq gnus-check-new-newsgroups nil     ; Do not look for new groups.
        gnus-save-killed-list nil)        ; Do not save list of killed groups.

  ;;; Groups
  (setq gnus-group-buffer "*Gnus Groups*"
        gnus-use-scoring nil
        gnus-group-line-format "%M%S%p%P%5y:%B%(%-16,16c%) %9,9~(cut 4)d\n"
        gnus-interactive-catchup nil      ; Catchup groups automatically.
        gnus-summary-next-group-on-exit nil)

  ;;; Articles
  (setq gnus-auto-select-next nil
        ;; gnus-add-to-list t
        gnus-summary-line-format "%U%R%z%I%[: %-8,8f %] %s\n"))

