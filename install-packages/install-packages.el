;;; install-packages.el --- Emacs Package Installation

;; Author: Kyle W. Purdon (kpurdon)
;;
;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(require 'package)

;; https://www.reddit.com/r/emacs/comments/cdei4p/failed_to_download_gnu_archive_bad_request/
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(defvar my-packages
  '(better-defaults
    company
    company-go
    direnv
    elpy
    exec-path-from-shell
    fill-column-indicator
    flycheck
    flycheck-golangci-lint
    go-add-tags
    go-eldoc
    go-guru
    go-mode
    js2-mode
    json-mode
    magit
    markdown-mode
    osx-clipboard
    py-autopep8
    py-isort
    rainbow-delimiters
    smart-mode-line
    terraform-mode
    web-mode
    yaml-mode
    zenburn-theme))

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))


(when (not package-archive-contents)
    (package-refresh-contents))
(package-initialize)

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'install-packages)

;;; install-packages.el ends here
