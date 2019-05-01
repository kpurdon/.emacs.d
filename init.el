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
      linum-format "%4d \u2502 "
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

(global-linum-mode t)

;; modify ibuffer-formats to set name column wider
(setq ibuffer-formats
      '((mark modified read-only " "
              (name 40 40 :left :elide) " " filename)
        (mark " "
              (name 16 -1) " " filename)))

(load-theme 'cyberpunk t)
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

;; fix issues with company and fci-mode
;; https://github.com/alpaker/Fill-Column-Indicator/issues/54
;; https://github.com/alpaker/Fill-Column-Indicator/issues/46
(defvar-local my-fci-mode-stack '()
  "track fci-mode state to aid advice functions.")

(defun fci-conditional-enable (&rest _)
  "Conditionally (re-)enable fci-mode."
  (when (eq (pop my-fci-mode-stack) t)
    (fci-mode t)))

(defun fci-get-and-disable (&rest _)
  "Store current status of fci-mode, and disable if needed."
  (when (boundp 'fci-mode)
    (push fci-mode my-fci-mode-stack)
    (when fci-mode
      (fci-mode -1))))

(defun fci-hack (advised-func &rest args)
  "Disable fci-mode, call ADVISED-FUNC with ARGS, then re-enable fci-mode."
  (progn
    (fci-get-and-disable)
    (apply advised-func args)
    (fci-conditional-enable)))

;; disable fci-mode while certain operations are being performed
(advice-add 'web-mode-on-after-change :around #'fci-hack)
(advice-add 'web-mode-on-post-command :around #'fci-hack)
(add-hook 'company-completion-started-hook 'fci-get-and-disable)
(add-hook 'company-completion-cancelled-hook 'fci-conditional-enable)
(add-hook 'company-completion-finished-hook 'fci-conditional-enable)

;; customize company-mode
(setq company-idle-delay 0)
(setq company-echo-delay 0)
(setq company-minimum-prefix-length 1)

(require 'development)

(load custom-file)

(defvar emacs_home (getenv "EMACS_HOME"))
(setq default-directory emacs_home)

;;; init.el ends here
