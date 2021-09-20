;;; init-navigation.el --- Move around   -*- lexical-binding: t -*-

(require 'bookmark)

(if (boundp 'yet-bookmark-default-file)
    (setq bookmark-default-file yet-bookmark-default-file))

