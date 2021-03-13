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
  (add-hook 'go-mode-hook #'lsp-deferred))

;; TODO: move these into use-package go-mode
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; install flycheck-golangci-lint to use golangci-lint via flycheck
(use-package flycheck-golangci-lint
  :hook (go-mode . flycheck-golangci-lint-setup)
  :config
  ;; enable golangci-lint in test files
  (setq flycheck-golangci-lint-tests t)
  ;; only run fast checks
  (setq flycheck-golangci-lint-fast t))

;; allow the ability to add tags to go structs
;; https://github.com/brantou/emacs-go-tag
(use-package go-tag)
(setq go-tag-args (list "-transform" "camelcase"))



;;; golang.el ends here
