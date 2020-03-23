;;; golang.el --- Custom Emacs Configuration

;; Author: Kyle W. Purdon (kpurdon)
;; Keywords: configuration emacs
;; URL: https://github.com/kpurdon/.emacs.d/golang.el
;;
;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

;; install go mode
(use-package go-mode
  :config
  ;; enable lsp
  (add-hook 'go-mode-hook #'lsp-deferred)
  ;; have lsp auto-format the buffer on save
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  ;; have lsp auto-add/remove imports on save
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

;; install flycheck-golangci-lint to use golangci-lint via flycheck
(use-package flycheck-golangci-lint
  :hook (go-mode . flycheck-golangci-lint-setup)
  :config
  ;; enable golangci-lint in test files
  (setq flycheck-golangci-lint-tests t)
  ;; only run fast checks
  (setq flycheck-golangci-lint-fast t))

;; allow the ability to add tags to go structs
;; https://github.com/emacsorphanage/go-add-tags
(use-package go-add-tags)

;;; golang.el ends here
