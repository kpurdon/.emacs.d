;; _terraform.el -- custom terraform (.tf) configuration

;;; Commentary:

;; Author: Kyle W. Purdon (kpurdon)
;;
;; This file is not part of GNU Emacs.

;;; Code:

(require 'terraform-mode)

(add-hook `terraform-mode-hook `terraform-format-on-save-mode)

(provide '_terraform)

;;; _terraform.el ends here
