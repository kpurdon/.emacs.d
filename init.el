;;; init.el --- Custom Emacs Configuration

;; Author: Kyle W. Purdon (kpurdon)
;; Version: 6.0.0
;; Keywords: configuration emacs
;; URL: https://github.com/kpurdon/.emacs.d/init.el
;;
;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(package-initialize)

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'install-packages)
(require 'better-defaults)

(setq inhibit-startup-message t
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      inhibit-startup-message t
      mac-command-modifier 'meta
      mac-option-modifier nil
      sml/no-confirm-load-theme t
      yas-global-mode 1
      custom-file "~/.emacs.d/custom.el"
      magit-auto-revert-mode 0
      magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1)

(osx-clipboard-mode +1)

(global-display-line-numbers-mode)

;; modify ibuffer-formats to set name column wider
(setq ibuffer-formats
      '((mark modified read-only " "
              (name 40 40 :left :elide) " " filename)
        (mark " "
              (name 16 -1) " " filename)))

(load-theme 'zenburn t)
(windmove-default-keybindings)
(defalias 'yes-or-no-p 'y-or-n-p)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'magit)
(global-set-key (kbd "C-c g") 'magit-status)

(sml/setup)
(add-to-list 'sml/replacer-regexp-list
             '("^~/go" ":go:") t)
(add-to-list 'sml/replacer-regexp-list
             '("^~/code/github.com/syndio/ce" ":ce:") t)
(add-to-list 'sml/replacer-regexp-list
             '("^~/code/github.com/syndio/syndio" ":syndio:") t)

(add-hook 'after-init-hook 'global-company-mode)

;; customize company-mode
(setq company-idle-delay 0)
(setq company-echo-delay 0)
(setq company-minimum-prefix-length 1)

;; ignore some things in grep
(eval-after-load 'grep
  '(progn
     (add-to-list 'grep-find-ignored-directories ".data")
     (add-to-list 'grep-find-ignored-directories ".direnv")
     (add-to-list 'grep-find-ignored-directories ".terraform")
     (add-to-list 'grep-find-ignored-directories "node_modules")))

(require 'development)

;; put all backups in /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(load custom-file)

(defvar emacs_home (getenv "EMACS_HOME"))
(setq default-directory emacs_home)

;;; init.el ends here
