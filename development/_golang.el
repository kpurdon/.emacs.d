;;; _golang.el -- custom golang configuration

;;; Commentary:
;;; Author: Kyle W. Purdon (kpurdon)
;;;
;;; This file is not part of GNU Emacs.

;;; Code:

(require 'go-mode)

(exec-path-from-shell-copy-env "GOPATH")
(exec-path-from-shell-copy-env "GOROOT")

(add-hook 'go-mode-hook (lambda ()
                          ;; https://github.com/flycheck/flycheck/pull/1525
                          (setq flycheck-disabled-checkers '(go-build go-vet))
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)
                          (lsp-deferred)))

;; https://github.com/weijiangan/flycheck-golangci-lint
(setq flycheck-golangci-lint-tests t)
(setq flycheck-golangci-lint-fast t)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))

;; lsp fmt/imports hooks
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(require 'lsp-ui)

(require 'company)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(require 'company-lsp)

(add-hook `go-mode-hook `flycheck-mode)

(require 'go-guru)
(add-hook `go-mode-hook `go-guru-hl-identifier-mode)
(set-face-attribute 'highlight nil :background "#FF0" :foreground "#000")

(require 'go-add-tags)
(global-set-key (kbd "C-c t") 'go-add-tags)

(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)

(provide '_golang)

;;; _golang.el ends here
