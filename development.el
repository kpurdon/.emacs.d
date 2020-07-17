;;; development.el --- Custom Emacs Configuration

;; Author: Kyle W. Purdon (kpurdon)
;; Keywords: configuration emacs
;; URL: https://github.com/kpurdon/.emacs.d/development.el
;;
;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

;; always delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; make the default movement within words (e.g. someThing, some_thing, some-thing)
;; http://ergoemacs.org/emacs/emacs_subword-mode_superword-mode.html
(add-hook 'prog-mode-hook 'subword-mode)

;; only highlight mispelling for strings and comments
(add-hook `prog-mode-hook 'flyspell-prog-mode)

;; use color-matched delimiters in prog mode
;; https://github.com/Fanael/rainbow-delimiters
(use-package rainbow-delimiters
  :config
  (add-hook `prog-mode-hook `rainbow-delimiters-mode))

;; allow for development modes to use language servers
;; install lsp-mode, lsp-ui, and company-lsp
;; these will be initialized as needed by specific language configs
(use-package lsp-mode
  :config
  ;; don't expand snippets
  (setq lsp-enable-snippet nil)
  ;; ignore common things for lsp-mode
  (setq lsp-file-watch-ignored '(".data" ".git" ".direnv" "node_modules")))
(use-package lsp-ui)
(use-package company-lsp)

(load "~/.emacs.d/golang.el")
(load "~/.emacs.d/terraform.el")
(load "~/.emacs.d/json.el")
(load "~/.emacs.d/js.el")
(load "~/.emacs.d/markdown.el")
(load "~/.emacs.d/web.el")
(load "~/.emacs.d/python.el")
(load "~/.emacs.d/yaml.el")
(load "~/.emacs.d/docker.el")

;;; development.el ends here
