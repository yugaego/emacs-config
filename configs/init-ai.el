;;; init-ai.el --- LLM (AI) related configurations   -*- lexical-binding: t -*-

(require 'gptel)

(with-eval-after-load 'gptel

  (when (and (boundp 'yet-gptel-backend) yet-gptel-backend)
    (setq gptel-backend yet-gptel-backend))

  (when (and (boundp 'yet-gptel-model) yet-gptel-model)
    (setq gptel-model yet-gptel-model))

  (defun yet-gptel-response-recenter (beg end)
    "Position the answer at the top of the window."
    (goto-char beg)
    (recenter 0))

  (add-hook 'gptel-post-response-functions 'yet-gptel-response-recenter)

  (when (and (boundp 'yet-gptel-remove-citations) yet-gptel-remove-citations)
    (defun yet-gptel-response-remove-citations (beg end)
      (let ((pos (point)))
        (save-excursion
          (goto-char beg)
          (when (re-search-forward "^Citations:\\s-*$" end t 1)
            (let ((mbeg (match-beginning 0)))
              (when (re-search-forward "^\\*\\*\\*\\s-*$" end t 1)
                (forward-line -1)
                (delete-region mbeg (point)))))
          (goto-char pos))))

    (add-hook
     'gptel-post-response-functions
     'yet-gptel-response-remove-citations))

  (setq-default gptel-log-level 'info
                gptel-default-mode 'org-mode
                gptel-max-tokens 500
                gptel-directives
                '((default . "You are a helpful assistant. Provide clear and thorough answers. Be concise! Let's work this out in a step by step way to be sure we have the right answer.")
                  (programming . "You are a helpful assistant and careful programmer. Provide clear and thorough answers. Be concise! Let's work this out in a step by step way to be sure we have the right answer. Prefer writing code without any comments and notes, unless explicitly asked so.")
                  (writing . "You are a helpful assistant for editing, proofreading, writing, and translating texts. Provide clear and thorough answers but be concise. Let's work this out in a step by step way to be sure we have the right answer.")
                  (chat . "You are a conversation partner. Provide clear and thorough answers but be concise."))))
