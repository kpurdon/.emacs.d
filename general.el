;;; general.el --- Custom Emacs Configuration

;; Author: Kyle W. Purdon (kpurdon)
;; Keywords: configuration emacs
;; URL: https://github.com/kpurdon/.emacs.d/general.el
;;
;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x)) (exec-path-from-shell-initialize)))

;; use better defaults, a good place to start
;; https://github.com/technomancy/better-defaults
(use-package better-defaults)

;; theme it up a bit
;; https://github.com/bbatsov/zenburn-emacs
(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))

;; dont show the startup message
(setq inhibit-startup-message t)

;; use the command key as meta (M-*)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; allow using shift + arrow keys to move around buffers
(windmove-default-keybindings)

;; display line numbers in all buffers
(global-display-line-numbers-mode)

;; allow responding to yes/no prompts with y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; allow copy/paste to/from terminal emacs and other applications (on osx)
(defun copy-from-osx () (shell-command-to-string "pbpaste"))
(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))
(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;; use Hack 18pt as the default font
(add-to-list 'default-frame-alist '(font . "Hack-18"))

;; place any customization (M-x customize ...) in custom.el
(setq custom-file "~/.emacs.d/custom.el")

;; https://github.com/magit/magit
(use-package magit
  :bind
  ("C-c g" . 'magit-status)
  :config
  ;; dont auto-revert buffers (TODO: more information needed)
  (setq magit-auto-revert-mode 0)
  ;; akways display the magit-status in the full frame
  (setq magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1))

;; move all backups to the system temp directory
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; enable auto-completion globally with company
(use-package company
  :config
  (global-company-mode)
  ;; complete with no delay
  (setq company-idle-delay 0)
  ;; complete when a single character is typed
  (setq company-minimum-prefix-length 1))

;; enable better syntax checking than flymake globally
;; https://www.flycheck.org/en/latest/
(use-package flycheck
  :config
  (global-flycheck-mode))

;; load the environment from direnv
;; https://github.com/wbolster/emacs-direnv
;; https://direnv.net/
(use-package direnv
  :config
  (direnv-mode))

;; make the column name wider in ibuffer
(setq ibuffer-formats
      '((mark modified read-only " " (name 40 40 :left :elide) " " filename)
        (mark " " (name 16 -1) " " filename)))

;; ignore some things in gre
(eval-after-load 'grep
  '(progn
     (add-to-list 'grep-find-ignored-directories ".data")
     (add-to-list 'grep-find-ignored-directories ".direnv")
     (add-to-list 'grep-find-ignored-directories ".git")
     (add-to-list 'grep-find-ignored-directories "node_modules")))

;;; general.el ends here
