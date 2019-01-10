;;; install-packages.el --- Emacs Package Installation

;; Author: Kyle W. Purdon (kpurdon)
;;
;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(require 'package)

(defvar my-packages
  '(better-defaults
    company
    company-go
    cyberpunk-theme
    direnv
    elpy
    exec-path-from-shell
    fill-column-indicator
    flycheck
    go-add-tags
    go-eldoc
    go-guru
    go-mode
    json-mode
    magit
    markdown-mode
    osx-clipboard
    py-autopep8
    rainbow-delimiters
    smart-mode-line
    terraform-mode
    web-mode
    yaml-mode))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))


(when (not package-archive-contents)
    (package-refresh-contents))
(package-initialize)

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'install-packages)

;;; install-packages.el ends here
