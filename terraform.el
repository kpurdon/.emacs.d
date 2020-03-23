;;; terraform.el --- Custom Emacs Configuration

;; Author: Kyle W. Purdon (kpurdon)
;; Keywords: configuration emacs
;; URL: https://github.com/kpurdon/.emacs.d/terraform.el
;;
;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(use-package terraform-mode
  :config
  (add-hook `terraform-mode-hook `terraform-format-on-save-mode))

;;; terraform.el ends here
