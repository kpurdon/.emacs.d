;; _python.el -- custom python configuration

;;; Commentary:

;; Author: Kyle W. Purdon (kpurdon)
;;
;; This file is not part of GNU Emacs.

;;; Code:

(elpy-enable)

(exec-path-from-shell-copy-env "PYTHONPATH")

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
;; ignoring:
;; - E501 - Try to make lines fit within --max-line-length characters.
;; - W293 - Remove trailing whitespace on blank line.
;; - W391 - Remove trailing blank lines.
;; - W690 - Fix various deprecated code (via lib2to3).
(require 'py-autopep8)
(setq py-autopep8-options '("--ignore=E501,W293,W391,W690"))
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

;; enable isort import sorting
(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)

(define-key global-map (kbd "RET") 'newline-and-indent)

(provide '_python)

;;; _python.el ends here
