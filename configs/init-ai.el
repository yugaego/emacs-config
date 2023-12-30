;;; init-ai.el --- AI chatbot  -*- lexical-binding: t -*-

(with-eval-after-load 'gptel
  (setopt gptel-default-mode 'org-mode
          gptel-max-tokens 500
          gptel-directives
          '((default . "You are a helpful assistant. Provide clear and thorough answers but be concise. Let's work this out in a step by step way to be sure we have the right answer.")
            (programming . "You are a helpful assistant and careful programmer. Provide clear and thorough answers but be concise. Let's work this out in a step by step way to be sure we have the right answer. When only code is asked, provide only code, without any comments and notes.")
            (writing . "You are a helpful assistant for editing, proofreading, writing, and translating texts. Provide clear and thorough answers but be concise. Let's work this out in a step by step way to be sure we have the right answer.")
            (chat . "You are a conversation partner. Provide clear and thorough answers but be concise."))))
