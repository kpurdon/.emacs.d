;;; python.el --- Custom Emacs Configuration

;; Author: Kyle W. Purdon (kpurdon)
;; Keywords: configuration emacs
;; URL: https://github.com/kpurdon/.emacs.d/terraform.el
;;
;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(use-package elpy
  :init
  (elpy-enable)
  :config
  ;; disable flymake and enable flycheck
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  ;; set the elpy rpc virtualenv path the current path
  (setq elpy-rpc-virtualenv-path 'current))

(use-package py-autopep8
  :config
  (setq py-autopep8-options '("--ignore=E501,W293,W391,W690"))
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save))

(use-package py-isort
  :config
  (add-hook 'before-save-hook 'py-isort-before-save))

;;; python.el ends here
