;;; _golang.el -- custom golang configuration

;;; Commentary:
;;; Author: Kyle W. Purdon (kpurdon)
;;;
;;; This file is not part of GNU Emacs.

;;; Code:

(require 'go-mode)

(exec-path-from-shell-copy-env "GOPATH")

(require 'company)
(require 'company-go)
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
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
