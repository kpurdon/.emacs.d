;;; web.el --- Custom Emacs Configuration

;; Author: Kyle W. Purdon (kpurdon)
;; Keywords: configuration emacs
;; URL: https://github.com/kpurdon/.emacs.d/terraform.el
;;
;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(use-package web-mode
  :mode "\\.html\\'" ;; TODO: probably need to add css here?

  :config

  ;; set the markup indent to 2 spaces
  (setq web-mode-markup-indent-offset 2)

  ;; set the css indent to 2 spaces
  (setq web-mode-css-indent-offset 2)

  ;; set the code (html/js) indent to 2 spaces
  (setq web-mode-code-indent-offset 2)

  ;; auto-pair tags
  (setq web-mode-enable-auto-pairing t)

  ;; auto-close tags
  (setq web-mode-enable-auto-closing t)

  ;; highlight the current element
  (setq web-mode-enable-current-element-highlight t)

  ;; highlight the current column
  (setq web-mode-enable-current-column-highlight t))

;;; web.el ends here
