;;; development.el --- Load All Development Configuration

;;; Commentary:
;;; Author: Kyle W. Purdon (kpurdon)
;;;
;;; This file is not part of GNU Emacs.

;;; Code:

(require 'rainbow-delimiters)

(require 'fill-column-indicator)
(setq fci-rule-column 100)
(setq fci-rule-width 1)
(setq fci-rule-color "darkgrey")

(require 'direnv)
(direnv-mode)

(global-flycheck-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'subword-mode)
(add-hook 'prog-mode-hook 'fci-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(require '_python)
(require '_golang)
(require '_markdown)
(require '_web)
(require '_json)
(require '_terraform)

(provide 'development)

;;; development.el ends here
