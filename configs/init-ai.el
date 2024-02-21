;;; init-ai.el --- LLM (AI) related configurations   -*- lexical-binding: t -*-

(require 'gptel)

(with-eval-after-load 'gptel
  (add-hook 'gptel-post-response-functions 'gptel-end-of-response)
  (add-hook 'gptel-post-stream-hook 'gptel-auto-scroll)
  (setq-default gptel-default-mode 'org-mode
                gptel-max-tokens 500
                gptel-directives
                '((default . "You are a helpful assistant. Provide clear and thorough answers but be concise. Let's work this out in a step by step way to be sure we have the right answer.")
                  (programming . "You are a helpful assistant and careful programmer. Provide clear and thorough answers but be concise. Let's work this out in a step by step way to be sure we have the right answer. When only code is asked, provide only code, without any comments and notes.")
                  (writing . "You are a helpful assistant for editing, proofreading, writing, and translating texts. Provide clear and thorough answers but be concise. Let's work this out in a step by step way to be sure we have the right answer.")
                  (chat . "You are a conversation partner. Provide clear and thorough answers but be concise."))))
