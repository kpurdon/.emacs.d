;;; js.el --- Custom Emacs Configuration

;; Author: Kyle W. Purdon (kpurdon)
;; Keywords: configuration emacs
;; URL: https://github.com/kpurdon/.emacs.d/terraform.el
;;
;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(use-package js2-mode
  :mode "\\.js\\'"
  :config
  ;; set the default indent to 2 spaces
  (setq js2-basic-offset 2))

;;; js.el ends here
