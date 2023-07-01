;;; init-gnus.el --- Gnus: news (mailing lists) reader   -*- lexical-binding: t -*-

(require 'gnus)
(require 'gnus-start)
(require 'gnus-sum)
(require 'gnus-msg)

(with-eval-after-load 'gnus

   ;;; Gnus
  (setq gnus-select-method '(nntp "news.gmane.io")
        gnus-secondary-select-methods nil ; gwene lists available via gmane.
        gnus-inhibit-startup-message t
        gnus-always-read-dribble-file t
        gnus-interactive-exit nil)

  ;;; Servers
  (setq gnus-check-new-newsgroups nil     ; Do not look for new groups.
        gnus-save-killed-list nil)        ; Do not save list of killed groups.

  ;;; Groups
  (setq gnus-group-buffer "*Gnus Groups*"
        gnus-group-line-format "%M\ %S\ %p\ %P\ %5y:%B%(%G%)\n"
        gnus-use-scoring nil
        gnus-interactive-catchup nil      ; Catchup groups automatically.
        gnus-summary-next-group-on-exit t)

  ;;; Articles
  (setq gnus-auto-select-next nil
        gnus-add-to-list t
        gnus-summary-line-format "%U%R%z%I%[: %-16,16f %] %s\n")

  (defun yet-gnus-article-mode ()
    ;; Follow links by clicking `C-c RET'.
    (goto-address-mode 1))

  (add-hook 'gnus-article-mode-hook 'yet-gnus-article-mode)

  ;; Initiate responding by hitting `f' or `F'.
  (setq gnus-mailing-list-groups "^gmane")

  (gnus-add-configuration
   '(article (vertical 1.0 (summary .35 point) (article 1.0)))))

