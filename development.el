;;; development.el --- Custom Emacs Configuration

;; Author: Kyle W. Purdon (kpurdon)
;; Keywords: configuration emacs
;; URL: https://github.com/kpurdon/.emacs.d/development.el
;;
;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

;; always delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; make the default movement within words (e.g. someThing, some_thing, some-thing)
;; http://ergoemacs.org/emacs/emacs_subword-mode_superword-mode.html
(add-hook 'prog-mode-hook 'subword-mode)

;; only highlight mispelling for strings and comments
(add-hook `prog-mode-hook 'flyspell-prog-mode)

;; use color-matched delimiters in prog mode
;; https://github.com/Fanael/rainbow-delimiters
(use-package rainbow-delimiters
  :config
  (add-hook `prog-mode-hook `rainbow-delimiters-mode))



;;; development.el ends here
